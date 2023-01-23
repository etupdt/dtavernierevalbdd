
DROP DATABASE IF EXISTS cinema;

CREATE DATABASE cinema;

DROP USER IF EXISTS admin_cinema@'%';
DROP USER IF EXISTS user_cinema@localhost;
DROP USER IF EXISTS service@localhost;

USE cinema;

DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS cinema_price;
DROP TABLE IF EXISTS cinema_users;
DROP TABLE IF EXISTS cinema_administrators;
DROP TABLE IF EXISTS persons;
DROP TABLE IF EXISTS movie_shows;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS cinema_rooms;
DROP TABLE IF EXISTS movie_theaters;

CREATE TABLE IF NOT EXISTS movie_theaters (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(127) NOT NULL,
    address VARCHAR(255) NOT NULL		
);

CREATE TABLE IF NOT EXISTS cinema_rooms (
	id INT(11) ,
    name VARCHAR(127) NOT NULL,
    capacity int NOT NULL,
    is_located_in INT(11)
);

CREATE TABLE IF NOT EXISTS movies (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL
);

CREATE INDEX title ON movies (
    title,
    release_date
);

CREATE TABLE IF NOT EXISTS movie_shows (
	id INT(11),
    movie_start_time DATETIME NOT NULL,
    reservations_counter INT NOT NULL,
    planned_by INT(11) NOT NULL,
    play INT(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS persons (
	id INT,
    lastname VARCHAR(100) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    student BOOLEAN,
    work_for INT(11)
);

CREATE TABLE IF NOT EXISTS cinema_administrators (
    total_view BOOLEAN NOT NULL,
    person_id INT(11)
);

CREATE TABLE IF NOT EXISTS cinema_users (
    authorized BOOLEAN NOT NULL,
    person_id INT(11)
);

CREATE TABLE IF NOT EXISTS cinema_price (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(30),
    price DECIMAL(8, 2)
);

CREATE TABLE IF NOT EXISTS tickets (
	id INT(11),
    digital BOOLEAN,
    buy_by INT(11),
    cost INT(11) NOT NULL,
    concerning INT(11) NOT NULL
);

CREATE USER admin_cinema@'%' IDENTIFIED BY 'pa$$w0rd';

GRANT ALL ON cinema.* TO admin_cinema@'%' WITH GRANT OPTION;

CREATE USER IF NOT EXISTS service@localhost IDENTIFIED BY 'pa$$w0rd';

GRANT SELECT, SHOW VIEW, LOCK TABLES ON cinema.* TO service@localhost;

CREATE USER IF NOT EXISTS user_cinema@localhost IDENTIFIED BY 'pa$$w0rd';

GRANT SELECT, INSERT ON cinema.movie_shows TO user_cinema@localhost;
GRANT SELECT ON cinema.* TO user_cinema@localhost;

FLUSH PRIVILEGES;
