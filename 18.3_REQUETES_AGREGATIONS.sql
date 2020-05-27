USE sakila ;
SHOW TABLES ;

SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='actor';
-- 'actor_id', 'first_name', 'last_name', 'last_update'
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='film';
-- 'film_id', 'title', 'description', 'release_year', 'language_id', 'original_language_id'
-- 'rental_duration', 'rental_rate', 'length', 'replacement_cost', 'rating', 'special_features'
-- 'last_update'
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='film_actor';
-- 'actor_id', 'film_id', 'last_update'
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='category' ;
-- 'category_id', 'name', 'last_update'

-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
-- Afficher le nombre de films dans les quels à joué l'acteur « JOHNNY LOLLOBRIGIDA », 
-- regroupé par catégorie.  
SELECT actor_id, last_name, first_name FROM actor WHERE last_name = "LOLLOBRIGIDA";
-- '5', 'LOLLOBRIGIDA', 'JOHNNY'
SELECT COUNT(title), first_name, last_name FROM film
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor  ON actor.actor_id = film_actor.actor_id 
WHERE actor.actor_id = 5 ; -- 29 films avec JL

SELECT COUNT(title) nb_film, 
C.name, 
A.first_name,
A.last_name
FROM film F
INNER JOIN film_actor FA ON F.film_id = FA.film_id
INNER JOIN actor A ON FA.actor_id = A.actor_id
INNER JOIN film_category FC ON F.film_id = FC.film_id
INNER JOIN category C ON FC.category_id = C.category_id
WHERE A.first_name = "JOHNNY" 
AND A.last_name = "LOLLOBRIGIDA"
GROUP BY C.name ;
-- nb	 name     first_name	last_name
-- '3', 'Action', 'JOHNNY', 'LOLLOBRIGIDA'
-- '1', 'Animation', 'JOHNNY', 'LOLLOBRIGIDA'
-- '1', 'Children', 'JOHNNY', 'LOLLOBRIGIDA'
-- '1', 'Comedy', 'JOHNNY', 'LOLLOBRIGIDA'
-- ...

-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
-- Ecrire la requête qui affiche les catégories
--  dans les quels « JOHNNY LOLLOBRIGIDA » totalise plus de 3 films. 
SELECT COUNT(title) nb_film, C.name, A.first_name,A.last_name
FROM film F
INNER JOIN film_actor FA ON F.film_id = FA.film_id
INNER JOIN actor A ON FA.actor_id = A.actor_id
INNER JOIN film_category FC ON F.film_id = FC.film_id
INNER JOIN category C ON FC.category_id = C.category_id
WHERE A.first_name = "JOHNNY" 
AND A.last_name = "LOLLOBRIGIDA"
GROUP BY C.name 
HAVING nb_film > 3; -- Avec Group by, on utilise having pour faire le tri
-- nb 	name			first_name	last_name
-- '4', 'Documentary', 'JOHNNY', 'LOLLOBRIGIDA'

-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
-- Afficher la durée moyenne d'emprunt des films par acteurs.
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='rental';
-- 'rental_id', 'rental_date', 'inventory_id','customer_id', 'return_date', 
-- 'staff_id', 'last_update'
-- SELECT DATEDIFF( date1, date2 );
SELECT ROUND(AVG(datediff(return_date, rental_date)), 2) AS avg_rental  FROM rental ;
SELECT AVG(datediff(return_date, rental_date)) AS avg_rental, A.first_name, A.last_name
FROM rental R
INNER JOIN inventory I ON R.inventory_ID = I.inventory_ID
INNER JOIN film F ON I.film_id = F.film_id
INNER JOIN film_actor FA ON F.film_id = FA.film_id
INNER JOIN actor A ON FA.actor_id = A.actor_id
GROUP BY A.first_name, A.last_name ORDER BY A.last_name ; -- 199 lignes
-- avg_rental first_name last_name
-- '4.8384', 'DEBBIE', 'AKROYD'
-- '5.0256', 'CHRISTIAN', 'AKROYD'
-- '5.0022', 'KIRSTEN', 'AKROYD'
-- '5.2046', 'KIM', 'ALLEN'
-- '5.0212', 'MERYL', 'ALLEN'
-- '5.1772', 'CUBA', 'ALLEN'

-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
-- L'argent total dépensé au vidéos club par chaque clients, classé par ordre décroissant. 
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='customer';
-- 'customer_id', 'store_id', 'first_name', 'last_name', 'email', 'address_id', 'active'
-- 'create_date', 'last_update'
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='payment';
-- 'payment_id', 'customer_id', 'staff_id', 'rental_id', 'amount', 'payment_date', 'last_update'

SELECT SUM(amount) total, first_name, last_name FROM payment P
INNER JOIN customer C ON C.customer_id = P.customer_id
GROUP BY C.customer_id ORDER BY C.last_name ASC;
-- total	first_name last_name
-- '97.79', 'RAFAEL', 'ABNEY'
-- '133.72', 'NATHANIEL', 'ADAM'
-- '92.73', 'KATHLEEN', 'ADAMS'
-- '105.73', 'DIANA', 'ALEXANDER'
-- '160.68', 'GORDON', 'ALLARD'
-- '126.69', 'SHIRLEY', 'ALLEN'

