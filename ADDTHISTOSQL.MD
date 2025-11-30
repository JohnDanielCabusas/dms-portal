-- ADD COLUMNS FOR RESET CODES
ALTER TABLE reset_codes ADD COLUMN token VARCHAR(255) UNIQUE NOT NULL DEFAULT '';
ALTER TABLE reset_codes ADD COLUMN expires_at TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE reset_codes ADD COLUMN is_used TINYINT(1) DEFAULT 0;

-- unused table
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS file_editors;
DROP TABLE IF EXISTS file_versions;
SET FOREIGN_KEY_CHECKS = 1;

-- unused columns
ALTER TABLE files DROP COLUMN editable_content;
ALTER TABLE files DROP COLUMN is_editable;
ALTER TABLE files DROP COLUMN current_version;


-- Drop the foreign key constraint
ALTER TABLE files DROP FOREIGN KEY files_ibfk_4;

-- Drop the index
ALTER TABLE files DROP INDEX document_type_category_id;

-- Drop the column
ALTER TABLE files DROP COLUMN document_type_category_id;
