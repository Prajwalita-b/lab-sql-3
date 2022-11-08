use sakila;
select count(distinct last_name) from actor; -- Q1
select count(distinct language_id) from film; -- Q2
select count(distinct film_id) from film where rating = "PG-13"; -- Q3
select title, length from film where release_year = "2006" order by length desc limit 10; -- Q4
select datediff(max(rental_date), min(rental_date)) from rental; -- Q5
select *, date_format(convert(rental_date,date), '%M') as month_, date_format(convert(rental_date,date), '%W') as weekday_ from rental limit 20; -- Q6
select *, 
case
when date_format(convert(rental_date,date), '%W') = 'Saturday' then 'Weekend'
when date_format(convert(rental_date,date), '%W') = 'Sunday' then 'Weekend'
else 'Weekday'
end as 'day_type'
from rental; -- Q7
select count(rental_id) as 'rentals_last_month' 
from rental 
where date_format(convert(rental_date,date),'%Y-%M') = (select date_format(convert(max(rental_date),date),'%Y-%M') from rental); -- Q8