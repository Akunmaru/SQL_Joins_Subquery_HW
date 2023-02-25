--QUESTION 1: List all customers who live in Texas (Use JOINS)
--ANSWER: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
select first_name, last_name
from customer
inner join address
on address.address_id = customer.address_id and address.district = 'Texas';

--QUESTION 2: Get all payments above $6.99 with the Customer's Full Name
--ANSWER:
select first_name, last_name, payment.payment_id, payment.amount
from customer
inner join payment
on payment.customer_id = customer.customer_id and payment.amount > 6.99;

--QUESTION 3: Show all customers names who have made payments over $175 (Use SubQueries)
--ANSWER: Peter Menard
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having max(amount) > 175
);


--QUESTION 4: List all customers that live in Nepal (use the city table)
-- ASNWER: Kevin Schuler
select country_id
from country
where country = 'Nepal';

select first_name, last_name
from customer
where address_id in (
	select address_id
	from address
	where city_id in (
		select city_id
		from address
		where city_id in (
			select city_id
			from city
			where country_id = 66
		)
	)
);
--QUESTION 5: Which staff member had the most transactions?
--ANSWER: Jon Stephens
select staff_id from payment

select staff_id, count(payment_id)
from payment 
group by staff_id
order by count(payment_id) desc;

select first_name, last_name, staff_id 
from staff
where staff_id = 2;

--QUESTION 6: How many movies of each rating are there?
--ANSWER:  5 different ratings (PG-13, NC-17, R, PG, G)
-- PG-13 = 223
-- NC-17 = 209
-- R     = 196
-- PG    = 194
-- G     = 178
select rating, count(film_id)
from film
group by rating order by count(film_id) desc;

--QUESTION 7: Show all customers who have made a single payment above $6.99 (Use SubQueries)
--ANSWER:
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having max(amount) > 6.99
);

--QUESTION 8: How many free rentals did our stores give away?
-- ANSWER: 16,044
select count(rental_id)
from rental;
