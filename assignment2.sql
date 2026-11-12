-- 1. List all customers along with the films they have rented.
SELECT c.customer_id , f.title from sakila.customer c 
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
LEFT JOIN sakila.inventory i ON r.inventory_id = i.inventory_id
LEFT JOIN sakila.film f ON i.film_id = f.film_id;

-- 2. List all customers and show their rental count, including those who haven't rented any films.
SELECT c.customer_id , COUNT(r.rental_id) as Rental_count FROM sakila.customer c
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP by c.customer_id;

-- 3. Show all films along with their category. Include films that don't have a category assigned.
SELECT f.title , c.name as category FROM sakila.film f 
LEFT JOIN sakila.film_category fc ON f.film_id = fc.film_id
LEFT JOIN sakila.category c on c.category_id = fc.category_id;

-- 4. Show all customers and staff emails from both customer and staff tables using a full outer join (simulate using LEFT + RIGHT + UNION).
SELECT customer_id, email, 'customer' as type from sakila.customer
UNION ALL
SELECT staff_id, email, 'staff' as type from sakila.staff;

-- 5. Find all actors who acted in the film "ACADEMY DINOSAUR".
SELECT a.first_name FROM sakila.actor a
LEFT JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN sakila.film f ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';

-- 6. List all stores and the total number of staff members working in each store, even if a store has no staff.
SELECT st.store_id, COUNT(s.staff_id) as numberstaff from sakila.store st
LEFT JOIN sakila.staff s ON st.store_id = s.store_id
GROUP by st.store_id;

-- 7. List the customers who have rented films more than 5 times. Include their name and total rental count.
SELECT c.customer_id , COUNT(r.rental_id) as Rental_count FROM sakila.customer c
LEFT JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP by c.customer_id
HAVING Rental_count > 5;





