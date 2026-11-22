/* JsonEditorBox.js
 *
 * Purpose:
 *   ZK Widget wrapper for JSON Editor library
 *   https://github.com/json-editor/json-editor
 *
 * Copyright (C) Contributors
 * This program is free software under GPL v2.
 */
(function() {

	// Track if json-editor library is loaded
	let jsonEditorLoaded = false;
	let loadingPromise = null;

	// Load json-editor library dynamically
	function loadJsonEditorLib() {
		if (jsonEditorLoaded) {
			return Promise.resolve();
		}
		if (loadingPromise) {
			return loadingPromise;
		}

		loadingPromise = new Promise(function(resolve, reject) {
			// Check if already loaded
			if (window.JSONEditor) {
				jsonEditorLoaded = true;
				resolve();
				return;
			}

			// Load from CDN
			let script = document.createElement('script');
			script.src = 'https://cdn.jsdelivr.net/npm/@json-editor/json-editor@latest/dist/jsoneditor.min.js';
			script.onload = function() {
				jsonEditorLoaded = true;
				resolve();
			};
			script.onerror = function() {
				reject(new Error('Failed to load JSON Editor library'));
			};
			document.head.appendChild(script);
		});

		return loadingPromise;
	}

	let JsonEditorBox =

	jsoneditorbox.JsonEditorBox = zk.$extends(zul.inp.InputWidget, {

		_schema: null,
		_jsonValue: '',
		_theme: 'html',
		_iconlib: 'fontawesome4',
		_showErrors: 'interaction',
		_disabled: false,
		_disableArrayAdd: false,
		_disableArrayDelete: false,
		_disableArrayReorder: false,
		_disableCollapse: false,
		_disableEditJson: false,
		_disableProperties: false,
		_promptBeforeDelete: true,
		_startCollapsed: false,
		_compactMode: false,
		_editor: null,
		_editorReady: false,
		_skipChange: false,
		_initialValue: null,  // Store initial value for comparison
		_userHasEdited: false, // Track if user has actually edited
		_popoverObserver: null, // MutationObserver that catches .je-modal popovers opening
		_floatingModals: null,  // .je-modal elements currently relocated to <body>
		_repositionHandler: null, // scroll/resize handler kept while popovers are floating

		$define: {
			schema: function(v) {
				this._schema = v;
				if (this._editorReady) {
					this._rebuildEditor();
				}
			},
			jsonValue: function(v) {
				this._jsonValue = v || '';
				// Store initial value and reset user edit flag when value is set from server
				this._initialValue = this._normalizeJson(v);
				this._userHasEdited = false;

				if (this._editorReady && this._editor) {
					this._skipChange = true;
					try {
						let parsed = v ? JSON.parse(v) : {};
						this._editor.setValue(parsed);
					} catch(e) {
						// Invalid JSON, ignore
					}
					// Use setTimeout to allow any pending change events to be ignored
					let wgt = this;
					setTimeout(function() {
						wgt._skipChange = false;
					}, 100);
				}
			},
			theme: function(v) {
				this._theme = v;
				if (this._editorReady) {
					this._rebuildEditor();
				}
			},
			iconlib: function(v) {
				this._iconlib = v;
				if (this._editorReady) {
					this._rebuildEditor();
				}
			},
			showErrors: function(v) {
				this._showErrors = v;
			},
			disabled: function(v) {
				this._disabled = v;
				if (this._editor) {
					if (v) {
						this._editor.disable();
					} else {
						this._editor.enable();
					}
				}
			},
			disableArrayAdd: null,
			disableArrayDelete: null,
			disableArrayReorder: null,
			disableCollapse: null,
			disableEditJson: null,
			disableProperties: null,
			promptBeforeDelete: null,
			startCollapsed: null,
			compactMode: null
		},

		getZclass: function() {
			return this._zclass != null ? this._zclass : 'z-jsoneditorbox';
		},

		bind_: function() {
			this.$supers(JsonEditorBox, 'bind_', arguments);

			let wgt = this;

			// Remove any height style that ZK might have added
			this._removeHeightStyle();

			// Load JSON Editor library and initialize
			loadJsonEditorLib().then(function() {
				if (wgt.$n()) { // Check if still bound
					wgt._initEditor();
					wgt._removeHeightStyle();
				}
			}).catch(function(err) {
				console.error('JsonEditorBox: Failed to load library', err);
				if (wgt.$n()) {
					wgt._initFallbackMode();
				}
			});
		},

		_removeHeightStyle: function() {
			let n = this.$n();
			if (n) {
				n.style.height = 'auto';
				n.style.overflow = 'visible';
			}
		},

		unbind_: function() {
			this._destroyEditor();
			this.$supers(JsonEditorBox, 'unbind_', arguments);
		},

		_destroyEditor: function() {
			this._teardownPopoverEscape();
			if (this._editor) {
				try {
					this._editor.destroy();
				} catch(e) {
					// Ignore destruction errors
				}
				this._editor = null;
			}
			this._editorReady = false;
		},

		_initEditor: function() {
			let container = this.$n('editor');
			if (!container || !window.JSONEditor) {
				this._initFallbackMode();
				return;
			}

			// Clear any existing content in the container
			container.innerHTML = '';

			let wgt = this;
			let schema = this._parseSchema();

			// IMPORTANT: Skip change events during initialization
			this._skipChange = true;
			// Store initial value for comparison (normalized)
			this._initialValue = this._normalizeJson(this._jsonValue);
			this._userHasEdited = false;

			// Configure JSON Editor options
			let options = {
				schema: schema,
				theme: this._theme || 'html',
				iconlib: this._iconlib || 'fontawesome4',
				show_errors: this._showErrors || 'interaction',
				disable_array_add: this._disableArrayAdd,
				disable_array_delete: this._disableArrayDelete,
				disable_array_reorder: this._disableArrayReorder,
				disable_collapse: this._disableCollapse,
				disable_edit_json: this._disableEditJson,
				disable_properties: this._disableProperties,
				prompt_before_delete: this._promptBeforeDelete,
				startval: this._parseJsonValue(),
				compact: this._compactMode,
				// Important: don't let JSON Editor manage its own container
				form_name_root: 'jsoneditor_' + this.uuid
			};

			if (this._startCollapsed) {
				options.collapsed = true;
			}

			try {
				this._editor = new JSONEditor(container, options);
				this._editorReady = true;

				// Listen for changes
				this._editor.on('change', function() {
					if (!wgt._editorReady || wgt._skipChange) return;

					try {
						let value = wgt._editor.getValue();
						let jsonStr = JSON.stringify(value, null, 2);
						let normalizedNew = wgt._normalizeJson(jsonStr);

						// Only fire change if value is actually different from initial
						// This prevents false positives from JSON reformatting
						if (normalizedNew !== wgt._initialValue) {
							wgt._userHasEdited = true;
							wgt._jsonValue = jsonStr;
							wgt.fire('onChange', { value: jsonStr });
						}
						// Ensure height stays auto after content changes
						wgt._removeHeightStyle();
					} catch(e) {
						// Ignore errors during value retrieval
					}
				});

				// Listen for ready event
				this._editor.on('ready', function() {
					if (wgt._disabled && wgt._editor) {
						wgt._editor.disable();
					}
					// Ensure height is auto after ready
					wgt._removeHeightStyle();

					// Relocate json-editor popovers to <body> so they aren't
					// clipped/covered by the surrounding ZK form region
					wgt._installPopoverEscape();

					// Re-capture the initial value after editor has processed it
					// This ensures we compare against what the editor actually has
					try {
						let editorValue = wgt._editor.getValue();
						wgt._initialValue = JSON.stringify(editorValue);
					} catch(e) {
						// Keep existing initial value
					}

					// IMPORTANT: Only allow change events after editor is fully ready
					// Use setTimeout to ensure all initial events have fired
					setTimeout(function() {
						wgt._skipChange = false;
					}, 200);
				});

				// Hide fallback textarea
				let fallback = wgt.$n('fallback');
				if (fallback) {
					fallback.style.display = 'none';
				}

				// Final height fix
				this._removeHeightStyle();

			} catch(e) {
				console.error('JsonEditorBox: Failed to initialize editor', e);
				this._initFallbackMode();
			}
		},

		_initFallbackMode: function() {
			// Show the fallback textarea
			let fallback = this.$n('fallback');
			let editorDiv = this.$n('editor');

			if (fallback) {
				fallback.style.display = 'block';
				fallback.value = this._jsonValue || '';

				let wgt = this;
				jq(fallback).off('change.jsoneditorbox').on('change.jsoneditorbox', function() {
					wgt._jsonValue = this.value;
					wgt.fire('onChange', { value: this.value });
				});
			}

			if (editorDiv) {
				editorDiv.style.display = 'none';
			}
		},

		_parseSchema: function() {
			if (!this._schema) {
				// Default schema for free-form JSON
				return {
					type: 'object',
					title: ' ',
					options: {
						disable_properties: false,
						disable_edit_json: false
					}
				};
			}

			try {
				return JSON.parse(this._schema);
			} catch(e) {
				console.warn('JsonEditorBox: Invalid schema, using default', e);
				return {
					type: 'object',
					title: ' ',
					options: {
						disable_properties: false,
						disable_edit_json: false
					}
				};
			}
		},

		_parseJsonValue: function() {
			if (!this._jsonValue) {
				return {};
			}

			try {
				return JSON.parse(this._jsonValue);
			} catch(e) {
				return {};
			}
		},

		// Normalize JSON for comparison (removes formatting differences)
		_normalizeJson: function(jsonStr) {
			if (!jsonStr) return '{}';
			try {
				// Parse and re-stringify without formatting to normalize
				return JSON.stringify(JSON.parse(jsonStr));
			} catch(e) {
				return jsonStr || '{}';
			}
		},

		_rebuildEditor: function() {
			this._destroyEditor();
			this._initEditor();
		},

		// --- Popover escaping ------------------------------------------------
		// json-editor renders its "Edit JSON" and "Properties" popovers inline as
		// .je-modal (position:absolute; z-index:10). Inside an iDempiere/ZK AD
		// window those get clipped by the scrollable form region and painted under
		// the detail panel (raising z-index alone does NOT help — it's a stacking
		// context + clipping trap). We relocate any opened .je-modal to <body> with
		// position:fixed and a very high z-index, anchored under its trigger row,
		// and restore it to its original DOM position when it closes.
		_installPopoverEscape: function() {
			let wgt = this;
			let container = this.$n('editor');
			if (!container || wgt._popoverObserver) return;

			wgt._floatingModals = [];
			let Z = 2147483000;

			let isHidden = function(modal) {
				return modal.style.display === 'none';
			};

			let position = function(modal) {
				let c = modal.__jeControls;
				if (!c || !c.isConnected) { restore(modal); return; }
				let r = c.getBoundingClientRect();
				modal.style.left = Math.round(r.left) + 'px';
				modal.style.top = Math.round(r.bottom + 2) + 'px';
			};

			let restore = function(modal) {
				if (!modal.__jeFloating) return;
				if (modal.__jeObs) { modal.__jeObs.disconnect(); modal.__jeObs = null; }
				modal.style.position = '';
				modal.style.zIndex = '';
				modal.style.left = '';
				modal.style.top = '';
				jq(modal).removeClass('je-modal--floating');
				modal.__jeFloating = false;
				modal.__jeControls = null;
				if (modal.__jePlaceholder && modal.__jePlaceholder.parentNode) {
					modal.__jePlaceholder.parentNode.insertBefore(modal, modal.__jePlaceholder);
					modal.__jePlaceholder.remove();
				}
				modal.__jePlaceholder = null;
				let i = wgt._floatingModals.indexOf(modal);
				if (i >= 0) wgt._floatingModals.splice(i, 1);
				if (!wgt._floatingModals.length) wgt._unbindReposition();
			};

			let relocate = function(modal) {
				if (modal.__jeFloating) { position(modal); return; }
				// capture the trigger button row BEFORE detaching the modal
				modal.__jeControls = modal.closest('.je-object__controls')
					|| modal.closest('.je-array__controls') || modal.parentNode;
				modal.__jePlaceholder = document.createComment('je-modal');
				modal.parentNode.insertBefore(modal.__jePlaceholder, modal);
				document.body.appendChild(modal);
				modal.style.position = 'fixed';
				modal.style.zIndex = Z;
				jq(modal).addClass('je-modal--floating');
				modal.__jeFloating = true;
				position(modal);
				wgt._floatingModals.push(modal);

				// once detached, the container observer no longer sees it — watch
				// the modal itself so we can restore it when json-editor hides it
				modal.__jeObs = new MutationObserver(function() {
					if (isHidden(modal)) restore(modal);
				});
				modal.__jeObs.observe(modal, { attributes: true, attributeFilter: ['style', 'class'] });

				wgt._bindReposition();
			};

			// re-anchor / cleanup hooks used by reposition + teardown
			wgt._repositionAll = function() {
				wgt._floatingModals.slice().forEach(position);
			};

			wgt._popoverObserver = new MutationObserver(function(muts) {
				for (let i = 0; i < muts.length; i++) {
					let t = muts[i].target;
					if (t.nodeType === 1 && t.classList
							&& t.classList.contains('je-modal') && !isHidden(t)) {
						relocate(t);
					}
				}
			});
			wgt._popoverObserver.observe(container, {
				attributes: true, attributeFilter: ['style', 'class'], subtree: true
			});
		},

		_bindReposition: function() {
			if (this._repositionHandler) return;
			let wgt = this;
			this._repositionHandler = function() {
				if (wgt._repositionAll) wgt._repositionAll();
			};
			window.addEventListener('scroll', this._repositionHandler, true);
			window.addEventListener('resize', this._repositionHandler, true);
		},

		_unbindReposition: function() {
			if (!this._repositionHandler) return;
			window.removeEventListener('scroll', this._repositionHandler, true);
			window.removeEventListener('resize', this._repositionHandler, true);
			this._repositionHandler = null;
		},

		_teardownPopoverEscape: function() {
			// editor is going away — drop any floating popovers from <body>
			(this._floatingModals || []).slice().forEach(function(modal) {
				if (modal.__jeObs) { modal.__jeObs.disconnect(); modal.__jeObs = null; }
				if (modal.parentNode) modal.parentNode.removeChild(modal);
			});
			this._floatingModals = [];
			this._unbindReposition();
			if (this._popoverObserver) {
				this._popoverObserver.disconnect();
				this._popoverObserver = null;
			}
		},

		getValue: function() {
			if (this._editor && this._editorReady) {
				try {
					return JSON.stringify(this._editor.getValue(), null, 2);
				} catch(e) {
					return this._jsonValue || '';
				}
			}
			return this._jsonValue || '';
		},

		setValue: function(value) {
			this.setJsonValue(value);
		},

		// Override getText for ZK compatibility
		getText: function() {
			return this.getValue();
		},

		// InputWidget compatibility
		getInputNode: function() {
			return this.$n('fallback');
		},

		coerceFromString_: function(value) {
			return value;
		},

		coerceToString_: function(value) {
			return value != null ? value.toString() : '';
		},

		doKeyDown_: function(evt) {
			// Allow all keys in the editor
		},

		doKeyUp_: function(evt) {
			// Handle key events if needed
		},

		// Handle focus
		focus_: function(timeout) {
			// Focus the editor container or fallback
			let n = this.$n('editor') || this.$n('fallback');
			if (n) {
				this._focus(n, timeout);
			}
		}
	});

})();
