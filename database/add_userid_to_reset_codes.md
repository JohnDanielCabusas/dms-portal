-- Migration: add user_id to reset_codes, backfill from users.email, add FK

-- 1) Add nullable user_id column
ALTER TABLE reset_codes
  ADD COLUMN user_id INT NULL AFTER email;

-- 2) Backfill existing rows by matching email -> users.email
UPDATE reset_codes rc
JOIN users u ON rc.email = u.email
SET rc.user_id = u.user_id
WHERE rc.user_id IS NULL;

-- 3) Check how many rows remain unmatched (inspect output before continuing)
SELECT COUNT(*) AS no_user_matches FROM reset_codes WHERE user_id IS NULL;

-- 4) Add index and foreign key constraint (ON DELETE SET NULL recommended)
ALTER TABLE reset_codes
  ADD INDEX idx_reset_codes_user_id (user_id);

ALTER TABLE reset_codes
  ADD CONSTRAINT fk_reset_codes_user
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;


