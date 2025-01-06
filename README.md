# BikeStores Data Analysis Using SQL  
![Logo](https://github.com/julioalexp/Analyzing-data-from-the-BikeStores-database-using-SQL/blob/main/bikestore.jpg)

## Objectives


1. Identify Key Revenue Drivers: Analyze which customers, products, and categories generate the highest revenue.

2. Customer Insights: Explore customer purchasing behavior by analyzing order frequencies and the top customers by number of orders.

3. Store Performance: Examine the sales performance of different stores to identify the most profitable locations.
4. Inventory Management: Assess inventory levels to identify products that are low in stock and determine the total inventory value across stores.
5. Supplier Relationships: Analyze the product offerings from suppliers to understand which suppliers provide the most products.

## Business Problems
* Revenue Maximization: Understanding which customers, products, and stores contribute most to the revenue helps allocate marketing and sales efforts more effectively.

* Inventory Optimization: By analyzing stock levels, we can reduce the risk of overstocking or understocking, ensuring that customer demands are met without over-investing in inventory.

* Customer Retention: Identifying top customers helps tailor marketing strategies, loyalty programs, and promotions to retain high-value customers.

* Sales Strategy: By analyzing store and product performance, we can optimize product offerings, pricing strategies, and store-level promotions.

## Dataset

The dataset can be found at Kaggle.

Link. [BikeStore Dataset](https://www.kaggle.com/datasets/mohamedzrirak/sql-bkestores)

## Business Problems and Solutions
1. Which customer has generated the highest sales in terms of revenue?
Top ccustomers by revenue:
```sql
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
```
Query Output

| first_name | total_sales |
|------------|-------------|
| Sharyn     | 39900.3893  |
