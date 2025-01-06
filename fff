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

-- 2. Currently, Jannette David from the New York branch is no longer with the company. Therefore, we need to deactivate her, and in her place, Venita Daniel—who previously reported to Jannette—should now report to Fabiola Jackson.  

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

-- 3. Last month, we ended our business relationship with Heller Bikes, so we are going to remove them from our supplier list.  

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

-- 6. Which customer has generated the highest sales in terms of revenue?  

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

-- 7. Which product category generates the highest revenue?

SELECT 
    production.categories.category_name, 
    SUM(sales.order_items.quantity * sales.order_items.list_price - sales.order_items.list_price * sales.order_items.discount) AS total_revenue
FROM 
    sales.order_items
INNER JOIN 
    production.products ON sales.order_items.product_id = production.products.product_id
INNER JOIN 
    production.categories ON production.products.category_id = production.categories.category_id
GROUP BY 
    production.categories.category_name
ORDER BY 
    total_revenue DESC;

-- 7. Which product category generates the highest revenue?

SELECT 
    production.products.product_name, 
    AVG(sales.order_items.list_price - sales.order_items.list_price * sales.order_items.discount) AS average_sales_price
FROM 
    sales.order_items
INNER JOIN 
    production.products ON sales.order_items.product_id = production.products.product_id
GROUP BY 
    production.products.product_name
ORDER BY 
    average_sales_price DESC;

-- 8. What is the average sales price for each bike model?

SELECT 
    sales.stores.store_name, 
    SUM(sales.order_items.quantity * sales.order_items.list_price - sales.order_items.list_price * sales.order_items.discount) AS total_revenue
FROM 
    sales.orders
INNER JOIN 
    sales.order_items ON sales.orders.order_id = sales.order_items.order_id
INNER JOIN 
    sales.stores ON sales.orders.store_id = sales.stores.store_id
GROUP BY 
    sales.stores.store_name
ORDER BY 
    total_revenue DESC;

-- 10. How many products are currently low in stock (below 10 units)?

SELECT 
    production.products.product_name, 
    production.stocks.quantity
FROM 
    production.stocks
INNER JOIN 
    production.products ON production.stocks.product_id = production.products.product_id
WHERE 
    production.stocks.quantity < 10
ORDER BY 
    production.stocks.quantity ASC;

-- 11. Who are the top 5 customers by the number of orders placed?

SELECT TOP 5
    sales.customers.first_name, 
    sales.customers.last_name, 
    COUNT(sales.orders.order_id) AS total_orders
FROM 
    sales.orders
INNER JOIN 
    sales.customers ON sales.orders.customer_id = sales.customers.customer_id
GROUP BY 
    sales.customers.first_name, 
    sales.customers.last_name
ORDER BY 
    total_orders DESC;

-- 12. What is the total inventory value for each store?
SELECT 
    sales.stores.store_name, 
    SUM(production.stocks.quantity * production.products.list_price) AS total_inventory_value
FROM 
    production.stocks
INNER JOIN 
    production.products ON production.stocks.product_id = production.products.product_id
INNER JOIN 
    sales.stores ON production.stocks.store_id = sales.stores.store_id
GROUP BY 
    sales.stores.store_name
ORDER BY 
    total_inventory_value DESC;

-- 13. Which month has the highest sales revenue?

SELECT 
    DATEPART(YEAR, sales.orders.order_date) AS sales_year,
    DATEPART(MONTH, sales.orders.order_date) AS sales_month,
    SUM(sales.order_items.quantity * sales.order_items.list_price - sales.order_items.list_price * sales.order_items.discount) AS total_revenue
FROM 
    sales.orders
INNER JOIN 
    sales.order_items ON sales.orders.order_id = sales.order_items.order_id
GROUP BY 
    DATEPART(YEAR, sales.orders.order_date), 
    DATEPART(MONTH, sales.orders.order_date)
ORDER BY 
    total_revenue DESC;

-- 14. Which supplier provides the most products?
SELECT 
    production.brands.brand_name, 
    COUNT(production.products.product_id) AS total_products
FROM 
    production.products
INNER JOIN 
    production.brands ON production.products.brand_id = production.brands.brand_id
GROUP BY 
    production.brands.brand_name
ORDER BY 
    total_products DESC;
	
