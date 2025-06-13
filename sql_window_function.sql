-- Window Functions

--Aggregate functions as Window function


Use EMPLOYEE;

select *
from sys.tables;

ALTER TABLE EMPLOYEE_INFO 
ADD DEP_ID INT ,
SALARY INT;

SELECT * FROM Customers;

UPDATE EMPLOYEE_INFO
SET DEP_ID =8  WHERE EMP_ID= 101;

--Write a query to calculate the average salary of employees in each department using a window function.
--Include the employee name, department ID, and average salary.

SELECT E.EMP_NAME,E.DEP_ID, AVG(E.SALARY)
OVER (PARTITION BY DEP_ID) as average_salary
FROM EMPLOYEE_INFO AS E ;

/* If you have a sales table with a sale_date and amount column, 
write a query to calculate the cumulative total of sales amounts ordered by sale date.*/

select e.sale_date, sum(e.amount)
over (partition by sale_date order by sale_date) as sale_amount
from EMPLOYEE_INFO as e;

-- Rank Function

Select c.customer_id,c.customer_name,c.country,
Rank() over(order by country)
from customers as c;

-- row_number()

Select c.customer_id,c.customer_name,c.country,
Row_number() over(order by country)
from customers as c;

--Dense rank

Select c.customer_id,c.customer_name,c.country,
Dense_rank() over(order by country)
from customers as c;

-- Percent rank

Select c.customer_id,c.customer_name,c.country,
PERCENT_RANK() over(order by country)
from customers as c;


-- lead function

Select c.customer_id,c.customer_name,c.country,
lead(customer_id) over(order by customer_id)
from customers as c;

--lag function

Select c.customer_id,c.customer_name,c.country,
lag(customer_id,2) over(order by customer_id)
from customers as c;
