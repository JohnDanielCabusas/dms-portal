ALTER TABLE `settings`
  ADD COLUMN `company_logo` VARCHAR(255) NULL AFTER `company`;

INSERT INTO `settings` (settings_id, company, max_file_mb, allowed_types, company_logo)
VALUES (6001, 'DMS', 50, 'pdf,doc,docx,jpg,jpeg,png,txt', NULL)
ON DUPLICATE KEY UPDATE settings_id = settings_id;

ALTER TABLE `files`
  ADD COLUMN `is_encrypted` TINYINT(1) NOT NULL DEFAULT 0 AFTER `file_path`,
  ADD COLUMN `encryption_version` VARCHAR(32) NULL AFTER `is_encrypted`;

UPDATE `files`
SET is_encrypted = CASE WHEN file_path IS NOT NULL AND file_path <> '' THEN 1 ELSE 0 END,
    encryption_version = COALESCE(encryption_version, 'hash_v1');

