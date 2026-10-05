<%@ page contentType="text/css;charset=UTF-8" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.idempiere.org/dsp/web/util" prefix="u" %>

:root {
	/* Core CSS variables */
	--zk-base-font-size: 12px;
	--zk-base-title-font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Noto Sans", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji";
	--zk-base-content-font-family: var(--zk-base-title-font-family);

	/* --zk-color-primary: #0093F9;  -- removed: let Marble's own primary show through */

	--zk-mask-background-color: var(--zk-color-surface); /* #E0E1E3 */;
	--zk-mesh-cell-focus-box-shadow-color: transparent; /* var(--zk-color-primary); */
	--zk-toolbar-button-background-color: transparent;
    --zk-toolbar-button-checked-color: var(--zk-color-on-primary); /* var(--zk-text-color-default3); */
    --zk-toolbar-button-checked-background-color: var(--zk-color-primary); /* var(--zk-color-primary); */

	/* Custom CSS variables */
	--zk-body-background-color: var(--zk-color-surface-container, #f0f4fa); /* was iceblue #D4E3F4 -> Marble soft surface */
    --zk-body-text-color: var(--zk-color-on-surface);
    --zk-icon-font-family: FontAwesome;

	--zk-screen-font-size-x-large: 14px;
    --zk-screen-font-size-large: 13px;
    --zk-screen-font-size-medium: var(--zk-base-font-size);
    --zk-screen-font-size-small: 11px;
    --zk-mobile-font-size: 15px;

	--zk-attachment-drag-border-color: var(--zk-color-primary);
    --zk-frozen-background-color: var(--zk-color-surface);

	--zk-adwindow-status-background-color: var(--zk-color-surface-container-low);
	--zk-adwindow-docstatus-error-color: var(--zk-color-error);
	--zk-adwindow-breadcrumb-background-color: var(--zk-color-surface);
	--zk-adwindow-breadcrumb-border-color: var(--zk-color-outline-variant);
	--zk-adwindow-detailpane-grid-south-background-color: var(--zk-color-surface);
	--zk-adwindow-sub-tab-border-color: var(--zk-color-outline);
	--zk-adwindow-activity-card-border-color: var(--zk-color-outline-variant);
	--zk-adwindow-mobile-overflow-active-background-color: var(--zk-color-surface-container-high);

	--zk-appmenu-link-color: var(--zk-body-text-color);
	--zk-appmenu-link-hover-background-color: var(--zk-color-surface-container-high, #e8eef7);
	--zk-appmenu-link-hover-color: rgba(0,0,0,0.9);
	--zk-appmenu-search-toggle-border-color: var(--zk-color-outline-variant);
	--zk-appmenu-highlight-background-color: var(--zk-color-primary-container);

	--zk-button-os-hover-color: var(--zk-color-on-surface);
	--zk-button-os-hover-background-color: var(--zk-color-surface-container-high);
	--zk-button-focus-border-color-local: var(--zk-color-primary);
	--zk-button-sorttab-shadow-color: var(--zk-color-outline-variant);
	--zk-button-sorttab-color: var(--zk-color-on-surface-variant);
	--zk-button-sorttab-border-color: var(--zk-color-outline-variant);
	--zk-button-sorttab-text-shadow-color: var(--zk-color-outline);
	--zk-button-cancel-background-color: var(--zk-color-surface-container-high);
	--zk-button-cancel-color: var(--zk-color-on-surface);
	--zk-button-cancel-hover-background-color: var(--zk-color-surface-container-highest);
	--zk-button-cancel-hover-color: var(--zk-color-on-surface);
	--zk-button-disabled-icon-color: var(--zk-body-text-color);
	--zk-button-ok-icon-color: var(--zk-color-on-primary);

	--zk-desktop-header-background-color: var(--zk-color-surface-container-high, #e8eef7);
	--zk-desktop-header-border-color: var(--zk-color-outline-variant, #d7dce3); /* was iceblue #adddff */
	--zk-desktop-header-hover-background-color: var(--zk-color-surface-container-highest, #e0e8f4);
	--zk-desktop-header-hover-color: var(--zk-color-on-surface);
	--zk-desktop-tab-toolbar-hover-background-color: var(--zk-color-surface-container-high);
	--zk-desktop-tab-toolbar-hover-shadow-color: var(--zk-color-outline-variant);
	--zk-desktop-column-border-color: var(--zk-color-outline-variant);
	--zk-desktop-column-background-color: var(--zk-color-surface-container-low);
	--zk-desktop-toolbar-icon-color: var(--zk-color-on-surface-variant);

	--zk-drill-window-field-color: var(--zk-color-on-surface-variant);

	--zk-field-editor-button-icon-color: var(--zk-body-text-color);
	--zk-field-editor-button-hover-icon-color: var(--zk-color-on-surface);
	--zk-field-editor-chosenbox-focus-background-color: var(--zk-color-surface-container-high);
	--zk-field-editor-chosenbox-focus-border-color: var(--zk-color-primary);
	--zk-field-editor-grid-combobox-focus-button-border-color: var(--zk-color-primary);
	--zk-field-editor-image-border-color: var(--zk-color-outline-variant);
	--zk-field-editor-html-border-color: var(--zk-color-outline-variant);
	--zk-field-editor-html-hover-border-color: var(--zk-color-outline);
	--zk-field-editor-mandatory-border-color: var(--zk-color-error);
	--zk-field-editor-mandatory-label-color: var(--zk-color-error);
	--zk-field-editor-action-hover-background-color: var(--zk-color-surface-container-high);
	--zk-field-editor-fullsize-image-border-color: var(--zk-color-outline-variant);
	--zk-field-editor-fullsize-image-background-color: var(--zk-color-surface-container);

	/* Marble (M3) adherence: find-window popup tokens mapped to Marble color roles. */
	--zk-find-window-popup-background-color: var(--zk-color-surface-container);
	--zk-find-window-popup-shadow-color: rgba(0,0,0,0.12);
	--zk-find-window-popup-mobile-shadow-color: rgba(0,0,0,0.15);
	--zk-find-window-menu-text-color: var(--zk-color-on-surface);
	--zk-find-window-transparent-color: transparent;
	--zk-find-window-item-hover-gradient-start-color: var(--zk-color-surface-container-high);
	--zk-find-window-item-hover-gradient-end-color: var(--zk-color-surface-container-high);
	--zk-find-window-delete-hover-gradient-start-color: var(--zk-color-error-container);
	--zk-find-window-delete-hover-gradient-end-color: var(--zk-color-error-container);
	--zk-find-window-item-active-background-color: var(--zk-color-surface-container-high);
	--zk-find-window-item-separator-border-color: var(--zk-color-outline-variant);
	--zk-find-window-delete-text-color: var(--zk-color-error);
	--zk-find-window-delete-hover-text-color: var(--zk-color-error);
	--zk-find-window-separator-gradient-mid-color: var(--zk-color-outline-variant);
	--zk-find-window-checkbox-checked-color: var(--zk-color-primary);

	--zk-font-icons-error-message-color: var(--zk-color-status-error);
	--zk-font-icons-exclamation-message-color: var(--zk-color-status-warning);
	--zk-font-icons-info-message-color: var(--zk-color-status-info);
	--zk-font-icons-question-message-color: var(--zk-color-status-success);

	--zk-form-busy-dialog-background-color: transparent;
	--zk-form-busy-dialog-box-background-color: transparent;
	--zk-form-busy-dialog-image-background-color: transparent;
	--zk-form-busy-dialog-label-color: var(--zk-color-on-surface);

	--zk-form-status-border-color: var(--zk-color-outline-variant);

	--zk-gadget-border-radius: var(--zk-shape-corner-small);
	--zk-gadget-box-shadow: var(--zk-elevation-1);
	--zk-gadget-box-shadow-hover: var(--zk-elevation-2);
	--zk-gadget-dashboard-widget-border-color: var(--zk-color-outline-variant);
	--zk-gadget-panel-body-background-color: var(--zk-color-surface);
	--zk-gadget-panel-header-background-color: var(--zk-color-surface);
	--zk-gadget-panel-header-border-color: var(--zk-color-outline-variant);
	--zk-gadget-panel-header-text-color: var(--zk-color-on-surface);
	--zk-gadget-panel-icon-color: var(--zk-color-on-surface-variant);
	--zk-gadget-panel-icon-hover-color: var(--zk-color-on-surface);
	--zk-gadget-panel-icon-hover-bg: var(--zk-color-surface-container-high);
	--zk-gadget-recent-item-text-color: var(--zk-body-text-color);
	--zk-gadget-recent-item-hover-background-color: var(--zk-color-surface-container-high, #e8eef7);
	--zk-gadget-views-button-hover-text-color: var(--zk-color-on-surface);
	--zk-gadget-mandatory-process-background-color: var(--zk-color-error);
	--zk-gadget-mandatory-process-text-color: var(--zk-color-on-error);
	--zk-gadget-performance-indicator-background-color: var(--zk-color-surface-container-low);
	--zk-gadget-performance-indicator-border-color: var(--zk-color-outline-variant);
	--zk-gadget-performance-title-background-color: var(--zk-color-surface-container);
	--zk-gadget-favorite-button-border-color: var(--zk-color-outline-variant);
	--zk-gadget-help-popup-background-color: var(--zk-color-inverse-surface);
	--zk-gadget-help-popup-text-color: var(--zk-color-inverse-on-surface);

	--zk-grid-header-background-color: var(--zk-color-surface-container, #f0f4fa);
	--zk-grid-header-border-color: var(--zk-color-outline-variant);
	--zk-grid-row-indicator-color: var(--zk-body-text-color);
	--zk-grid-highlight-background-color: var(--zk-color-primary-container);
	--zk-grid-transparent-color: transparent;
	--zk-grid-body-background-color: var(--zk-color-surface);
	--zk-grid-content-text-color: var(--zk-body-text-color);
	--zk-grid-content-hover-text-color: var(--zk-color-on-surface);
	--zk-grid-sort-active-background-color: var(--zk-color-surface-container-high, #e8eef7);
	--zk-grid-row-cell-border-color: var(--zk-color-outline-variant);
	/* row hover 4% -> M3 8%; grids stay flat */
	--zk-grid-row-hover-bg: color-mix(in srgb, var(--zk-color-on-surface) 8%, transparent);

	--zk-group-row-background-color: var(--zk-color-surface-container);
	--zk-group-header-text-color: var(--zk-color-on-surface);
	--zk-group-inner-background-color: var(--zk-color-surface);
	--zk-group-list-header-border-color: rgb(207, 207, 207);

	--zk-help-window-title-color: var(--zk-color-on-surface);
	--zk-help-window-tabs-color: var(--zk-color-primary);
	--zk-help-window-content-border-color: var(--zk-color-outline-variant);
	--zk-help-window-tab-header-background-color: var(--zk-color-surface-container);
	--zk-help-window-tab-name-color: var(--zk-color-on-surface);
	--zk-help-window-fields-color: var(--zk-color-primary);
	--zk-help-window-content-link-color: var(--zk-color-primary);
	--zk-help-window-left-link-color: var(--zk-color-on-surface);
	--zk-help-window-row-hover-background-color: var(--zk-color-surface-container-high);

	--zk-info-window-panel-background-color: var(--zk-color-surface-container);

	--zk-input-element-attachment-border-color: var(--zk-color-outline-variant);
	--zk-input-element-attachment-background-color: var(--zk-color-surface-container);
	--zk-input-element-combobox-disabled-color: rgba(0,0,0,0.7);
	--zk-input-element-combobox-text-disabled-background-color: var(--zk-color-surface-container-high);
	--zk-input-element-focus-background-color: var(--zk-color-surface-container-high);
	--zk-input-element-readonly-background-color: var(--zk-color-surface-container);
	--zk-input-element-disabled-color: var(--zk-color-on-surface-variant);
	--zk-input-element-border-color: var(--zk-color-outline-variant);
	--zk-input-element-datebox-button-color: var(--zk-body-text-color);
	--zk-input-element-hover-background-color: var(--zk-color-surface-container-high);
	--zk-input-element-hover-icon-color: var(--zk-color-on-surface);
	--zk-input-element-checkbox-focus-border-color: var(--zk-color-primary);
	--zk-input-element-checkbox-focus-color: var(--zk-color-primary-container);
	--zk-input-element-label-color: var(--zk-body-text-color);

	--zk-login-window-background-color: var(--zk-color-surface-container, #f0f4fa); /* was iceblue #c7e8ff -> Marble soft surface */
	--zk-login-box-background-color: var(--zk-color-surface, #fff);
	--zk-login-header-text-color: var(--zk-color-on-surface, #1c1b1f);
	--zk-login-label-color: var(--zk-color-on-surface-variant, #44474f);
	--zk-login-side-panel-background-color: var(--zk-color-surface, #fff);

	--zk-menu-tree-disabled-color: var(--zk-color-on-surface-variant);
	--zk-menu-tree-disabled-border-color: var(--zk-color-outline-variant);

	--zk-parameter-process-bottom-border-color: var(--zk-color-outline-variant);
	--zk-parameter-process-placeholder-color: var(--zk-color-on-surface-variant);

	/* Status legend — Marble's canonical status roles as soft backgrounds via its own
	   color-mix idiom (20% tint, same as .z-progressmeter-*): finished=success,
	   in-progress=info, pending=warning, delayed=error, skipped=neutral. */
	--zk-setup-wizard-finished-background-color: color-mix(in srgb, var(--zk-color-status-success) 20%, transparent);
	--zk-setup-wizard-skipped-background-color: color-mix(in srgb, var(--zk-color-status-neutral) 20%, transparent);
	--zk-setup-wizard-delayed-background-color: color-mix(in srgb, var(--zk-color-status-error) 20%, transparent);
	--zk-setup-wizard-in-progress-background-color: color-mix(in srgb, var(--zk-color-status-info) 20%, transparent);
	--zk-setup-wizard-pending-background-color: color-mix(in srgb, var(--zk-color-status-warning) 20%, transparent);
	--zk-setup-wizard-progress-border-color: var(--zk-color-outline-variant);

	--zk-toolbar-popup-window-border-color: var(--zk-color-outline-variant);
	--zk-toolbar-popup-arrow-shadow-color: rgba(0, 0, 0, 0.2);
	--zk-toolbar-popup-arrow-background-color: var(--zk-color-surface);
	--zk-toolbar-popup-arrow-side-border-color: transparent;
    
	--zk-toolbar-depressed-border-color: var(--zk-color-primary);
	--zk-toolbar-depressed-background-color: var(--zk-color-primary-container);
	--zk-toolbar-button-text-color: var(--zk-body-text-color);
	--zk-toolbar-button-focus-text-color: var(--zk-color-on-primary);
	--zk-toolbar-button-focus-background-color: var(--zk-color-primary);

	--zk-tree-cell-text-color: var(--zk-body-text-color);
	--zk-tree-moveitem-inset-border-shadow-color: var(--zk-color-outline-variant);
	--zk-tree-moveitem-inset-shadow-color: var(--zk-color-outline);
	
	--zk-window-modal-background-color: var(--zk-color-surface);
	--zk-window-transparent-color: transparent;
	--zk-window-header-color: var(--zk-color-on-surface);
	--zk-window-embedded-header-color: var(--zk-color-on-surface); /* was #fff — invisible on Marble's light surface (embedded header bg is transparent); matches --zk-window-header-color */
	--zk-window-dialog-footer-background-color: var(--zk-color-surface-container-low);
	--zk-window-dialog-footer-shadow-color: var(--zk-color-surface);
	--zk-window-quickform-readonly-color: var(--zk-color-on-surface);
	--zk-window-quickform-current-row-border-color: var(--zk-color-primary);

	--zk-text-color-light: rgba(0,0,0,0.72);
}

html,body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
	background-color: var(--zk-body-background-color);
	color: var(--zk-body-text-color);
	font-family: var(--zk-base-content-font-family);
	overflow: hidden;
}


.z-initing {
    background-image: url(${c:encodeURL('~./theme/marble/images/zssosepowered.png')}) !important;
}

[class*="z-"]:not([class*="z-icon-"]):not([class*="z-group-icon-"]) {
	font-family: var(--zk-base-content-font-family);
}
@media screen and (min-device-width: 2500px) {
	[class*="z-"]:not([class*="z-icon-"]):not([class*="z-group-icon-"]) {
		font-size: var(--zk-screen-font-size-x-large);
	}
}
@media screen and (max-device-width: 2499px) {
	[class*="z-"]:not([class*="z-icon-"]):not([class*="z-group-icon-"]) {
		font-size: var(--zk-screen-font-size-large);
	}
}
@media screen and (max-device-width: 1899px) {
	[class*="z-"]:not([class*="z-icon-"]):not([class*="z-group-icon-"]) {
		font-size: var(--zk-screen-font-size-medium);
	}
}
@media screen and (max-device-width: 1399px) {
	[class*="z-"]:not([class*="z-icon-"]):not([class*="z-group-icon-"]) {
		font-size: var(--zk-screen-font-size-small);
	}
}

<%-- Mobile/Tablet --%>
.tablet-scrolling {
	-webkit-overflow-scrolling: touch;
}
<%-- default font size for mobile --%>
.mobile [class*="z-"]:not([class*="z-icon-"]):not([class*="z-group-icon-"]) {
    font-size: var(--zk-mobile-font-size);
}
<%-- the not=xyz is needed to get this selected over standard zk rule --%>
.mobile [class*="z-icon-"]:not([class*="xyz"]), .mobile [class*="z-group-icon-"] {
    font-size: var(--zk-mobile-font-size);
}

<%-- vbox fix for firefox and ie --%>
table.z-vbox > tbody > tr > td > table {
	width: 100%;	
}

<%-- decorate file drop area --%>
.attachment-drag-entered {
    border: 5px dashed var(--zk-attachment-drag-border-color) !important;
}

<c:include page="fragment/login.css.dsp" />

<c:include page="fragment/desktop.css.dsp" />

<c:include page="fragment/application-menu.css.dsp" />

<c:include page="fragment/gadget.css.dsp" />

<c:include page="fragment/toolbar.css.dsp" />

<c:include page="fragment/button.css.dsp" />

<c:include page="fragment/adwindow.css.dsp" />
			
<%-- MARBLE-STRIP: <c:include page="fragment/grid.css.dsp" /> --%>

<%-- MARBLE-STRIP: <c:include page="fragment/input-element.css.dsp" /> --%>

<c:include page="fragment/tree.css.dsp" />

<c:include page="fragment/field-editor.css.dsp" />

<c:include page="fragment/group.css.dsp" />

<%-- MARBLE-STRIP: <c:include page="fragment/tab.css.dsp" /> --%>

<c:include page="fragment/menu-tree.css.dsp" />

<c:include page="fragment/info-window.css.dsp" />

<c:include page="fragment/window.css.dsp" />

<c:include page="fragment/form.css.dsp" />

<c:include page="fragment/toolbar-popup.css.dsp" />	

<c:include page="fragment/setup-wizard.css.dsp" />

<c:include page="fragment/about.css.dsp" />

<c:include page="fragment/tab-editor.css.dsp" />

<c:include page="fragment/find-window.css.dsp" />

<c:include page="fragment/help-window.css.dsp" />

<c:include page="fragment/drill-window.css.dsp" />

<%-- MARBLE-STRIP: borderlayout.css.dsp removed — Marble styles .z-south/north/east/west natively --%>

<c:include page="fragment/parameter-process.css.dsp" />

<c:include page="fragment/window-size.css.dsp" />

<c:include page="fragment/font-icons.css.dsp" />

<c:include page="fragment/keikai.css.dsp" />

<c:if test="${u:isThemeHasCustomCSSFragment()}">
    <c:include page="fragment/custom.css.dsp" />
</c:if>

/* Marble styles the .z-loadingbar (top progress bar) but NOT the .z-loading "Processing"
   box, which ZK renders at top-left (position:absolute;top:0;left:0) and then re-centers
   via JS -> a visible jump on index load. Center it from the first paint. The !important
   beats ZK's inline JS positioning so it stays centered (no jump).
   NOTE: Marble gap (loading box uncentered) — worth reporting upstream. */
.z-loading {
	position: fixed !important;
	top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%) !important;
}
