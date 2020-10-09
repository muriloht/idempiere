-- IDEMPIERE - Print Format DOCX
-- Oct 11, 2019, 11:03:03 AM BRT
INSERT INTO AD_Element (AD_Element_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,ColumnName,Name,PrintName,EntityType,AD_Element_UU) VALUES (203447,0,0,'Y',TO_TIMESTAMP('2019-10-11 11:03:03','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2019-10-11 11:03:03','YYYY-MM-DD HH24:MI:SS'),0,'isTemplateDOCX','Template DOCX','Template DOCX','D','0f6e3d84-db52-451d-b198-3cadae74906f')
;

-- Oct 11, 2019, 11:04:18 AM BRT
INSERT INTO AD_Column (AD_Column_ID,Version,Name,AD_Table_ID,ColumnName,DefaultValue,FieldLength,IsKey,IsParent,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsEncrypted,AD_Reference_ID,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,AD_Element_ID,IsUpdateable,IsSelectionColumn,EntityType,IsSyncDatabase,IsAlwaysUpdateable,IsAutocomplete,IsAllowLogging,AD_Column_UU,IsAllowCopy,SeqNoSelection,IsToolbarButton,IsSecure,FKConstraintType,IsHtml) VALUES (214325,0,'Template DOCX',493,'isTemplateDOCX','N',1,'N','N','Y','N','N',0,'N',20,0,0,'Y',TO_TIMESTAMP('2019-10-11 11:04:18','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2019-10-11 11:04:18','YYYY-MM-DD HH24:MI:SS'),0,203447,'Y','N','D','N','N','N','Y','3fd13100-93b6-4f3b-b2ae-8829874da577','Y',0,'N','N','N','N')
;

-- Oct 11, 2019, 11:04:20 AM BRT
ALTER TABLE AD_PrintFormat ADD COLUMN isTemplateDOCX CHAR(1) DEFAULT 'N' CHECK (isTemplateDOCX IN ('Y','N')) NOT NULL
;

-- Oct 11, 2019, 11:06:37 AM BRT
INSERT INTO AD_Field (AD_Field_ID,Name,AD_Tab_ID,AD_Column_ID,IsDisplayed,DisplayLength,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsEncrypted,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,IsReadOnly,IsCentrallyMaintained,EntityType,AD_Field_UU,IsDisplayedGrid,SeqNoGrid,XPosition,ColumnSpan) VALUES (206519,'Template DOCX',425,214325,'Y',1,260,'N','N','N','N',0,0,'Y',TO_TIMESTAMP('2019-10-11 11:06:37','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2019-10-11 11:06:37','YYYY-MM-DD HH24:MI:SS'),0,'N','Y','D','e5412d6f-b719-4a15-ac61-a60d4c729495','Y',260,2,2)
;

-- Oct 11, 2019, 11:08:28 AM BRT
UPDATE AD_Field SET IsDisplayed='Y', SeqNo=90, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, XPosition=2, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=206519
;

-- Oct 11, 2019, 11:08:32 AM BRT
UPDATE AD_Field SET SeqNo=100, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5656
;

-- Oct 11, 2019, 11:08:36 AM BRT
UPDATE AD_Field SET SeqNo=110, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5651
;

-- Oct 11, 2019, 11:08:40 AM BRT
UPDATE AD_Field SET SeqNo=120, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5663
;

-- Oct 11, 2019, 11:08:44 AM BRT
UPDATE AD_Field SET SeqNo=130, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5653
;

-- Oct 11, 2019, 11:08:48 AM BRT
UPDATE AD_Field SET SeqNo=140, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5762
;

-- Oct 11, 2019, 11:08:52 AM BRT
UPDATE AD_Field SET SeqNo=150, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=6503
;

-- Oct 11, 2019, 11:08:56 AM BRT
UPDATE AD_Field SET SeqNo=160, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:08:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5657
;

-- Oct 11, 2019, 11:09:00 AM BRT
UPDATE AD_Field SET SeqNo=170, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5661
;

-- Oct 11, 2019, 11:09:04 AM BRT
UPDATE AD_Field SET SeqNo=180, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5654
;

-- Oct 11, 2019, 11:09:08 AM BRT
UPDATE AD_Field SET SeqNo=190, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5658
;

-- Oct 11, 2019, 11:09:12 AM BRT
UPDATE AD_Field SET SeqNo=200, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=50179
;

-- Oct 11, 2019, 11:09:16 AM BRT
UPDATE AD_Field SET SeqNo=210, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=202368
;

-- Oct 11, 2019, 11:09:21 AM BRT
UPDATE AD_Field SET SeqNo=220, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=52009
;

-- Oct 11, 2019, 11:09:25 AM BRT
UPDATE AD_Field SET SeqNo=230, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5660
;

-- Oct 11, 2019, 11:09:29 AM BRT
UPDATE AD_Field SET SeqNo=240, AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:09:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=52008
;

-- Oct 11, 2019, 11:10:48 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:10:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5656
;

-- Oct 11, 2019, 11:10:56 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:10:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5651
;

-- Oct 11, 2019, 11:11:03 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5663
;

-- Oct 11, 2019, 11:11:09 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5653
;

-- Oct 11, 2019, 11:11:16 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5762
;

-- Oct 11, 2019, 11:11:22 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=6503
;

-- Oct 11, 2019, 11:11:31 AM BRT
UPDATE AD_Field SET DisplayLogic='@IsForm@=Y & @IsStandardHeaderFooter@=N & @isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5657
;

-- Oct 11, 2019, 11:11:40 AM BRT
UPDATE AD_Field SET DisplayLogic='@IsForm@=Y & @IsStandardHeaderFooter@=N & @isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5661
;

-- Oct 11, 2019, 11:11:47 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5654
;

-- Oct 11, 2019, 11:11:53 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:11:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=5658
;

-- Oct 11, 2019, 11:12:00 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:12:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=50179
;

-- Oct 11, 2019, 11:12:09 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:12:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=52009
;

-- Oct 11, 2019, 11:13:06 AM BRT
UPDATE AD_Field SET DisplayLogic='@isTemplateDOCX@ !''Y''', AD_Reference_Value_ID=NULL, AD_Val_Rule_ID=NULL, IsToolbarButton=NULL,Updated=TO_TIMESTAMP('2019-10-11 11:13:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=52008
;

-- Oct 11, 2019, 11:25:57 AM BRT
INSERT INTO AD_Message (MsgType,MsgText,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy,AD_Message_ID,Value,EntityType,AD_Message_UU) VALUES ('E','docx - Word Document file',0,0,'Y',TO_TIMESTAMP('2019-10-11 11:25:57','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2019-10-11 11:25:57','YYYY-MM-DD HH24:MI:SS'),0,200642,'FileDOCX','D','76ae75e1-0cf4-4e7f-9ef6-e0167481405c')
;

SELECT register_migration_script('IDEMPIERE-DOCX.sql') FROM dual
;