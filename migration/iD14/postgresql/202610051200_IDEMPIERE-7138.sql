-- IDEMPIERE-7138 Marble UI density (comfortable/compact)
SELECT register_migration_script('202610051200_IDEMPIERE-7138.sql') FROM dual;

-- Oct 5, 2026
INSERT INTO AD_SysConfig (AD_SysConfig_ID,AD_SysConfig_UU,Name,Value,Description,EntityType,ConfigurationLevel,AD_Client_ID,AD_Org_ID,IsActive,Created,CreatedBy,Updated,UpdatedBy) VALUES (200329,'98b97f01-76e2-4bc1-b323-40b77cec5a7b','ZK_THEME_DENSITY','comfortable','Marble theme UI density: comfortable (default) or compact','D','S',0,0,'Y',TO_TIMESTAMP('2026-10-05 12:00:00','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2026-10-05 12:00:00','YYYY-MM-DD HH24:MI:SS'),100)
;
