use shop;
-- 1.Найти общую сумму заказов для каждого клиента.
select
	CUST_ID,
    sum(AMT) as orders_sum
from orders
group by CUST_ID;

-- 2. Получить количество заказов для каждого продавца.
select
	SELL_ID,
    count(ORDER_ID) as sals_count
from orders
group by SELL_ID;


-- 3. Получить количество клиентов с рейтингом выше среднего.
select count(*) as count_top_customers
from customers
where RATING > (select avg(RATING) from customers);

-- 4. Получить количество клиентов в каждом городе с рейтингом выше 200.
select CITY, count(*) as count_top_customers
from customers
where RATING > 200
group by CITY;

-- 5. Получить количество заказов, сделанных в каждый месяц.
select 
	month(ODATE) as month,
    count(*) as order_count
from orders
group by month;

-- 6. Найти клиентов, у которых сумма заказов превышает среднюю сумму заказов всех клиентов.
select CUST_ID
from orders 
where AMT > (select avg(AMT) from orders);

