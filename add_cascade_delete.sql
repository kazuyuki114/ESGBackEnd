-- Script to add ON DELETE CASCADE to all foreign key constraints
-- ESG Analytics Database - Foreign Key Cascade Migration
-- Run this script after the database has been created
-- Begin transaction to ensure atomicity
BEGIN;

-- 1. Drop existing foreign key constraint for companies.industry_id
ALTER TABLE
    companies DROP CONSTRAINT IF EXISTS fk_companies_industry;

-- Re-add with ON DELETE CASCADE
ALTER TABLE
    companies
ADD
    CONSTRAINT fk_companies_industry FOREIGN KEY (industry_id) REFERENCES industries(id) ON DELETE CASCADE;

-- 2. Drop existing foreign key constraint for report_submissions.company_id
ALTER TABLE
    report_submissions DROP CONSTRAINT IF EXISTS fk_report_submissions_company;

-- Re-add with ON DELETE CASCADE
ALTER TABLE
    report_submissions
ADD
    CONSTRAINT fk_report_submissions_company FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE;

-- 3. Drop existing foreign key constraint for ai_evaluations.submission_id
ALTER TABLE
    ai_evaluations DROP CONSTRAINT IF EXISTS fk_ai_evaluations_submission;

-- Re-add with ON DELETE CASCADE
ALTER TABLE
    ai_evaluations
ADD
    CONSTRAINT fk_ai_evaluations_submission FOREIGN KEY (submission_id) REFERENCES report_submissions(id) ON DELETE CASCADE;

-- 4. Drop existing foreign key constraint for esg_scores.id
ALTER TABLE
    esg_scores DROP CONSTRAINT IF EXISTS fk_esg_scores_ai_evaluations;

-- Re-add with ON DELETE CASCADE
ALTER TABLE
    esg_scores
ADD
    CONSTRAINT fk_esg_scores_ai_evaluations FOREIGN KEY (id) REFERENCES ai_evaluations(id) ON DELETE CASCADE;

-- 5. Drop existing foreign key constraint for evaluation_metrics.id
ALTER TABLE
    evaluation_metrics DROP CONSTRAINT IF EXISTS fk_evaluation_metrics_ai_evaluations;

-- Re-add with ON DELETE CASCADE
ALTER TABLE
    evaluation_metrics
ADD
    CONSTRAINT fk_evaluation_metrics_ai_evaluations FOREIGN KEY (id) REFERENCES ai_evaluations(id) ON DELETE CASCADE;

-- Commit the transaction
COMMIT;

-- Verify the changes by checking constraint information
SELECT
    tc.table_name,
    tc.constraint_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name,
    rc.delete_rule
FROM
    information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
    JOIN information_schema.referential_constraints AS rc ON tc.constraint_name = rc.constraint_name
    AND tc.table_schema = rc.constraint_schema
WHERE
    tc.constraint_type = 'FOREIGN KEY'
    AND tc.table_schema = 'public'
ORDER BY
    tc.table_name,
    tc.constraint_name;