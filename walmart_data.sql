create schema sales_data;
create database mart;
use mart;
SELECT * FROM sales_data.`walmartdata (1)`;
rename table sales_data.`walmartdata (1)`
 to walmart_data;
select * from walmart_data;

#1--
select distinct City
 from walmart_data;

#2--
select  distinct City,Branch 
from walmart_data ;

#3
select distinct Product_line 
from walmart_data;
#4
select Payment,count(*)as most_used_payment
 from walmart_data 
 group by Payment limit 1 ;
#5 
select Product_line ,count(*) as most_selling_product_line 
from walmart_data 
group by Product_line
order by  most_selling_product_line desc
 limit 1;
#6
select month_name,sum(gross_income)as total_revenue
 from walmart_data 
 group by month_name; 
#7
select month_name,round(sum(cogs),2)as largest_COGS
 from walmart_data group by month_name 
 order by largest_COGS desc 
 limit 1 ;
#8
select Product_line,sum(gross_income)as largest_revenue 
from walmart_data 
group by Product_line 
order by largest_revenue desc 
limit 1;
#9
select City ,sum(gross_income)as largest_revenue
 from walmart_data 
 group by City order by largest_revenue desc
 limit 1;
#10
SELECT 
	AVG(quantity) AS avg_qnty
FROM walmart_data;

SELECT
	product_line,
	CASE
		WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM walmart_data
GROUP BY Product_line;
#11
select avg(quantity) 
from walmart_data;
select Branch ,sum(Quantity) as product_sold 
from walmart_data 
group by Branch 
having product_sold > avg(quantity) ;

#12
select  distinct Gender , Product_line ,count(Product_line) as common_product_line from walmart_data
group by Gender,Product_line 
order by common_product_line desc ;

#13
select Product_line,round(avg(Rating),1) as avg_rating  
from  walmart_data 
group by product_line;
#14
select day_of_week,time_of_day,count(quantity)as number_of_sales 
from walmart_data
 where day_of_week='Sunday' 
 group by day_of_week,
 time_of_day
order by number_of_sales desc;

#15
select Customer_type,round(sum(gross_income),2) as most_revenue
 from walmart_data 
 group by Customer_type limit 1;
 #16
 select distinct Customer_type 
 from walmart_data;
#17
select distinct Payment from walmart_data;
#18
select Gender,count(*)  
from walmart_data group by Gender limit 1;
#19
select Branch,Gender,count(*) from walmart_data
 group by Branch,Gender 
 order by Branch;
#20
select  Branch,time_of_day , count(Rating)as most_rating
 from walmart_data
 group by Branch,time_of_day 
 order by most_rating desc 
 limit 1 ;
 #21
select Branch, day_of_week ,round(avg(Rating),3) as avg_rating  
 from walmart_data group by Branch,day_of_week order by avg_rating desc;
 