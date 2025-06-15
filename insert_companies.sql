-- Script to insert companies from ESG data
-- ESG Analytics Database - Company Data Insertion
-- Run this script after the database has been created and industries have been populated
-- Begin transaction to ensure atomicity
BEGIN;

-- Insert companies into the companies table
-- Water and related utilities companies
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
    (
        'Saigon Water Corp (SAWACO)',
        'saigon-water-corp-sawaco',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'contact@sawaco.com.vn',
        '+84-28-38221234',
        true,
        'active'
    ),
    (
        'Hanoi Water Ltd (H7O)',
        'hanoi-water-ltd-h7o',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'info@hanoiwater.com.vn',
        '+84-24-38221234',
        true,
        'active'
    ),
    (
        'Bien Hoa Water Supply JSC (BWE)',
        'bien-hoa-water-supply-jsc-bwe',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'contact@bwe.com.vn',
        '+84-251-3821234',
        true,
        'active'
    ),
    (
        'Da Nang Water Supply Company (DNW)',
        'da-nang-water-supply-company-dnw',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'info@danangwater.com.vn',
        '+84-236-3821234',
        true,
        'active'
    ),
    (
        'Hue Water Supply Co (HWS)',
        'hue-water-supply-co-hws',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'contact@huewater.com.vn',
        '+84-234-3821234',
        true,
        'active'
    ),
    (
        'Can Tho Water Supply JSC (CTW)',
        'can-tho-water-supply-jsc-ctw',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'info@canthowater.com.vn',
        '+84-292-3821234',
        true,
        'active'
    ),
    (
        'Vinh Long Water Supply Co',
        'vinh-long-water-supply-co',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'contact@vinhlongwater.com.vn',
        '+84-270-3821234',
        true,
        'active'
    ),
    (
        'Bac Ninh Water Supply Co',
        'bac-ninh-water-supply-co',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'info@bacninhwater.com.vn',
        '+84-222-3821234',
        true,
        'active'
    ),
    (
        'Long An Water Supply Co',
        'long-an-water-supply-co',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'contact@longanwater.com.vn',
        '+84-272-3821234',
        true,
        'active'
    ),
    (
        'Lam Dong Water Supply Co',
        'lam-dong-water-supply-co',
        'ce42a98c-9ce6-402b-a411-0c4b3d6f43f3',
        'info@lamdongwater.com.vn',
        '+84-263-3821234',
        true,
        'active'
    );

-- Banking services companies
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
    (
        'BIDV',
        'bidv',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'info@bidv.com.vn',
        '+84-24-39781234',
        true,
        'active'
    ),
    (
        'VietinBank',
        'vietinbank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'contact@vietinbank.vn',
        '+84-24-39771234',
        true,
        'active'
    ),
    (
        'Vietcombank',
        'vietcombank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'info@vietcombank.com.vn',
        '+84-24-39411234',
        true,
        'active'
    ),
    (
        'Agribank',
        'agribank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'contact@agribank.com.vn',
        '+84-24-39851234',
        true,
        'active'
    ),
    (
        'MBBank',
        'mbbank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'info@mbbank.com.vn',
        '+84-24-39261234',
        true,
        'active'
    ),
    (
        'Techcombank',
        'techcombank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'contact@techcombank.com.vn',
        '+84-24-35414567',
        true,
        'active'
    ),
    (
        'VPBank',
        'vpbank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'info@vpbank.com.vn',
        '+84-24-39441234',
        true,
        'active'
    ),
    (
        'ACB',
        'acb',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'contact@acb.com.vn',
        '+84-28-38247247',
        true,
        'active'
    ),
    (
        'Sacombank',
        'sacombank',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'info@sacombank.com.vn',
        '+84-28-39141414',
        true,
        'active'
    ),
    (
        'SHB',
        'shb',
        'bd40c338-c09d-4588-8025-dbd3d2accd86',
        'contact@shb.com.vn',
        '+84-24-38566868',
        true,
        'active'
    );

-- Software and IT services companies
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
    (
        'FPT Software',
        'fpt-software',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'info@fpt-software.com',
        '+84-24-37916565',
        true,
        'active'
    ),
    (
        'CMC Global',
        'cmc-global',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'contact@cmcglobal.com.vn',
        '+84-24-37156565',
        true,
        'active'
    ),
    (
        'NashTech Vietnam',
        'nashtech-vietnam',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'info@nashtechglobal.com',
        '+84-28-35210100',
        true,
        'active'
    ),
    (
        'KMS Technology',
        'kms-technology',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'contact@kms-technology.com',
        '+84-28-38489090',
        true,
        'active'
    ),
    (
        'Rikkeisoft',
        'rikkeisoft',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'info@rikkeisoft.com',
        '+84-24-37156565',
        true,
        'active'
    ),
    (
        'TMA Solutions',
        'tma-solutions',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'contact@tmasolutions.com',
        '+84-28-38489090',
        true,
        'active'
    ),
    (
        'Savvycom',
        'savvycom',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'info@savvycom.com',
        '+84-24-37156565',
        true,
        'active'
    ),
    (
        'GMO-Z.com RUNSYSTEM',
        'gmo-z-com-runsystem',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'contact@runsystem.net',
        '+84-28-35210100',
        true,
        'active'
    ),
    (
        'Appota',
        'appota',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'info@appota.com',
        '+84-24-37156565',
        true,
        'active'
    ),
    (
        'Global CyberSoft',
        'global-cybersoft',
        'b15dc659-5700-41f4-95d7-3005e3cfbe3c',
        'contact@cybersoft.edu.vn',
        '+84-28-38489090',
        true,
        'active'
    );

-- Transport infrastructure companies
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
    (
        'Airports Corporation of Vietnam (ACV)',
        'airports-corporation-of-vietnam-acv',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'info@acv.com.vn',
        '+84-24-38722222',
        true,
        'active'
    ),
    (
        'Vietnam Railways',
        'vietnam-railways',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'contact@vnr.vn',
        '+84-24-39421234',
        true,
        'active'
    ),
    (
        'Vietnam Maritime Corporation (VIMC)',
        'vietnam-maritime-corporation-vimc',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'info@vimc.com.vn',
        '+84-24-38253030',
        true,
        'active'
    ),
    (
        'CIENCO1 (Truong Son Bridge Construction)',
        'cienco1-truong-son-bridge-construction',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'contact@cienco1.com.vn',
        '+84-24-38254040',
        true,
        'active'
    ),
    (
        'CIENCO4',
        'cienco4',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'info@cienco4.com.vn',
        '+84-24-38255050',
        true,
        'active'
    ),
    (
        'Cienco6',
        'cienco6',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'contact@cienco6.com.vn',
        '+84-24-38256060',
        true,
        'active'
    ),
    (
        'Licogi 16',
        'licogi-16',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'info@licogi16.com.vn',
        '+84-24-38257070',
        true,
        'active'
    ),
    (
        'PMU18',
        'pmu18',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'contact@pmu18.com.vn',
        '+84-24-38258080',
        true,
        'active'
    ),
    (
        'VGC (Vietnam Construction & Import-Export)',
        'vgc-vietnam-construction-import-export',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'info@vgc.com.vn',
        '+84-24-38259090',
        true,
        'active'
    ),
    (
        'Fecon',
        'fecon',
        '6e377d3d-52c1-4843-8f41-5ccea7fea33f',
        'contact@fecon.com.vn',
        '+84-24-38250101',
        true,
        'active'
    );

-- Food and tobacco companies  
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
    (
        'Vinamilk',
        'vinamilk',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@vinamilk.com.vn',
        '+84-28-54155555',
        true,
        'active'
    ),
    (
        'Masanco',
        'masanco',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@masanco.com.vn',
        '+84-28-54156666',
        true,
        'active'
    ),
    (
        'TH Group',
        'th-group',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@thgroup.vn',
        '+84-24-39871111',
        true,
        'active'
    ),
    (
        'Kido Group',
        'kido-group',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@kido.com.vn',
        '+84-28-54157777',
        true,
        'active'
    ),
    (
        'Bibica',
        'bibica',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@bibica.com.vn',
        '+84-28-54158888',
        true,
        'active'
    ),
    (
        'Vissan',
        'vissan',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@vissan.com.vn',
        '+84-28-54159999',
        true,
        'active'
    ),
    (
        'Satra',
        'satra',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@satra.com.vn',
        '+84-28-54150000',
        true,
        'active'
    ),
    (
        'Acecook Vietnam',
        'acecook-vietnam',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@acecook.com.vn',
        '+84-28-54151111',
        true,
        'active'
    ),
    (
        'Orion Food Vina',
        'orion-food-vina',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@orionfoodvina.com',
        '+84-28-54152222',
        true,
        'active'
    ),
    (
        'Nestlé Vietnam',
        'nestle-vietnam',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@vn.nestle.com',
        '+84-28-54153333',
        true,
        'active'
    ),
    (
        'PepsiCo Vietnam',
        'pepsico-vietnam',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@pepsico.com.vn',
        '+84-28-54154444',
        true,
        'active'
    ),
    (
        'Suntory PepsiCo',
        'suntory-pepsico',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@suntory-pepsico.com.vn',
        '+84-28-54155555',
        true,
        'active'
    ),
    (
        'URC Vietnam',
        'urc-vietnam',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@urc.com.vn',
        '+84-28-54156666',
        true,
        'active'
    ),
    (
        'Ajinomoto Vietnam',
        'ajinomoto-vietnam',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@ajinomoto.com.vn',
        '+84-28-54157777',
        true,
        'active'
    ),
    (
        'Vietnam Tobacco Corporation (Vinataba)',
        'vietnam-tobacco-corporation-vinataba',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@vinataba.com.vn',
        '+84-24-39881234',
        true,
        'active'
    ),
    (
        'Hai Ha Confectionery',
        'hai-ha-confectionery',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@haiha.com.vn',
        '+84-28-54158888',
        true,
        'active'
    ),
    (
        'Hapro',
        'hapro',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@hapro.vn',
        '+84-24-39891234',
        true,
        'active'
    ),
    (
        'Quang Ngai Sugar',
        'quang-ngai-sugar',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@qns.com.vn',
        '+84-255-3821234',
        true,
        'active'
    ),
    (
        'Tan Hiep Phat',
        'tan-hiep-phat',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'info@thp.com.vn',
        '+84-28-54159999',
        true,
        'active'
    ),
    (
        'Uniben',
        'uniben',
        'f7908dbc-70a2-40fe-8a58-f97b74812eb4',
        'contact@uniben.com.vn',
        '+84-28-54150000',
        true,
        'active'
    );

-- Beverages companies
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
    (
        'Heineken Vietnam',
        'heineken-vietnam',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@heinekenvietnam.com',
        '+84-28-37221234',
        true,
        'active'
    ),
    (
        'Sabeco',
        'sabeco',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@sabeco.com.vn',
        '+84-28-35401234',
        true,
        'active'
    ),
    (
        'Suntory PepsiCo Vietnam',
        'suntory-pepsico-vietnam',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@suntory-pepsico.com.vn',
        '+84-28-37232345',
        true,
        'active'
    ),
    (
        'Nestlé Vietnam',
        'nestle-vietnam-beverages',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@nestle-vietnam.com',
        '+84-28-37243456',
        true,
        'active'
    ),
    (
        'Coca‑Cola Vietnam',
        'coca-cola-vietnam',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@coca-cola.com.vn',
        '+84-28-37254567',
        true,
        'active'
    ),
    (
        'URC Vietnam',
        'urc-vietnam-beverages',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@urc-beverages.com.vn',
        '+84-28-37265678',
        true,
        'active'
    ),
    (
        'Tan Hiep Phat',
        'tan-hiep-phat-beverages',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@thp-beverages.com.vn',
        '+84-28-37276789',
        true,
        'active'
    ),
    (
        'Habeco',
        'habeco',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@habeco.com.vn',
        '+84-24-39301234',
        true,
        'active'
    ),
    (
        'Carlsberg Vietnam',
        'carlsberg-vietnam',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@carlsberg.com.vn',
        '+84-28-37287890',
        true,
        'active'
    ),
    (
        'La Vie',
        'la-vie',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@lavie.com.vn',
        '+84-28-37298901',
        true,
        'active'
    ),
    (
        'Vinacafe Bien Hoa',
        'vinacafe-bien-hoa',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@vinacafe.com.vn',
        '+84-251-3891234',
        true,
        'active'
    ),
    (
        'Trung Nguyên',
        'trung-nguyen',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@trungnguyen.com.vn',
        '+84-24-39311234',
        true,
        'active'
    ),
    (
        'Huda Beer',
        'huda-beer',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@huda.com.vn',
        '+84-234-3891234',
        true,
        'active'
    ),
    (
        'Bena Beverage',
        'bena-beverage',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@bena.com.vn',
        '+84-28-37209012',
        true,
        'active'
    ),
    (
        'Nawon Beverage',
        'nawon-beverage',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@nawon.com.vn',
        '+84-28-37210123',
        true,
        'active'
    ),
    (
        'Tan Do Water',
        'tan-do-water',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@tandowater.com.vn',
        '+84-28-37221234',
        true,
        'active'
    ),
    (
        'Rita Drink',
        'rita-drink',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@ritadrink.com.vn',
        '+84-28-37232345',
        true,
        'active'
    ),
    (
        'NPV Beverage',
        'npv-beverage',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@npvbeverage.com.vn',
        '+84-28-37243456',
        true,
        'active'
    ),
    (
        'Dona Pacific',
        'dona-pacific',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@donapacific.com.vn',
        '+84-28-37254567',
        true,
        'active'
    ),
    (
        'Masan Consumer',
        'masan-consumer',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@masan.com.vn',
        '+84-28-37265678',
        true,
        'active'
    ),
    (
        'Quang Ngai Sugar',
        'quang-ngai-sugar-beverages',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@qns-beverages.com.vn',
        '+84-255-3832345',
        true,
        'active'
    ),
    (
        'Uniben',
        'uniben-beverages',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@uniben-beverages.com.vn',
        '+84-28-37276789',
        true,
        'active'
    ),
    (
        'Ajinomoto Vietnam',
        'ajinomoto-vietnam-beverages',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@ajinomoto-beverages.com.vn',
        '+84-28-37287890',
        true,
        'active'
    ),
    (
        'Wine‑Foods Union',
        'wine-foods-union',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@winefoods.com.vn',
        '+84-28-37298901',
        true,
        'active'
    ),
    (
        'Sanest Khanh Hoa',
        'sanest-khanh-hoa',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@sanest.com.vn',
        '+84-258-3891234',
        true,
        'active'
    ),
    (
        'Ha Long Beer',
        'ha-long-beer',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@halongbeer.com.vn',
        '+84-203-3891234',
        true,
        'active'
    ),
    (
        'Sapporo Vietnam',
        'sapporo-vietnam',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@sapporo.com.vn',
        '+84-28-37209012',
        true,
        'active'
    ),
    (
        'AB InBev Vietnam',
        'ab-inbev-vietnam',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'contact@ab-inbev.com.vn',
        '+84-28-37210123',
        true,
        'active'
    ),
    (
        'Huong Sen',
        'huong-sen',
        '7d033a58-6006-4d11-a732-56d4f305dcbe',
        'info@huongsen.com.vn',
        '+84-28-37221234',
        true,
        'active'
    );

-- Food and drug retailing companies
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
    (
        'VinMart',
        'vinmart',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@vinmart.com.vn',
        '+84-24-39881234',
        true,
        'active'
    ),
    (
        'Co.opmart',
        'coopmart',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@coopmart.com.vn',
        '+84-28-35401234',
        true,
        'active'
    ),
    (
        'Big C Vietnam',
        'big-c-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@bigc.vn',
        '+84-28-35412345',
        true,
        'active'
    ),
    (
        'Bach Hoa Xanh',
        'bach-hoa-xanh',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@bachhoaxanh.com',
        '+84-28-35423456',
        true,
        'active'
    ),
    (
        'Lotte Mart Vietnam',
        'lotte-mart-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@lottemart.com.vn',
        '+84-28-35434567',
        true,
        'active'
    ),
    (
        'AEON Vietnam',
        'aeon-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@aeon.com.vn',
        '+84-28-35445678',
        true,
        'active'
    ),
    (
        'Circle K Vietnam',
        'circle-k-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@circlek.com.vn',
        '+84-28-35456789',
        true,
        'active'
    ),
    (
        'FamilyMart Vietnam',
        'familymart-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@familymart.com.vn',
        '+84-28-35467890',
        true,
        'active'
    ),
    (
        'SatraMart',
        'satramart',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@satramart.com.vn',
        '+84-28-35478901',
        true,
        'active'
    ),
    (
        'Guardian Vietnam',
        'guardian-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@guardian.com.vn',
        '+84-28-35489012',
        true,
        'active'
    ),
    (
        'Pharmacity',
        'pharmacity',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@pharmacity.vn',
        '+84-28-35490123',
        true,
        'active'
    ),
    (
        'Long Chau Pharmacy',
        'long-chau-pharmacy',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@longchau.com.vn',
        '+84-28-35401234',
        true,
        'active'
    ),
    (
        'An Khang Pharmacy',
        'an-khang-pharmacy',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@ankhang.com.vn',
        '+84-28-35412345',
        true,
        'active'
    ),
    (
        'WinMart+',
        'winmart-plus',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@winmart.com.vn',
        '+84-28-35423456',
        true,
        'active'
    ),
    (
        'Mega Market Vietnam',
        'mega-market-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@megamarket.com.vn',
        '+84-28-35434567',
        true,
        'active'
    ),
    (
        'Cheers Vietnam',
        'cheers-vietnam',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@cheers.com.vn',
        '+84-28-35445678',
        true,
        'active'
    ),
    (
        'VinDS',
        'vinds',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@vinds.com.vn',
        '+84-28-35456789',
        true,
        'active'
    ),
    (
        'VinFa',
        'vinfa',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@vinfa.com.vn',
        '+84-28-35467890',
        true,
        'active'
    ),
    (
        'HNOSS Pharmacy',
        'hnoss-pharmacy',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'info@hnoss.com.vn',
        '+84-24-39892345',
        true,
        'active'
    ),
    (
        'Aeon Wellness',
        'aeon-wellness',
        'bbc3a948-28e8-4e50-a570-159ad0a26c97',
        'contact@aeonwellness.com.vn',
        '+84-28-35478901',
        true,
        'active'
    );

-- Professional and commercial services companies
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
    (
        'Saigon Newport Corporation',
        'saigon-newport-corporation',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'info@snp.com.vn',
        '+84-28-38217777',
        true,
        'active'
    ),
    (
        'Viettel Post',
        'viettel-post',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'contact@viettelpost.com.vn',
        '+84-24-39981234',
        true,
        'active'
    ),
    (
        'VNPost Logistics',
        'vnpost-logistics',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'info@vnpost.vn',
        '+84-24-38243030',
        true,
        'active'
    ),
    (
        'Viet A Corporation',
        'viet-a-corporation',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'contact@vieta.com.vn',
        '+84-24-39992345',
        true,
        'active'
    ),
    (
        'Nippon Express Vietnam',
        'nippon-express-vietnam',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'info@nipponexpress.com.vn',
        '+84-28-38229999',
        true,
        'active'
    ),
    (
        'Transimex',
        'transimex',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'contact@transimex.com.vn',
        '+84-28-38234040',
        true,
        'active'
    ),
    (
        'Gemadept Logistics',
        'gemadept-logistics',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'info@gemadept.com.vn',
        '+84-28-38245050',
        true,
        'active'
    ),
    (
        'ALS Cargo Terminal',
        'als-cargo-terminal',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'contact@als-cargo.com.vn',
        '+84-28-38256060',
        true,
        'active'
    ),
    (
        'ITL Corporation',
        'itl-corporation',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'info@itlcorp.com.vn',
        '+84-28-38267070',
        true,
        'active'
    ),
    (
        'Bee Logistics',
        'bee-logistics',
        '41d35e2c-91e6-4135-8620-1f52635ba25c',
        'contact@beelogistics.com.vn',
        '+84-28-38278080',
        true,
        'active'
    );

-- Commit the transaction
COMMIT;

-- Verify the insertion
SELECT
    c.name,
    c.slug,
    i.name as industry_name,
    i.code as industry_code,
    c.is_verified,
    c.status
FROM
    companies c
    JOIN industries i ON c.industry_id = i.id
ORDER BY
    i.name,
    c.name;

-- Count companies by industry
SELECT
    i.name as industry_name,
    i.code as industry_code,
    COUNT(c.id) as company_count
FROM
    industries i
    LEFT JOIN companies c ON i.id = c.industry_id
GROUP BY
    i.id,
    i.name,
    i.code
ORDER BY
    company_count DESC,
    i.name;