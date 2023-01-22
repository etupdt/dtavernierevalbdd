
DROP DATABASE IF EXISTS cinema;

CREATE DATABASE cinema;

DROP USER IF EXISTS user_cinema@localhost;
DROP USER IF EXISTS admin_cinema@localhost;
DROP USER IF EXISTS service@localhost;

USE cinema;

CREATE TABLE IF NOT EXISTS movie_theaters (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(127) NOT NULL,
    address VARCHAR(255) NOT NULL		
);

CREATE TABLE IF NOT EXISTS cinema_rooms (
	id INT(11) AUTO_INCREMENT,
    name VARCHAR(127) NOT NULL,
    capacity int NOT NULL,
    is_located_in INT(11) NOT NULL,
	FOREIGN KEY (is_located_in) REFERENCES movie_theaters(id) ON DELETE CASCADE,
    PRIMARY KEY (id, is_located_in)
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
	id INT(11) AUTO_INCREMENT,
    movie_start_time DATETIME NOT NULL,
    reservations_counter INT NOT NULL,
    planned_by INT(11) NOT NULL,
    play INT(11) NOT NULL,
	FOREIGN KEY (planned_by) REFERENCES cinema_rooms(id),
	FOREIGN KEY (play) REFERENCES movies(id) ON DELETE CASCADE,
    PRIMARY KEY (id, play)
);

CREATE TABLE IF NOT EXISTS employees (
	id INT AUTO_INCREMENT,
    lastname VARCHAR(100) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    work_for INT(11) NOT NULL,
	FOREIGN KEY (work_for) REFERENCES movie_theaters(id) ON DELETE CASCADE,
    PRIMARY KEY (id, work_for)
);

CREATE TABLE IF NOT EXISTS cinema_administrators (
    total_view BOOLEAN NOT NULL,
    employee_id INT(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE IF NOT EXISTS cinema_users (
    authorized BOOLEAN NOT NULL,
    employee_id INT(11) NOT NULL PRIMARY KEY,
	FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE IF NOT EXISTS cinema_price (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(30),
    price DECIMAL(8, 2)
);

CREATE USER IF NOT EXISTS user_cinema@localhost IDENTIFIED BY 'pa$$w0rd';

GRANT SELECT ON cinema.* TO user_cinema@localhost;
GRANT SELECT, INSERT ON cinema.movie_shows TO user_cinema@localhost;

CREATE USER IF NOT EXISTS admin_cinema@localhost IDENTIFIED BY 'pa$$w0rd';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON cinema.* TO admin_cinema@localhost;

CREATE USER IF NOT EXISTS service@localhost IDENTIFIED BY 'pa$$w0rd';

GRANT SELECT, SHOW VIEW, LOCK TABLES, RELOAD, REPLICATION CLIENT ON *.* TO service@localhost;

FLUSH PRIVILEGES;

