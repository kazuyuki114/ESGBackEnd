-- Script to insert report submissions for CSV companies
-- ESG Analytics Database - CSV Report Submissions
-- Begin transaction
BEGIN;

-- Insert report submissions for each CSV company
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
VALUES
    -- ACB - Banking
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'acb'
        ),
        'ACB ESG Annual Report 2023 - Sustainable Banking Initiatives',
        2023,
        'https://esg-reports.acb.com.vn/acb-esg-2023.pdf',
        8547200,
        'approved',
        '2024-03-15 09:30:00'
    ),
    -- Bibica - Food
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'bibica'
        ),
        'Bibica Sustainability Report 2023 - Food Safety & Environmental Impact',
        2023,
        'https://sustainability.bibica.com.vn/bibica-esg-2023.pdf',
        6234800,
        'approved',
        '2024-02-28 14:20:00'
    ),
    -- BIDV - Banking
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'bidv'
        ),
        'BIDV ESG Performance Report 2023 - Green Finance & Social Impact',
        2023,
        'https://esg.bidv.com.vn/bidv-sustainability-2023.pdf',
        12456700,
        'approved',
        '2024-03-20 11:45:00'
    ),
    -- Viettel Construction - Telecom
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'viettel-construction'
        ),
        'Viettel Construction ESG Report 2023 - Digital Infrastructure & Community Development',
        2023,
        'https://esg.viettel.com.vn/viettel-construction-esg-2023.pdf',
        9876500,
        'approved',
        '2024-03-10 16:15:00'
    ),
    -- PetroVietnam Fertilizer - Chemicals
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'petrovietnam-fertilizer'
        ),
        'PVFCCo ESG Report 2023 - Chemical Safety & Environmental Stewardship',
        2023,
        'https://esg.pvcfc.com.vn/pvcfc-sustainability-2023.pdf',
        15234600,
        'approved',
        '2024-02-15 10:30:00'
    ),
    -- FPT - Software
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'fpt'
        ),
        'FPT Digital Transformation & ESG Report 2023',
        2023,
        'https://esg.fpt.com.vn/fpt-esg-digital-2023.pdf',
        7890400,
        'approved',
        '2024-03-25 13:20:00'
    ),
    -- G.C Food - Food
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'gcf'
        ),
        'G.C Food ESG Report 2023 - Sustainable Food Production & Supply Chain',
        2023,
        'https://sustainability.gcfood.com.vn/gcf-esg-2023.pdf',
        5678900,
        'approved',
        '2024-02-20 15:45:00'
    ),
    -- Hoa Sen Group - Metals
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'hoa-sen-group'
        ),
        'Hoa Sen Group ESG Report 2023 - Steel Production & Environmental Management',
        2023,
        'https://esg.hoasen.com.vn/hsg-sustainability-2023.pdf',
        11234500,
        'approved',
        '2024-03-05 12:10:00'
    ),
    -- Home Credit - Investment Banking
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'home-credit-vietnam'
        ),
        'Home Credit Vietnam ESG Report 2023 - Financial Inclusion & Responsible Lending',
        2023,
        'https://esg.homecredit.vn/hc-vietnam-esg-2023.pdf',
        6789100,
        'approved',
        '2024-03-12 09:55:00'
    ),
    -- Miza - Investment Banking
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'miza'
        ),
        'Miza ESG Report 2023 - Fintech Innovation & Digital Financial Services',
        2023,
        'https://esg.miza.vn/miza-sustainability-2023.pdf',
        4567800,
        'approved',
        '2024-03-18 14:30:00'
    ),
    -- Novaland - Real Estate
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'novaland'
        ),
        'Novaland ESG Report 2023 - Sustainable Real Estate Development',
        2023,
        'https://esg.novaland.com.vn/nvl-sustainability-2023.pdf',
        13456700,
        'approved',
        '2024-02-25 11:20:00'
    ),
    -- PAN Group - Industrial Conglomerates
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'pan-group'
        ),
        'PAN Group ESG Report 2023 - Industrial Sustainability & Supply Chain Management',
        2023,
        'https://esg.pangroup.vn/pan-esg-2023.pdf',
        8901200,
        'approved',
        '2024-03-08 16:40:00'
    ),
    -- Petrolimex - Oil & Gas
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'petrolimex'
        ),
        'Petrolimex ESG Report 2023 - Energy Transition & Environmental Protection',
        2023,
        'https://esg.petrolimex.com.vn/plx-sustainability-2023.pdf',
        16789300,
        'approved',
        '2024-02-10 10:15:00'
    ),
    -- PNJ - Specialty Retail
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'pnj'
        ),
        'PNJ ESG Report 2023 - Responsible Sourcing & Retail Excellence',
        2023,
        'https://esg.pnj.com.vn/pnj-sustainability-2023.pdf',
        7234500,
        'approved',
        '2024-03-22 13:50:00'
    ),
    -- PetroVietnam - Oil & Gas
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'petrovietnam'
        ),
        'PetroVietnam ESG Report 2023 - National Energy Security & Environmental Responsibility',
        2023,
        'https://esg.pvn.vn/pvn-sustainability-2023.pdf',
        18456700,
        'approved',
        '2024-02-05 09:25:00'
    ),
    -- Sabeco - Beverages
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'sabeco'
        ),
        'Sabeco ESG Report 2023 - Responsible Consumption & Water Stewardship',
        2023,
        'https://esg.sabeco.com.vn/sab-sustainability-2023.pdf',
        9123400,
        'approved',
        '2024-03-01 15:10:00'
    ),
    -- SCB - Banking
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'scb'
        ),
        'Saigon Commercial Bank ESG Report 2023 - Digital Banking & Financial Inclusion',
        2023,
        'https://esg.scb.com.vn/scb-sustainability-2023.pdf',
        10567800,
        'approved',
        '2024-03-14 12:35:00'
    ),
    -- Techcombank - Banking
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'techcombank'
        ),
        'Techcombank ESG Report 2023 - Technology-Driven Sustainable Banking',
        2023,
        'https://esg.techcombank.com.vn/tcb-sustainability-2023.pdf',
        11890200,
        'approved',
        '2024-03-28 10:45:00'
    ),
    -- Thanh Cong Textile - Textiles
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'thanh-cong-textile'
        ),
        'Thanh Cong Textile ESG Report 2023 - Sustainable Fashion & Worker Welfare',
        2023,
        'https://esg.tcm.com.vn/tcm-sustainability-2023.pdf',
        6890100,
        'approved',
        '2024-02-18 14:55:00'
    ),
    -- Traphaco - Pharmaceuticals
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'traphaco'
        ),
        'Traphaco ESG Report 2023 - Healthcare Access & Pharmaceutical Innovation',
        2023,
        'https://esg.traphaco.com.vn/tra-sustainability-2023.pdf',
        8234600,
        'approved',
        '2024-03-06 11:30:00'
    ),
    -- Vinamilk - Food
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'vinamilk'
        ),
        'Vinamilk ESG Report 2023 - Dairy Sustainability & Nutrition Security',
        2023,
        'https://esg.vinamilk.com.vn/vnm-sustainability-2023.pdf',
        14567800,
        'approved',
        '2024-02-12 16:20:00'
    ),
    -- Vingroup - Investment Holdings
    (
        (
            SELECT
                id
            FROM
                companies
            WHERE
                slug = 'vingroup'
        ),
        'Vingroup ESG Report 2023 - Ecosystem Development & Smart City Solutions',
        2023,
        'https://esg.vingroup.net/vingroup-sustainability-2023.pdf',
        20123400,
        'approved',
        '2024-01-30 09:40:00'
    );

-- Commit transaction
COMMIT;

-- Verification query
SELECT
    c.name as company_name,
    rs.title,
    rs.year,
    rs.status,
    rs.submitted_at,
    ROUND(rs.file_size / 1024.0 / 1024.0, 2) as file_size_mb
FROM
    report_submissions rs
    JOIN companies c ON rs.company_id = c.id
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
    rs.submitted_at DESC;