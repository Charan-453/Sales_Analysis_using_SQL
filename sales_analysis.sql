//Creating a sales table
create table sales(Order_id varchar2(30),
Product varchar2(30),
Category varchar2(30),
Quantity number(30),
Price number(30),
City varchar2(30),
Order_date Date);

//The below command is used to display the table
select * from sales;

//The below commands are used to find the total_revenue per each month and the total_quantity ordered.
select
extract(YEAR from order_date)
as year,
extract(MONTH from order_date) as month,
sum(price) as monthly_revenue,
count(Distinct order_id) as quantity
from sales
group by
extract(YEAR from order_date),
extract(MONTH from order_date)
order by
year,
month;

//Total revenue of the year 2026
select sum(price) as total_revenue from sales;

//Total orders of the year 2026
select count(Distinct order_id) as total_orders from sales;

//Product wise revenue
select product,
sum(price) as revenue
from sales
group by product
order by revenue desc;

//Category wise revenue
select category,
sum(price) as revenue
from sales
group by category
order by revenue desc;

//City wise revenue
select city,
sum(price) as revenue
from sales
group by city
order by revenue desc;

//Category wise total orders
select category,
count(distinct order_id) as total_orders
from sales
group by category
order by total_orders desc;

//Product wise total orders
select product,
sum(quantity) as total_orders
from sales
group by product
order by total_orders desc;

//City wise total orders
select * from sales;
select city,
count(quantity) as total_orders
from sales
group by city
order by total_orders;

//Product,City wise total orders
select product,city,
sum(quantity) as total_orders
from sales
group by product,city
order by product,city;


