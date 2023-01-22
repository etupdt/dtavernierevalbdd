
USE cinema;

TRUNCATE TABLE cinema_users;
TRUNCATE TABLE cinema_price;
TRUNCATE TABLE employees;
TRUNCATE TABLE cinema_rooms;
TRUNCATE TABLE movie_theaters;
TRUNCATE TABLE movies;
TRUNCATE TABLE movie_shows;

INSERT INTO movie_theaters (name, address) VALUES ('UGC CINÉ CITÉ LES HALLES', 'Forum des Halles - Niveau -3 75001 PARIS');
INSERT INTO movie_theaters (name, address) VALUES ('UGC GRAND NORMANDIE', '116 bis, avenue des Champs-Elysées 75008 PARIS');
INSERT INTO movie_theaters (name, address) VALUES ('UGC CINÉ CITÉ MAILLOT', '2, place de la Porte Maillot - Palais des Congrès - Niveau -1 75017 PARIS');

INSERT INTO cinema_rooms (name, capacity, is_located_in) VALUES ('Salle 1', 150, 1);
INSERT INTO cinema_rooms (name, capacity, is_located_in) VALUES ('Salle 2', 150, 1);
INSERT INTO cinema_rooms (name, capacity, is_located_in) VALUES ('Salle A', 150, 2);
INSERT INTO cinema_rooms (name, capacity, is_located_in) VALUES ('Salle 1', 150, 3);
INSERT INTO cinema_rooms (name, capacity, is_located_in) VALUES ('Salle 2', 150, 3);

INSERT INTO movies (title, release_date) VALUES ('CET ETE LA', '2023-01-04');
INSERT INTO movies (title, release_date) VALUES ('AVATAR : LA VOIE DE L''EAU', '2022-12-14');
INSERT INTO movies (title, release_date) VALUES ('BABYLON', '2023-01-18');
INSERT INTO movies (title, release_date) VALUES ('CARAVAGE', '2022-12-28');
INSERT INTO movies (title, release_date) VALUES ('NOSTALGIA', '2023-01-04');
INSERT INTO movies (title, release_date) VALUES ('RETOUR A SEOUL', '2023-01-25');
INSERT INTO movies (title, release_date) VALUES ('LES BANSHEES D''INISHERIN', '2022-12-28');

INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 14:00:00', 125, 1, 1);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 17:00:00', 15, 1, 4);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 20:00:00', 136, 1, 6);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 14:00:00', 89, 2, 2);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 17:00:00', 100, 2, 1);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 20:00:00', 67, 2, 7);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 14:00:00', 10, 3, 1);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 17:00:00', 39, 3, 2);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 20:00:00', 154, 3, 3);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 14:00:00', 61, 4, 2);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 17:00:00', 19, 4, 3);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 14:00:00', 125, 5, 1);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 17:00:00', 15, 5, 4);
INSERT INTO movie_shows (movie_start_time, reservations_counter, planned_by, play) VALUES ('2023-02-16 20:00:00', 136, 5, 2);

INSERT INTO employees (lastname, firstname, work_for) VALUES ('Dupont', 'Bernard', 1);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Durand', 'Delphine', 1);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Colona', 'Alfred', 1);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Paris', 'Nathalie', 1);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Montesquieu', 'Julie', 1);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Lebon', 'Philippe', 2);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Chaffoin', 'Claude', 2);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Leblanc', 'Isabelle', 2);
INSERT INTO employees (lastname, firstname, work_for) VALUES ('Ducreux', 'Sophie', 3);

INSERT INTO cinema_administrators (total_view, employee_id) VALUES (0, 1);
INSERT INTO cinema_administrators (total_view, employee_id) VALUES (1, 4);
INSERT INTO cinema_administrators (total_view, employee_id) VALUES (1, 7);

INSERT INTO cinema_users (authorized, employee_id) VALUES (0, 2);
INSERT INTO cinema_users (authorized, employee_id) VALUES (1, 3);
INSERT INTO cinema_users (authorized, employee_id) VALUES (0, 5);
INSERT INTO cinema_users (authorized, employee_id) VALUES (0, 6);
INSERT INTO cinema_users (authorized, employee_id) VALUES (1, 8);
INSERT INTO cinema_users (authorized, employee_id) VALUES (1, 9);

INSERT INTO cinema_price (type, price) VALUES ('Plein tarif', 9.20);
INSERT INTO cinema_price (type, price) VALUES ('Étudiant', 7.60);
INSERT INTO cinema_price (type, price) VALUES ('Moins de 14 ans', 5.90);
