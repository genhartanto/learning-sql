-- 01_basics/select_basics.sql
-- Learning: SELECT, FROM, LIMIT
-- Date: 2026-02-19

-- Showing the table
SELECT * FROM film;
SELECT * FROM film LIMIT 10;

-- How many films are in the database?
SELECT COUNT(*) FROM film;

-- What are the distinct rental durations available? (DISTINCT: ignored duplicates, ORDER default: ascending)
SELECT DISTINCT rental_duration
FROM film
ORDER BY rental_duration;

-- Show films that cost less than $3 to rent, ordered by price
SELECT title, rental_rate
FROM film
WHERE rental_rate < 3
ORDER BY rental_rate DESC;

-- How many films are in each rating category? (G, PG, R, etc.)
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating
ORDER BY total_films DESC;

-- Who are the top 10 customers by total payments made?
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;