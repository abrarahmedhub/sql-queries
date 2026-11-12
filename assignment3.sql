-- 1. display all customer details who have made more than 5 payments.
SELECT c.* , COUNT(p.payment_id) FROM sakila.customer c 
LEFT JOIN sakila.payment p on c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(p.payment_id) > 5;

SELECT * FROM sakila.customer
WHERE customer_id in  
(select customer_id FROM sakila.payment
GROUP BY customer_id
having COUNT(payment_id) > 5);

-- 2. Find the names of actors who have acted in more than 10 films.
SELECT first_name FROM sakila.actor
WHERE actor_id IN
(SELECT actor_id FROM sakila.film_actor
GROUP BY actor_id
HAVING COUNT(film_id) > 10);

-- 3. Find the names of customers who never made a payment.
SELECT first_name FROM sakila.customer
WHERE customer_id NOT IN 
(select customer_id FROM sakila.payment);

-- 4. List all films whose rental rate is higher than the average rental rate of all films.
SELECT title, rental_rate FROM sakila.film 
WHERE rental_rate > (SELECT AVG(rental_rate) FROM sakila.film);

-- 5. List the titles of films that were never rented.
SELECT title FROM sakila.film
WHERE film_id NOT IN
(select film_id FROM sakila.inventory
WHERE inventory_id IN (select inventory_id FROM sakila.rental));

-- 6. Display the customers who rented films in the same month as customer with ID 5.
SELECT * from sakila.customer
WHERE customer_id in 
(select customer_id FROM sakila.rental
WHERE MONTH(rental_date) IN
(select MONTH(rental_date) FROM sakila.rental
WHERE customer_id = 5)) and customer_id <> 5;

-- 7. Find all staff members who handled a payment greater than the average payment amount.
SELECT first_name from sakila.staff
WHERE staff_id IN
(SELECT staff_id from sakila.payment
WHERE amount > (select avg(amount) FROM sakila.payment));

-- 8. Show the title and rental duration of films whose rental duration is greater than the average.
SELECT title, rental_duration FROM sakila.film
WHERE rental_duration > (select AVG(rental_duration) FROM sakila.film);

-- 9. Find all customers who have the same address as customer with ID 1.
SELECT * FROM sakila.customer
WHERE address_id IN (select address_id FROM sakila.customer
WHERE customer_id = 1);

-- 10. List all payments that are greater than the average of all payments.
SELECT * FROM sakila.payment
WHERE amount > (select AVG(amount) FROM sakila.payment);







