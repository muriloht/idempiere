-- IDEMPIERE-6216
SELECT register_migration_script('202408201236_IDEMPIERE-6216.sql') FROM dual;

-- Aug 20, 2024, 12:36:08 PM CEST
UPDATE AD_Process_Para SET MandatoryLogic='@UseDefaultCoA@=N',Updated=TO_TIMESTAMP('2024-08-20 12:36:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=53296
;

