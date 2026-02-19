-- 02_aggregation/group_by_practice.sql
-- Learning: GROUP BY, HAVING, COUNT, SUM, AVG, MIN, MAX
-- Date: 2026-02-19

-- Average rental rate by film rating
SELECT rating, AVG(rental_rate) AS avg_price
FROM film
--WHERE rental_rate > 2
GROUP BY rating, rental_duration
ORDER BY avg_price DESC;

-- How many films were released each year?
SELECT release_year, COUNT(*) AS total_films
FROM film
GROUP BY release_year
ORDER BY release_year;

-- Total revenue by rental duration
SELECT rental_duration, SUM(rental_rate) AS total_revenue
FROM film
GROUP BY rental_duration
ORDER BY total_revenue DESC;

-- HAVING clause: Only show ratings with more than 150 films
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating
HAVING COUNT(*) > 150

-- Multiple aggregations at once
SELECT rating,
	COUNT(*) AS total_films,
	AVG(rental_rate) AS avg_price,
	MIN(rental_rate) AS cheapest,
	MAX(rental_rate) AS most_expensive
FROM film
GROUP BY rating
ORDER BY avg_price DESC;