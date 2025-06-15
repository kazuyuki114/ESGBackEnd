-- Script to insert AI evaluations for CSV companies using exact CSV data
-- ESG Analytics Database - CSV AI Evaluations with Real Data
-- Begin transaction
BEGIN;

-- Create temporary table to store CSV data for processing
CREATE TEMP TABLE csv_esg_data (
    company_code VARCHAR(50),
    company_name VARCHAR(255),
    e_score DECIMAL(10, 2),
    s_score DECIMAL(10, 2),
    g_score DECIMAL(10, 2),
    env_climate_action DECIMAL(10, 2),
    env_energy_transition DECIMAL(10, 2),
    env_water_stewardship DECIMAL(10, 2),
    env_biodiversity_nature DECIMAL(10, 2),
    env_pollution_prevention DECIMAL(10, 2),
    env_circular_economy DECIMAL(10, 2),
    env_sustainable_practices DECIMAL(10, 2),
    social_diversity_inclusion DECIMAL(10, 2),
    social_workforce_development DECIMAL(10, 2),
    social_health_safety DECIMAL(10, 2),
    social_human_rights DECIMAL(10, 2),
    social_community_engagement DECIMAL(10, 2),
    social_customer_stakeholder DECIMAL(10, 2),
    social_financial_inclusion DECIMAL(10, 2),
    gov_corporate_governance DECIMAL(10, 2),
    gov_ethics_integrity DECIMAL(10, 2),
    gov_transparency_disclosure DECIMAL(10, 2),
    gov_risk_management DECIMAL(10, 2),
    gov_compliance_legal DECIMAL(10, 2),
    gov_stakeholder_relations DECIMAL(10, 2),
    gov_innovation_technology DECIMAL(10, 2),
    gov_cybersecurity_data DECIMAL(10, 2)
);

-- Insert CSV data
INSERT INTO
    csv_esg_data
VALUES
    (
        'ACB',
        'Ngân hàng Thương mại Cổ phần Á Châu',
        86.3,
        86.63,
        87.63,
        23.0,
        10.33,
        15.33,
        11.67,
        5.33,
        2.0,
        0.0,
        2.67,
        8.67,
        14.0,
        0.0,
        6.0,
        10.33,
        0.0,
        33.33,
        27.67,
        79.0,
        23.67,
        39.67,
        30.0,
        3.0,
        0.0
    ),
    (
        'BBC',
        'CTCP Bibica',
        69.35,
        68.3,
        69.7,
        2.0,
        0.5,
        15.0,
        11.0,
        1.5,
        4.5,
        0.0,
        0.0,
        5.0,
        11.0,
        0.0,
        3.5,
        7.5,
        0.0,
        54.0,
        42.0,
        100.0,
        6.0,
        35.5,
        44.0,
        20.5,
        0.0
    ),
    (
        'BIDV',
        'Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam',
        73.85,
        74.1,
        76.5,
        36.5,
        17.5,
        21.5,
        14.5,
        8.0,
        4.0,
        0.0,
        4.0,
        21.0,
        36.0,
        0.0,
        15.5,
        16.5,
        0.5,
        61.0,
        46.0,
        100.0,
        42.5,
        100.0,
        49.5,
        3.5,
        0.0
    ),
    (
        'CTR',
        'Tổng Công ty cổ phần Công trình Viettel',
        84.7,
        85.3,
        87.3,
        8.0,
        4.0,
        6.0,
        5.0,
        2.0,
        1.0,
        0.0,
        1.0,
        3.0,
        5.0,
        0.0,
        2.0,
        4.0,
        0.0,
        13.0,
        11.0,
        30.0,
        9.0,
        17.0,
        12.0,
        2.0,
        0.0
    ),
    (
        'DPM',
        'Tổng Công ty Phân bón và Hóa chất Dầu khí - CTCP',
        73.05,
        74.05,
        73.4,
        24.0,
        9.0,
        20.0,
        10.0,
        7.5,
        2.5,
        0.0,
        3.0,
        7.0,
        15.0,
        0.0,
        4.5,
        5.5,
        0.0,
        78.0,
        77.0,
        100.0,
        46.5,
        72.0,
        55.5,
        0.0,
        0.0
    ),
    (
        'FPT',
        'Công ty Cổ phần FPT',
        88.0,
        88.0,
        88.0,
        18.5,
        7.5,
        12.0,
        10.0,
        4.5,
        2.0,
        0.0,
        2.0,
        6.5,
        11.0,
        0.0,
        4.5,
        7.5,
        0.0,
        22.0,
        18.5,
        51.5,
        15.5,
        25.5,
        18.5,
        3.5,
        0.0
    ),
    (
        'GCF',
        'CTCP Thực phẩm G.C',
        86.6,
        88.0,
        87.3,
        20.0,
        9.0,
        13.0,
        10.0,
        5.0,
        2.0,
        0.0,
        2.0,
        8.0,
        13.0,
        0.0,
        5.0,
        9.0,
        0.0,
        25.0,
        21.0,
        59.0,
        17.0,
        29.0,
        21.0,
        2.0,
        0.0
    ),
    (
        'HSG',
        'CTCP Tập đoàn Hoa Sen',
        71.5,
        72.1,
        75.0,
        17.0,
        9.0,
        13.0,
        21.0,
        7.0,
        3.0,
        0.0,
        3.0,
        8.0,
        10.0,
        0.0,
        5.0,
        5.0,
        0.0,
        73.0,
        59.0,
        100.0,
        61.0,
        87.0,
        54.0,
        1.0,
        0.0
    ),
    (
        'Home-Credit',
        'Home-Credit',
        80.3,
        78.2,
        86.6,
        12.0,
        5.0,
        8.0,
        6.0,
        2.0,
        1.0,
        0.0,
        1.0,
        4.0,
        6.0,
        0.0,
        2.0,
        4.0,
        0.0,
        16.0,
        14.0,
        39.0,
        12.0,
        20.0,
        15.0,
        2.0,
        0.0
    ),
    (
        'Miza',
        'Miza',
        77.9,
        85.3,
        85.3,
        4.0,
        2.0,
        3.0,
        2.0,
        1.0,
        0.0,
        0.0,
        1.0,
        2.0,
        3.0,
        0.0,
        1.0,
        2.0,
        0.0,
        6.0,
        6.0,
        15.0,
        4.0,
        7.0,
        5.0,
        1.0,
        0.0
    ),
    (
        'NVL',
        'CTCP Tập đoàn Đầu tư Địa ốc No Va',
        88.0,
        88.0,
        88.0,
        15.5,
        7.0,
        10.5,
        8.0,
        3.5,
        1.5,
        0.0,
        1.5,
        5.0,
        8.0,
        0.0,
        2.5,
        5.5,
        0.0,
        18.5,
        16.0,
        43.5,
        13.0,
        22.0,
        16.0,
        2.5,
        0.0
    ),
    (
        'PAN',
        'CTCP Tập đoàn PAN',
        57.58,
        59.28,
        64.35,
        6.5,
        2.75,
        3.75,
        2.5,
        0.5,
        0.75,
        0.0,
        0.0,
        1.75,
        2.75,
        0.0,
        0.75,
        1.5,
        0.0,
        9.25,
        7.5,
        22.0,
        5.5,
        10.25,
        7.5,
        0.5,
        0.0
    ),
    (
        'PLX',
        'Tập đoàn Xăng Dầu Việt Nam',
        89.0,
        87.95,
        90.7,
        21.0,
        8.5,
        13.0,
        10.5,
        5.0,
        2.5,
        0.0,
        2.0,
        6.5,
        10.5,
        0.0,
        4.0,
        7.0,
        0.0,
        25.5,
        21.5,
        59.5,
        18.5,
        31.0,
        22.5,
        3.5,
        0.0
    ),
    (
        'PNJ',
        'Công ty Cổ phần Vàng bạc Đá quý Phú Nhuận',
        76.17,
        77.5,
        86.45,
        12.17,
        5.0,
        8.5,
        5.83,
        2.83,
        1.67,
        0.0,
        1.5,
        4.67,
        6.83,
        0.0,
        2.5,
        5.0,
        0.0,
        16.33,
        13.5,
        37.67,
        11.33,
        18.83,
        13.83,
        2.0,
        0.0
    ),
    (
        'PVN',
        'Petrovietnam – Tập đoàn Dầu khí Việt Nam',
        74.9,
        72.85,
        78.05,
        23.0,
        9.0,
        15.0,
        11.0,
        4.5,
        2.5,
        0.0,
        2.0,
        7.5,
        12.5,
        0.0,
        4.0,
        7.0,
        0.0,
        29.0,
        23.5,
        67.0,
        20.5,
        34.5,
        25.5,
        3.0,
        0.0
    ),
    (
        'SAB',
        'Sabeco – Tổng công ty Bia – Rượu – Nước giải khát Sài Gòn',
        75.5,
        77.4,
        76.55,
        21.25,
        10.0,
        16.0,
        14.5,
        4.25,
        1.25,
        0.0,
        2.25,
        9.75,
        16.75,
        0.0,
        5.5,
        8.5,
        0.0,
        61.75,
        53.25,
        100.0,
        40.0,
        65.5,
        47.0,
        1.0,
        0.0
    ),
    (
        'SCB',
        'Ngân hàng Thương mại Cổ phần Sài Gòn',
        72.4,
        73.5,
        68.6,
        31.0,
        10.0,
        19.0,
        14.0,
        7.0,
        2.0,
        0.0,
        5.0,
        17.0,
        24.0,
        0.0,
        8.0,
        8.0,
        0.0,
        84.0,
        72.0,
        100.0,
        49.0,
        78.0,
        61.0,
        0.0,
        0.0
    ),
    (
        'TCB',
        'Techcombank – Ngân hàng TMCP Kỹ Thương Việt Nam',
        88.0,
        88.0,
        87.6,
        17.0,
        7.0,
        11.0,
        8.0,
        4.0,
        2.0,
        0.0,
        2.0,
        6.0,
        9.0,
        0.0,
        3.0,
        6.0,
        0.0,
        20.0,
        17.0,
        46.0,
        14.0,
        23.0,
        17.0,
        3.0,
        0.0
    ),
    (
        'TCM',
        'CTCP Dệt may - Đầu tư - Thương mại Thành Công',
        70.8,
        57.3,
        69.3,
        25.0,
        7.0,
        11.0,
        13.0,
        8.0,
        0.0,
        0.0,
        1.0,
        4.0,
        5.0,
        0.0,
        2.0,
        1.0,
        0.0,
        52.0,
        37.0,
        93.0,
        24.0,
        45.0,
        35.0,
        0.0,
        0.0
    ),
    (
        'TRA',
        'CTCP Traphaco',
        79.25,
        81.1,
        80.4,
        20.0,
        8.5,
        14.5,
        12.0,
        4.5,
        1.5,
        0.0,
        2.5,
        8.5,
        14.5,
        0.0,
        5.0,
        8.0,
        0.0,
        48.0,
        42.0,
        100.0,
        32.0,
        52.0,
        37.0,
        2.0,
        0.0
    ),
    (
        'VNM',
        'Công ty Cổ phần Sữa Việt Nam (Vinamilk)',
        83.95,
        79.28,
        86.35,
        28.5,
        11.25,
        18.25,
        13.0,
        6.25,
        3.0,
        0.0,
        2.75,
        10.0,
        16.0,
        0.0,
        6.0,
        12.0,
        0.0,
        41.25,
        33.75,
        95.25,
        30.0,
        49.0,
        36.75,
        4.25,
        0.0
    ),
    (
        'VinGroup',
        'Tập đoàn Vingroup – Công ty Cổ phần',
        72.6,
        70.7,
        72.7,
        38.0,
        17.0,
        28.0,
        23.0,
        11.0,
        5.0,
        0.0,
        6.0,
        17.0,
        30.0,
        0.0,
        8.0,
        9.0,
        0.0,
        100.0,
        100.0,
        100.0,
        80.0,
        100.0,
        98.0,
        0.0,
        0.0
    );

-- Create mapping table for company codes to slugs
CREATE TEMP TABLE company_slug_mapping AS
SELECT
    ced.company_code,
    CASE
        WHEN ced.company_code = 'ACB' THEN 'acb'
        WHEN ced.company_code = 'BBC' THEN 'bibica'
        WHEN ced.company_code = 'BIDV' THEN 'bidv'
        WHEN ced.company_code = 'CTR' THEN 'viettel-construction'
        WHEN ced.company_code = 'DPM' THEN 'petrovietnam-fertilizer'
        WHEN ced.company_code = 'FPT' THEN 'fpt'
        WHEN ced.company_code = 'GCF' THEN 'gcf'
        WHEN ced.company_code = 'HSG' THEN 'hoa-sen-group'
        WHEN ced.company_code = 'Home-Credit' THEN 'home-credit-vietnam'
        WHEN ced.company_code = 'Miza' THEN 'miza'
        WHEN ced.company_code = 'NVL' THEN 'novaland'
        WHEN ced.company_code = 'PAN' THEN 'pan-group'
        WHEN ced.company_code = 'PLX' THEN 'petrolimex'
        WHEN ced.company_code = 'PNJ' THEN 'pnj'
        WHEN ced.company_code = 'PVN' THEN 'petrovietnam'
        WHEN ced.company_code = 'SAB' THEN 'sabeco'
        WHEN ced.company_code = 'SCB' THEN 'scb'
        WHEN ced.company_code = 'TCB' THEN 'techcombank'
        WHEN ced.company_code = 'TCM' THEN 'thanh-cong-textile'
        WHEN ced.company_code = 'TRA' THEN 'traphaco'
        WHEN ced.company_code = 'VNM' THEN 'vinamilk'
        WHEN ced.company_code = 'VinGroup' THEN 'vingroup'
    END as slug
FROM
    csv_esg_data ced;

-- Insert AI evaluations using CSV data
INSERT INTO
    ai_evaluations (
        id,
        submission_id,
        recommendations,
        key_findings,
        evaluated_at
    )
SELECT
    rs.id,
    rs.id,
    CASE
        WHEN ced.company_code IN ('ACB', 'BIDV', 'SCB', 'TCB') THEN 'Focus on expanding green finance products and digital banking solutions. Strengthen climate risk assessment frameworks and enhance ESG integration in lending decisions.'
        WHEN ced.company_code IN ('BBC', 'GCF', 'VNM') THEN 'Improve supply chain sustainability and food safety protocols. Enhance water stewardship and reduce packaging waste through circular economy initiatives.'
        WHEN ced.company_code = 'FPT' THEN 'Leverage technology for ESG solutions and expand digital inclusion programs. Focus on cybersecurity and data privacy while promoting sustainable IT practices.'
        WHEN ced.company_code IN ('PLX', 'PVN') THEN 'Accelerate energy transition planning and invest in renewable energy projects. Strengthen environmental monitoring and community engagement in operational areas.'
        WHEN ced.company_code = 'DPM' THEN 'Enhance chemical safety protocols and environmental impact mitigation. Develop sustainable fertilizer products and improve waste management systems.'
        WHEN ced.company_code = 'HSG' THEN 'Implement cleaner production technologies and improve energy efficiency. Strengthen worker safety programs and environmental compliance monitoring.'
        WHEN ced.company_code IN ('Home-Credit', 'Miza') THEN 'Expand financial inclusion programs and responsible lending practices. Enhance digital financial literacy and customer protection measures.'
        WHEN ced.company_code IN ('NVL', 'VinGroup') THEN 'Integrate green building standards and sustainable urban development practices. Focus on smart city solutions and community development programs.'
        ELSE 'Continue ESG improvement initiatives and stakeholder engagement programs.'
    END,
    CASE
        WHEN ced.e_score > 85 THEN 'Strong environmental performance with effective climate action and resource management initiatives.'
        WHEN ced.e_score > 75 THEN 'Good environmental practices with opportunities for improvement in energy efficiency and waste reduction.'
        WHEN ced.e_score > 65 THEN 'Moderate environmental performance requiring enhanced sustainability strategies and monitoring systems.'
        ELSE 'Environmental performance needs significant improvement across multiple sustainability dimensions.'
    END || ' ' || CASE
        WHEN ced.s_score > 85 THEN 'Excellent social impact with strong workforce development and community engagement programs.'
        WHEN ced.s_score > 75 THEN 'Good social performance with effective diversity and inclusion initiatives.'
        WHEN ced.s_score > 65 THEN 'Adequate social practices with room for improvement in stakeholder relations and worker welfare.'
        ELSE 'Social performance requires enhancement in multiple areas including workforce development and community relations.'
    END || ' ' || CASE
        WHEN ced.g_score > 85 THEN 'Strong governance framework with excellent transparency and risk management practices.'
        WHEN ced.g_score > 75 THEN 'Good governance standards with effective compliance and stakeholder relations.'
        WHEN ced.g_score > 65 THEN 'Adequate governance practices with opportunities for improvement in transparency and ethics.'
        ELSE 'Governance framework needs strengthening across multiple dimensions including compliance and risk management.'
    END,
    NOW() - INTERVAL '30 days' + (RANDOM() * INTERVAL '25 days')
FROM
    report_submissions rs
    JOIN companies c ON rs.company_id = c.id
    JOIN company_slug_mapping csm ON c.slug = csm.slug
    JOIN csv_esg_data ced ON csm.company_code = ced.company_code;

-- Insert ESG scores using exact CSV data
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
    ROUND(
        (
            ced.e_score * 0.35 + ced.s_score * 0.35 + ced.g_score * 0.30
        ),
        2
    ) as overall_score,
    ced.e_score,
    ced.s_score,
    ced.g_score,
    CASE
        WHEN RANDOM() > 0.3 THEN true
        ELSE false
    END,
    CASE
        WHEN RANDOM() > 0.7 THEN 'Vietnam ESG Council'
        WHEN RANDOM() > 0.4 THEN 'State Securities Commission'
        ELSE 'Independent ESG Auditor'
    END,
    CASE
        WHEN RANDOM() > 0.3 THEN NOW() - INTERVAL '15 days' + (RANDOM() * INTERVAL '10 days')
        ELSE NULL
    END
FROM
    ai_evaluations ae
    JOIN report_submissions rs ON ae.submission_id = rs.id
    JOIN companies c ON rs.company_id = c.id
    JOIN company_slug_mapping csm ON c.slug = csm.slug
    JOIN csv_esg_data ced ON csm.company_code = ced.company_code;

-- Insert evaluation metrics using exact CSV data
INSERT INTO
    evaluation_metrics (
        id,
        env_climate_action,
        env_energy_transition,
        env_water_stewardship,
        env_biodiversity_nature,
        env_pollution_prevention,
        env_circular_economy,
        env_sustainable_practices,
        social_diversity_inclusion,
        social_workforce_development,
        social_health_safety,
        social_human_rights,
        social_community_engagement,
        social_customer_stakeholder,
        social_financial_inclusion,
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
    LEAST(100, ced.env_climate_action),
    LEAST(100, ced.env_energy_transition),
    LEAST(100, ced.env_water_stewardship),
    LEAST(100, ced.env_biodiversity_nature),
    LEAST(100, ced.env_pollution_prevention),
    LEAST(100, ced.env_circular_economy),
    LEAST(100, ced.env_sustainable_practices),
    LEAST(100, ced.social_diversity_inclusion),
    LEAST(100, ced.social_workforce_development),
    LEAST(100, ced.social_health_safety),
    LEAST(100, ced.social_human_rights),
    LEAST(100, ced.social_community_engagement),
    LEAST(100, ced.social_customer_stakeholder),
    LEAST(100, ced.social_financial_inclusion),
    LEAST(100, ced.gov_corporate_governance),
    LEAST(100, ced.gov_ethics_integrity),
    LEAST(100, ced.gov_transparency_disclosure),
    LEAST(100, ced.gov_risk_management),
    LEAST(100, ced.gov_compliance_legal),
    LEAST(100, ced.gov_stakeholder_relations),
    LEAST(100, ced.gov_innovation_technology),
    LEAST(100, ced.gov_cybersecurity_data)
FROM
    ai_evaluations ae
    JOIN report_submissions rs ON ae.submission_id = rs.id
    JOIN companies c ON rs.company_id = c.id
    JOIN company_slug_mapping csm ON c.slug = csm.slug
    JOIN csv_esg_data ced ON csm.company_code = ced.company_code;

-- Clean up temporary tables
DROP TABLE csv_esg_data;

DROP TABLE company_slug_mapping;

-- Commit transaction
COMMIT;

-- Verification query
SELECT
    c.name as company_name,
    rs.title,
    es.overall_score,
    es.environmental_score,
    es.social_score,
    es.governance_score,
    es.is_verified,
    es.verified_by,
    ae.evaluated_at
FROM
    companies c
    JOIN report_submissions rs ON c.id = rs.company_id
    JOIN ai_evaluations ae ON rs.id = ae.submission_id
    JOIN esg_scores es ON ae.id = es.id
WHERE
    c.slug IN (
        'acb',
        'bibica',
        'bidv',
        'viettel-construction',
        'petrovietnam-fertilizer',
        'fpt',
        'gcf',
        'hoa-sen-group',
        'home-credit-vietnam',
        'miza',
        'novaland',
        'pan-group',
        'petrolimex',
        'pnj',
        'petrovietnam',
        'sabeco',
        'scb',
        'techcombank',
        'thanh-cong-textile',
        'traphaco',
        'vinamilk',
        'vingroup'
    )
ORDER BY
    es.overall_score DESC;