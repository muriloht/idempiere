/**********************************************************************
* This file is part of iDempiere ERP Open Source                      *
* http://www.idempiere.org                                            *
*                                                                     *
* Copyright (C) Contributors                                          *
*                                                                     *
* This program is free software; you can redistribute it and/or       *
* modify it under the terms of the GNU General Public License         *
* as published by the Free Software Foundation; either version 2      *
* of the License, or (at your option) any later version.              *
*                                                                     *
* This program is distributed in the hope that it will be useful,     *
* but WITHOUT ANY WARRANTY; without even the implied warranty of      *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the        *
* GNU General Public License for more details.                        *
*                                                                     *
* You should have received a copy of the GNU General Public License   *
* along with this program; if not, write to the Free Software         *
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,          *
* MA 02110-1301, USA.                                                 *
*                                                                     *
* Contributors:                                                       *
* - Diego Ruiz, BX Service GmbH                                       *
**********************************************************************/
package org.adempiere.webui.editor;

import org.adempiere.webui.component.JsonEditorBox;
import org.adempiere.webui.event.ContextMenuEvent;
import org.adempiere.webui.event.ContextMenuListener;
import org.adempiere.webui.event.ValueChangeEvent;
import org.compiere.model.GridField;
import org.compiere.model.MSysConfig;
import org.compiere.util.Env;
import org.compiere.util.Util;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.Events;

/**
 * JSON Editor for iDempiere.
 *
 * Uses JsonEditorBox component which wraps the json-editor library
 * (https://github.com/json-editor/json-editor)
 *
 * Enable via SysConfig USE_ADVANCED_JSON_EDITOR=Y
 * Define schemas via SysConfig JSON_SCHEMA_{ColumnName}
 */
public class WJsonEditor extends WEditor implements ContextMenuListener {

	private static final String[] LISTENER_EVENTS = {Events.ON_CHANGE};

	private static final String SYSCONFIG_USE_ADVANCED = "USE_ADVANCED_JSON_EDITOR";
	private static final String SYSCONFIG_SCHEMA_PREFIX = "JSON_SCHEMA_";

	private String oldValue;

	/**
	 * Constructor
	 * @param gridField grid field
	 */
	public WJsonEditor(GridField gridField) {
		this(gridField, false, null);
	}

	/**
	 * Constructor
	 * @param gridField grid field
	 * @param tableEditor true if used in grid/table
	 * @param editorConfiguration optional configuration
	 */
	public WJsonEditor(GridField gridField, boolean tableEditor, IEditorConfiguration editorConfiguration) {
		super(new JsonEditorBox(), gridField, tableEditor, editorConfiguration);
		init(gridField);
	}

	/**
	 * Initialize the editor
	 */
	private void init(GridField gridField) {
		// Load schema from SysConfig if available
		if (gridField != null) {
			String schemaKey = SYSCONFIG_SCHEMA_PREFIX + gridField.getColumnName();
			String schema = MSysConfig.getValue(schemaKey, null,
					Env.getAD_Client_ID(Env.getCtx()), Env.getAD_Org_ID(Env.getCtx()));
			if (!Util.isEmpty(schema)) {
				getComponent().setSchema(schema);
			}
		}

		setChangeEventWhenEditing(false);
	}

	@Override
	public JsonEditorBox getComponent() {
		return (JsonEditorBox) component;
	}

	@Override
	public String getDisplay() {
		String value = getComponent().getJsonValue();
		return value != null ? value : "";
	}

	@Override
	public Object getValue() {
		return getComponent().getJsonValue();
	}

	@Override
	public void setValue(Object value) {
		String strValue = value != null ? value.toString() : "";
		oldValue = strValue;
		getComponent().setJsonValue(strValue);
	}

	@Override
	public String[] getEvents() {
		return LISTENER_EVENTS;
	}

	@Override
	public void onEvent(Event event) throws Exception {
		if (Events.ON_CHANGE.equals(event.getName())) {
			String newValue = getComponent().getJsonValue();
			// Only fire if actually changed (normalized comparison)
			if (!isSameJson(oldValue, newValue)) {
				ValueChangeEvent vce = new ValueChangeEvent(this, getColumnName(), oldValue, newValue);
				fireValueChange(vce);
				oldValue = newValue;
			}
		}
	}

	private boolean isSameJson(String v1, String v2) {
		String n1 = normalizeJson(v1);
		String n2 = normalizeJson(v2);
		return n1.equals(n2);
	}

	private String normalizeJson(String json) {
		if (Util.isEmpty(json)) return "{}";
		try {
			Object parsed = org.zkoss.json.JSONValue.parse(json);
			return parsed != null ? org.zkoss.json.JSONValue.toJSONString(parsed) : "{}";
		} catch (Exception e) {
			return json;
		}
	}

	@Override
	public void setReadWrite(boolean readWrite) {
		getComponent().setDisabled(!readWrite);
	}

	@Override
	public boolean isReadWrite() {
		return !getComponent().isDisabled();
	}

	@Override
	public void onMenu(ContextMenuEvent evt) {
		// Context menu handling if needed
	}

	/**
	 * Check if advanced JSON editor is enabled via SysConfig
	 * @return true if USE_ADVANCED_JSON_EDITOR=Y
	 */
	public static boolean isAdvancedEditorEnabled() {
		return MSysConfig.getBooleanValue(SYSCONFIG_USE_ADVANCED, false,
				Env.getAD_Client_ID(Env.getCtx()), Env.getAD_Org_ID(Env.getCtx()));
	}
}
