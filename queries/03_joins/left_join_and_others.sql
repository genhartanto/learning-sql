-- 03_joins/left_join_and_others.sql
-- Learning: LEFT JOIN ... ON, COALESCE, etc.
-- Date: 2026-02-24

-- Show ALL customers, even those with no payments
SELECT
    c.first_name,
    c.last_name,
    COUNT(p.payment_id) AS number_of_payments,
    COALESCE(SUM(p.amount), 0) AS total_spent
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY number_of_payments ASC;
LIMIT 20;

-- Which customers have never rented a film?
SELECT
    c.first_name,
    c.last_name,
    c.email
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;

-- Comparing INNER JOIN and LEFT JOIN
-- INNER JOIN will only show customers with payments, LEFT JOIN will show all customers
SELECT COUNT(DISTINCT c.customer_id) AS customers_with_payments
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id;

SELECT COUNT(DISTINCT c.customer_id) AS total_customers
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id;

-- Find the difference
SELECT
    (SELECT COUNT(*) FROM customer) AS total_customers,
    (SELECT COUNT(DISTINCT customer_id) FROM payment) AS customers_with_payments,
    (SELECT COUNT(*) FROM customer) - (SELECT COUNT(DISTINCT customer_id) FROM payment) AS customers_without_payments;

-- RIGHT JOIN: Same as LEFT JOIN, but reversed
-- Almost never used because we can just swap the tables and use LEFT JOIN
SELECT
    c.first_name,
    c.last_name,
    COUNT(p.payment_id) AS payments
FROM payment p
RIGHT JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- FULL OUTER JOIN: Show ALL customers and ALL patments, even if they don't match
-- Rare in practice, but good to understand
SELECT
    c.customer_id AS cust_id,
    c.first_name,
    p.payment_id,
    p.amount
FROM customer c
FULL OUTER JOIN payment p ON c.customer_id = p.customer_id
WHERE c.customer_id IS NULL OR p.payment_id IS NULL
LIMIT 20;

-- Which films have NEVER been rented?
SELECT
    f.title,
    f.release_year
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL

-- Show all categories with their film counts, even categories with 0 films
SELECT
    c.name AS category_name,
    COUNT(fc.film_id) AS film_count
FROM category c
LEFT JOIN film_category fc ON fc.category_id = c.category_id
GROUP BY c.category_id, c.name
ORDER BY film_count ASC;

-- Find actors who appear in the most films (with LEFT JOIN to handle actors with no films)
SELECT
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC;

-- For each rating (G, PG, R, etc.), show:
-- - Number of films
-- - Average rental rate
-- - Total potential revenue (sum of all rental rates)
-- Only show ratings with more than 150 films



-- Find customers who rented films in February 2005
-- Show: customer name, number of rentals, total amount paid
-- Order by total amount paid (highest first)


-- Which store (store 1 or store 2) generated more revenue?


-- Find films that exist in inventory but have never been rented

-- For each film rating, show the top 3 most expensive films