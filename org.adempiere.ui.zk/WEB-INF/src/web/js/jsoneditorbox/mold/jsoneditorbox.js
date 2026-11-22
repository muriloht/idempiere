/* jsoneditorbox.js (mold)
 *
 * Purpose:
 *   Mold (rendering template) for JsonEditorBox widget
 *
 * Copyright (C) Contributors
 * This program is free software under GPL v2.
 */
function (out) {
	let zcls = this.getZclass(),
		uid = this.uuid,
		disabled = this._disabled ? ' disabled="disabled"' : '';

	// Don't use domAttrs_ which may include height style
	// Build attributes manually
	let cls = zcls;
	if (this._sclass) cls += ' ' + this._sclass;

	out.push('<div id="', uid, '" class="', cls, '"');

	// Add width if specified, but ignore height
	if (this._width) {
		out.push(' style="width:', this._width, ';"');
	}

	if (!this.isVisible()) {
		out.push(' style="display:none;"');
	}

	out.push('>');

	// Container for JSON Editor
	out.push('<div id="', uid, '-editor" class="', zcls, '-editor"></div>');

	// Fallback textarea (shown when library fails to load)
	out.push('<textarea id="', uid, '-fallback" class="', zcls, '-fallback"',
			disabled,
			' style="display:none; width:100%; min-height:200px; font-family:monospace;">',
			zUtl.encodeXML(this._jsonValue || ''),
			'</textarea>');

	out.push('</div>');
}
