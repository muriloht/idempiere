<%@ taglib uri="http://www.idempiere.org/dsp/web/util" prefix="u" %>
<%-- header --%>
.desktop-north {
	background-color: var(--zk-desktop-header-background-color);
	border-bottom: 1px solid var(--zk-desktop-header-border-color) !important;
}
<%-- left panel for logo and global search --%>
.desktop-header-left {
	margin: 0;
	margin-left: 1px;
	margin-top: 1px;
	background-color: transparent !important; 
	border: none !important;
}

.desktop-header {
	background-color: ${u:sysConfig("ZK_DESKTOP_HEADER_BACKGROUND_COLOR", "var(--zk-color-surface-container-high, #e8eef7)")}; <%-- default -> Marble soft surface (was iceblue #C7E8FF) --%>
	width: 100%;
	height: 46px;
	padding-left: 4px;
}

.desktop-header.mobile {
	height: 36px;
	padding: 4px 4px;
}
.desktop-header.mobile .systemStatus {
	display:none;
}

<%-- user name and links --%>
.desktop-header-font {
	font-size: 10px;
}

<%-- popup container for collapsed desktop header --%>
.desktop-header-popup {
	width: 800px;
	border-radius: 2px;
	border: none;
	right: 1px;
}
.desktop-header-popup, .desktop-header-popup > .z-window-content {
	background-color: var(--zk-desktop-header-background-color);
}

.desktop-header-popup .desktop-header {
	border: none;
	height: 100% !important;
}

<%-- right panel for user name, notifications, and links --%>
.desktop-user-panel {
	float: right;
	display: inline-flex;
	align-items: center;
}
.desktop-user-panel.mobile .desktop-header-font.desktop-header-username {
	font-weight: 600;
    white-space: nowrap;
}
.desktop-user-panel.mobile {
    height: auto;
}
.desktop-user-panel .z-toolbarbutton:hover {
	background: var(--zk-desktop-header-hover-background-color);
	color: var(--zk-desktop-header-hover-color);
}
.desktop-header-username {
	padding: 0px 4px;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.desktop-header-username:hover {
	background: var(--zk-desktop-header-hover-background-color);
	color: var(--zk-desktop-header-hover-color);
}

<%-- Notification Bell --%>
.desktop-header-notification-btn {
	position: relative;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 34px;
	height: 34px;
	margin-right: 8px;
	border-radius: 6px;
	cursor: pointer;
	color: var(--zk-color-on-surface-variant);
	transition: background-color 0.15s ease, color 0.15s ease;
}
.desktop-header-notification-btn:hover {
	background-color: var(--zk-desktop-header-hover-background-color);
	color: var(--zk-color-on-surface);
}
.desktop-header-bell-icon {
	font-size: 16px;
}
.desktop-header-notification-badge {
	position: absolute;
	top: 2px;
	right: 2px;
	min-width: 16px;
	height: 16px;
	line-height: 16px;
	padding: 0 4px;
	font-size: 10px;
	font-weight: 700;
	text-align: center;
	color: var(--zk-color-on-error);
	background-color: var(--zk-color-error);
	border-radius: 8px;
	box-shadow: var(--zk-elevation-1);
}

<%-- User Profile Chip --%>
.desktop-header-user-chip {
	display: inline-flex;
	align-items: center;
	padding: 3px 8px 3px 4px;
	border-radius: 20px;
	cursor: pointer;
	border: 1px solid transparent;
	transition: background-color 0.15s ease, border-color 0.15s ease;
}
.desktop-header-user-chip:hover {
	background-color: var(--zk-desktop-header-hover-background-color);
	border-color: var(--zk-desktop-header-border-color);
}
.desktop-header-user-avatar {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 28px;
	height: 28px;
	border-radius: 50%;
	background-color: var(--zk-color-primary);
	color: var(--zk-color-on-primary);
	font-size: 11px;
	font-weight: 600;
	letter-spacing: 0.5px;
	margin-right: 6px;
	flex-shrink: 0;
}
.desktop-header-user-meta {
	display: flex;
	flex-direction: column;
	text-align: left;
	margin-right: 6px;
	max-width: 200px;
}
@media screen and (max-width: 600px) {
	.desktop-header-user-meta {
		display: none;
	}
}
.desktop-header-username {
	font-size: var(--zk-typescale-body-small-size);
	font-weight: 600;
	color: var(--zk-color-on-surface);
	line-height: 14px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.desktop-header-usersub {
	font-size: 10px;
	color: var(--zk-color-on-surface-variant);
	line-height: 12px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.desktop-header-user-caret {
	font-size: 12px;
	color: var(--zk-color-on-surface-variant);
}

<%-- User Menu Popup --%>
.user-panel-popup {
	min-width: 260px;
	padding: 0 !important;
	border-radius: 8px !important;
	box-shadow: var(--zk-elevation-dropdown) !important;
	border: 1px solid var(--zk-color-outline-variant) !important;
	background: var(--zk-color-surface) !important;
}
.user-panel-popup .z-popup-content {
	padding: 0 !important;
}
.user-menu-layout {
	padding: 12px 0 8px 0;
	width: 100%;
}
.user-menu-profile-card {
	padding: 4px 16px 10px 16px;
	display: flex;
	align-items: center;
}
.user-menu-avatar-big {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: var(--zk-color-primary);
	color: var(--zk-color-on-primary);
	font-size: 15px;
	font-weight: 600;
	margin-right: 12px;
	flex-shrink: 0;
}
.user-menu-info {
	display: flex;
	flex-direction: column;
	overflow: hidden;
}
.user-menu-name {
	font-size: var(--zk-typescale-body-medium-size);
	font-weight: 600;
	color: var(--zk-color-on-surface);
}
.user-menu-email {
	font-size: var(--zk-typescale-label-small-size);
	color: var(--zk-color-on-surface-variant);
}
.user-menu-org, .user-menu-warehouse {
	font-size: var(--zk-typescale-label-small-size);
	color: var(--zk-color-on-surface-variant);
	margin-top: 2px;
}
.user-menu-separator.z-separator {
	margin: 6px 0;
	background: var(--zk-color-surface-container);
	border-bottom: 1px solid var(--zk-color-outline-variant);
}
.user-menu-actions {
	padding: 2px 8px;
}
.user-menu-item.z-toolbarbutton {
	display: flex !important;
	align-items: center !important;
	width: 100% !important;
	padding: 7px 10px !important;
	border-radius: 6px !important;
	font-size: var(--zk-typescale-body-small-size) !important;
	color: var(--zk-color-on-surface) !important;
	text-align: left !important;
	border: none !important;
	transition: background-color 0.15s ease, color 0.15s ease;
}
.user-menu-item.z-toolbarbutton:hover {
	background-color: var(--zk-color-surface-container-high) !important;
	color: var(--zk-color-on-surface) !important;
}
.user-menu-item [class^="z-icon-"] {
	font-size: 14px;
	width: 20px;
	text-align: center;
	margin-right: 8px;
	color: var(--zk-color-on-surface-variant);
}
.user-menu-item:hover [class^="z-icon-"] {
	color: var(--zk-color-primary);
}
.user-menu-logout.z-toolbarbutton {
	color: var(--zk-color-error) !important;
	margin: 0 8px !important;
	width: calc(100% - 16px) !important;
}
.user-menu-logout.z-toolbarbutton:hover {
	background-color: var(--zk-color-error-container) !important;
	color: var(--zk-color-error) !important;
}
.user-menu-logout [class^="z-icon-"] {
	color: var(--zk-color-error);
}

<%-- Notification Popup --%>
.notification-popup {
	width: 320px;
	padding: 0 !important;
	border-radius: 8px !important;
	box-shadow: var(--zk-elevation-dropdown) !important;
	border: 1px solid var(--zk-color-outline-variant) !important;
	background: var(--zk-color-surface) !important;
}
.notification-popup .z-popup-content {
	padding: 0 !important;
}
.notification-popup-layout {
	padding: 0;
	width: 100%;
	max-height: 420px;
	overflow-y: auto;
}
@media screen and (max-height: 419px) {
	.notification-popup-layout {
		max-height: 100%;
	}
}
.notification-popup-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px 14px;
	border-bottom: 1px solid var(--zk-color-outline-variant);
	background-color: var(--zk-color-surface-container-low);
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
}
.notification-popup-title {
	font-size: var(--zk-typescale-body-medium-size);
	font-weight: 600;
	color: var(--zk-color-on-surface);
}
.notification-item-row {
	display: flex;
	align-items: center;
	padding: 8px 10px;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.15s ease;
	margin-bottom: 2px;
}
.notification-item-row:hover {
	background-color: var(--zk-color-surface-container-high);
}
.notification-item-icon {
	font-size: 14px;
	width: 22px;
	text-align: center;
	margin-right: 8px;
	color: var(--zk-color-on-surface-variant);
}
.notification-item-row.has-unread .notification-item-icon {
	color: var(--zk-color-primary);
}
.notification-item-name {
	font-size: var(--zk-typescale-body-small-size);
	color: var(--zk-color-on-surface);
	flex-grow: 1;
}
.notification-item-badge {
	font-size: var(--zk-typescale-label-small-size);
	font-weight: 600;
	padding: 2px 7px;
	border-radius: 10px;
	margin-left: 8px;
}
.notification-item-badge.unread {
	background-color: var(--zk-color-primary-container);
	color: var(--zk-color-on-primary-container);
}
.notification-item-badge.zero {
	background-color: var(--zk-color-surface-container-high);
	color: var(--zk-color-on-surface-variant);
}
.notification-empty-text {
	font-size: var(--zk-typescale-body-small-size);
	color: var(--zk-color-on-surface-variant);
	display: flex;
	align-items: center;
	padding: 8px 10px;
	border-radius: 6px;
	margin-bottom: 2px;
	flex-grow: 1;
}

<%-- main desktop layout (border layout) --%>
.desktop-layout {
	position: absolute; 
	border: none;
}
.desktop-north, .desktop-center {
	border: none;
}
.desktop-center {
	padding-top: 1px;
}
.desktop-center > .z-center-body {
	padding: 0px;
}

<%-- tabbox for application windows --%>
.desktop-tabbox {
	padding-top: 0px; 
	border: none;
}
@media screen and (max-width: 360px) {
	.desktop-tabbox .z-tab {
		max-width: 190px;
	}
}
.desktop-tabbox .z-tab .z-tab-text {
	padding-top: 0px;
	padding-bottom: 0px;
}
.desktop-tabbox .z-tabs .z-toolbar-tabs-body {
	padding: 0px !important;
	margin: 0px !important;
}
.desktop-tabbox .z-tabs .z-toolbar-tabs-body .z-toolbarbutton {
	padding: 0px !important;
	border: 1px solid transparent !important;
	margin: 0px !important;
}
.desktop-tabbox .z-tabs .z-toolbar-tabs .z-toolbarbutton-hover {
	border: none !important;
	padding: 0px !important;
	margin: 0px !important;
}
.desktop-tabbox .z-tabs .z-toolbar-tabs .z-toolbarbutton-hover .z-toolbarbutton-content {
	background-image: none !important;
	background-color:var(--zk-desktop-tab-toolbar-hover-background-color) !important;
	padding: 0px !important;
	margin: 0px !important;
	-webkit-box-shadow:inset 0px 0px 3px var(--zk-desktop-tab-toolbar-hover-shadow-color);
	-moz-box-shadow:inset 0px 0px 3px var(--zk-desktop-tab-toolbar-hover-shadow-color);	
	-o-box-shadow:inset 0px 0px 3px var(--zk-desktop-tab-toolbar-hover-shadow-color);	
	-ms-box-shadow:inset 0px 0px 3px var(--zk-desktop-tab-toolbar-hover-shadow-color);	
	box-shadow:inset 0px 0px 3px var(--zk-desktop-tab-toolbar-hover-shadow-color);
}
.desktop-tabbox.z-tabbox > .z-tabbox-icon.z-tabbox-left-scroll,
.desktop-tabbox.z-tabbox > .z-tabbox-icon.z-tabbox-right-scroll {
	line-height: 30px;
}
.desktop-tabbox.z-tabbox  > .z-tabs > .z-tabs-content .z-tab-image {
	width: 16px;
	height: 16px;
}

.desktop-tabpanel {
	margin: 0;
	padding: 0;
	border: 0;
	position: relative !important;
}
.desktop-tabpanel > .z-window-embedded {
	border: none;
}
<%-- the home tab panel --%>
.desktop-home-tabpanel {
	width: 100% !important;
}
.desktop-home-tabpanel .z-hlayout-inner {
	padding: 5px !important;
}

<%-- left panel for side gadgets --%>
.desktop-left-column {
	width: 200px;
	border: none;
	border-right: 1px solid var(--zk-desktop-column-border-color);
	background-color: var(--zk-desktop-column-background-color);
	padding-top: 2px; 
}
.desktop-left-column + .z-west-splitter,  .desktop-left-column.z-west {
	border-top: none; 
	border-right: 1px solid transparent;
}
.desktop-left-column .z-west-body {
	border-right: none;
}

<%-- right panel for side gadgets --%>
.desktop-right-column {
	width: 200px;
	border: none;
	border-left: 1px solid var(--zk-desktop-column-border-color);
	background-color: var(--zk-desktop-column-background-color);
	padding-top: 2px; 
}
.desktop-right-column + .z-east-splitter,  .desktop-right-column.z-east {
	border-top: none; 
	border-left: 1px solid transparent;
}
.desktop-right-column .z-east-body {
	border-left: none;
}
.desktop-layout > div > .z-west-collapsed, .desktop-layout > div > .z-east-collapsed {
	border-top: none;
}
.desktop-left-column .z-anchorlayout, .desktop-right-column .z-anchorlayout {
	overflow-x: hidden;
}

<%-- dashboard layout --%>
.z-anchorlayout { overflow:auto }
.z-anchorchildren { overflow:visible }
.z-anchorchildren .z-hlayout {
	white-space: normal;
}

<%-- popup for application menu tree --%>
.desktop-menu-popup {
	z-index: 9999;
}
<%-- bottom toolbar of application menu tree popup --%>
.desktop-menu-toolbar {
	verticle-align: middle; 
	padding: 2px;
	border-top: 1px solid var(--zk-desktop-column-border-color);
}

<%-- desktop window container --%>
.window-container-toolbar-btn.z-toolbarbutton {
	width: 28px;
}
.window-container-toolbar-btn.z-toolbarbutton .z-toolbarbutton-content img {
	width: 22px;
	height: 22px;
	padding: 3px 3px;
}
.window-container-toolbar-btn.z-toolbarbutton .z-toolbarbutton-content [class^="z-icon"] {
	padding: 3px 3px;
	font-size: 16px;
	color: var(--zk-desktop-toolbar-icon-color);
}
.window-container-toolbar > .z-toolbar-content,
.window-container-toolbar-btn.z-toolbarbutton, 
.window-container-toolbar-btn.z-toolbarbutton .z-toolbarbutton-content,
.window-container-toolbar-btn.z-toolbarbutton .z-toolbarbutton-content [class^="z-icon"] {
	display:inline-flex;
	align-items: center;
	justify-content: center;
	border-bottom: 0px; 
}
.window-container-toolbar-btn.tab-list.z-toolbarbutton {
	width: auto;	
	padding: 2px 3px;
}
.window-container-toolbar-btn.tab-list.z-toolbarbutton > .z-toolbarbutton-content {
	font-size: var(--zk-typescale-label-large-size);
	padding-right: 6px;
}
.window-container-toolbar-btn.tab-list.z-toolbarbutton > .z-toolbarbutton-content > i {
	padding-right: 0px;
	margin-right: -4px;
	font-size: 18px;
}


<%-- MARBLE FIX: the application-menu tree popup rendered EMPTY because Marble's z-flex
     layout collapses the panel/tree chain to height:0 (overflow:hidden then clips the tree).
     Make the flex chain fill the popup height so the menu tree is visible + scrollable. --%>
.desktop-menu-popup {
	display: flex;
	flex-direction: column;
}
.desktop-menu-popup > .z-popup-content {
	flex: 1 1 auto;
	min-height: 0;
}
.desktop-menu-popup .menu-panel {
	flex: 1 1 auto;
	min-height: 0;
}
.desktop-menu-popup .menu-panel > .z-panel-body {
	flex: 1 1 auto;
	min-height: 0;
}
.desktop-menu-popup .menu-panel .z-panelchildren {
	flex: 1 1 auto;
	min-height: 0;
}
.desktop-menu-popup .z-tree {
	flex: 1 1 auto;
	min-height: 0;
	overflow: auto;
}
