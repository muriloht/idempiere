/******************************************************************************
 * Product: iDempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) Contributors                                                 *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/
package org.adempiere.webui.component;

import java.io.IOException;
import java.util.Map;

import org.zkoss.lang.Objects;
import org.zkoss.zk.au.AuRequest;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.sys.ContentRenderer;
import org.zkoss.zul.impl.InputElement;

/**
 * ZK Component wrapper for JSON Editor (https://github.com/json-editor/json-editor)
 *
 * This component provides a rich JSON editing experience with:
 * - Schema-based form generation
 * - Validation
 * - Multiple themes support
 * - Array/Object editing
 *
 * @author iDempiere Community
 */
public class JsonEditorBox extends InputElement {

	private static final long serialVersionUID = 1L;

	static {
		addClientEvent(JsonEditorBox.class, Events.ON_CHANGE, CE_IMPORTANT);
	}

	/** JSON Schema for validation and UI generation */
	private String schema;

	/** Current JSON value */
	private String jsonValue = "";

	/** Theme for the editor (html, bootstrap4, bootstrap5) */
	private String theme = "html";

	/** Icon library (fontawesome4, fontawesome5, bootstrap) */
	private String iconlib = "fontawesome4";

	/** Show validation errors mode (interaction, change, always, never) */
	private String showErrors = "interaction";

	/** Disable array add button */
	private boolean disableArrayAdd = false;

	/** Disable array delete button */
	private boolean disableArrayDelete = false;

	/** Disable array reorder */
	private boolean disableArrayReorder = false;

	/** Disable collapse functionality */
	private boolean disableCollapse = false;

	/** Disable edit JSON button */
	private boolean disableEditJson = false;

	/** Disable properties button */
	private boolean disableProperties = false;

	/** Require confirmation before delete */
	private boolean promptBeforeDelete = true;

	/** Start collapsed */
	private boolean startCollapsed = false;

	/** Compact mode - less padding/margin */
	private boolean compactMode = false;

	/**
	 * Default constructor
	 */
	public JsonEditorBox() {
		super();
	}

	/**
	 * Constructor with initial JSON value
	 * @param value Initial JSON string
	 */
	public JsonEditorBox(String value) {
		super();
		setJsonValue(value);
	}

	@Override
	public String getZclass() {
		return _zclass == null ? "z-jsoneditorbox" : _zclass;
	}

	/**
	 * Get the JSON Schema
	 * @return JSON Schema string
	 */
	public String getSchema() {
		return schema;
	}

	/**
	 * Set JSON Schema for the editor.
	 * @param schema JSON Schema string
	 */
	public void setSchema(String schema) {
		if (!Objects.equals(this.schema, schema)) {
			this.schema = schema;
			smartUpdate("schema", this.schema);
		}
	}

	/**
	 * Get current JSON value
	 * @return JSON string
	 */
	public String getJsonValue() {
		return jsonValue;
	}

	/**
	 * Set JSON value
	 * @param value JSON string
	 */
	public void setJsonValue(String value) {
		String newValue = value != null ? value : "";
		if (!Objects.equals(this.jsonValue, newValue)) {
			this.jsonValue = newValue;
			smartUpdate("jsonValue", this.jsonValue);
		}
	}

	/**
	 * Get editor theme
	 * @return theme name
	 */
	public String getTheme() {
		return theme;
	}

	/**
	 * Set editor theme
	 * @param theme theme name
	 */
	public void setTheme(String theme) {
		if (!Objects.equals(this.theme, theme)) {
			this.theme = theme;
			smartUpdate("theme", this.theme);
		}
	}

	/**
	 * Get icon library
	 * @return icon library name
	 */
	public String getIconlib() {
		return iconlib;
	}

	/**
	 * Set icon library
	 * @param iconlib icon library name
	 */
	public void setIconlib(String iconlib) {
		if (!Objects.equals(this.iconlib, iconlib)) {
			this.iconlib = iconlib;
			smartUpdate("iconlib", this.iconlib);
		}
	}

	/**
	 * Get show errors mode
	 * @return show errors mode
	 */
	public String getShowErrors() {
		return showErrors;
	}

	/**
	 * Set when to show validation errors
	 * @param showErrors mode
	 */
	public void setShowErrors(String showErrors) {
		if (!Objects.equals(this.showErrors, showErrors)) {
			this.showErrors = showErrors;
			smartUpdate("showErrors", this.showErrors);
		}
	}

	public boolean isDisableArrayAdd() {
		return disableArrayAdd;
	}

	public void setDisableArrayAdd(boolean disableArrayAdd) {
		if (this.disableArrayAdd != disableArrayAdd) {
			this.disableArrayAdd = disableArrayAdd;
			smartUpdate("disableArrayAdd", this.disableArrayAdd);
		}
	}

	public boolean isDisableArrayDelete() {
		return disableArrayDelete;
	}

	public void setDisableArrayDelete(boolean disableArrayDelete) {
		if (this.disableArrayDelete != disableArrayDelete) {
			this.disableArrayDelete = disableArrayDelete;
			smartUpdate("disableArrayDelete", this.disableArrayDelete);
		}
	}

	public boolean isDisableArrayReorder() {
		return disableArrayReorder;
	}

	public void setDisableArrayReorder(boolean disableArrayReorder) {
		if (this.disableArrayReorder != disableArrayReorder) {
			this.disableArrayReorder = disableArrayReorder;
			smartUpdate("disableArrayReorder", this.disableArrayReorder);
		}
	}

	public boolean isDisableCollapse() {
		return disableCollapse;
	}

	public void setDisableCollapse(boolean disableCollapse) {
		if (this.disableCollapse != disableCollapse) {
			this.disableCollapse = disableCollapse;
			smartUpdate("disableCollapse", this.disableCollapse);
		}
	}

	public boolean isDisableEditJson() {
		return disableEditJson;
	}

	public void setDisableEditJson(boolean disableEditJson) {
		if (this.disableEditJson != disableEditJson) {
			this.disableEditJson = disableEditJson;
			smartUpdate("disableEditJson", this.disableEditJson);
		}
	}

	public boolean isDisableProperties() {
		return disableProperties;
	}

	public void setDisableProperties(boolean disableProperties) {
		if (this.disableProperties != disableProperties) {
			this.disableProperties = disableProperties;
			smartUpdate("disableProperties", this.disableProperties);
		}
	}

	public boolean isPromptBeforeDelete() {
		return promptBeforeDelete;
	}

	public void setPromptBeforeDelete(boolean promptBeforeDelete) {
		if (this.promptBeforeDelete != promptBeforeDelete) {
			this.promptBeforeDelete = promptBeforeDelete;
			smartUpdate("promptBeforeDelete", this.promptBeforeDelete);
		}
	}

	public boolean isStartCollapsed() {
		return startCollapsed;
	}

	public void setStartCollapsed(boolean startCollapsed) {
		if (this.startCollapsed != startCollapsed) {
			this.startCollapsed = startCollapsed;
			smartUpdate("startCollapsed", this.startCollapsed);
		}
	}

	public boolean isCompactMode() {
		return compactMode;
	}

	public void setCompactMode(boolean compactMode) {
		if (this.compactMode != compactMode) {
			this.compactMode = compactMode;
			smartUpdate("compactMode", this.compactMode);
		}
	}

	@Override
	protected void renderProperties(ContentRenderer renderer) throws IOException {
		super.renderProperties(renderer);

		render(renderer, "schema", schema);
		render(renderer, "jsonValue", jsonValue);
		render(renderer, "theme", theme);
		render(renderer, "iconlib", iconlib);
		render(renderer, "showErrors", showErrors);
		render(renderer, "disableArrayAdd", disableArrayAdd);
		render(renderer, "disableArrayDelete", disableArrayDelete);
		render(renderer, "disableArrayReorder", disableArrayReorder);
		render(renderer, "disableCollapse", disableCollapse);
		render(renderer, "disableEditJson", disableEditJson);
		render(renderer, "disableProperties", disableProperties);
		render(renderer, "promptBeforeDelete", promptBeforeDelete);
		render(renderer, "startCollapsed", startCollapsed);
		render(renderer, "compactMode", compactMode);
	}

	@Override
	public void service(AuRequest request, boolean everError) {
		final String cmd = request.getCommand();
		final Map<String, Object> data = request.getData();

		if (Events.ON_CHANGE.equals(cmd)) {
			String newValue = (String) data.get("value");
			if (newValue == null) {
				newValue = "";
			}
			this.jsonValue = newValue;
			Events.postEvent(new Event(Events.ON_CHANGE, this, newValue));
		} else {
			super.service(request, everError);
		}
	}

	@Override
	protected Object coerceFromString(String value) {
		return value;
	}

	@Override
	protected String coerceToString(Object value) {
		return value != null ? value.toString() : "";
	}

	// Convenience methods
	public String getText() {
		return getJsonValue();
	}

	public void setText(String text) {
		setJsonValue(text);
	}
}
