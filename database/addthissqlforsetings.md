--  Add nullable created_by and updated_by columns
ALTER TABLE settings
  ADD COLUMN created_by INT NULL AFTER company_logo,
  ADD COLUMN updated_by INT NULL AFTER created_by;

--  (Optional) Backfill created_by/updated_by to a known admin (replace 1 with the admin user_id)
-- Only run if you want to attribute the existing settings row to an existing user
UPDATE settings SET created_by = 1, updated_by = 1 WHERE settings_id = 6001 AND (created_by IS NULL OR updated_by IS NULL);

--  Add indexes then FK constraints referencing users.user_id (ON DELETE SET NULL recommended)
ALTER TABLE settings
  ADD INDEX idx_settings_created_by (created_by),
  ADD INDEX idx_settings_updated_by (updated_by);

ALTER TABLE settings
  ADD CONSTRAINT fk_settings_created_by
    FOREIGN KEY (created_by) REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  ADD CONSTRAINT fk_settings_updated_by
    FOREIGN KEY (updated_by) REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

--  Verify
SELECT * FROM settings;
SHOW CREATE TABLE settings;