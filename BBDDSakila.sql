USE sakila;  -- Selecciona la base de datos sakila para trabajar con ella

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT title  -- Selecciona títulos únicos
FROM film;  -- De la tabla film

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT DISTINCT title, rating  -- Selecciona títulos y clasificaciones únicos
FROM film  -- De la tabla film
WHERE rating = "PG-13";  -- Donde la clasificación sea PG-13

-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT title, description  -- Selecciona títulos y descripciones
FROM film  -- De la tabla film
WHERE description LIKE "%amazing%";  -- Donde la descripción contenga "amazing"

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title, length  -- Selecciona títulos y duraciones
FROM film  -- De la tabla film
WHERE length > 120  -- Donde la duración sea mayor a 120 minutos
ORDER BY length ASC;  -- Ordena por duración ascendente

-- 5. Recupera los nombres de todos los actores.
SELECT first_name  -- Selecciona los nombres de pila
FROM actor  -- De la tabla actor
ORDER BY first_name ASC;  -- Ordena por nombre ascendente

-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name  -- Selecciona nombres y apellidos
FROM actor  -- De la tabla actor
WHERE last_name = "Gibson"  -- Donde el apellido sea "Gibson"
ORDER BY first_name ASC;  -- Ordena por nombre ascendente

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT actor_id, first_name  -- Selecciona identificadores y nombres de pila
FROM actor  -- De la tabla actor
WHERE actor_id BETWEEN 10 AND 20  -- Donde el identificador esté entre 10 y 20
ORDER BY actor_id ASC;  -- Ordena por identificador ascendente

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title, rating  -- Selecciona títulos y clasificaciones
FROM film  -- De la tabla film
WHERE rating <> "R" AND rating <> "PG-13";  -- Donde la clasificación no sea ni "R" ni "PG-13"

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y 
-- muestra la clasificación junto con el recuento.
SELECT COUNT(title), rating  -- Cuenta los títulos y selecciona las clasificaciones
FROM film  -- De la tabla film
GROUP BY rating;  -- Agrupa por clasificación

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
-- su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT customer.customer_id, customer.first_name, customer.last_name, COUNT(rental.rental_id) AS total_rentals_by_customer  -- Selecciona identificadores, nombres, apellidos y cuenta los alquileres
FROM customer  -- De la tabla customer
INNER JOIN rental ON customer.customer_id = rental.customer_id  -- Junta con rental usando identificadores de cliente
GROUP BY customer.customer_id  -- Agrupa por identificador de cliente
ORDER BY customer.first_name ASC;  -- Ordena por nombre ascendente

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y 
-- muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT category.name, COUNT(rental.rental_id) AS rental_count  -- Selecciona nombres de categorías y cuenta los alquileres
FROM category  -- De la tabla category
INNER JOIN film_category ON category.category_id = film_category.category_id  -- Junta con film_category usando identificadores de categoría
INNER JOIN inventory ON film_category.film_id = inventory.film_id  -- Junta con inventory usando identificadores de película
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id  -- Junta con rental usando identificadores de inventario
GROUP BY category.name  -- Agrupa por nombre de categoría
ORDER BY category.name ASC;  -- Ordena por nombre de categoría ascendente

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y 
-- muestra la clasificación junto con el promedio de duración.
SELECT rating, AVG(length) AS avg_time_films  -- Selecciona clasificaciones y calcula el promedio de duración
FROM film  -- De la tabla film
GROUP BY rating  -- Agrupa por clasificación
ORDER BY rating ASC;  -- Ordena por clasificación ascendente

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT film.title, actor.first_name, actor.last_name  -- Selecciona títulos, nombres y apellidos
FROM actor  -- De la tabla actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id  -- Junta con film_actor usando identificadores de actor
INNER JOIN film ON film_actor.film_id = film.film_id  -- Junta con film usando identificadores de película
WHERE film.title = 'Indian Love'  -- Donde el título sea "Indian Love"
ORDER BY actor.first_name;  -- Ordena por nombre de actor ascendente

-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title, description  -- Selecciona títulos y descripciones
FROM film  -- De la tabla film
WHERE description LIKE '%dog%' OR description LIKE '%cat%';  -- Donde la descripción contenga "dog" o "cat"

-- 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
SELECT actor.actor_id, actor.first_name, actor.last_name  -- Selecciona identificadores, nombres y apellidos
FROM actor  -- De la tabla actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id  -- Junta con film_actor usando identificadores de actor
WHERE film_actor.actor_id IS NULL;  -- Donde no haya coincidencias en film_actor

-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year  -- Selecciona títulos y años de lanzamiento
FROM film  -- De la tabla film
WHERE release_year BETWEEN 2005 AND 2010  -- Donde el año de lanzamiento esté entre 2005 y 2010
ORDER BY title ASC;  -- Ordena por título ascendente

-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
SELECT film.title, category.name AS category  -- Selecciona títulos y nombres de categorías
FROM film  -- De la tabla film
INNER JOIN film_category ON film.film_id = film_category.film_id  -- Junta con film_category usando identificadores de película
INNER JOIN category ON film_category.category_id = category.category_id  -- Junta con category usando identificadores de categoría
WHERE category.name = 'Family';  -- Donde el nombre de la categoría sea "Family"

-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS films_count  -- Selecciona nombres, apellidos y cuenta las películas
FROM actor  -- De la tabla actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id  -- Junta con film_actor usando identificadores de actor
GROUP BY actor.actor_id, actor.first_name, actor.last_name  -- Agrupa por identificador, nombre y apellido
HAVING COUNT(film_actor.film_id) > 10  -- Donde el recuento de películas sea mayor a 10
ORDER BY films_count;  -- Ordena por recuento de películas

-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
SELECT title, rating  -- Selecciona títulos y clasificaciones
FROM film  -- De la tabla film
WHERE rating = 'R' AND length > 120;  -- Donde la clasificación sea "R" y la duración mayor a 120 minutos

-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y 
-- muestra el nombre de la categoría junto con el promedio de duración.
SELECT category.name, AVG(film.length) AS avg_duration  -- Selecciona nombres de categorías y calcula el promedio de duración
FROM film  -- De la tabla film
INNER JOIN film_category ON film.film_id = film_category.film_id  -- Junta con film_category usando identificadores de película
INNER JOIN category ON film_category.category_id = category.category_id  -- Junta con category usando identificadores de categoría
GROUP BY category.name  -- Agrupa por nombre de categoría
HAVING AVG(film.length) > 120;  -- Donde el promedio de duración sea mayor a 120 minutos

-- 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del 
-- actor junto con la cantidad de películas en las que han actuado.
SELECT actor.first_name, actor.last_name, COUNT(film_actor.film_id) AS film_count  -- Selecciona nombres, apellidos y cuenta las películas
FROM actor  -- De la tabla actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id  -- Junta con film_actor usando identificadores de actor
GROUP BY actor.actor_id  -- Agrupa por identificador de actor
HAVING COUNT(film_actor.film_id) >= 5  -- Donde el recuento de películas sea mayor o igual a 5
ORDER BY film_count;  -- Ordena por recuento de películas

-- 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. 
-- Utiliza una subconsulta para encontrar los rental_ids 
-- con una duración superior a 5 días y luego selecciona las películas correspondientes.
WITH LongRentals AS (  -- Define una subconsulta con nombre LongRentals
    SELECT rental.rental_id,  -- Selecciona identificadores de alquiler
           rental.inventory_id,  -- Selecciona identificadores de inventario
           rental.customer_id,  -- Selecciona identificadores de cliente
           DATEDIFF(rental.return_date, rental.rental_date) AS rental_duration  -- Calcula la duración del alquiler
    FROM rental  -- De la tabla rental
    WHERE rental.return_date > rental.rental_date + INTERVAL 5 DAY  -- Donde la duración del alquiler sea mayor a 5 días
)

SELECT film.title,  -- Selecciona títulos de películas
       LongRentals.rental_duration,  -- Selecciona duración del alquiler
       LongRentals.customer_id  -- Selecciona identificadores de cliente
FROM LongRentals  -- De la subconsulta LongRentals
INNER JOIN inventory ON LongRentals.inventory_id = inventory.inventory_id  -- Junta con inventory usando identificadores de inventario
INNER JOIN film ON inventory.film_id = film.film_id  -- Junta con film usando identificadores de película
ORDER BY rental.customer_id;  -- Ordena por identificador de cliente

-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". 
-- Utiliza una subconsulta para encontrar los actores que han actuado en
-- películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
SELECT actor.first_name, actor.last_name  -- Selecciona nombres y apellidos
FROM actor  -- De la tabla actor
WHERE actor.actor_id NOT IN (  -- Donde el identificador de actor no esté en la siguiente subconsulta
    SELECT film_actor.actor_id  -- Selecciona identificadores de actor
    FROM film_actor  -- De la tabla film_actor
    JOIN film_category ON film_actor.film_id = film_category.film_id  -- Junta con film_category usando identificadores de película
    JOIN category ON film_category.category_id = category.category_id  -- Junta con category usando identificadores de categoría
    WHERE category.name = 'Horror'  -- Donde el nombre de la categoría sea "Horror"
);

-- 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la
-- categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en
-- películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
SELECT DISTINCT actor.first_name AS FIRST_NAME, actor.last_name AS LAST_NAME, category.name AS CATEGORY  -- Selecciona nombres, apellidos y categorías únicas
FROM actor  -- De la tabla actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id  -- Junta con film_actor usando identificadores de actor
INNER JOIN film_category ON film_actor.film_id = film_category.film_id  -- Junta con film_category usando identificadores de película
INNER JOIN category ON film_category.category_id = category.category_id  -- Junta con category usando identificadores de categoría
WHERE actor.actor_id NOT IN (  -- Donde el identificador de actor no esté en la siguiente subconsulta
    SELECT film_actor.actor_id  -- Selecciona identificadores de actor
    FROM film_actor  -- De la tabla film_actor
    JOIN film_category ON film_actor.film_id = film_category.film_id  -- Junta con film_category usando identificadores de película
    JOIN category ON film_category.category_id = category.category_id  -- Junta con category usando identificadores de categoría
    WHERE category.name = 'Horror'  -- Donde el nombre de la categoría sea "Horror"
)
ORDER BY actor.first_name ASC;  -- Ordena por nombre ascendente

-- BONUS

-- 24. BONUS: Encuentra el título de las películas que son comedias y tienen una duración mayor a 180
-- minutos en la tabla film.
SELECT film.title AS comedy, film.length AS length, category.name AS category  -- Selecciona títulos, duraciones y nombres de categorías
FROM film  -- De la tabla film
JOIN film_category ON film.film_id = film_category.film_id  -- Junta con film_category usando identificadores de película
JOIN category ON film_category.category_id = category.category_id  -- Junta con category usando identificadores de categoría
WHERE category.name = 'Comedy' AND film.length > 180;  -- Donde el nombre de la categoría sea "Comedy" y la duración mayor a 180 minutos

-- 25. BONUS: Encuentra todos los actores que han actuado juntos en al menos una película. La
-- consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que
-- han actuado juntos.
SELECT actor1.first_name AS actor1_first_name,  -- Selecciona nombres del primer actor
       actor1.last_name AS actor1_last_name,  -- Selecciona apellidos del primer actor
       actor2.first_name AS actor2_first_name,  -- Selecciona nombres del segundo actor
       actor2.last_name AS actor2_last_name,  -- Selecciona apellidos del segundo actor
       COUNT(*) AS number_of_movies_together  -- Cuenta el número de películas juntos
FROM film_actor AS fa1  -- De la tabla film_actor como fa1
JOIN film_actor AS fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id  -- Junta con film_actor como fa2 usando identificadores de película y actor
JOIN actor AS actor1 ON fa1.actor_id = actor1.actor_id  -- Junta con actor como actor1 usando identificadores de actor
JOIN actor AS actor2 ON fa2.actor_id = actor2.actor_id  -- Junta con actor como actor2 usando identificadores de actor
GROUP BY actor1.actor_id, actor1.first_name, actor1.last_name, actor2.actor_id, actor2.first_name, actor2.last_name  -- Agrupa por identificadores, nombres y apellidos de ambos actores
HAVING COUNT(*) > 0  -- Donde el número de películas juntos sea mayor a 0
ORDER BY actor1.first_name ASC;  -- Ordena por nombre del primer actor ascendente
