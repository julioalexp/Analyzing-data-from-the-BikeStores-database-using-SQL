-- 1. Which customer has generated the highest sales in terms of revenue?
SELECT TOP 1 
    sales.customers.first_name, 
    SUM(sales.order_items.quantity * sales.order_items.list_price - sales.order_items.list_price * sales.order_items.discount) AS total_sales
FROM 
    sales.orders
INNER JOIN 
    sales.order_items ON sales.orders.order_id = sales.order_items.order_id
INNER JOIN 
    sales.customers ON sales.orders.customer_id = sales.customers.customer_id
GROUP BY 
    sales.customers.first_name
ORDER BY 
    total_sales DESC;

-- 2. Update staff details for the New York branch:
-- Deactivate Jannette David and update manager assignments
UPDATE [sales].[staffs]
SET 
    active = 0, 
    manager_id = (SELECT staff_id FROM [sales].[staffs] WHERE email = 'fabiola.jackson@bikes.shop')
WHERE 
    email = 'jannette.david@bikes.shop' 
    AND store_id = (SELECT store_id FROM [sales].[stores] WHERE store_name = 'New York');

UPDATE [sales].[staffs]
SET 
    manager_id = (SELECT staff_id FROM [sales].[staffs] WHERE email = 'venita.daniel@bikes.shop')
WHERE 
    manager_id = (SELECT staff_id FROM [sales].[staffs] WHERE email = 'jannette.david@bikes.shop');

-- 3. Remove Heller from the supplier list
DELETE FROM [production].[brands]
WHERE brand_name = 'Heller';

-- 4. What is the most expensive bike in inventory?
SELECT TOP 1 
    product_name, 
    list_price
FROM 
    [production].[products]
ORDER BY 
    list_price DESC;

-- 5. How many employees does the company have per branch?
SELECT 
    sales.stores.store_name, 
    COUNT(*) AS total_employees
FROM 
    [sales].[staffs]
LEFT JOIN 
    [sales].[stores] ON [sales].[staffs].store_id = [sales].[stores].store_id
GROUP BY 
    sales.stores.store_name;
