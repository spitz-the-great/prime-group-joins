
-- Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses"
ON "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items.
SELECT * FROM "orders"
JOIN "line_items" 
ON "orders"."id" = "line_items"."order_id";

-- Which warehouses have cheetos?

SELECT "warehouse"."warehouse" FROM "warehouse" JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id" WHERE "warehouse_product"."product_id" = 5;


-- Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse" 
FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id" 
WHERE "warehouse_product"."product_id" = 6;

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT COUNT("orders"."id"), "customers"  
FROM "orders" 
JOIN "addresses" ON "orders"."address_id" = "addresses"."id" 
JOIN "customers" ON "customers"."id" = "addresses"."customer_id" 
GROUP BY "customers";


-- How many customers do we have?
SELECT COUNT(*)
FROM "customers";


-- How many products do we carry?
SELECT COUNT(*)
FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") 
FROM "warehouse_product" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."id" = 6;

-- (Stretch) How much was the total cost for each order?

-- (Stretch) How much has each customer spent in total?
-- (Stretch) How much has each customer spent in total? 
-- Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).