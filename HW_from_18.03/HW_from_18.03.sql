use 111023_m;
-- 1. Вывести максимальный и минимальный credit_limit.
select max(CREDIT_LIMIT) from customers;

-- 2. Вывести покупателей у которых creditlimit выше среднего creditlimit.
select
	CUST_FIRST_NAME as name,
    CUST_LAST_NAME as surname
from customers
where CREDIT_LIMIT > (select avg(CREDIT_LIMIT) from customers);

-- 3. Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.
select count(*) from customers
where CUST_FIRST_NAME like 'd%' and CREDIT_LIMIT > 500;

-- 4. Найти среднее значение unit_price
select round(avg(UNIT_PRICE), 2) from order_items;

-- 5. Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.
select PRODUCT_NAME
from product_information as t1
inner join order_items as t2
on  t1.PRODUCT_ID = t2.PRODUCT_ID
where t2.QUANTITY < (select avg(QUANTITY) from order_items );

-- 6. Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).
select
	t1.CUST_FIRST_NAME,
    t1.CUST_LAST_NAME,
    t2.ORDER_TOTAL
from customers as t1
inner join orders as t2
where t2.ORDER_TOTAL = (select max(ORDER_TOTAL)from orders);

-- 7.Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.
select
	round(sum(t1.ORDER_TOTAL), 2) 
from orders as t1
inner join customers as t2
on	t1.CUSTOMER_ID = t2.CUSTOMER_ID
where  t2.MARITAL_STATUS = 'married';



