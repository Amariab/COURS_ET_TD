USE SIMPLON ;

# AFFICHER LES TABLES DE LA BDD :
SHOW TABLES ;

# AFFICHER LES COLONNES DE LA TABLE "jeux_video" :
SHOW COLUMNS FROM jeux_video ;
DESCRIBE jeux_video ;

# AFFICHER LES NOMS DES JEUX
SELECT nom FROM jeux_video ;

# LISTER LES JEUX SUR « SUPERNES », TRIER LES RÉSULTATS PAR ORDRE ALPHABÉTIQUE DE NOM DE JEUX :
SELECT console, nom FROM jeux_video ;
SELECT nom FROM jeux_video WHERE console = "SuperNES";
SELECT nom FROM jeux_video WHERE console = "SuperNES" ORDER BY nom ;

# QUI POSSÈDE « STREET FIGHTER 2 » ? (nom de la console) 
SELECT console FROM jeux_video ;
SELECT nom, console FROM jeux_video WHERE nom = "Street Fighter 2" ;

# AFFICHER LES NOMS, CONSOLES ET PRIX DES 4 JEUX LES MOINS CHÈRES :
SHOW COLUMNS FROM jeux_video ;
SELECT nom, console, prix FROM jeux_video ORDER BY prix ASC LIMIT 4 ;

# AFFICHER LE NOM DES JEUX ET LE POSSESSEUR DONT LE POSSESSEUR CONTIENT UN « O » :
SHOW COLUMNS FROM jeux_video ;
SELECT nom, possesseur FROM jeux_video ;
SELECT nom, possesseur FROM jeux_video WHERE possesseur LIKE ("%o%") ;

# LISTER LES JEUX SUR « PC » DONT LE NOMBRE MAX DE JOUEURS ET COMPRIS ENTRE 4 ET 12 :
SHOW COLUMNS FROM jeux_video ;
SELECT console FROM jeux_video ;
SELECT nom FROM jeux_video WHERE console = "PC" AND nbre_joueurs_max BETWEEN 4 AND 12 ;
SELECT nom, nbre_joueurs_max FROM jeux_video WHERE console = "PC" AND nbre_joueurs_max BETWEEN 4 AND 12 ;

# AFFICHER SANS DOUBLONS LES CONSOLES :
SELECT DISTINCT console FROM jeux_video ;

# QUELLES SONT LES CONSOLES DONT LES JEUX SONT INFÉRIEURS À 15€ ?
SELECT console, nom, prix FROM jeux_video WHERE prix < 15 ORDER BY prix ASC ;

# QUELLES SONT LES CONSOLES DONT LES JEUX SONT TOUS INFÉRIEUR À 15€ ?
SELECT console FROM jeux_video GROUP BY console HAVING MAX(prix) < 15 ;

# QUELLES SONT LES CONSOLES DONT LE NOMBRE DE JOUEURS MAX EST 4 JOUEURS ?
SHOW COLUMNS FROM jeux_video ;
SELECT console FROM jeux_video WHERE nbre_joueurs_max = 4 ;

# ECRIRE LA REQUÊTE QUI PERMET DE LISTER LES NOMS DE JEUX QUI COMMENCE PAR UN B OU UN F  ET DONT LES POSSESSEUR ON UN E DANS LEUR PRÉNOMS :
SELECT nom, possesseur FROM jeux_video WHERE nom LIKE ("B%") OR nom LIKE ("F%") AND possesseur LIKE ("%e%") ;

# Insertion de données dans la BDD
SHOW COLUMNS FROM jeux_video ;
INSERT INTO	jeux_video (ID, nom, possesseur, console, prix, nbre_joueurs_max, commentaires)
 VALUES
(123, "LE JEU", "MOI", "CONSOLE", 15, 3, "blabla") ;














