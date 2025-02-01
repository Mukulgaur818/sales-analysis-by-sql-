SELECT * FROM fact
Select * from Product
select  * from Location;

select count(Distinct State) from Location;

select count(ProductId) 
from Product
where Type='Regular';

select sum(Marketing) as Marketing from fact
where ProductId = 1;

select min(Sales)
from fact;

select max(COGS) FROM FACT;

SELECT PRODUCTID FROM Product
where Product_Type = 'Coffee';

select * from fact 
where Total_Expenses>40;

select AVG(sales)
from fact 
where Area_Code = 719;

select sum(profit)
from fact f
inner join Location L 
on f.Area_Code = L.Area_Code
where L.State='Colorado';

select avg(inventory),productid
from fact 
group by productid
order by ProductId;

select * 
from Location
order by State;

--Display the average budget margin of the store where average budget margin should be greater than 100.

select avg(budget_margin),productid from fact
group by productid 
having avg(Budget_Margin)>100;

select sum(sales)
from fact
where date='2010-01-01';

select productid,date,avg(total_expenses)
from fact 
group by ProductId,date
order by ProductId,date ;

--Display the table with the following attributes such as Date, productid, product_type, product, Sales, profit, state, area_code
select Date, f.ProductId,product_type,product,sales,profit,state,f.area_code
from fact f 
inner join product p on 
f.ProductId=p.ProductId 
inner join Location L
on f.Area_Code=L.Area_Code;

--Display the rank without any gap to show the Sales wise rank.

select date,productid,profit,sales,area_code , DENSE_RANK() over (order by sales asc) as rank
from fact;

--Find the State wise Profit and Sales

select sum(profit) as profit,sum(sales) as sales,state
from fact f 
inner join location l on f.Area_Code=l.Area_Code
group by state;

select sum(profit) as profit,sum(sales) as sales,state,product
from fact f 
inner join location l on f.Area_Code=l.Area_Code
inner join Product p on p.ProductId=f.ProductId
group by state,product;

select sales,(sales+sales*0.05) as increased_sales
from fact

--Find the maximum profit along with the Product id and Product Type.

select profit,f.productid,product_type
from fact f inner join
product p on 
f.ProductId=p.ProductId
where Profit = (select max(Profit) from fact)

create procedure product_type @prod_type varchar(20)
as
select * from Product where Product_Type=@prod_type

exec product_type @prod_type='Coffee'

select total_expenses,
(case
when total_expenses<60 then 'profit'
else 'loss'
end) as status
from fact


SELECT 
    DATEPART(WEEK, Date) AS Week, 
    ProductID,
    SUM(Sales) AS TotalSales
FROM 
    Fact
GROUP BY 
    ROLLUP(DATEPART(WEEK, Date), ProductID)
ORDER BY 
    Week, ProductID;

	select  Area_Code from fact
	union
	select Area_Code from Location

	select  Area_Code from fact
	intersect
	select Area_Code from Location

	create function producttype (@product_type nvarchar(50))
	returns table 
	as
	return
	(
	select ProductId,Product_Type,Product,type from product
	where Product_Type=@product_type
	);

	select * from producttype('Coffee')

	update Product
	set product_type = 'Tea'
	where ProductId=1;

	select date,productid,sales
	from fact
	where Total_Expenses between 100 and 200;

	delete from Product
	where Type='Regular';

	select Product, ASCII(substring(product,5,1)) as asciivalue
	from Product
	where len(product)>=5;


































