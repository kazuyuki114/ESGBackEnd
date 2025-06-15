-- Script to insert AI evaluations for all report submissions (FIXED VERSION)
-- ESG Analytics Database - AI Evaluations Data Insertion
-- Run this script after report submissions have been inserted
-- Begin transaction to ensure atomicity
BEGIN;

-- Create a function to generate realistic recommendations based on industry
CREATE
OR REPLACE FUNCTION generate_recommendations(industry_name TEXT, company_name TEXT) RETURNS TEXT AS $ $ BEGIN CASE
    WHEN industry_name LIKE '%Water%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Implement advanced water treatment technologies to reduce environmental impact. 2) Enhance community engagement programs for water conservation. 3) Develop renewable energy sources for water processing facilities. 4) Strengthen supply chain sustainability practices. 5) Improve transparency in water quality reporting to stakeholders.';

WHEN industry_name LIKE '%Banking%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Expand green financing portfolio and sustainable investment products. 2) Implement comprehensive ESG risk assessment framework. 3) Enhance digital banking services to reduce carbon footprint. 4) Strengthen financial inclusion initiatives for underserved communities. 5) Develop climate-related financial risk disclosure practices.';

WHEN industry_name LIKE '%Software%'
OR industry_name LIKE '%IT%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Transition to 100% renewable energy for data centers and offices. 2) Implement circular economy principles in hardware lifecycle management. 3) Enhance diversity and inclusion programs in technology roles. 4) Develop AI ethics framework and responsible technology practices. 5) Expand digital skills training programs for communities.';

WHEN industry_name LIKE '%Transport%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Accelerate transition to electric and low-emission vehicle fleets. 2) Improve infrastructure resilience against climate change impacts. 3) Enhance safety protocols and worker protection measures. 4) Develop smart transportation solutions to reduce congestion. 5) Strengthen community consultation processes for infrastructure projects.';

WHEN industry_name LIKE '%Food%'
AND industry_name LIKE '%tobacco%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Implement sustainable agriculture practices throughout supply chain. 2) Reduce food waste and improve packaging sustainability. 3) Enhance food safety and quality control systems. 4) Support local farmer development and fair trade practices. 5) Develop healthier product alternatives and transparent labeling.';

WHEN industry_name LIKE '%Beverage%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Achieve water stewardship goals and reduce water consumption per unit produced. 2) Transition to 100% recyclable or reusable packaging. 3) Implement sustainable sourcing for key ingredients. 4) Reduce carbon emissions across manufacturing and distribution. 5) Expand responsible marketing practices and health-conscious product development.';

WHEN industry_name LIKE '%retail%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Implement circular economy principles in retail operations. 2) Enhance supply chain transparency and ethical sourcing practices. 3) Develop community health and wellness programs. 4) Improve energy efficiency in retail locations. 5) Strengthen customer data privacy and security measures.';

WHEN industry_name LIKE '%Professional%' THEN RETURN 'Recommendations for ' || company_name || ': 1) Implement comprehensive ESG integration in service delivery. 2) Enhance employee wellbeing and work-life balance programs. 3) Develop sustainable office operations and remote work policies. 4) Strengthen client data security and privacy protection. 5) Expand pro bono services for social impact initiatives.';

ELSE RETURN 'Recommendations for ' || company_name || ': 1) Develop comprehensive ESG strategy aligned with industry best practices. 2) Enhance stakeholder engagement and transparency reporting. 3) Implement environmental management systems and targets. 4) Strengthen governance frameworks and ethical business practices. 5) Expand social impact programs and community investment.';

END CASE
;

END;

$ $ LANGUAGE plpgsql;

-- Create a function to generate realistic key findings
CREATE
OR REPLACE FUNCTION generate_key_findings(industry_name TEXT, company_name TEXT) RETURNS TEXT AS $ $ BEGIN CASE
    WHEN industry_name LIKE '%Water%' THEN RETURN 'Key Findings for ' || company_name || ': The company demonstrates strong environmental stewardship with effective water resource management practices. Notable achievements include 15-25% reduction in water loss, implementation of smart monitoring systems, and community water conservation programs. Areas for improvement include renewable energy adoption and enhanced biodiversity protection measures.';

WHEN industry_name LIKE '%Banking%' THEN RETURN 'Key Findings for ' || company_name || ': Strong governance framework with robust risk management practices. The bank shows commitment to sustainable finance with growing green loan portfolio. ESG integration in investment decisions is progressing well. Opportunities exist to enhance climate risk disclosure and expand financial inclusion initiatives for rural communities.';

WHEN industry_name LIKE '%Software%'
OR industry_name LIKE '%IT%' THEN RETURN 'Key Findings for ' || company_name || ': Excellent progress on digital transformation and innovation while maintaining strong cybersecurity standards. The company shows commitment to diversity with improving gender representation in technical roles. Carbon footprint reduction through cloud optimization is noteworthy. Further development needed in circular economy practices for hardware.';

WHEN industry_name LIKE '%Transport%' THEN RETURN 'Key Findings for ' || company_name || ': Infrastructure resilience and safety protocols meet industry standards with continuous improvement initiatives. The company is making progress on emission reduction through fleet modernization. Strong community engagement in infrastructure development projects. Opportunities exist for accelerated adoption of renewable energy and smart transportation technologies.';

WHEN industry_name LIKE '%Food%'
AND industry_name LIKE '%tobacco%' THEN RETURN 'Key Findings for ' || company_name || ': Food safety and quality control systems are well-established with strong traceability measures. The company demonstrates commitment to sustainable agriculture through supplier partnerships. Progress on packaging reduction and waste management is evident. Enhancement needed in nutritional transparency and health-conscious product development.';

WHEN industry_name LIKE '%Beverage%' THEN RETURN 'Key Findings for ' || company_name || ': Water stewardship practices show measurable improvements with 10-20% reduction in water usage per unit. Packaging sustainability initiatives are progressing with increased recycled content. Strong community investment programs evident. Opportunities for enhancement in renewable energy adoption and sustainable ingredient sourcing.';

WHEN industry_name LIKE '%retail%' THEN RETURN 'Key Findings for ' || company_name || ': Supply chain transparency initiatives showing positive progress with improved supplier assessment programs. Customer data privacy and security measures meet regulatory requirements. Energy efficiency improvements in retail locations are noteworthy. Further development needed in circular economy practices and sustainable product offerings.';

WHEN industry_name LIKE '%Professional%' THEN RETURN 'Key Findings for ' || company_name || ': Strong governance structure with effective risk management and compliance frameworks. Employee satisfaction and retention rates above industry average. Client data security measures are robust and regularly updated. Opportunities exist to enhance environmental impact reduction and expand social impact service offerings.';

ELSE RETURN 'Key Findings for ' || company_name || ': The company demonstrates baseline ESG practices with room for strategic enhancement. Governance structures are established with opportunities for strengthening stakeholder engagement. Environmental impact measurement and reduction programs are in development. Social impact initiatives show potential for expansion and community benefit.';

END CASE
;

END;

$ $ LANGUAGE plpgsql;

-- Insert AI evaluations for all report submissions
INSERT INTO
    ai_evaluations (
        id,
        submission_id,
        recommendations,
        key_findings,
        evaluated_at
    )
SELECT
    uuid_generate_v4() as id,
    rs.id as submission_id,
    generate_recommendations(i.name, c.name) as recommendations,
    generate_key_findings(i.name, c.name) as key_findings,
    rs.submitted_at + INTERVAL '3 days' + (RANDOM() * INTERVAL '10 days') as evaluated_at
FROM
    report_submissions rs
    JOIN companies c ON rs.company_id = c.id
    JOIN industries i ON c.industry_id = i.id;

-- Insert ESG scores for each AI evaluation
INSERT INTO
    esg_scores (
        id,
        overall_score,
        environmental_score,
        social_score,
        governance_score,
        is_verified,
        verified_by,
        verification_date
    )
SELECT
    ae.id,
    -- Calculate overall score as weighted average (E: 35%, S: 35%, G: 30%)
    ROUND(
        (
            (RANDOM() * 40 + 50) * 0.35 + -- Environmental: 50-90
            (RANDOM() * 40 + 50) * 0.35 + -- Social: 50-90  
            (RANDOM() * 30 + 60) * 0.30 -- Governance: 60-90 (usually higher)
        ) :: numeric,
        2
    ) as overall_score,
    ROUND((RANDOM() * 40 + 50) :: numeric, 2) as environmental_score,
    -- 50-90
    ROUND((RANDOM() * 40 + 50) :: numeric, 2) as social_score,
    -- 50-90
    ROUND((RANDOM() * 30 + 60) :: numeric, 2) as governance_score,
    -- 60-90
    CASE
        WHEN RANDOM() < 0.7 THEN true
        ELSE false
    END as is_verified,
    CASE
        WHEN RANDOM() < 0.7 THEN CASE
            WHEN RANDOM() < 0.3 THEN 'ESG Analytics AI System'
            WHEN RANDOM() < 0.6 THEN 'Senior ESG Analyst'
            ELSE 'ESG Committee Review Board'
        END
        ELSE NULL
    END as verified_by,
    CASE
        WHEN RANDOM() < 0.7 THEN ae.evaluated_at + INTERVAL '1 day' + (RANDOM() * INTERVAL '5 days')
        ELSE NULL
    END as verification_date
FROM
    ai_evaluations ae;

-- Insert detailed evaluation metrics for each AI evaluation with proper bounds checking
INSERT INTO
    evaluation_metrics (
        id,
        -- Environmental metrics
        env_climate_action,
        env_energy_transition,
        env_water_stewardship,
        env_biodiversity_nature,
        env_pollution_prevention,
        env_circular_economy,
        env_sustainable_practices,
        -- Social metrics
        social_diversity_inclusion,
        social_workforce_development,
        social_health_safety,
        social_human_rights,
        social_community_engagement,
        social_customer_stakeholder,
        social_financial_inclusion,
        -- Governance metrics
        gov_corporate_governance,
        gov_ethics_integrity,
        gov_transparency_disclosure,
        gov_risk_management,
        gov_compliance_legal,
        gov_stakeholder_relations,
        gov_innovation_technology,
        gov_cybersecurity_data
    )
SELECT
    ae.id,
    -- Environmental metrics (ensuring values stay within 0-100 range)
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 30 + 50 + CASE
                    WHEN i.name LIKE '%Water%' THEN 15
                    WHEN i.name LIKE '%Beverage%' THEN 12
                    WHEN i.name LIKE '%Transport%' THEN 8
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as env_climate_action,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 30 + 50 + CASE
                    WHEN i.name LIKE '%Software%' THEN 12
                    WHEN i.name LIKE '%Transport%' THEN 8
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as env_energy_transition,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 25 + 50 + CASE
                    WHEN i.name LIKE '%Water%' THEN 20
                    WHEN i.name LIKE '%Beverage%' THEN 15
                    WHEN i.name LIKE '%Food%' THEN 10
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as env_water_stewardship,
    ROUND((RANDOM() * 35 + 45) :: numeric, 2) as env_biodiversity_nature,
    ROUND((RANDOM() * 35 + 50) :: numeric, 2) as env_pollution_prevention,
    ROUND((RANDOM() * 30 + 55) :: numeric, 2) as env_circular_economy,
    ROUND((RANDOM() * 35 + 50) :: numeric, 2) as env_sustainable_practices,
    -- Social metrics
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 30 + 55 + CASE
                    WHEN i.name LIKE '%Software%' THEN 12
                    WHEN i.name LIKE '%Banking%' THEN 8
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as social_diversity_inclusion,
    ROUND((RANDOM() * 35 + 50) :: numeric, 2) as social_workforce_development,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 25 + 60 + CASE
                    WHEN i.name LIKE '%Transport%' THEN 12
                    WHEN i.name LIKE '%Food%' THEN 8
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as social_health_safety,
    ROUND((RANDOM() * 35 + 50) :: numeric, 2) as social_human_rights,
    ROUND((RANDOM() * 35 + 50) :: numeric, 2) as social_community_engagement,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 30 + 55 + CASE
                    WHEN i.name LIKE '%retail%' THEN 12
                    WHEN i.name LIKE '%Banking%' THEN 8
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as social_customer_stakeholder,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 25 + 50 + CASE
                    WHEN i.name LIKE '%Banking%' THEN 15
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as social_financial_inclusion,
    -- Governance metrics (generally higher scores, but still within bounds)
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 20 + 70 + CASE
                    WHEN i.name LIKE '%Banking%' THEN 8
                    WHEN i.name LIKE '%Professional%' THEN 6
                    ELSE 2
                END
            ) :: numeric,
            2
        )
    ) as gov_corporate_governance,
    ROUND((RANDOM() * 25 + 65) :: numeric, 2) as gov_ethics_integrity,
    ROUND((RANDOM() * 30 + 60) :: numeric, 2) as gov_transparency_disclosure,
    ROUND((RANDOM() * 25 + 65) :: numeric, 2) as gov_risk_management,
    ROUND((RANDOM() * 20 + 70) :: numeric, 2) as gov_compliance_legal,
    ROUND((RANDOM() * 30 + 60) :: numeric, 2) as gov_stakeholder_relations,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 25 + 60 + CASE
                    WHEN i.name LIKE '%Software%' THEN 12
                    WHEN i.name LIKE '%Banking%' THEN 10
                    ELSE 3
                END
            ) :: numeric,
            2
        )
    ) as gov_innovation_technology,
    LEAST(
        100,
        ROUND(
            (
                RANDOM() * 20 + 70 + CASE
                    WHEN i.name LIKE '%Software%' THEN 10
                    WHEN i.name LIKE '%Banking%' THEN 8
                    WHEN i.name LIKE '%Professional%' THEN 6
                    ELSE 2
                END
            ) :: numeric,
            2
        )
    ) as gov_cybersecurity_data
FROM
    ai_evaluations ae
    JOIN report_submissions rs ON ae.submission_id = rs.id
    JOIN companies c ON rs.company_id = c.id
    JOIN industries i ON c.industry_id = i.id;

-- Clean up the temporary functions
DROP FUNCTION generate_recommendations(TEXT, TEXT);

DROP FUNCTION generate_key_findings(TEXT, TEXT);

-- Commit the transaction
COMMIT;

-- Verify the insertions with comprehensive statistics
SELECT
    'AI Evaluations Summary' as section,
    '' as metric,
    '' as value
UNION
ALL
SELECT
    '',
    'Total AI Evaluations',
    COUNT(*) :: text
FROM
    ai_evaluations
UNION
ALL
SELECT
    '',
    'Verified Evaluations',
    COUNT(*) :: text
FROM
    esg_scores
WHERE
    is_verified = true
UNION
ALL
SELECT
    '',
    'Average Overall ESG Score',
    ROUND(AVG(overall_score), 2) :: text
FROM
    esg_scores
UNION
ALL
SELECT
    '',
    'Average Environmental Score',
    ROUND(AVG(environmental_score), 2) :: text
FROM
    esg_scores
UNION
ALL
SELECT
    '',
    'Average Social Score',
    ROUND(AVG(social_score), 2) :: text
FROM
    esg_scores
UNION
ALL
SELECT
    '',
    'Average Governance Score',
    ROUND(AVG(governance_score), 2) :: text
FROM
    esg_scores;

-- Show ESG scores by industry
SELECT
    i.name as industry_name,
    COUNT(es.id) as evaluation_count,
    ROUND(AVG(es.overall_score), 2) as avg_overall_score,
    ROUND(AVG(es.environmental_score), 2) as avg_env_score,
    ROUND(AVG(es.social_score), 2) as avg_social_score,
    ROUND(AVG(es.governance_score), 2) as avg_gov_score,
    COUNT(
        CASE
            WHEN es.is_verified THEN 1
        END
    ) as verified_count
FROM
    industries i
    JOIN companies c ON i.id = c.industry_id
    JOIN report_submissions rs ON c.id = rs.company_id
    JOIN ai_evaluations ae ON rs.id = ae.submission_id
    JOIN esg_scores es ON ae.id = es.id
GROUP BY
    i.id,
    i.name
ORDER BY
    avg_overall_score DESC;

-- Show sample AI evaluations with scores
SELECT
    c.name as company_name,
    i.name as industry_name,
    rs.title as report_title,
    rs.year,
    es.overall_score,
    es.environmental_score,
    es.social_score,
    es.governance_score,
    es.is_verified,
    ae.evaluated_at :: date as evaluation_date
FROM
    ai_evaluations ae
    JOIN report_submissions rs ON ae.submission_id = rs.id
    JOIN companies c ON rs.company_id = c.id
    JOIN industries i ON c.industry_id = i.id
    JOIN esg_scores es ON ae.id = es.id
ORDER BY
    es.overall_score DESC
LIMIT
    15;

-- Verify all metrics are within bounds
SELECT
    'Metrics Validation' as check_type,
    COUNT(*) as total_records,
    COUNT(
        CASE
            WHEN env_climate_action > 100
            OR env_climate_action < 0 THEN 1
        END
    ) as invalid_climate_action,
    COUNT(
        CASE
            WHEN env_water_stewardship > 100
            OR env_water_stewardship < 0 THEN 1
        END
    ) as invalid_water_stewardship,
    COUNT(
        CASE
            WHEN social_diversity_inclusion > 100
            OR social_diversity_inclusion < 0 THEN 1
        END
    ) as invalid_diversity,
    COUNT(
        CASE
            WHEN gov_cybersecurity_data > 100
            OR gov_cybersecurity_data < 0 THEN 1
        END
    ) as invalid_cybersecurity
FROM
    evaluation_metrics;