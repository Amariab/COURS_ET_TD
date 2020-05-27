#créer un utilisateur admin1
create user 'admin1'@'localhost' identified by 'password';

#lui donner le droit de céer d'autre utilisateurs, afficher toute les bases de données et d'utiliser la commande shutdown
grant create user, show databases, shutdown on * to admin1;

#créer un utilisateur user1
create user 'user1'@'localhost' identified by 'password';

#lui octroyer le droit de créer,suprimer et modifier une table
grant create, drop, update, alter on nom_table to user1;

#lui donner la possibilité de verouiller une table
grant lock on nom_table to user1;

#lui autoriser la création de nouvelle clé primaire
grant references on * to user1;

# créer un utilisateur user2
create user 'user2'@'localhost' identified by 'password';

#lui autoriser l'execution de la commande select
grant select on * to user2;

#lui autoriser l'execution de la commande insert 
grant insert on * to user2;

#lui autoriser la'execution de la commande update
grant update on * to user2;

#lui autoriser l'execution de la commande delete 
grant delete on * to user2;
