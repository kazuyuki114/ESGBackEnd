-- Script to insert companies from CSV data with proper industry mappings
-- ESG Analytics Database - CSV Companies Data Insertion
-- Begin transaction to ensure atomicity
BEGIN;

-- Insert companies from CSV data with proper industry classifications
INSERT INTO
    companies (
        name,
        slug,
        industry_id,
        email,
        phone,
        is_verified,
        status
    )
VALUES
    -- Banking Services Companies
    (
        'Ngân hàng Thương mại Cổ phần Á Châu',
        'acb',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'BANKSERV'
        ),
        'esg@acb.com.vn',
        '+84-28-38247247',
        true,
        'active'
    ),
    (
        'Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam',
        'bidv',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'BANKSERV'
        ),
        'esg@bidv.com.vn',
        '+84-24-39781234',
        true,
        'active'
    ),
    (
        'Ngân hàng Thương mại Cổ phần Sài Gòn',
        'scb',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'BANKSERV'
        ),
        'esg@scb.com.vn',
        '+84-28-39141414',
        true,
        'active'
    ),
    (
        'Techcombank – Ngân hàng TMCP Kỹ Thương Việt Nam',
        'techcombank',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'BANKSERV'
        ),
        'esg@techcombank.com.vn',
        '+84-24-35414567',
        true,
        'active'
    ),
    -- Food and Beverage Companies
    (
        'CTCP Bibica',
        'bibica',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'FOOD'
        ),
        'esg@bibica.com.vn',
        '+84-28-54158888',
        true,
        'active'
    ),
    (
        'Sabeco – Tổng công ty Bia – Rượu – Nước giải khát Sài Gòn',
        'sabeco',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'BEVG'
        ),
        'esg@sabeco.com.vn',
        '+84-28-35401234',
        true,
        'active'
    ),
    (
        'Công ty Cổ phần Sữa Việt Nam (Vinamilk)',
        'vinamilk',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'FOOD'
        ),
        'esg@vinamilk.com.vn',
        '+84-28-54155555',
        true,
        'active'
    ),
    (
        'CTCP Thực phẩm G.C',
        'gcf',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'FOOD'
        ),
        'esg@gcfood.com.vn',
        '+84-28-54167777',
        true,
        'active'
    ),
    -- Software and IT Services
    (
        'Công ty Cổ phần FPT',
        'fpt',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'SOFTWARE'
        ),
        'esg@fpt.com.vn',
        '+84-24-37916565',
        true,
        'active'
    ),
    -- Telecommunications and Technology
    (
        'Tổng Công ty cổ phần Công trình Viettel',
        'viettel-construction',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'TELECOM'
        ),
        'esg@viettel.com.vn',
        '+84-24-39981234',
        true,
        'active'
    ),
    -- Oil, Gas and Chemicals
    (
        'Tổng Công ty Phân bón và Hóa chất Dầu khí - CTCP',
        'petrovietnam-fertilizer',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'CHEM'
        ),
        'esg@pvcfc.com.vn',
        '+84-24-38253030',
        true,
        'active'
    ),
    (
        'Tập đoàn Xăng Dầu Việt Nam',
        'petrolimex',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'OILGAS'
        ),
        'esg@petrolimex.com.vn',
        '+84-24-38265656',
        true,
        'active'
    ),
    (
        'Petrovietnam – Tập đoàn Dầu khí Việt Nam',
        'petrovietnam',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'OILGAS'
        ),
        'esg@pvn.vn',
        '+84-24-38257979',
        true,
        'active'
    ),
    -- Metals and Manufacturing
    (
        'CTCP Tập đoàn Hoa Sen',
        'hoa-sen-group',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'METALS'
        ),
        'esg@hoasen.com.vn',
        '+84-28-39303456',
        true,
        'active'
    ),
    -- Financial Services (Non-Banking)
    (
        'Home-Credit',
        'home-credit-vietnam',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'INVBANK'
        ),
        'esg@homecredit.vn',
        '+84-24-39876543',
        true,
        'active'
    ),
    (
        'Miza',
        'miza',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'INVBANK'
        ),
        'esg@miza.vn',
        '+84-28-39654321',
        true,
        'active'
    ),
    -- Real Estate
    (
        'CTCP Tập đoàn Đầu tư Địa ốc No Va',
        'novaland',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'REALOP'
        ),
        'esg@novaland.com.vn',
        '+84-28-39123456',
        true,
        'active'
    ),
    (
        'Tập đoàn Vingroup – Công ty Cổ phần',
        'vingroup',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'INVHOLD'
        ),
        'esg@vingroup.net',
        '+84-24-39741234',
        true,
        'active'
    ),
    -- Industrial Conglomerates
    (
        'CTCP Tập đoàn PAN',
        'pan-group',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'INDCONG'
        ),
        'esg@pangroup.vn',
        '+84-28-39567890',
        true,
        'active'
    ),
    -- Retail and Consumer Goods
    (
        'Công ty Cổ phần Vàng bạc Đá quý Phú Nhuận',
        'pnj',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'SPECRET'
        ),
        'esg@pnj.com.vn',
        '+84-28-39321654',
        true,
        'active'
    ),
    -- Textiles and Apparel
    (
        'CTCP Dệt may - Đầu tư - Thương mại Thành Công',
        'thanh-cong-textile',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'TEXTILE'
        ),
        'esg@tcm.com.vn',
        '+84-28-39789012',
        true,
        'active'
    ),
    -- Pharmaceuticals
    (
        'CTCP Traphaco',
        'traphaco',
        (
            SELECT
                id
            FROM
                industries
            WHERE
                code = 'PHARMA'
        ),
        'esg@traphaco.com.vn',
        '+84-24-39456789',
        true,
        'active'
    );

-- Create company codes mapping for reference
CREATE TEMP TABLE csv_company_mapping (
    csv_code VARCHAR(50),
    company_name VARCHAR(255),
    database_slug VARCHAR(255)
);

INSERT INTO
    csv_company_mapping
VALUES
    (
        'ACB',
        'Ngân hàng Thương mại Cổ phần Á Châu',
        'acb'
    ),
    ('BBC', 'CTCP Bibica', 'bibica'),
    (
        'BIDV',
        'Ngân hàng Thương mại Cổ phần Đầu tư và Phát triển Việt Nam',
        'bidv'
    ),
    (
        'CTR',
        'Tổng Công ty cổ phần Công trình Viettel',
        'viettel-construction'
    ),
    (
        'DPM',
        'Tổng Công ty Phân bón và Hóa chất Dầu khí - CTCP',
        'petrovietnam-fertilizer'
    ),
    ('FPT', 'Công ty Cổ phần FPT', 'fpt'),
    ('GCF', 'CTCP Thực phẩm G.C', 'gcf'),
    ('HSG', 'CTCP Tập đoàn Hoa Sen', 'hoa-sen-group'),
    (
        'Home-Credit',
        'Home-Credit',
        'home-credit-vietnam'
    ),
    ('Miza', 'Miza', 'miza'),
    (
        'NVL',
        'CTCP Tập đoàn Đầu tư Địa ốc No Va',
        'novaland'
    ),
    ('PAN', 'CTCP Tập đoàn PAN', 'pan-group'),
    (
        'PLX',
        'Tập đoàn Xăng Dầu Việt Nam',
        'petrolimex'
    ),
    (
        'PNJ',
        'Công ty Cổ phần Vàng bạc Đá quý Phú Nhuận',
        'pnj'
    ),
    (
        'PVN',
        'Petrovietnam – Tập đoàn Dầu khí Việt Nam',
        'petrovietnam'
    ),
    (
        'SAB',
        'Sabeco – Tổng công ty Bia – Rượu – Nước giải khát Sài Gòn',
        'sabeco'
    ),
    (
        'SCB',
        'Ngân hàng Thương mại Cổ phần Sài Gòn',
        'scb'
    ),
    (
        'TCB',
        'Techcombank – Ngân hàng TMCP Kỹ Thương Việt Nam',
        'techcombank'
    ),
    (
        'TCM',
        'CTCP Dệt may - Đầu tư - Thương mại Thành Công',
        'thanh-cong-textile'
    ),
    ('TRA', 'CTCP Traphaco', 'traphaco'),
    (
        'VNM',
        'Công ty Cổ phần Sữa Việt Nam (Vinamilk)',
        'vinamilk'
    ),
    (
        'VinGroup',
        'Tập đoàn Vingroup – Công ty Cổ phần',
        'vingroup'
    );

-- Commit the transaction
COMMIT;

-- Verify the insertions and show company-industry mappings
SELECT
    ccm.csv_code,
    c.name as company_name,
    i.name as industry_name,
    i.code as industry_code,
    c.slug as database_slug,
    c.is_verified,
    c.status
FROM
    csv_company_mapping ccm
    JOIN companies c ON c.slug = ccm.database_slug
    JOIN industries i ON c.industry_id = i.id
ORDER BY
    ccm.csv_code;

-- Show company count by industry
SELECT
    i.name as industry_name,
    i.code as industry_code,
    COUNT(c.id) as company_count
FROM
    industries i
    JOIN companies c ON i.id = c.industry_id
WHERE
    c.slug IN (
        SELECT
            database_slug
        FROM
            csv_company_mapping
    )
GROUP BY
    i.id,
    i.name,
    i.code
ORDER BY
    company_count DESC,
    i.name;

-- Clean up temporary table
DROP TABLE csv_company_mapping;