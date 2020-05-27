USE SIMPLON ;
SHOW TABLES ;
-- jeux_video
select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where table_name='jeux_video';
-- 'ID','nom', 'possesseur', 'console', 'prix', 'nbre_joueurs_max', 'commentaires'

SELECT * FROM jeux_video ;

-- Afficher le prix minimum, le prix maximum, le nom du jeu et le possesseur
SELECT MIN(prix) AS prix_mini FROM jeux_video ; -- 2
SELECT MAX(prix) AS prix_max FROM jeux_video ;  -- 60
SELECT MIN(prix), MAX(prix) FROM jeux_video ;   -- 2 et 60
SELECT MIN(prix) AS prix_mini, MAX(prix) AS prix_max FROM jeux_video ; 

SELECT MIN(prix) AS prix_mini, MAX(prix) AS prix_max, nom FROM jeux_video ; 
Error Code: 1140. In aggregated query without GROUP BY, expression #3 of SELECT list contains nonaggregated column 'SIMPLON.jeux_video.nom'; this is incompatible with sql_mode=only_full_group_by	0,00024 sec

-- la moyenne des prix
SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM jeux_video ; -- 28,08

-- La valeur totale
SELECT SUM(prix) AS prix_total FROM jeux_video ; -- 1432

-- le nb total de jeux
SELECT COUNT(nom) nb_total_jeux FROM jeux_video ; -- 51

-- la variance des prix des jeux videos
SELECT ROUND(VARIANCE(prix), 2) FROM jeux_video ; -- 314,62

-- l'ecart-type du prix des jeux_video
SELECT ROUND(STD(prix), 2) AS Ecart_type_prix FROM jeux_video ; -- 17,74

-- le nb de jeux par console
SELECT COUNT(nom) AS nb , console FROM jeux_video GROUP BY console ;
-- nb    console
-- '1', 'CONSOLE'
-- '3', 'Dreamcast'
-- '1', 'Gameboy'
-- '2', 'GameCube'
-- '2', 'GBA'
-- '3', 'Megadrive'
-- '3', 'NES'
-- '4', 'Nintendo 64'
-- '6', 'PC'
-- '4', 'PS'
-- '9', 'PS2'
-- '3', 'SuperNES'
-- '10', 'Xbox'

SELECT COUNT(nom) AS nb , console, possesseur FROM jeux_video GROUP BY console, possesseur ;
-- nb :	 console :    possesseur :
-- '1', 'CONSOLE', 'MOI'
-- '2', 'Dreamcast', 'Florent'
-- '1', 'Dreamcast', 'Patrick'
-- '1', 'Gameboy', 'Florent'...

-- liste des possesseurs qui ont plus de 5 jeux
SELECT COUNT(nom) AS nb, possesseur FROM jeux_video 
GROUP BY possesseur HAVING nb > 5 ;
--  nb    possesseur
-- '17', 'Florent'
-- '12', 'Michel'
-- '13', 'Patrick'

-- Afficher le nombre de films dans les quels à joué l'acteur « JOHNNY LOLLOBRIGIDA », 
-- regroupé par catégorie.
SELECT * FROM jeux_video ; 










