-- -----------------------------------------------------
-- Upgrade for databases created before the lockbox import indexes were
-- added to create-schema.sql. Run once: ant db-add-lockbox-import-indexes
-- (or psql -f). New databases already get these from create-schema.sql.
-- -----------------------------------------------------
CREATE INDEX mainframe_import_audit_batch_record_idx ON opm.mainframe_import (audit_batch_id, record_string);
CREATE INDEX mainframe_import_pay_transaction_key_idx ON opm.mainframe_import (pay_transaction_key);
CREATE INDEX payment_transaction_duplicate_check_idx ON opm.payment_transaction (scm_claim_number, pay_trans_batch_number, pay_trans_block_number, pay_trans_sequence_number);
