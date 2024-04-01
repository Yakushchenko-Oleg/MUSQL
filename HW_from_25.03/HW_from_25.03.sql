use shop;	
-- Определить какие из покупок были совершены в июне
select * from orders
where month(ODATE) = 6;

-- Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года
select * from orders
where ODATE between '2022-04-10' and '2022-05-10';

-- Определить сколько покупок было совершено в марте
select count(*) as count_of_orders from orders
where month(ODATE) = 3;

-- Определить среднюю стоимость покупок в марте
select round(avg(AMT), 2) as avarage_sun_orders from orders
where month(ODATE) = 3;

-- Выведите минимальный рейтинг(rating) покупателя среди сделавших заказ в апреле 2022 года.
select min(t1.RATING) as min_raiting
from customers as t1
inner join orders as t2
on t1.CUST_ID = t2.CUST_ID
where month(ODATE) = 4 and year(ODATE) = 2022;

-- Выведите продавцов, которые оформили заказ на наибольшую сумму в период с 1 марта по 1 май 2022 года.
-- Вывести : sell_id, amt
select sell_id, amt from orders
where AMT = (select min(AMT) from orders where ODATE between '2022-03-01' and '2022-05-01');

	