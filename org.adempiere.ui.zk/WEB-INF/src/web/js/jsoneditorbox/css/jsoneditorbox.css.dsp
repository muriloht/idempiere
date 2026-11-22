<%-- jsoneditorbox.css.dsp

Purpose:
  Styles for JsonEditorBox widget

Copyright (C) Contributors
This program is free software under GPL v2.
--%>
<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>

.z-jsoneditorbox {
	display: block;
	width: 100%;
	position: relative;
	height: auto !important;
	min-height: 50px;
	overflow: visible;
}

.z-jsoneditorbox-editor {
	width: 100%;
	min-height: 50px;
	overflow: visible;
	/* No background, no border - integrate with page */
	background: transparent;
	border: none;
	padding: 0;
}

.z-jsoneditorbox-fallback {
	width: 100%;
	min-height: 150px;
	font-family: monospace;
	font-size: 12px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

/* JSON Editor library overrides */
.z-jsoneditorbox .je-object__container {
	position: relative;
	overflow: visible;
}

.z-jsoneditorbox .je-indented-panel {
	padding-left: 10px;
	margin-left: 5px;
	border-left: 1px solid #ddd;
}

.z-jsoneditorbox .row {
	margin-left: 0;
	margin-right: 0;
	display: flex;
	flex-wrap: wrap;
}

.z-jsoneditorbox .form-group {
	margin-bottom: 8px;
	width: 100%;
}

.z-jsoneditorbox .form-control {
	font-size: 12px;
	padding: 4px 8px;
	height: auto;
	width: 100%;
	box-sizing: border-box;
}

.z-jsoneditorbox input[type="text"],
.z-jsoneditorbox input[type="number"],
.z-jsoneditorbox select,
.z-jsoneditorbox textarea {
	width: 100%;
	padding: 4px 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 12px;
	box-sizing: border-box;
}

.z-jsoneditorbox .btn {
	font-size: 11px;
	padding: 2px 6px;
	margin: 1px;
	cursor: pointer;
}

.z-jsoneditorbox .btn-group {
	margin-bottom: 5px;
}

/* Property controls */
.z-jsoneditorbox .je-object__controls {
	margin-bottom: 5px;
}

.z-jsoneditorbox .json-editor-btn-add,
.z-jsoneditorbox .json-editor-btn-delete,
.z-jsoneditorbox .json-editor-btn-collapse,
.z-jsoneditorbox .json-editor-btn-edit_properties,
.z-jsoneditorbox .json-editor-btn-moveup,
.z-jsoneditorbox .json-editor-btn-movedown {
	background: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 2px 6px;
	font-size: 11px;
	cursor: pointer;
}

.z-jsoneditorbox .json-editor-btn-add:hover,
.z-jsoneditorbox .json-editor-btn-delete:hover {
	background: #e0e0e0;
}

.z-jsoneditorbox .json-editor-btn-delete {
	color: #c00;
}

/* Labels */
.z-jsoneditorbox label {
	font-weight: normal;
	font-size: 12px;
	margin-bottom: 2px;
	display: block;
}

.z-jsoneditorbox .je-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 5px 0;
	margin-bottom: 5px;
}

/* Error styling */
.z-jsoneditorbox .invalid-feedback {
	display: block;
	font-size: 11px;
	color: #c00;
	margin-top: 2px;
}

.z-jsoneditorbox .is-invalid {
	border-color: #c00;
}

/* Disabled state */
.z-jsoneditorbox[disabled] .z-jsoneditorbox-editor {
	pointer-events: none;
	opacity: 0.6;
}

/* Card/Panel styles - transparent, no border */
.z-jsoneditorbox .card {
	border: none;
	border-radius: 0;
	margin-bottom: 8px;
	background: transparent;
}

.z-jsoneditorbox .card-header {
	background: transparent;
	padding: 5px 0;
	border-bottom: none;
	font-weight: bold;
	font-size: 12px;
}

.z-jsoneditorbox .card-body {
	padding: 5px 0;
}

/* Collapse icon */
.z-jsoneditorbox .je-collapse-icon {
	cursor: pointer;
	margin-right: 5px;
}

/* Array items */
.z-jsoneditorbox .je-array-item {
	margin-bottom: 5px;
	padding: 5px;
	border: 1px solid #eee;
	border-radius: 3px;
	background: transparent;
}

/* Ensure proper containment - allow growth */
.z-jsoneditorbox .je-object__container,
.z-jsoneditorbox .je-array__container {
	overflow: visible;
	position: relative;
}

/* Fix for select2 and other dropdowns if used */
.z-jsoneditorbox select {
	max-width: 100%;
}

/* Override any inline styles that might set fixed height */
.z-jsoneditorbox[style*="height"] {
	height: auto !important;
}

/* Ensure the editor container grows */
div.z-jsoneditorbox,
div.z-jsoneditorbox-editor {
	height: auto !important;
	overflow: visible !important;
}

/* ---------------------------------------------------------------------------
   Floating popovers (Edit JSON / Properties)
   json-editor renders these inline as .je-modal (z-index:10), which gets clipped
   by the scrollable AD window form region and painted under the detail panel.
   The widget JS relocates them to <body> with position:fixed (class added below).
   Since they leave the .z-jsoneditorbox scope, re-apply the chrome + field
   styling here at the global level.
   --------------------------------------------------------------------------- */
.je-modal--floating {
	background: #ffffff;
	border: 1px solid #adadad;
	border-radius: 4px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
	padding: 10px;
	max-height: 70vh;
	max-width: 90vw;
	overflow: auto;
}

.je-modal--floating input[type="text"],
.je-modal--floating input[type="number"],
.je-modal--floating select,
.je-modal--floating textarea {
	padding: 4px 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 12px;
	box-sizing: border-box;
}

.je-modal--floating textarea {
	width: 340px;
	min-height: 180px;
	font-family: monospace;
}

.je-modal--floating label {
	font-size: 12px;
	font-weight: normal;
	margin-right: 6px;
}

.je-modal--floating button {
	font-size: 11px;
	padding: 3px 10px;
	margin: 6px 4px 0 0;
	border: 1px solid #ccc;
	border-radius: 3px;
	background: #f5f5f5;
	cursor: pointer;
}

.je-modal--floating button:hover {
	background: #e8e8e8;
}
