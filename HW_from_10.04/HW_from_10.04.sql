-- 1 Посчитать количество рейсов по каждой модели самолета. Вывести modelname и flightcount.
select t1.model_name,
	 count( t2.trip_code) as count_trips
from airliners as t1
inner join trips as t2
on t1.id = t2.airliner_id
group by t1.model_name;

-- 2 Вычислить среднюю стоимость билета по классам обслуживания. Вывести serviceclass и averageprice.
select service_class, 
	   round(avg(price),2) average_price
from tickets
group by service_class;

-- 3 Определить средний возраст клиентов, сгруппированных по классу обслуживания. Вывести serviceclass и averageage.
select t1.service_class, 
	   round(avg(t2.age),0) as average_age
from tickets as t1
inner join clients as t2
on	t1.client_id = t2.id
group by service_class;

-- 4 Получить общее количество билетов, купленных каждым клиентом. Вывести name и ticket_count.
select t1.name, 
		count(t2.id) as ticket_count
from clients as t1
inner join tickets as t2
on	t2.client_id = t1.id        
group by t1.name;

-- 5 Определить количество рейсов, отправленных из каждого аэропорта. Вывести departure и departure_count.
select departure, count(*) as departure_count
from trips
group by departure;

-- 6 Вычислить общий доход от продажи билетов для каждой страны производителя самолетов. Вывести country и total_sum.
select t1.country, 
	   count(price) as total_sum
from airliners as t1
inner join trips as t2
on t1.id = t2.airliner_id
inner join tickets as t3
on t3.trip_id = t2.id
group by t1.country;



