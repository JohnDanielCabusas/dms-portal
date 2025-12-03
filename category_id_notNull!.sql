-- Drop the existing FK constraint with SET NULL
ALTER TABLE files DROP FOREIGN KEY files_ibfk_3;

-- Make category_id NOT NULL
ALTER TABLE files MODIFY COLUMN category_id INT(11) NOT NULL;

-- Add FK back with ON DELETE RESTRICT (prevents deletion of categories in use)
ALTER TABLE files 
ADD CONSTRAINT files_ibfk_3 FOREIGN KEY (category_id) 
REFERENCES categories(category_id) ON DELETE RESTRICT;