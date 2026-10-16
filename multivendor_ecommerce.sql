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

-- display all vendors--subscription plan name and price
SELECT
    v.business_name,
    v.contact_person,
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
INSERT INTO users (id, is_active, created_at, updated_at, username, email, password) VALUES
(1, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'rocky', 'rocky@gmail.com', 'hashed_pass_123'),
(2, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'oldcustomer', 'oldcustomer@gmail.com', 'hashed_pass_456'),
(3, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'tanaka', 'tanaka@gmail.com', 'hashed_pass_789');
-- USER PROFILE 


-- new added  
INSERT INTO users (id, is_active, created_at, updated_at, username, email, password) 
VALUES (5, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'karim', 'karim@gmail.com', 'pass123');
select * from users;
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
SELECT * from user_profile;
-- delete user from this email 
DELETE FROM users where email='oldcustomer@gmail.com';

-- add the new user_profile 

INSERT INTO user_profile (id, is_active, created_at, updated_at, user_id, first_name, last_name, phone_no, business_address) VALUES
(101, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, 'Alif Hossain', 'Rocky', '+819012345678', 'Osaka, Japan'),
(102, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2, 'John', 'Doe', '+818098765432', 'Tokyo, Japan'),
(103, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, 'Tanaka', 'Ken', '+817011223344', 'Kyoto, Japan');
DELETE FROM user_profile WHERE user_id=(select id FROM users WHERE email='oldcustomer@gmail.com');


INSERT INTO user_profile (id, is_active, created_at, updated_at, user_id, first_name, last_name, phone_no, business_address) 
VALUES (50, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 5, 'Karim', 'Uddin', '+81900000000', 'Tokyo, Japan');

CREATE TABLE Category(
    id INTEGER PRIMARY KEY,
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    title VARCHAR(100),
    description VARCHAR(255)
);
-- DELETE from Category where id=1;
INSERT INTO Category(id,is_active,created_at,updated_at,title,description)
VALUES
(1, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Electronics', 'Electronic devices and gadgets'),
(2, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Clothing', 'Men and Women apparel'),
(3, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Home Appliance', 'Home and kitchen appliances');
SELECT * FROM Category;
SELECT * FROM Product;

ALTER TABLE Product
ADD COLUMN stock INT DEFAULT 0;
ALTER TABLE 
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
-- DELETE from Product Where id IN(2,3,4,5);
SELECT * from Product;
INSERT INTO Product(
    id, 
    is_active, 
    created_at, 
    updated_at, 
    title, 
    price, 
    category_id
)VALUES
-- Electronics
(1, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Laptop', 75000.00,1),
(2, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Smartphone', 45000.00, 1),
(3, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Wireless Earbuds', 5500.00, 1),
(4, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Cotton Formal Shirt', 2500.00, 2),
(5, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Microwave Oven', 18000.00, 3);
-- Electronic-(1,2=id) 
-- Clothing (3)
-- Home Appliance (4)

-- to get value using Sub-query method  
select title,price,stock from Product WHERE category_id=(select id from Category where title='Electronics');

UPDATE Product 
SET stock=15
WHERE title='Laptop';
SELECT 
    c.title AS category_title,
    p.title AS product_title,
    c.description,
    p.price
FROM Category AS c
JOIN Product AS p 
    ON c.id = p.category_id;

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
        REFERENCES users(id)
);
SELECT * FROM "Order";

INSERT INTO "Order" (id, is_active, created_at, updated_at, ordered_by, order_date, total_amount, order_status) 
VALUES 
(1001, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 5, '2026-06-01', 12500.00, 'Processing'),
(1002, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 3, '2026-10-01', 75000.00, 'Delivered'),
(1004, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, '2026-10-14', 18000.00, 'Pending');

-- add another value


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

INSERT INTO order_items (order_id, product_id, quantity, unit_price) 
VALUES
(1001, 1, 1, 75000.00),
(1002, 5, 1, 18000.00),
(1002, 3, 2, 5500.00),
(1004, 2, 1, 45000.00);


select 
    o.id AS order_id,
    up.first_name,
    pr.title AS product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS total_price,
    o.created_at AS date,  
    o.total_amount,
    o.order_status AS status
from "Order" o
JOIN users u ON o.ordered_by=u.id
JOIN user_profile up ON u.id=up.user_id
JOIN order_items oi ON oi.order_id=o.id
JOIN Product pr ON o.ordered_by=pr.id
WHERE up.first_name='Karim' AND up.last_name='Uddin';


-- top 5 selling  

select 
    pr.id AS product_id,
    pr.title AS product_name,
    SUM(oi.quantity) AS total_quantity_sold
from order_items oi
JOIN Product pr 
ON oi.product_id=pr.id 
GROUP BY pr.id,pr.title
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- payment 
CREATE TABLE Payment(
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    user_id INTEGER,
    Pay
    is_active BOOLEAN,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    payment_date VARCHAR(50),
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    status VARCHAR(50),
CONSTRAINT fk_payment_order
    FOREIGN KEY (order_id) REFERENCES "Order"(id) ON DELETE CASCADE,
CONSTRAINT fk_user_id
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
select * from Payment;
INSERT INTO Payment (
    payment_id,
    order_id, 
    user_id, 
    is_active, 
    created_at, 
    updated_at, 
    payment_date, 
    payment_method, 
    amount, 
    status
) VALUES 
(501, 1001, 5, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-06-01', 'Credit Card', 12500.00, 'Paid'),
(502, 1002, 1, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-10-01', 'PayPal', 75000.00, 'Paid'),
(503, 1004, 3, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '2026-10-14', 'Cash on Delivery', 18000.00, 'Pending');

select 
    pr.amount as payment_amount,
    pr.payment_method as payment_method,
    pr.status as payment_status
from "Order" o 
join payment pr ON o.id=pr.order_id
WHERE id=1001

-- WHO BOUGHT MORE
-- SELECT
--     u.id AS user_id,
--     u.username AS user_name,
--     SUM(o.quantity*unit_price) AS top_buyer
-- from "Order" o
-- JOIN users u ON o.ordered_by=u.id
-- join user_profile up ON u.id=up.user_id
-- join order_items oi ON oi.order_id=o.id
-- join product pr ON o.ordered_by=
-- group by u.id,u.name 
-- ORDER BY top_buyer DESC
-- LIMIT 1;


