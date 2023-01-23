# dtavernierevalbdd
Evaluation Base de données

## Database cinema

Gestion de l'achat de tickets de cinéma pour un ensemble de cinémas associés entre eux.

## Etapes de mise en place de la database :

Pour créer la database, les étapes doivent être exécutées dans l'ordre. l'ensemble des étapes peut être rejouées sans erreurs.

### - Création des tables : 01_root_init_database_cinema.sql

A lancer par le user root, il crée la database, les tables et les users :

- admin_cinema : user ayant tous les droits sur la database, dont celui de restauration de la database
- user_cinema : les employés des cinémas qui ont les droits de mise à jour sur les tables
- service : user de service executant les dumps de la database

### - Modification des tables pour mise en place des contraintes : 02_root_constraints_database_cinema.sql

A lancer par le user admin_cinema, il cré les contraintes.

### - Insertion des jeux de tests : 03_admin_insert_cinema.sql

A lancer par le user admin_cinema, il cré les enregistrements de tests dans les différentes tables.
