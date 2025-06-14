-- Add indexes on id columns for better performance
-- This will improve query performance for lookups, joins, and foreign key operations
-- Create index on esg_scores.id
CREATE INDEX IF NOT EXISTS idx_esg_scores_id ON esg_scores(id);

-- Create index on evaluation_metrics.id  
CREATE INDEX IF NOT EXISTS idx_evaluation_metrics_id ON evaluation_metrics(id);

-- Verify the indexes were created
-- \di idx_esg_scores_id
-- \di idx_evaluation_metrics_id
-- Optional: Show all indexes for these tables
-- SELECT indexname, tablename, indexdef FROM pg_indexes WHERE tablename IN ('esg_scores', 'evaluation_metrics');