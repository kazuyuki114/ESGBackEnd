-- ESG Analytics Database Schema for PostgreSQL
-- Simplified ESG Analytics Schema for Techcombank
-- Create database (run this separately if needed)
-- CREATE DATABASE esg_analytics_simplified;
-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Set timezone for consistent timestamp handling
SET
    timezone = 'UTC';

-- Create industries table
CREATE TABLE industries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50) UNIQUE NOT NULL
);

-- Create companies table
CREATE TABLE companies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    industry_id UUID NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    -- Foreign key constraint
    CONSTRAINT fk_companies_industry FOREIGN KEY (industry_id) REFERENCES industries(id)
);

-- Create report_submissions table
CREATE TABLE report_submissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    year INTEGER NOT NULL,
    file_url VARCHAR(500) NOT NULL,
    file_size BIGINT NOT NULL,
    status VARCHAR(50) DEFAULT 'submitted',
    submitted_at TIMESTAMP DEFAULT NOW(),
    -- Foreign key constraint
    CONSTRAINT fk_report_submissions_company FOREIGN KEY (company_id) REFERENCES companies(id)
);

-- Create ai_evaluations table
CREATE TABLE ai_evaluations (
    id UUID PRIMARY KEY,
    submission_id UUID NOT NULL,
    recommendations TEXT,
    key_findings TEXT,
    evaluated_at TIMESTAMP DEFAULT NOW(),
    -- Foreign key constraints
    CONSTRAINT fk_ai_evaluations_submission FOREIGN KEY (submission_id) REFERENCES report_submissions(id)
);

-- Create esg_scores table
CREATE TABLE esg_scores (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    overall_score DECIMAL(5, 2) NOT NULL CHECK (
        overall_score >= 0
        AND overall_score <= 100
    ),
    environmental_score DECIMAL(5, 2) NOT NULL CHECK (
        environmental_score >= 0
        AND environmental_score <= 100
    ),
    social_score DECIMAL(5, 2) NOT NULL CHECK (
        social_score >= 0
        AND social_score <= 100
    ),
    governance_score DECIMAL(5, 2) NOT NULL CHECK (
        governance_score >= 0
        AND governance_score <= 100
    ),
    is_verified BOOLEAN DEFAULT FALSE,
    verified_by VARCHAR(255),
    verification_date TIMESTAMP,
    CONSTRAINT fk_esg_scores_ai_evaluations FOREIGN KEY (id) REFERENCES ai_evaluations(id)
);

-- Create evaluation_metrics table
CREATE TABLE evaluation_metrics (
    id UUID PRIMARY KEY,
    -- Environmental metrics
    env_climate_action DOUBLE PRECISION NOT NULL CHECK (
        env_climate_action >= 0
        AND env_climate_action <= 100
    ),
    env_energy_transition DOUBLE PRECISION NOT NULL CHECK (
        env_energy_transition >= 0
        AND env_energy_transition <= 100
    ),
    env_water_stewardship DOUBLE PRECISION NOT NULL CHECK (
        env_water_stewardship >= 0
        AND env_water_stewardship <= 100
    ),
    env_biodiversity_nature DOUBLE PRECISION NOT NULL CHECK (
        env_biodiversity_nature >= 0
        AND env_biodiversity_nature <= 100
    ),
    env_pollution_prevention DOUBLE PRECISION NOT NULL CHECK (
        env_pollution_prevention >= 0
        AND env_pollution_prevention <= 100
    ),
    env_circular_economy DOUBLE PRECISION NOT NULL CHECK (
        env_circular_economy >= 0
        AND env_circular_economy <= 100
    ),
    env_sustainable_practices DOUBLE PRECISION NOT NULL CHECK (
        env_sustainable_practices >= 0
        AND env_sustainable_practices <= 100
    ),
    -- Social metrics
    social_diversity_inclusion DOUBLE PRECISION NOT NULL CHECK (
        social_diversity_inclusion >= 0
        AND social_diversity_inclusion <= 100
    ),
    social_workforce_development DOUBLE PRECISION NOT NULL CHECK (
        social_workforce_development >= 0
        AND social_workforce_development <= 100
    ),
    social_health_safety DOUBLE PRECISION NOT NULL CHECK (
        social_health_safety >= 0
        AND social_health_safety <= 100
    ),
    social_human_rights DOUBLE PRECISION NOT NULL CHECK (
        social_human_rights >= 0
        AND social_human_rights <= 100
    ),
    social_community_engagement DOUBLE PRECISION NOT NULL CHECK (
        social_community_engagement >= 0
        AND social_community_engagement <= 100
    ),
    social_customer_stakeholder DOUBLE PRECISION NOT NULL CHECK (
        social_customer_stakeholder >= 0
        AND social_customer_stakeholder <= 100
    ),
    social_financial_inclusion DOUBLE PRECISION NOT NULL CHECK (
        social_financial_inclusion >= 0
        AND social_financial_inclusion <= 100
    ),
    -- Governance metrics
    gov_corporate_governance DOUBLE PRECISION NOT NULL CHECK (
        gov_corporate_governance >= 0
        AND gov_corporate_governance <= 100
    ),
    gov_ethics_integrity DOUBLE PRECISION NOT NULL CHECK (
        gov_ethics_integrity >= 0
        AND gov_ethics_integrity <= 100
    ),
    gov_transparency_disclosure DOUBLE PRECISION NOT NULL CHECK (
        gov_transparency_disclosure >= 0
        AND gov_transparency_disclosure <= 100
    ),
    gov_risk_management DOUBLE PRECISION NOT NULL CHECK (
        gov_risk_management >= 0
        AND gov_risk_management <= 100
    ),
    gov_compliance_legal DOUBLE PRECISION NOT NULL CHECK (
        gov_compliance_legal >= 0
        AND gov_compliance_legal <= 100
    ),
    gov_stakeholder_relations DOUBLE PRECISION NOT NULL CHECK (
        gov_stakeholder_relations >= 0
        AND gov_stakeholder_relations <= 100
    ),
    gov_innovation_technology DOUBLE PRECISION NOT NULL CHECK (
        gov_innovation_technology >= 0
        AND gov_innovation_technology <= 100
    ),
    gov_cybersecurity_data DOUBLE PRECISION NOT NULL CHECK (
        gov_cybersecurity_data >= 0
        AND gov_cybersecurity_data <= 100
    ),
    -- Foreign key constraint (one-to-one with esg_scores)
    CONSTRAINT fk_evaluation_metrics_ai_evaluations FOREIGN KEY (id) REFERENCES ai_evaluations(id)
);




-- Create indexes for better performance
CREATE INDEX idx_companies_industry_id ON companies(industry_id);

CREATE INDEX idx_companies_slug ON companies(slug);

CREATE INDEX idx_companies_status ON companies(status);

CREATE INDEX idx_report_submissions_company_id ON report_submissions(company_id);

CREATE INDEX idx_report_submissions_year ON report_submissions(year);

CREATE INDEX idx_report_submissions_status ON report_submissions(status);

CREATE INDEX idx_esg_scores_verification ON esg_scores(is_verified);

CREATE INDEX idx_ai_evaluations_submission_id ON ai_evaluations(submission_id);

CREATE INDEX idx_ai_evaluations_evaluated_at ON ai_evaluations(evaluated_at);

-- Create trigger function to update updated_at timestamp
CREATE
OR REPLACE FUNCTION update_updated_at_column() RETURNS TRIGGER AS $$ BEGIN NEW.updated_at = NOW();

RETURN NEW;

END;

$$ language 'plpgsql';

-- Create trigger for companies table
CREATE TRIGGER update_companies_updated_at BEFORE
UPDATE
    ON companies FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert sample data for industries
INSERT INTO
    industries (id, name, code)
VALUES
    (
        '11111111-1111-1111-1111-111111111111',
        'Banking & Financial Services',
        'BANK'
    ),
    (
        '22222222-2222-2222-2222-222222222222',
        'Technology',
        'TECH'
    ),
    (
        '33333333-3333-3333-3333-333333333333',
        'Manufacturing',
        'MANF'
    ),
    (
        '44444444-4444-4444-4444-444444444444',
        'Healthcare',
        'HLTH'
    ),
    (
        '55555555-5555-5555-5555-555555555555',
        'Energy',
        'ENRG'
    ),
    (
        '66666666-6666-6666-6666-666666666666',
        'Real Estate',
        'REAL'
    ),
    (
        '77777777-7777-7777-7777-777777777777',
        'Retail & Consumer',
        'RETL'
    ),
    (
        '88888888-8888-8888-8888-888888888888',
        'Transportation',
        'TRNS'
    );

-- Grant permissions (adjust as needed for your environment)
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO esg_user;
-- GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO esg_user;