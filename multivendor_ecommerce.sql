-- Active: 1791289434549@@127.0.0.1@5432@multivendor_saas
-- subscription_plan   
CREATE TABLE subscription_plan (
    id INTEGER PRIMARY KEY,
    subscription_name VARCHAR(50),
    price DECIMAL(10, 2),
    duration INTEGER,
    feature VARCHAR(100)
);
CREATE TABLE Vendor_Profile (
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    name VARCHAR(50),
    last_name VARCHAR(50),
    business_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone_no VARCHAR(20),
    business_address VARCHAR(255),
    subscription_plan INTEGER,
    CONSTRAINT fk_subscription 
        FOREIGN KEY (subscription_plan) 
        REFERENCES subscription_plan(id)
);
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