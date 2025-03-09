LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_customers_dataset.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_geolocation_dataset.csv'
INTO TABLE geolocation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;




LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_order_items_dataset.csv'
INTO TABLE order_items
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_orders_dataset.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status, order_purchase_timestamp, 
 @order_approved_at, @order_delivered_carrier_date, @order_delivered_customer_date, order_estimated_delivery_date)
SET 
 order_approved_at = NULLIF(@order_approved_at, ''),
 order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
 order_delivered_customer_date = NULLIF(@order_delivered_customer_date, '');


LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_order_payments_dataset.csv'
INTO TABLE order_payments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'  -- Importante: Ajusta o delimitador para CRLF
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_products_dataset.csv'
INTO TABLE products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty, 
product_weight_g, product_length_cm, product_height_cm, product_width_cm)
SET product_name_length = NULLIF(product_name_length, ''),
    product_description_length = NULLIF(product_description_length, ''),
    product_photos_qty = NULLIF(product_photos_qty, ''),
    product_weight_g = NULLIF(product_weight_g, ''),
    product_length_cm = NULLIF(product_length_cm, ''),
    product_height_cm = NULLIF(product_height_cm, ''),
    product_width_cm = NULLIF(product_width_cm, '');
    
SELECT * FROM products
WHERE product_name_length = 0 
   OR product_description_length = 0 
   OR product_photos_qty = 0;


LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/olist_sellers_dataset.csv'
INTO TABLE sellers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/Edilton/OneDrive - Fundacao Getulio Vargas - FGV/Documentos/brazilian-ecommerce-analysis/data/product_category_name_translation.csv'
INTO TABLE category_translation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


