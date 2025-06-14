-- Fix ESG Scores table schema
-- Remove the DEFAULT uuid_generate_v4() from esg_scores.id since it should use the same ID as ai_evaluations
-- First, check if there are any existing records (optional)
-- SELECT COUNT(*) FROM esg_scores;
-- Drop the default constraint on esg_scores.id
ALTER TABLE
    esg_scores
ALTER COLUMN
    id DROP DEFAULT;

-- The table should now work correctly with foreign key references
-- where the ID must match an existing ai_evaluations.id
-- Verify the change
-- \d esg_scores