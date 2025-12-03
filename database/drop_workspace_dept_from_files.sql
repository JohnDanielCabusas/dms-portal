-- Migration: drop deprecated columns from files table
-- Removes workspace_id and department_id which are now represented
-- by the file_workspaces table and file_shares.
ALTER TABLE files DROP FOREIGN KEY files_ibfk_2;
ALTER TABLE files DROP FOREIGN KEY files_ibfk_5;

ALTER TABLE files
  DROP COLUMN workspace_id,
  DROP COLUMN department_id;


