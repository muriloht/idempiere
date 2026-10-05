<%-- container for input field and button --%>
.editor-box {
	display: inline-flex;
	padding: 0px; 
	margin: 0px; 
	position: relative;
	align-items: center;
}

<%-- input field --%>
.editor-input {
	box-sizing: border-box;
	-moz-box-sizing: border-box; /* Firefox */
	display: inline-block;	 
	width: 100%;
	flex: auto;
}
.editor-input.mobile.z-decimalbox {
	padding-right: 5px;
}

<%-- combobox editor: restore inline-flex so input fills to the button --%>
.editor-input.z-combobox {
	display: inline-flex;
}

<%-- button for field --%>
.editor-button {
	padding: 0px;
	margin: 0px;
	display: inline-block;	
	background-color: transparent;
	background-image: none;
	width: 24px;
	min-width: 24px;
	height: 24px;
	min-height: 24px;	
	border: none;
	box-shadow: none;
	flex: auto;
}
.z-button.editor-button > i,
.z-button-os.editor-button > i {
	color: var(--zk-field-editor-button-icon-color);
}
.z-button.editor-button:hover > i,
.z-button-os.editor-button:hover > i {
  color: var(--zk-field-editor-button-hover-icon-color);
}
.editor-button :hover {
	-webkit-filter: contrast(1.5);
	filter: contrast(150%);
}
.editor-button img {
	vertical-align: top;
	text-align: left;
	width: 18px;
	height: 18px;
	padding: 1px 1px;
}

<%-- chosen box --%>
<%-- Marble styles the zkmax Chosenbox, but iDempiere ships its OWN forked chosenbox addon
     (org.zkoss.addon.chosenbox; DOM: .z-chosenbox-inp/-sel-item/-sel-item-cnt/-del-btn/-pp/-option)
     whose CSS path is outside Marble's theme-provider rewrite scope, so it kept the legacy
     gradient/sprite look. Re-skin the fork's ACTUAL DOM with Marble tokens to match the theme. --%>
.z-chosenbox {
	background: var(--zk-color-surface);
	background-image: none;
	border: 1px solid var(--zk-color-outline-variant);
	border-radius: var(--zk-shape-corner-extra-small);
	min-height: var(--zk-control-height);
	box-sizing: border-box;
	display: inline-flex;
	flex-wrap: wrap;
	align-items: center;
	gap: 4px;
	padding: 3px 6px;
	cursor: text;
	overflow: visible;
}
.z-chosenbox:hover {
	border-color: var(--zk-color-outline);
}
.z-chosenbox:has(> .z-chosenbox-inp:focus),
.z-chosenbox-focus {
	border-color: var(--zk-color-primary);
	box-shadow: 0 0 0 1px var(--zk-color-primary);
}
<%-- selected chips --%>
.z-chosenbox-sel-item {
	background: var(--zk-color-surface-container-high);
	background-image: none;
	border: none;
	border-radius: var(--zk-shape-corner-extra-small);
	color: var(--zk-color-on-surface);
	margin: 0;
	padding: 0 4px 0 8px;
	height: 26px;
	display: inline-flex;
	align-items: center;
	gap: 2px;
	flex-shrink: 0;
	white-space: nowrap;
}
.z-chosenbox-sel-item-focus {
	background: var(--zk-color-secondary-container);
	border-color: transparent;
}
.z-chosenbox-sel-item-cnt {
	color: var(--zk-color-on-surface);
	font-family: var(--zk-base-content-font-family);
	padding: 0 2px;
}
<%-- chip delete (x): drop the legacy sprite for a clean glyph button --%>
.z-chosenbox-del-btn {
	background: none !important;
	border: none;
	width: 16px;
	height: 16px;
	border-radius: 50%;
	position: relative;
	cursor: pointer;
	flex-shrink: 0;
}
.z-chosenbox-del-btn::before {
	content: "\00d7";
	position: absolute;
	inset: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 15px;
	line-height: 1;
	color: var(--zk-color-on-surface-variant);
}
.z-chosenbox-del-btn:hover {
	background: rgba(0, 0, 0, 0.08) !important;
}
<%-- inline text input --%>
.z-chosenbox-inp {
	background: transparent !important;
	border: 0 !important;
	outline: 0;
	box-shadow: none;
	color: var(--zk-color-on-surface);
	font-family: var(--zk-base-content-font-family);
	flex: 1;
	min-width: 60px;
	padding: 0 4px;
}
<%-- dropdown popup + options --%>
.z-chosenbox-pp {
	background: var(--zk-color-surface);
	border: 1px solid var(--zk-color-outline-variant);
	border-radius: var(--zk-shape-corner-small);
	box-shadow: var(--zk-elevation-dropdown);
	overflow: auto;
}
.z-chosenbox-option {
	padding: 6px 12px;
	color: var(--zk-color-on-surface);
	cursor: pointer;
}
.z-chosenbox-option-over {
	background: var(--zk-color-surface-container-high);
}
.z-chosenbox-empty {
	padding: 6px 12px;
	color: var(--zk-color-on-surface-variant);
}
.z-chosenbox-empty-creatable {
	padding: 6px 12px;
	color: var(--zk-color-primary);
	cursor: pointer;
}
<%-- include/exclude icon for chosenbox - M3 state color via the btn-negate-include/-exclude
     classes (set in ProcessParameterPanel): include=primary (included), exclude=error (negated) --%>
.editor-box + .btn-negate-include.z-button > .z-icon-IncludeSelected::before {
	color: var(--zk-color-primary);
}
.editor-box + .btn-negate-exclude.z-button > .z-icon-ExcludeSelected::before {
	color: var(--zk-color-error);
}
<%-- Marble's param-grid cells are position:static, so this absolutely-positioned button
     escaped to the grid body (rendered top-right of the whole panel = "torto"). Anchor it
     to its own field box and center it vertically in the control. --%>
.z-div:has(> .btn-negate) {
	position: relative;
}
.editor-box + .btn-negate.z-button {
	background: none;
	border: none;
	margin: 0px !important;
	padding: 0px;
	min-width: 18px;
	width: 18px;
	height: 18px;
	min-height: 18px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
	font-weight: lighter;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	right: 30px;
	z-index: 2000;
}
.editor-box + .btn-negate.z-button, 
.editor-box + .btn-negate.z-button:focus {
	border: none;
	box-shadow: none;	
}
.editor-box + .btn-negate.z-button [class^="z-icon-"] {
	font-size: 14px;
	padding: 0px;
	line-height: 1;
}

<%-- datetime box --%>
.datetime-box {
	display: flex;
	flex-wrap: wrap;
}

<%-- combobox editor in grid view --%>
span.grid-combobox-editor {
	width: 100% !important;
	position: relative;
}
.grid-combobox-editor input {
	width: 100% !important;
	padding-right: 26px;
	border-right: 0px;
}
.grid-combobox-editor.z-combobox-disabled input {
	padding-right: 5px;
}
.grid-combobox-editor .z-combobox-button {
	position: absolute;
	right: 0px;
}
.grid-combobox-editor input:focus {
	border-right: 0px;
}
	
.grid-combobox-editor input:focus + .z-combobox-button {
	border-left: 1px solid var(--zk-field-editor-grid-combobox-focus-button-border-color);
}

<%-- payment rule --%>
.payment-rule-editor {
	display: inline-flex;
	padding: 0px; 
	margin: 0px; 
	position: relative;
}
.payment-rule-editor .z-combobox {
	width: 100%;
}
.payment-rule-editor .z-combobox-input {
	display: inline-block;
	padding-right: 44px; 
	width: 100%;
}
.payment-rule-editor .z-combobox-input.editor-input-disd {
	padding-right: 22px !important;
}
.payment-rule-editor .z-combobox-button {
	position: absolute;
	right: 0px;
}
.payment-rule-editor .z-combobox .z-combobox-button-hover {
	background-position: 0px 0px;
}
.payment-rule-editor > .editor-button {
	border-radius: 0px;
	right: 24px;
	border: none;
  	top: 3px;
  	min-height: 20px;
}

<%-- chart --%>
.chart-field {
	padding: 10px; 
}

<%-- image field --%>
.image-field {
	cursor: pointer;
	border: 1px solid var(--zk-field-editor-image-border-color);
	height: 24px;
	width: 24px;
}
.image-field.image-field-readonly {
	cursor: default;
	border: none;
}
.image-fit {
	object-fit: scale-down;
}
.z-cell.image-field-cell {
	z-index: 1;
}

<%-- html field --%>
.html-field {
	cursor: pointer;
	overflow: auto;
	border: 1px solid var(--zk-field-editor-html-border-color);
	border-radius: 4px;
}
.html-field:hover {
	border-color: var(--zk-field-editor-html-hover-border-color);
}
.html-field:focus {
	border-color: var(--zk-field-editor-chosenbox-focus-border-color);
}

<%-- dashboard content editor --%>
.dashboard-field-panel.z-panel, .dashboard-field-panel.z-panel > .z-panel-body,  .dashboard-field-panel.z-panel > .z-panel-body > .z-panelchildren  {
	overflow: visible;
}

<%-- field label --%>
.field-label {
	position: relative; 
	float: right;
}
.mandatory-decorator-text {
	text-decoration: none; font-size: xx-small; vertical-align: top;
}

.idempiere-mandatory, .idempiere-mandatory input, .idempiere-mandatory a {
	border-color:var(--zk-field-editor-mandatory-border-color);
}

.idempiere-mandatory-label{
   color: var(--zk-field-editor-mandatory-label-color)!important;
}

.idempiere-zoomable-label {
    cursor: pointer; 
    text-decoration: underline;
}

<%-- range button for datebox --%>
.z-toolbarbutton:has(> span > i.z-icon-History) {
	padding: 2px;
    min-width: 24px;
    border: none;
}
.z-toolbarbutton:has(> span > i.z-icon-History):hover {
	background-color: var(--zk-field-editor-action-hover-background-color) !important;
}
.date-picker-calendar-button {
    position: absolute;
    right: 0px;
    top: 5px;
}
<%-- date range editor --%>
.date-picker-container {
	padding-left: 5px;
}
.date-picker-component {
	display: inline-grid;
	min-height: 25px;
	border-radius: 5px;
	margin: 0px 5px 5px 0px !important;
}
.date-picker-component .z-listbox {
	border: none;
}
.date-picker-label {
	font-weight: bold;
	margin: 5px;
}

<%-- record id editor --%>
.recordid-editor {
  display: inline-flex;
  position: relative;
  align-items: center;
}
.recordid-editor > input {
  flex: auto;
}
.recordid-editor .z-toolbarbutton {
    margin: 0px;
    background-image: none;
    position: relative;
    width: 24px;
    min-width: 24px;
    height: 24px;
    min-height: 24px;
    right: auto !important;
    padding: 0px;
    flex: auto;
}
.recordid-editor .z-toolbarbutton:hover {
	background-color: var(--zk-field-editor-action-hover-background-color);
}

<%-- font icon for field button --%>
.z-button [class^="z-icon-"], .z-button-os [class^="z-icon-"] {
	color: var(--zk-field-editor-button-hover-icon-color);
}

<%-- full size image hover --%>
.fullsize-image {
	padding: 5px;
  	border: 1px solid var(--zk-field-editor-fullsize-image-border-color);
  	background: var(--zk-field-editor-fullsize-image-background-color);
}
