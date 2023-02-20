# Use Sakila
USE sakila;

# 1- Select all the actors with the first name ‘Scarlett’
SELECT first_name, actor_id
FROM actor
WHERE first_name = 'Scarlett';

# 2- Select all the actors with the last name ‘Johansson’
SELECT first_name, last_name,  actor_id
FROM actor
WHERE last_name = 'Johansson';

# 3- How many films (movies) are available for rent?
SELECT
    f.film_id, count(r.inventory_id) as "Number of films Rented"
FROM
    film f, rental r
WHERE 
    f.film_id = r.inventory_id
GROUP BY
    f.film_id
HAVING count(r.inventory_id) is NULL;

# 4- How many films have been rented?

SELECT count(r.rental_id) AS 'number of films rented'
FROM rental r;

# 5- What is the shortest and longest rental period?
SELECT MIN(rental_duration) AS 'shortest rental period'
FROM film;

SELECT MAX(rental_duration) AS 'longest rental period'
FROM film;

# 6- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) AS 'max_duration'
FROM film;

SELECT MIN(length) AS 'min_duration'
FROM film;


# 7- What's the average movie duration?
SELECT AVG(length) 
FROM film;

# 8- What's the average movie duration expressed in format (hours, minutes)?
SELECT 
TIME_TO_SEC(AVG(length)) AS 'seconds',
TIME_TO_SEC(AVG(length))/60 AS 'minutes',
TIME_TO_SEC(AVG(length))/(60*60) AS 'hours'
FROM film;

# 9- How many movies longer than 3 hours?
SELECT count(length)
FROM film
WHERE length > 180;

# 10- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT CONCAT(customer_id, email) AS 'new_name'
FROM customer;

# 11- What's the length of the longest film title?
SELECT MAX(LENGTH(title)) 
FROM film;