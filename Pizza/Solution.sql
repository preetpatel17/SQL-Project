create database if not exists Pizzadb;
use pizzadb;
select * from pizza_sales;
-- 1. Total Revenue:
select sum(total_price) as Total_Revenue from pizza_sales;

-- 2. Average Order Value
select sum(total_price)/count(distinct(order_id)) as Average_Order_Value from pizza_sales;

-- 3. Total Pizzas Sold
select sum(quantity) as  Total_Pizza_Sold from pizza_Sales;

-- 4. Total Orders
select count(distinct(order_id)) as Total_Orders from pizza_sales;

-- 5. Average Pizzas Per Order
select round(sum(quantity) / count(distinct(order_id)),2) as avg_pizza from pizza_sales;

-- Daily Trend for Total Orders 
select dayname(str_to_date(order_date,'%d-%m-%y')) as order_day , count(distinct(order_id)) from pizza_sales group by order_day ;

-- Monthly Trend For Orders
select monthname(str_to_date(order_date,'%d-%m-%y')) as order_month, count(distinct(order_id)) as total_orders 
from pizza_sales 
group by order_month;

-- % of sales by pizza category
select pizza_category, round(sum(total_price),2) as total_revenue, round(((sum(total_price)/(select sum(total_price) from pizza_sales))*100),2) as category_pct 
from pizza_sales 
group by pizza_category;

-- % of sales by pizza size
select pizza_size, round(sum(total_price),2) as total_revenue, round(((sum(total_price)/(select sum(total_price) from pizza_sales))*100),2) as size_pct 
from pizza_sales 
group by pizza_size;

-- total pizza sold by pizza category
select pizza_category, sum(quantity) as Total_Quantity_Sold from pizza_sales group by pizza_category;

-- Top 5 Pizzas by Revenue
select * from pizza_sales;
select pizza_name , sum(total_price) as Total_Revenue from pizza_sales 
group by pizza_name
order by Total_Revenue desc
limit 5;

-- Bottom 5 Pizzas by Revenue 
select pizza_name , sum(total_price) as Total_Revenue from pizza_sales 
group by pizza_name
order by Total_Revenue asc
limit 5;

-- . Top 5 Pizzas by Quantity
select pizza_name, sum(quantity) as Total_Pizza_Sold from pizza_sales 
group by pizza_name 
order by Total_Pizza_Sold desc
limit 5;

-- Bottom 5 Pizzas by Quantity
select pizza_name, sum(quantity) as Total_Pizza_Sold from pizza_sales 
group by pizza_name 
order by Total_Pizza_Sold 
limit 5;

-- Top 5 Pizzas by Total Orders
select * from pizza_Sales;
select pizza_name, count(distinct(order_id)) as Total_Orders from pizza_sales
group by pizza_name 
order by Total_Orders desc
limit 5;

-- Bottom 5 Pizzas By Total Orders
select * from pizza_Sales;
select pizza_name, count(distinct(order_id)) as Total_Orders from pizza_sales
group by pizza_name 
order by Total_Orders 
limit 5;
