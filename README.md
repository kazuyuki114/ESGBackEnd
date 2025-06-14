# ESG Analytics Database

A simplified PostgreSQL database schema for ESG (Environmental, Social, Governance) analytics system designed for Techcombank.

## Database Schema Overview

The database consists of 6 main tables:

1. **industries** - Industry classifications
2. **companies** - Company information with industry associations
3. **esg_scores** - Overall ESG scores for companies
4. **evaluation_metrics** - Detailed ESG metric breakdowns (21 specific metrics)
5. **report_submissions** - ESG reports submitted by companies
6. **ai_evaluations** - AI-generated evaluations and recommendations

## Key Relationships

- Companies belong to industries (many-to-one)
- Companies can submit multiple reports (one-to-many)
- ESG scores, evaluation metrics, and AI evaluations have a one-to-one relationship (same ID)
- AI evaluations are linked to report submissions

## Database Setup

### Prerequisites

- PostgreSQL 12 or higher
- psql command-line tool or any PostgreSQL client

### Installation Steps

1. **Create the database:**

   ```sql
   CREATE DATABASE esg_analytics_simplified;
   ```

2. **Connect to the database:**

   ```bash
   psql -d esg_analytics_simplified
   ```

3. **Run the schema creation script:**
   ```bash
   psql -d esg_analytics_simplified -f create_esg_database.sql
   ```

## Database Features

### Data Validation

- All ESG scores and metrics are constrained between 0-100
- Email validation and required fields enforced
- Unique constraints on company slugs and industry codes
- UUID primary keys for better security and uniqueness

### Performance Optimizations

- Strategic indexes on frequently queried columns
- Automatic timestamp updates for `companies.updated_at`

### Sample Data

The script includes sample industry data for common sectors:

- Banking & Financial Services
- Technology
- Manufacturing
- Healthcare
- Energy
- Real Estate
- Retail & Consumer
- Transportation

## Table Structures

### ESG Metrics Categories

**Environmental (7 metrics):**

- Climate Action
- Energy Transition
- Water Stewardship
- Biodiversity & Nature
- Pollution Prevention
- Circular Economy
- Sustainable Practices

**Social (7 metrics):**

- Diversity & Inclusion
- Workforce Development
- Health & Safety
- Human Rights
- Community Engagement
- Customer & Stakeholder Relations
- Financial Inclusion

**Governance (8 metrics):**

- Corporate Governance
- Ethics & Integrity
- Transparency & Disclosure
- Risk Management
- Compliance & Legal
- Stakeholder Relations
- Innovation & Technology
- Cybersecurity & Data Protection

## Usage Examples

### Insert a new company:

```sql
INSERT INTO companies (name, slug, industry_id, email)
VALUES ('Techcombank', 'techcombank', '11111111-1111-1111-1111-111111111111', 'contact@techcombank.com');
```

### Submit an ESG report:

```sql
INSERT INTO report_submissions (company_id, title, year, file_url, file_size)
VALUES ('99999999-9999-9999-9999-999999999999', '2023 ESG Report', 2023, 'https://example.com/report.pdf', 2048576);
```

### Record ESG scores:

```sql
INSERT INTO esg_scores (overall_score, environmental_score, social_score, governance_score)
VALUES (85.5, 82.0, 88.0, 86.5);
```

### Query company ESG performance:

```sql
SELECT
    c.name as company_name,
    i.name as industry,
    es.overall_score,
    es.environmental_score,
    es.social_score,
    es.governance_score
FROM companies c
JOIN industries i ON c.industry_id = i.id
LEFT JOIN esg_scores es ON es.id IN (
    SELECT ae.id FROM ai_evaluations ae
    JOIN report_submissions rs ON ae.submission_id = rs.id
    WHERE rs.company_id = c.id
);
```

## Security Considerations

- Uncomment and adjust the GRANT statements at the end of the SQL file
- Create specific database users with appropriate permissions
- Consider row-level security for multi-tenant scenarios
- Implement proper backup and recovery procedures

## Maintenance

### Regular Tasks

- Monitor index performance and rebuild if necessary
- Archive old report submissions based on retention policies
- Update industry classifications as needed
- Review and optimize query performance periodically

### Monitoring Queries

```sql
-- Check database size
SELECT pg_size_pretty(pg_database_size('esg_analytics_simplified'));

-- Monitor table sizes
SELECT
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
```

## Contributing

When making schema changes:

1. Test changes in a development environment first
2. Document any breaking changes
3. Update this README with new features or modifications
4. Consider backward compatibility for existing data
