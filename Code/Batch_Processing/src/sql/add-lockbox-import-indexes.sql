-- -----------------------------------------------------
-- Upgrade for databases created before the lockbox import indexes were
-- added to create-schema.sql. Run once: ant db-add-lockbox-import-indexes
-- (one transaction), or psql -v ON_ERROR_STOP=1 --single-transaction -f.
-- New databases already get these from create-schema.sql.
-- payment_transaction comes first: the import locks payment_transaction
-- and then mainframe_import, so taking them in the same order cannot
-- deadlock with a running import.
-- -----------------------------------------------------
CREATE INDEX payment_transaction_duplicate_check_idx ON opm.payment_transaction (scm_claim_number, pay_trans_batch_number, pay_trans_block_number, pay_trans_sequence_number);
CREATE INDEX mainframe_import_audit_batch_record_idx ON opm.mainframe_import (audit_batch_id, record_string);
CREATE INDEX mainframe_import_pay_transaction_key_idx ON opm.mainframe_import (pay_transaction_key);
