-- IDEMPIERE-3989
SELECT register_migration_script('202310061103_IDEMPIERE-3989.sql') FROM dual;

-- Oct 6, 2023, 11:03:05 AM BRT
INSERT INTO AD_ViewColumn (AD_Client_ID,AD_Org_ID,AD_ViewColumn_ID,AD_ViewColumn_UU,Created,CreatedBy,EntityType,IsActive,Updated,UpdatedBy,AD_ViewComponent_ID,ColumnName,ColumnSQL,SeqNo) VALUES (0,0,217706,'2cca7f60-b49c-414d-bf75-7f6aad3d39a4',TO_TIMESTAMP('2023-10-06 11:03:05','YYYY-MM-DD HH24:MI:SS'),100,'D','Y',TO_TIMESTAMP('2023-10-06 11:03:05','YYYY-MM-DD HH24:MI:SS'),100,200008,'entitytype','f.entitytype',720)
;

-- Oct 6, 2023, 11:03:12 AM BRT
DROP VIEW AD_Field_v
;

-- Oct 6, 2023, 11:03:12 AM BRT
CREATE OR REPLACE VIEW AD_Field_v(AD_Window_ID, AD_Tab_ID, AD_Field_ID, AD_Table_ID, AD_Column_ID, Name, Description, Help, IsDisplayed, DisplayLogic, DisplayLength, SeqNo, SortNo, IsSameLine, IsHeading, IsFieldOnly, IsReadOnly, isencryptedfield, ObscureType, ColumnName, ColumnSQL, FieldLength, VFormat, DefaultValue, IsKey, IsParent, IsMandatory, IsIdentifier, IsTranslated, AD_Reference_Value_ID, Callout, AD_Reference_ID, AD_Val_Rule_ID, AD_Process_ID, IsAlwaysUpdateable, ReadOnlyLogic, MandatoryLogic, IsUpdateable, isencryptedcolumn, IsSelectionColumn, TableName, ValueMin, ValueMax, fieldgroup, validationcode, Included_Tab_ID, FieldGroupType, IsCollapsedByDefault, InfoFactoryClass, IsAutocomplete, IsAllowCopy, IsDisplayedGrid, SeqNoGrid, SeqNoSelection, XPosition, ColumnSpan, NumLines, IsToolbarButton, FormatPattern, IsAdvancedField, IsDefaultFocus, AD_Chart_ID, AD_LabelStyle_ID, AD_FieldStyle_ID, PA_DashboardContent_ID, Placeholder, IsHtml, IsQuickForm, AD_Val_Rule_Lookup_ID, validationcodelookup, alwaysupdatablelogic, AD_InfoWindow_ID, entitytype) AS SELECT t.ad_window_id AS AD_Window_ID, f.ad_tab_id AS AD_Tab_ID, f.ad_field_id AS AD_Field_ID, tbl.ad_table_id AS AD_Table_ID, f.ad_column_id AS AD_Column_ID, f.name AS Name, f.description AS Description, f.help AS Help, f.isdisplayed AS IsDisplayed, f.displaylogic AS DisplayLogic, f.displaylength AS DisplayLength, f.seqno AS SeqNo, f.sortno AS SortNo, f.issameline AS IsSameLine, f.isheading AS IsHeading, f.isfieldonly AS IsFieldOnly, f.isreadonly AS IsReadOnly, f.isencrypted AS isencryptedfield, f.obscuretype AS ObscureType, c.columnname AS ColumnName, COALESCE(f.columnsql, c.columnsql) AS ColumnSQL, c.fieldlength AS FieldLength, COALESCE(f.vformat, c.vformat) AS VFormat, COALESCE(f.defaultvalue, c.defaultvalue) AS DefaultValue, c.iskey AS IsKey, c.isparent AS IsParent, COALESCE(f.ismandatory, c.ismandatory) AS IsMandatory, c.isidentifier AS IsIdentifier, c.istranslated AS IsTranslated, COALESCE(f.ad_reference_value_id, c.ad_reference_value_id) AS AD_Reference_Value_ID, c.callout AS Callout, COALESCE(f.ad_reference_id, c.ad_reference_id) AS AD_Reference_ID, COALESCE(f.ad_val_rule_id, c.ad_val_rule_id) AS AD_Val_Rule_ID, c.ad_process_id AS AD_Process_ID, COALESCE(f.isalwaysupdateable, c.isalwaysupdateable) AS IsAlwaysUpdateable, COALESCE(f.readonlylogic, c.readonlylogic) AS ReadOnlyLogic, COALESCE(f.mandatorylogic, c.mandatorylogic) AS MandatoryLogic, COALESCE(f.isupdateable, c.isupdateable) AS IsUpdateable, c.isencrypted AS isencryptedcolumn, COALESCE(f.isselectioncolumn, c.isselectioncolumn) AS IsSelectionColumn, tbl.tablename AS TableName, c.valuemin AS ValueMin, c.valuemax AS ValueMax, fg.name AS fieldgroup, vr.code AS validationcode, f.included_tab_id AS Included_Tab_ID, fg.fieldgrouptype AS FieldGroupType, fg.iscollapsedbydefault AS IsCollapsedByDefault, COALESCE(f.infofactoryclass, c.infofactoryclass) AS InfoFactoryClass, c.isautocomplete AS IsAutocomplete, COALESCE(f.isallowcopy, c.isallowcopy) AS IsAllowCopy, f.isdisplayedgrid AS IsDisplayedGrid, f.seqnogrid AS SeqNoGrid, c.seqnoselection AS SeqNoSelection, f.xposition AS XPosition, f.columnspan AS ColumnSpan, f.numlines AS NumLines, COALESCE(f.istoolbarbutton, c.istoolbarbutton) AS IsToolbarButton, c.formatpattern AS FormatPattern, f.isadvancedfield AS IsAdvancedField, f.isdefaultfocus AS IsDefaultFocus, COALESCE(f.ad_chart_id, c.ad_chart_id) AS AD_Chart_ID, f.ad_labelstyle_id AS AD_LabelStyle_ID, f.ad_fieldstyle_id AS AD_FieldStyle_ID, c.pa_dashboardcontent_id AS PA_DashboardContent_ID, COALESCE(f.placeholder, c.placeholder) AS Placeholder, c.ishtml AS IsHtml, f.isquickform AS IsQuickForm, COALESCE(f.ad_val_rule_lookup_id, c.ad_val_rule_lookup_id) AS AD_Val_Rule_Lookup_ID, vrf.code AS validationcodelookup, COALESCE(f.alwaysupdatablelogic, c.alwaysupdatablelogic) AS alwaysupdatablelogic, c.ad_infowindow_id AS AD_InfoWindow_ID, f.entitytype AS entitytype FROM ad_field f JOIN ad_tab t ON f.ad_tab_id = t.ad_tab_id LEFT JOIN ad_fieldgroup fg ON f.ad_fieldgroup_id = fg.ad_fieldgroup_id LEFT JOIN ad_column c ON f.ad_column_id = c.ad_column_id JOIN ad_table tbl ON c.ad_table_id = tbl.ad_table_id LEFT JOIN ad_val_rule vr ON vr.ad_val_rule_id = COALESCE(f.ad_val_rule_id, c.ad_val_rule_id) LEFT JOIN ad_val_rule vrf ON vrf.ad_val_rule_id = COALESCE(f.ad_val_rule_lookup_id, c.ad_val_rule_lookup_id) WHERE f.isactive = 'Y' AND c.isactive = 'Y'
;

-- Oct 6, 2023, 11:04:16 AM BRT
INSERT INTO AD_ViewColumn (AD_Client_ID,AD_Org_ID,AD_ViewColumn_ID,AD_ViewColumn_UU,Created,CreatedBy,EntityType,IsActive,Updated,UpdatedBy,AD_ViewComponent_ID,ColumnName,ColumnSQL,SeqNo) VALUES (0,0,217707,'fa44512f-c797-4fe4-8865-862a2a7bcfc7',TO_TIMESTAMP('2023-10-06 11:04:16','YYYY-MM-DD HH24:MI:SS'),100,'D','Y',TO_TIMESTAMP('2023-10-06 11:04:16','YYYY-MM-DD HH24:MI:SS'),100,200009,'entitytype','f.entitytype',730)
;

-- Oct 6, 2023, 11:04:21 AM BRT
DROP VIEW AD_Field_vt
;

-- Oct 6, 2023, 11:04:21 AM BRT
CREATE OR REPLACE VIEW AD_Field_vt(AD_Language, AD_Window_ID, AD_Tab_ID, AD_Field_ID, AD_Table_ID, AD_Column_ID, Name, Description, Help, IsDisplayed, DisplayLogic, DisplayLength, SeqNo, SortNo, IsSameLine, IsHeading, IsFieldOnly, IsReadOnly, isencryptedfield, ObscureType, ColumnName, ColumnSQL, FieldLength, VFormat, DefaultValue, IsKey, IsParent, IsMandatory, IsIdentifier, IsTranslated, AD_Reference_Value_ID, Callout, AD_Reference_ID, AD_Val_Rule_ID, AD_Process_ID, IsAlwaysUpdateable, ReadOnlyLogic, MandatoryLogic, IsUpdateable, isencryptedcolumn, IsSelectionColumn, TableName, ValueMin, ValueMax, fieldgroup, validationcode, Included_Tab_ID, FieldGroupType, IsCollapsedByDefault, InfoFactoryClass, IsAutocomplete, IsAllowCopy, IsDisplayedGrid, SeqNoGrid, SeqNoSelection, XPosition, ColumnSpan, NumLines, IsToolbarButton, FormatPattern, IsAdvancedField, IsDefaultFocus, AD_Chart_ID, AD_LabelStyle_ID, AD_FieldStyle_ID, PA_DashboardContent_ID, Placeholder, IsHtml, IsQuickForm, AD_Val_Rule_Lookup_ID, validationcodelookup, alwaysupdatablelogic, AD_InfoWindow_ID, entitytype) AS SELECT trl.ad_language AS AD_Language, t.ad_window_id AS AD_Window_ID, f.ad_tab_id AS AD_Tab_ID, f.ad_field_id AS AD_Field_ID, tbl.ad_table_id AS AD_Table_ID, f.ad_column_id AS AD_Column_ID, trl.name AS Name, trl.description AS Description, trl.help AS Help, f.isdisplayed AS IsDisplayed, f.displaylogic AS DisplayLogic, f.displaylength AS DisplayLength, f.seqno AS SeqNo, f.sortno AS SortNo, f.issameline AS IsSameLine, f.isheading AS IsHeading, f.isfieldonly AS IsFieldOnly, f.isreadonly AS IsReadOnly, f.isencrypted AS isencryptedfield, f.obscuretype AS ObscureType, c.columnname AS ColumnName, COALESCE(f.columnsql, c.columnsql) AS ColumnSQL, c.fieldlength AS FieldLength, COALESCE(f.vformat, c.vformat) AS VFormat, COALESCE(f.defaultvalue, c.defaultvalue) AS DefaultValue, c.iskey AS IsKey, c.isparent AS IsParent, COALESCE(f.ismandatory, c.ismandatory) AS IsMandatory, c.isidentifier AS IsIdentifier, c.istranslated AS IsTranslated, COALESCE(f.ad_reference_value_id, c.ad_reference_value_id) AS AD_Reference_Value_ID, c.callout AS Callout, COALESCE(f.ad_reference_id, c.ad_reference_id) AS AD_Reference_ID, COALESCE(f.ad_val_rule_id, c.ad_val_rule_id) AS AD_Val_Rule_ID, c.ad_process_id AS AD_Process_ID, COALESCE(f.isalwaysupdateable, c.isalwaysupdateable) AS IsAlwaysUpdateable, COALESCE(f.readonlylogic, c.readonlylogic) AS ReadOnlyLogic, COALESCE(f.mandatorylogic, c.mandatorylogic) AS MandatoryLogic, COALESCE(f.isupdateable, c.isupdateable) AS IsUpdateable, c.isencrypted AS isencryptedcolumn, COALESCE(f.isselectioncolumn, c.isselectioncolumn) AS IsSelectionColumn, tbl.tablename AS TableName, c.valuemin AS ValueMin, c.valuemax AS ValueMax, fgt.name AS fieldgroup, vr.code AS validationcode, f.included_tab_id AS Included_Tab_ID, fg.fieldgrouptype AS FieldGroupType, fg.iscollapsedbydefault AS IsCollapsedByDefault, COALESCE(f.infofactoryclass, c.infofactoryclass) AS InfoFactoryClass, c.isautocomplete AS IsAutocomplete, COALESCE(f.isallowcopy, c.isallowcopy) AS IsAllowCopy, f.isdisplayedgrid AS IsDisplayedGrid, f.seqnogrid AS SeqNoGrid, c.seqnoselection AS SeqNoSelection, f.xposition AS XPosition, f.columnspan AS ColumnSpan, f.numlines AS NumLines, COALESCE(f.istoolbarbutton, c.istoolbarbutton) AS IsToolbarButton, c.formatpattern AS FormatPattern, f.isadvancedfield AS IsAdvancedField, f.isdefaultfocus AS IsDefaultFocus, COALESCE(f.ad_chart_id, c.ad_chart_id) AS AD_Chart_ID, f.ad_labelstyle_id AS AD_LabelStyle_ID, f.ad_fieldstyle_id AS AD_FieldStyle_ID, c.pa_dashboardcontent_id AS PA_DashboardContent_ID, COALESCE(trl.placeholder, ct.placeholder) AS Placeholder, c.ishtml AS IsHtml, f.isquickform AS IsQuickForm, COALESCE(f.ad_val_rule_lookup_id, c.ad_val_rule_lookup_id) AS AD_Val_Rule_Lookup_ID, vrf.code AS validationcodelookup, COALESCE(f.alwaysupdatablelogic, c.alwaysupdatablelogic) AS alwaysupdatablelogic, c.ad_infowindow_id AS AD_InfoWindow_ID, f.entitytype AS entitytype FROM ad_field f JOIN ad_field_trl trl ON f.ad_field_id = trl.ad_field_id JOIN ad_tab t ON f.ad_tab_id = t.ad_tab_id LEFT JOIN ad_fieldgroup fg ON f.ad_fieldgroup_id = fg.ad_fieldgroup_id LEFT JOIN ad_fieldgroup_trl fgt ON f.ad_fieldgroup_id = fgt.ad_fieldgroup_id AND trl.ad_language = fgt.ad_language LEFT JOIN ad_column c ON f.ad_column_id = c.ad_column_id LEFT JOIN ad_column_trl ct ON f.ad_column_id = ct.ad_column_id AND trl.ad_language = ct.ad_language JOIN ad_table tbl ON c.ad_table_id = tbl.ad_table_id LEFT JOIN ad_val_rule vr ON vr.ad_val_rule_id = COALESCE(f.ad_val_rule_id, c.ad_val_rule_id) LEFT JOIN ad_val_rule vrf ON vrf.ad_val_rule_id = COALESCE(f.ad_val_rule_lookup_id, c.ad_val_rule_lookup_id) WHERE f.isactive = 'Y' AND c.isactive = 'Y'
;

-- Oct 6, 2023, 11:05:20 AM BRT
INSERT INTO AD_ViewColumn (AD_Client_ID,AD_Org_ID,AD_ViewColumn_ID,AD_ViewColumn_UU,Created,CreatedBy,EntityType,IsActive,Updated,UpdatedBy,AD_ViewComponent_ID,ColumnName,ColumnSQL,SeqNo) VALUES (0,0,217708,'af082e9d-35ca-4cf3-a66f-9dc156ef8d06',TO_TIMESTAMP('2023-10-06 11:05:20','YYYY-MM-DD HH24:MI:SS'),100,'D','Y',TO_TIMESTAMP('2023-10-06 11:05:20','YYYY-MM-DD HH24:MI:SS'),100,200011,'entitytype','t.entitytype',440)
;

-- Oct 6, 2023, 11:05:28 AM BRT
CREATE OR REPLACE VIEW AD_Tab_v(AD_Tab_ID, AD_Window_ID, AD_Table_ID, Name, Description, Help, SeqNo, IsSingleRow, HasTree, IsInfoTab, ReplicationType, TableName, AccessLevel, IsSecurityEnabled, IsDeleteable, IsHighVolume, IsView, hasassociation, IsTranslationTab, IsReadOnly, AD_Image_ID, TabLevel, WhereClause, OrderByClause, CommitWarning, ReadOnlyLogic, DisplayLogic, AD_Column_ID, AD_Process_ID, IsSortTab, IsInsertRecord, IsAdvancedTab, AD_ColumnSortOrder_ID, AD_ColumnSortYesNo_ID, Included_Tab_ID, Parent_Column_ID, AD_Tab_UU, AD_Table_UU, TreeDisplayedOn, MaxQueryRecords, IsAllowAdvancedLookup, IsLookupOnlySelection, AD_TabType, entitytype) AS SELECT t.ad_tab_id AS AD_Tab_ID, t.ad_window_id AS AD_Window_ID, t.ad_table_id AS AD_Table_ID, t.name AS Name, t.description AS Description, t.help AS Help, t.seqno AS SeqNo, t.issinglerow AS IsSingleRow, t.hastree AS HasTree, t.isinfotab AS IsInfoTab, tbl.replicationtype AS ReplicationType, tbl.tablename AS TableName, tbl.accesslevel AS AccessLevel, tbl.issecurityenabled AS IsSecurityEnabled, tbl.isdeleteable AS IsDeleteable, COALESCE(t.IsHighVolume, tbl.IsHighVolume) AS IsHighVolume, tbl.isview AS IsView, CAST('N' AS char(1)) AS hasassociation, t.istranslationtab AS IsTranslationTab, t.isreadonly AS IsReadOnly, t.ad_image_id AS AD_Image_ID, t.tablevel AS TabLevel, t.whereclause AS WhereClause, t.orderbyclause AS OrderByClause, t.commitwarning AS CommitWarning, t.readonlylogic AS ReadOnlyLogic, t.displaylogic AS DisplayLogic, t.ad_column_id AS AD_Column_ID, t.ad_process_id AS AD_Process_ID, t.issorttab AS IsSortTab, t.isinsertrecord AS IsInsertRecord, t.isadvancedtab AS IsAdvancedTab, t.ad_columnsortorder_id AS AD_ColumnSortOrder_ID, t.ad_columnsortyesno_id AS AD_ColumnSortYesNo_ID, t.included_tab_id AS Included_Tab_ID, t.parent_column_id AS Parent_Column_ID, t.ad_tab_uu AS AD_Tab_UU, tbl.ad_table_uu AS AD_Table_UU, t.treedisplayedon AS TreeDisplayedOn, t.maxqueryrecords AS MaxQueryRecords, t.isallowadvancedlookup AS IsAllowAdvancedLookup, t.islookuponlyselection AS IsLookupOnlySelection, t.ad_tabtype AS AD_TabType, t.entitytype AS entitytype FROM ad_tab t JOIN ad_table tbl ON t.ad_table_id = tbl.ad_table_id WHERE t.isactive = 'Y' AND tbl.isactive = 'Y'
;

-- Oct 6, 2023, 11:06:13 AM BRT
INSERT INTO AD_ViewColumn (AD_Client_ID,AD_Org_ID,AD_ViewColumn_ID,AD_ViewColumn_UU,Created,CreatedBy,EntityType,IsActive,Updated,UpdatedBy,AD_ViewComponent_ID,ColumnName,ColumnSQL,SeqNo) VALUES (0,0,217709,'ed2c20ca-cb52-4371-b28c-bb9c1bffaa90',TO_TIMESTAMP('2023-10-06 11:06:13','YYYY-MM-DD HH24:MI:SS'),100,'D','Y',TO_TIMESTAMP('2023-10-06 11:06:13','YYYY-MM-DD HH24:MI:SS'),100,200012,'entitytype','t.entitytype',450)
;

-- Oct 6, 2023, 11:06:17 AM BRT
CREATE OR REPLACE VIEW AD_Tab_vt(AD_Language, AD_Tab_ID, AD_Window_ID, AD_Table_ID, Name, Description, Help, SeqNo, IsSingleRow, HasTree, IsInfoTab, ReplicationType, TableName, AccessLevel, IsSecurityEnabled, IsDeleteable, IsHighVolume, IsView, hasassociation, IsTranslationTab, IsReadOnly, AD_Image_ID, TabLevel, WhereClause, OrderByClause, CommitWarning, ReadOnlyLogic, DisplayLogic, AD_Column_ID, AD_Process_ID, IsSortTab, IsInsertRecord, IsAdvancedTab, AD_ColumnSortOrder_ID, AD_ColumnSortYesNo_ID, Included_Tab_ID, Parent_Column_ID, AD_Tab_UU, AD_Table_UU, TreeDisplayedOn, MaxQueryRecords, IsAllowAdvancedLookup, IsLookupOnlySelection, AD_TabType, entitytype) AS SELECT trl.ad_language AS AD_Language, t.ad_tab_id AS AD_Tab_ID, t.ad_window_id AS AD_Window_ID, t.ad_table_id AS AD_Table_ID, trl.name AS Name, trl.description AS Description, trl.help AS Help, t.seqno AS SeqNo, t.issinglerow AS IsSingleRow, t.hastree AS HasTree, t.isinfotab AS IsInfoTab, tbl.replicationtype AS ReplicationType, tbl.tablename AS TableName, tbl.accesslevel AS AccessLevel, tbl.issecurityenabled AS IsSecurityEnabled, tbl.isdeleteable AS IsDeleteable, COALESCE(t.IsHighVolume, tbl.IsHighVolume) AS IsHighVolume, tbl.isview AS IsView, CAST('N' AS char(1)) AS hasassociation, t.istranslationtab AS IsTranslationTab, t.isreadonly AS IsReadOnly, t.ad_image_id AS AD_Image_ID, t.tablevel AS TabLevel, t.whereclause AS WhereClause, t.orderbyclause AS OrderByClause, trl.commitwarning AS CommitWarning, t.readonlylogic AS ReadOnlyLogic, t.displaylogic AS DisplayLogic, t.ad_column_id AS AD_Column_ID, t.ad_process_id AS AD_Process_ID, t.issorttab AS IsSortTab, t.isinsertrecord AS IsInsertRecord, t.isadvancedtab AS IsAdvancedTab, t.ad_columnsortorder_id AS AD_ColumnSortOrder_ID, t.ad_columnsortyesno_id AS AD_ColumnSortYesNo_ID, t.included_tab_id AS Included_Tab_ID, t.parent_column_id AS Parent_Column_ID, t.ad_tab_uu AS AD_Tab_UU, tbl.ad_table_uu AS AD_Table_UU, t.treedisplayedon AS TreeDisplayedOn, t.maxqueryrecords AS MaxQueryRecords, t.isallowadvancedlookup AS IsAllowAdvancedLookup, t.islookuponlyselection AS IsLookupOnlySelection, t.ad_tabtype AS AD_TabType, t.entitytype AS entitytype FROM ad_tab t JOIN ad_table tbl ON t.ad_table_id = tbl.ad_table_id JOIN ad_tab_trl trl ON t.ad_tab_id = trl.ad_tab_id WHERE t.isactive = 'Y' AND tbl.isactive = 'Y'
;

-- Oct 6, 2023, 11:07:19 AM BRT
INSERT INTO AD_ViewColumn (AD_Client_ID,AD_Org_ID,AD_ViewColumn_ID,AD_ViewColumn_UU,Created,CreatedBy,EntityType,IsActive,Updated,UpdatedBy,AD_ViewComponent_ID,ColumnName,ColumnSQL,SeqNo) VALUES (0,0,217710,'bbf17571-7f5d-4557-a153-2a8af8342b94',TO_TIMESTAMP('2023-10-06 11:07:19','YYYY-MM-DD HH24:MI:SS'),100,'D','Y',TO_TIMESTAMP('2023-10-06 11:07:19','YYYY-MM-DD HH24:MI:SS'),100,200014,'entitytype','bt.entitytype',140)
;

-- Oct 6, 2023, 11:07:23 AM BRT
CREATE OR REPLACE VIEW AD_Window_vt(AD_Language, AD_Window_ID, Name, Description, Help, WindowType, AD_Color_ID, AD_Image_ID, IsActive, WinWidth, WinHeight, IsSOTrx, AD_Window_UU, entitytype) AS SELECT trl.ad_language AS AD_Language, bt.ad_window_id AS AD_Window_ID, trl.name AS Name, trl.description AS Description, trl.help AS Help, bt.windowtype AS WindowType, bt.ad_color_id AS AD_Color_ID, bt.ad_image_id AS AD_Image_ID, bt.isactive AS IsActive, bt.winwidth AS WinWidth, bt.winheight AS WinHeight, bt.issotrx AS IsSOTrx, bt.ad_window_uu AS AD_Window_UU, bt.entitytype AS entitytype FROM ad_window bt JOIN ad_window_trl trl ON bt.ad_window_id = trl.ad_window_id WHERE bt.isactive = 'Y'
;

