# 🎬 Ejercicio Final Módulo 2 - SQL

Este ejercicio tiene como objetivo evaluar mi comprensión y habilidades en SQL utilizando la base de datos Sakila, que simula una tienda de alquiler de películas.

## 📝 Instrucciones
- Antes de comenzar, crea un nuevo repositorio en GitHub.
- Esta evaluación consta de una serie de preguntas que evalúan tu comprensión y habilidades en SQL.
- Puedes utilizar recursos externos como internet, materiales de referencia o tus propias notas.
- Completa los ejercicios en un archivo SQL.

## 📚 Ejercicios
**Base de Datos Sakila:**
Utilizaremos la base de datos Sakila que contiene tablas como `film`, `actor`, `customer`, `rental`, `category`, entre otras.

1. Selecciona todos los nombres de películas sin duplicados.
2. Muestra los nombres de todas las películas con una clasificación de "PG-13".
3. Encuentra el título y la descripción de todas las películas que contengan la palabra "increíble" en su descripción.
4. Encuentra el título de todas las películas con una duración mayor a 120 minutos.
5. Recupera los nombres de todos los actores.
6. Encuentra el nombre y apellido de los actores con "Gibson" en su apellido.
7. Encuentra los nombres de los actores con un actor_id entre 10 y 20.
8. Encuentra el título de las películas en la tabla `film` que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
9. Encuentra la cantidad total de películas en cada clasificación de la tabla `film` y muestra la clasificación junto con el recuento.
10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

...

## ⭐ Bonus
24. **BONUS:** Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla `film`.
25. **BONUS:** Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.

## 📜 Normas
Este ejercicio se realiza de forma individual, pero puedes consultar dudas con la profesora y compañeras si lo necesitas. Durante la prueba, evita copiar código de otras personas. Después de la entrega, habrá una revisión del ejercicio con la profesora para recibir feedback.

## 📈 Criterios de Evaluación
Se evaluará el dominio de las queries básicas, el uso de joins y subconsultas, entre otros criterios. Es importante seguir las normas y tener un README en el repositorio explicando brevemente cómo arrancar el proyecto.

# 🗂️ Sakila Database Schema

## Tabla `actor`
- `actor_id`
- `first_name`
- `last_name`
- `last_update`

## Tabla `address`
- `address_id`
- `address`
- `address2`
- `district`
- `city_id`
- `postal_code`
- `phone`
- `location`
- `last_update`

## Tabla `category`
- `category_id`
- `name`
- `last_update`

## Tabla `city`
- `city_id`
- `city`
- `country_id`
- `last_update`

## Tabla `country`
- `country_id`
- `country`
- `last_update`

## Tabla `customer`
- `customer_id`
- `store_id`
- `first_name`
- `last_name`
- `email`
- `address_id`
- `active`
- `create_date`
- `last_update`

## Tabla `film`
- `film_id`
- `title`
- `description`
- `release_year`
- `language_id`
- `original_language_id`
- `rental_duration`
- `rental_rate`
- `length`
- `replacement_cost`
- `rating`
- `special_features`
- `last_update`

## Tabla `film_actor`
- `actor_id`
- `film_id`
- `last_update`

## Tabla `film_category`
- `film_id`
- `category_id`
- `last_update`

## Tabla `film_text`
- `film_id`
- `title`
- `description`

## Tabla `inventory`
- `inventory_id`
- `film_id`
- `store_id`
- `last_update`

## Tabla `language`
- `language_id`
- `name`
- `last_update`

## Tabla `payment`
- `payment_id`
- `customer_id`
- `staff_id`
- `rental_id`
- `amount`
- `payment_date`
- `last_update`

## Tabla `rental`
- `rental_id`
- `rental_date`
- `inventory_id`
- `customer_id`
- `return_date`
- `staff_id`
- `last_update`

## Tabla `staff`
- `staff_id`
- `first_name`
- `last_name`
- `address_id`
- `picture`
- `email`
- `store_id`
- `active`
- `username`
- `password`
- `last_update`

## Tabla `store`
- `store_id`
- `manager_staff_id`
- `address_id`
- `last_update`




