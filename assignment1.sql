-- 1. Get all customers whose first name starts with 'J' and who are active.
SELECT * FROM sakila.customer
WHERE first_name LIKE 'J%' and active = TRUE;

-- 2. Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
SELECT title,description from sakila.film
WHERE title LIKE '%action%' OR description LIKE '%war%';

-- 3. List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
SELECT * FROM sakila.customer
WHERE first_name like '%a' AND last_name NOT LIKE '&SMITH&';

-- 4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
SELECT * FROM sakila.film 
WHERE rental_rate > 3.0 AND replacement_cost IS NOT NULL;

-- 5. Count how many customers exist in each store who have active status = 1.
SELECT COUNT(store_id), store_id FROM sakila.customer
WHERE active = 1
GROUP BY store_id;

-- 6. Show distinct film ratings available in the film table.
SELECT DISTINCT rating FROM sakila.film;

-- 7.Find the number of films for each rental duration where the average length is more than 100 minutes.
SELECT count(title), rental_duration , avg(length) as avg_lenght from sakila.film
group by rental_duration
having avg_lenght > 100;

-- 8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
SELECT COUNT(date(payment_date)), DATE(payment_date), SUM(amount) from sakila.payment
GROUP by date(payment_date)
HAVING COUNT(date(payment_date)) > 100;

SELECT DISTINCT DATE(payment_date) from sakila.payment;

SELECT DISTINCT payment_date from sakila.payment;

DESCRIBE sakila.payment;

-- 9. Find customers whose email address is null or ends with '.org'.
SELECT * FROM sakila.customer
WHERE email LIKE '%org' or email IS NULL;

-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
SELECT * FROM sakila.film
WHERE rating = 'G' OR rating = 'PG'
ORDER BY rental_rate desc;

-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
SELECT COUNT(*), length from sakila.film
WHERE title = 'T%'
GROUP BY length
HAVING COUNT(*) > 5;

select length, COUNT(film_id) from sakila.film
where title LIKE 'T%'
GROUP BY length
HAVING COUNT(film_id) > 1;

SELECT DISTINCT length, COUNT(film_id) FROM sakila.film
GROUP BY length
HAVING COUNT(film_id) > 5;

-- 12. List all actors who have appeared in more than 10 films.
SELECT actor_id , COUNT(film_id) FROM sakila.film_actor
GROUP BY actor_id
HAVING COUNT(film_id) > 10; 

-- 13. Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.
SELECT title, rental_rate, length from sakila.film
ORDER BY rental_rate desc, length desc
LIMIT 5;


-- 14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.
SELECT c.customer_id, COUNT(r.rental_id) as trent FROM sakila.customer c 
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY trent DESC;


-- 15. List the film titles that have never been rented.
SELECT f.title FROM sakila.film f
LEFT JOIN sakila.inventory i ON f.film_id = i.film_id
LEFT JOIN sakila.rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL
ORDER BY f.title;

