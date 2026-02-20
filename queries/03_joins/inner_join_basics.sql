-- 03_joins/inner_join_basics.sql
-- Learning: INNER JOIN ... ON
-- Date: 2026-02-19

-- Get customer names with their payment amounts
SELECT
	c.first_name,
	c.last_name,
	p.amount,
	p.payment_date
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
LIMIT 20;

-- Top 10 customers by total spending
SELECT
	c.first_name,
	c.last_name,
	SUM(p.amount) AS total_spent,
	COUNT(p.payment_id) AS number_of_payments
FROM payment p
INNER JOIN customer c ON p.customer_id = c.customer_id
--WHERE p.amount > 5 -- more than $5 spent
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;
LIMIT 10;

-- Which staff member processed the most payments?
SELECT
	s.first_name,
	s.last_name,
	COUNT(p.payment_id) AS payments_processed,
	SUM(p.amount) AS total_revenue
FROM payment p
INNER JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY total_revenue DESC;

-- How many films are in each category?
-- This is a many-to-many category, where one film can have multiple categories, one categories has multiple films
SELECT
	c.name AS category,
	COUNT(f.film_id) AS number_of_films
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY number_of_films DESC;

-- Show each customer's rental history with film titles
SELECT
	c.first_name || ' ' || c.last_name AS customer_name, -- combining first and last name (|| concatenates strings))
	f.title AS film_title,
	r.rental_date,
	r.return_date
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
ORDER BY r.rental_date DESC
LIMIT 50;

-- Show the top 5 most rented films with their titles and rental counts
SELECT
	f.title AS film_title,
	COUNT(r.rental_id) AS rental_count,
	f.rating
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
WHERE f.rental_rate >= 2.99
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC;