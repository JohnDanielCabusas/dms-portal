-- Migration: Remove unused columns and tables
-- Date: 2025-11-30
-- Purpose: Drop unused file columns (editable_content, is_editable, current_version, document_type_category_id)
--          Drop entirely unused tables (file_editors, file_versions)
--          Back up data for reversible rollback.

-- =============================
-- SAFETY FIRST: Run this in a transaction. Verify backups succeed.
-- =============================

START TRANSACTION;

-- 1. Back up data from unused file columns (in case future rollback is needed)
DROP TABLE IF EXISTS files_backup_unused_columns;
CREATE TABLE files_backup_unused_columns AS
SELECT file_id, editable_content, is_editable, current_version, document_type_category_id
FROM files;

-- 2. Back up full file_editors and file_versions tables before dropping (skip if tables don't exist)
-- Note: These tables were already removed from your schema

-- 3. Drop foreign key constraint and unused columns from files
ALTER TABLE files
  DROP FOREIGN KEY files_ibfk_4;

ALTER TABLE files
  DROP COLUMN editable_content,
  DROP COLUMN is_editable,
  DROP COLUMN current_version,
  DROP COLUMN document_type_category_id;

-- 4. Drop unused tables (if they exist)
DROP TABLE IF EXISTS file_editors;
DROP TABLE IF EXISTS file_versions;

COMMIT;

-- =============================
-- Rollback Script (Manual) - Save below separately if desired
-- =============================
-- To rollback, execute the following:
-- START TRANSACTION;
-- ALTER TABLE files
--   ADD COLUMN editable_content LONGTEXT DEFAULT NULL,
--   ADD COLUMN is_editable TINYINT(1) DEFAULT 0,
--   ADD COLUMN current_version INT(11) DEFAULT 1,
--   ADD COLUMN document_type_category_id INT(11) DEFAULT NULL;
-- 
-- UPDATE files f
-- JOIN files_backup_unused_columns b ON f.file_id = b.file_id
-- SET f.editable_content = b.editable_content,
--     f.is_editable = b.is_editable,
--     f.current_version = b.current_version,
--     f.document_type_category_id = b.document_type_category_id;
-- 
-- CREATE TABLE file_editors (
--   editor_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   file_id int(11) NOT NULL,
--   user_id int(11) NOT NULL,
--   session_id varchar(255) DEFAULT NULL,
--   last_activity timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
--   UNIQUE KEY unique_editor (file_id,user_id),
--   KEY file_id (file_id),
--   KEY user_id (user_id),
--   CONSTRAINT file_editors_ibfk_1 FOREIGN KEY (file_id) REFERENCES files (file_id) ON DELETE CASCADE,
--   CONSTRAINT file_editors_ibfk_2 FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- 
-- CREATE TABLE file_versions (
--   version_id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   file_id int(11) NOT NULL,
--   version_number int(11) NOT NULL,
--   content longtext DEFAULT NULL,
--   content_hash varchar(255) DEFAULT NULL,
--   edited_by int(11) NOT NULL,
--   edit_summary varchar(255) DEFAULT NULL,
--   created_at timestamp NOT NULL DEFAULT current_timestamp(),
--   UNIQUE KEY unique_version (file_id,version_number),
--   KEY file_id (file_id),
--   KEY edited_by (edited_by),
--   CONSTRAINT file_versions_ibfk_1 FOREIGN KEY (file_id) REFERENCES files (file_id) ON DELETE CASCADE,
--   CONSTRAINT file_versions_ibfk_2 FOREIGN KEY (edited_by) REFERENCES users (user_id) ON DELETE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- COMMIT;

-- END OF MIGRATION
