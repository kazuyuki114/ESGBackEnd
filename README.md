# ESG Analytics Database

A comprehensive PostgreSQL database system for ESG (Environmental, Social, Governance) analytics and reporting.

## Quick Setup

### Prerequisites

- PostgreSQL 12+
- Database with UUID extension support

### Installation Steps

1. **Create Database Schema**

   ```bash
   psql -d your_database -f create_esg_database.sql
   ```

2. **Add Foreign Key Cascades** _(Optional)_

   ```bash
   psql -d your_database -f add_cascade_delete.sql
   ```

3. **Insert Sample Data**
   ```bash
   psql -d your_database -f insert_companies.sql
   psql -d your_database -f insert_report_submissions.sql
   psql -d your_database -f insert_ai_evaluations_fixed.sql
   ```

## Database Structure

### Core Tables

- **`industries`** - 54+ industry classifications
- **`companies`** - 119 Vietnamese companies across 8 sectors
- **`report_submissions`** - ESG reports with file metadata
- **`ai_evaluations`** - AI-generated analysis and recommendations
- **`esg_scores`** - Overall and component ESG scores
- **`evaluation_metrics`** - 18 detailed ESG metrics

### Key Features

- ✅ **Industry-specific scoring** with weighted metrics
- ✅ **AI-generated recommendations** tailored by sector
- ✅ **Comprehensive ESG evaluation** (Environmental, Social, Governance)
- ✅ **Multi-year reporting** support
- ✅ **Verification workflow** with approval status
- ✅ **CASCADE deletion** for data integrity

## Sample Data

- **119 companies** across Banking, Software, Food, Beverages, etc.
- **170+ report submissions** with realistic file sizes and dates
- **Complete AI evaluations** with scores ranging 50-90 points
- **18 detailed metrics** per evaluation

## Database Queries

View company ESG scores:

```sql
SELECT c.name, i.name as industry, es.overall_score, es.environmental_score, es.social_score, es.governance_score
FROM companies c
JOIN industries i ON c.industry_id = i.id
JOIN report_submissions rs ON c.id = rs.company_id
JOIN ai_evaluations ae ON rs.id = ae.submission_id
JOIN esg_scores es ON ae.id = es.id
ORDER BY es.overall_score DESC;
```

## Tech Stack

- **Database**: PostgreSQL
- **Languages**: SQL, PL/pgSQL
- **Extensions**: UUID-OSSP
- **Data**: Vietnamese companies with realistic ESG metrics
