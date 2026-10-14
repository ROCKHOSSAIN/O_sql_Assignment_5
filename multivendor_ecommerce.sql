-- Active: 1791289434549@@127.0.0.1@5432@multivendor_saas
-- subscription_plan   
CREATE TABLE subscription_plan (
    id INTEGER PRIMARY KEY,
    subscription_name VARCHAR(50),
    price DECIMAL(10, 2),
    duration INTEGER,
    feature VARCHAR(100)
);
INSERT INTO subscription_plan(id,subscription_name,price,duration,feature)
VALUES
(1, 'Basic Plan', 9.99, 30, 'Access to basic features, Email support'),
(2, 'Standard Plan', 19.99, 30, 'Access to all standard features, Priority support'),
(3, 'Premium Plan', 49.99, 90, 'All features unlocked, 24/7 dedicated support, Free updates'),
(4, 'Enterprise Plan', 99.99, 365, 'Custom solutions, Dedicated account manager, Unlimited access');

select * from subscription_plan;

CREATE TABLE Vendor_Profile (
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    business_name VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone_no VARCHAR(20),
    business_address VARCHAR(255),
    subscription_plan INTEGER,
    CONSTRAINT fk_subscription 
        FOREIGN KEY (subscription_plan) 
        REFERENCES subscription_plan(id)
);
-- DELETE FROM Vendor_Profile;
-- DROP TABLE Vendor_Profile;
SELECT * FROM Vendor_Profile;

INSERT INTO Vendor_Profile (
    id,
    is_active,
    created_at,
    updated_at,
    business_name,
    contact_person,
    email,
    phone_no,
    business_address,
    subscription_plan
)
VALUES
(
    1,
    TRUE,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    'SmartTech Ltd.',
    'Rahim Khan',
    'rahim@smarttech.com',
    '017XXXXXXXX',
    'Dhaka, Bangladesh',
    1
),
(
    2,
    TRUE,
    '2026-01-10 10:00:00',
    '2026-01-10 10:00:00',
    'Alif Enterprise',
    'Alif Hossain',
    'rocky@smarttech.com',
    '+819012345678',
    'Osaka, Japan',
    2
),
(
    3,
    TRUE,
    '2026-02-15 14:30:00',
    '2026-02-20 09:15:00',
    'Tokyo Tech Solutions',
    'Tanaka Ken',
    'shankar@smarttech.com',
    '+818098765432',
    'Tokyo, Japan',
    4
),
(
    4,
    FALSE,
    '2026-03-01 11:20:00',
    '2026-04-05 16:45:00',
    'Kansai Foods',
    'Yamada Taro',
    'labib@smarttech.com',
    '+817011223344',
    'Kyoto, Japan',
    3
);

SELECT
    v.business_name,
    s.subscription_name,
    s.price
FROM Vendor_Profile AS v 
JOIN subscription_plan AS s 
ON v.subscription_plan=s.id

SELECT * FROM Vendor_Profile;

-- category  
-- Users 
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    username VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- USER PROFILE 

CREATE TABLE user_profile (
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    user_id INTEGER UNIQUE, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_no VARCHAR(20),
    business_address VARCHAR(255),
    CONSTRAINT fk_user_profile_user 
        FOREIGN KEY (user_id) 
        REFERENCES users(id)
);

CREATE TABLE Category(
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(100),
    description VARCHAR(255)
);

-- product
CREATE TABLE Product(
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INTEGER,
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES  Category(id)
);

-- order

CREATE TABLE "Order" (
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    ordered_by INTEGER,
    order_date VARCHAR(50),
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(50),
    CONSTRAINT fk_ordered_by 
        FOREIGN KEY (ordered_by) 
        REFERENCES user_Profile(id)
);
SELECT * FROM "Order";

CREATE TABLE order_items (
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_items_order 
        FOREIGN KEY (order_id) 
        REFERENCES "Order"(id),
    CONSTRAINT fk_order_items_product 
        FOREIGN KEY (product_id) 
        REFERENCES Product(id)
);
select * from order_items;