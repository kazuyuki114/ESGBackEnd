-- Script to insert report submissions for all companies
-- ESG Analytics Database - Report Submissions Data Insertion
-- Run this script after companies have been inserted
-- Begin transaction to ensure atomicity
BEGIN;

-- Insert report submissions for Water and related utilities companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - ESG Sustainability Report ', 2023),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (15000000 - 2000000) + 2000000) AS BIGINT
    ),
    -- Random size between 2MB and 15MB
    CASE
        WHEN RANDOM() < 0.1 THEN 'pending_review'
        WHEN RANDOM() < 0.05 THEN 'rejected'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-03-01' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-03-01')
    )
FROM
    companies c
WHERE
    c.industry_id = 'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3';

-- Insert additional 2024 reports for some water companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - Annual ESG Report ', 2024),
    2024,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2024.pdf'
    ),
    CAST(
        (RANDOM() * (18000000 - 3000000) + 3000000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.2 THEN 'pending_review'
        WHEN RANDOM() < 0.1 THEN 'under_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2024-01-01' + (
        RANDOM() * (TIMESTAMP '2024-11-30' - TIMESTAMP '2024-01-01')
    )
FROM
    companies c
WHERE
    c.industry_id = 'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3'
    AND RANDOM() < 0.7;

-- 70% of companies submit 2024 reports
-- Insert report submissions for Banking services companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(
        c.name,
        ' - Environmental, Social & Governance Report ',
        2023
    ),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (25000000 - 5000000) + 5000000) AS BIGINT
    ),
    -- Larger files for banks
    CASE
        WHEN RANDOM() < 0.05 THEN 'pending_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-02-01' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-02-01')
    )
FROM
    companies c
WHERE
    c.industry_id = 'bd40c338-c09d-4588-8025-dbd3d2accd86';

-- Insert 2022 reports for banks (they have better reporting history)
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - ESG Performance Report ', 2022),
    2022,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2022.pdf'
    ),
    CAST(
        (RANDOM() * (20000000 - 4000000) + 4000000) AS BIGINT
    ),
    'approved',
    TIMESTAMP '2022-03-01' + (
        RANDOM() * (TIMESTAMP '2022-12-31' - TIMESTAMP '2022-03-01')
    )
FROM
    companies c
WHERE
    c.industry_id = 'bd40c338-c09d-4588-8025-dbd3d2accd86';

-- Insert 2024 reports for banks
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - Integrated ESG Report ', 2024),
    2024,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2024.pdf'
    ),
    CAST(
        (RANDOM() * (30000000 - 6000000) + 6000000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.15 THEN 'under_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2024-01-15' + (
        RANDOM() * (TIMESTAMP '2024-11-30' - TIMESTAMP '2024-01-15')
    )
FROM
    companies c
WHERE
    c.industry_id = 'bd40c338-c09d-4588-8025-dbd3d2accd86';

-- Insert report submissions for Software and IT services companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(
        c.name,
        ' - Digital Sustainability Report ',
        2023
    ),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (12000000 - 1500000) + 1500000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.15 THEN 'pending_review'
        WHEN RANDOM() < 0.05 THEN 'rejected'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-04-01' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-04-01')
    )
FROM
    companies c
WHERE
    c.industry_id = 'b15dc659-5700-41f4-95d7-3005e3cfbe3c';

-- Insert report submissions for Transport infrastructure companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - Infrastructure ESG Report ', 2023),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (20000000 - 3000000) + 3000000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.1 THEN 'pending_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-03-15' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-03-15')
    )
FROM
    companies c
WHERE
    c.industry_id = '6e377d3d-52c1-4843-8f41-5ccea7fea33f';

-- Insert report submissions for Food and tobacco companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - Food Safety & ESG Report ', 2023),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (16000000 - 2500000) + 2500000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.12 THEN 'pending_review'
        WHEN RANDOM() < 0.03 THEN 'rejected'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-02-15' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-02-15')
    )
FROM
    companies c
WHERE
    c.industry_id = 'f7908dbc-70a2-40fe-8a58-f97b74812eb4';

-- Insert report submissions for Beverages companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(
        c.name,
        ' - Sustainable Beverage Production Report ',
        2023
    ),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (14000000 - 2000000) + 2000000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.1 THEN 'pending_review'
        WHEN RANDOM() < 0.05 THEN 'under_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-03-01' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-03-01')
    )
FROM
    companies c
WHERE
    c.industry_id = '7d033a58-6006-4d11-a732-56d4f305dcbe';

-- Insert report submissions for Food and drug retailing companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(
        c.name,
        ' - Retail ESG & Community Impact Report ',
        2023
    ),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (13000000 - 1800000) + 1800000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.15 THEN 'pending_review'
        WHEN RANDOM() < 0.08 THEN 'under_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-04-01' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-04-01')
    )
FROM
    companies c
WHERE
    c.industry_id = 'bbc3a948-28e8-4e50-a570-159ad0a26c97';

-- Insert report submissions for Professional and commercial services companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(
        c.name,
        ' - Professional Services ESG Report ',
        2023
    ),
    2023,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2023.pdf'
    ),
    CAST(
        (RANDOM() * (11000000 - 1500000) + 1500000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.2 THEN 'pending_review'
        WHEN RANDOM() < 0.1 THEN 'under_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2023-05-01' + (
        RANDOM() * (TIMESTAMP '2023-12-31' - TIMESTAMP '2023-05-01')
    )
FROM
    companies c
WHERE
    c.industry_id = '41d35e2c-91e6-4135-8620-1f52635ba25c';

-- Insert some 2024 reports for major companies across all industries
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - Q3 ESG Progress Report ', 2024),
    2024,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_q3_2024.pdf'
    ),
    CAST(
        (RANDOM() * (8000000 - 1000000) + 1000000) AS BIGINT
    ),
    CASE
        WHEN RANDOM() < 0.3 THEN 'pending_review'
        WHEN RANDOM() < 0.15 THEN 'under_review'
        ELSE 'approved'
    END,
    TIMESTAMP '2024-08-01' + (
        RANDOM() * (TIMESTAMP '2024-11-30' - TIMESTAMP '2024-08-01')
    )
FROM
    companies c
WHERE
    RANDOM() < 0.4 -- 40% of all companies submit Q3 reports
    AND c.industry_id IN (
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        -- Banking
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        -- Food and tobacco
        '7d033a58-6006-4d11-a732-56d4f305dcbe' -- Beverages
    );

-- Insert some 2022 historical reports for established companies
INSERT INTO
    report_submissions (
        company_id,
        title,
        year,
        file_url,
        file_size,
        status,
        submitted_at
    )
SELECT
    c.id,
    CONCAT(c.name, ' - Annual ESG Report ', 2022),
    2022,
    CONCAT(
        'https://esg-reports.storage.com/',
        LOWER(REPLACE(c.slug, '-', '_')),
        '_esg_2022.pdf'
    ),
    CAST(
        (RANDOM() * (12000000 - 2000000) + 2000000) AS BIGINT
    ),
    'approved',
    -- All historical reports are approved
    TIMESTAMP '2022-02-01' + (
        RANDOM() * (TIMESTAMP '2022-12-31' - TIMESTAMP '2022-02-01')
    )
FROM
    companies c
WHERE
    c.name IN (
        'Vinamilk',
        'Sabeco',
        'Heineken Vietnam',
        'VinMart',
        'FPT Software',
        'Airports Corporation of Vietnam (ACV)',
        'Saigon Water Corp (SAWACO)',
        'Viettel Post',
        'Techcombank',
        'BIDV'
    );

-- Commit the transaction
COMMIT;

-- Verify the insertions with summary statistics
SELECT
    'Total Report Submissions' as metric,
    COUNT(*) as count
FROM
    report_submissions
UNION
ALL
SELECT
    'Reports by Status',
    NULL
UNION
ALL
SELECT
    CONCAT('  - ', status),
    COUNT(*)
FROM
    report_submissions
GROUP BY
    status
UNION
ALL
SELECT
    'Reports by Year',
    NULL
UNION
ALL
SELECT
    CONCAT('  - ', year),
    COUNT(*)
FROM
    report_submissions
GROUP BY
    year
ORDER BY
    metric,
    count DESC;

-- Show report submissions by industry
SELECT
    i.name as industry_name,
    i.code as industry_code,
    COUNT(rs.id) as report_count,
    COUNT(DISTINCT c.id) as companies_with_reports,
    ROUND(AVG(rs.file_size / 1024.0 / 1024.0), 2) as avg_file_size_mb
FROM
    industries i
    LEFT JOIN companies c ON i.id = c.industry_id
    LEFT JOIN report_submissions rs ON c.id = rs.company_id
GROUP BY
    i.id,
    i.name,
    i.code
HAVING
    COUNT(rs.id) > 0
ORDER BY
    report_count DESC;

-- Show sample report submissions
SELECT
    c.name as company_name,
    i.name as industry_name,
    rs.title,
    rs.year,
    rs.status,
    ROUND(rs.file_size / 1024.0 / 1024.0, 2) as file_size_mb,
    rs.submitted_at :: date as submitted_date
FROM
    report_submissions rs
    JOIN companies c ON rs.company_id = c.id
    JOIN industries i ON c.industry_id = i.id
ORDER BY
    rs.submitted_at DESC
LIMIT
    20;