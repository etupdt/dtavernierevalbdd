
ALTER TABLE cinema_rooms
	MODIFY id INT AUTO_INCREMENT,
	ADD FOREIGN KEY (is_located_in) REFERENCES movie_theaters(id) ON DELETE CASCADE,
    ADD PRIMARY KEY (id, is_located_in);

ALTER TABLE movie_shows
	MODIFY id INT AUTO_INCREMENT,
	ADD FOREIGN KEY (planned_by) REFERENCES cinema_rooms(id),
	ADD FOREIGN KEY (play) REFERENCES movies(id) ON DELETE CASCADE,
    ADD PRIMARY KEY (id, play);

ALTER TABLE persons 
	MODIFY id INT AUTO_INCREMENT PRIMARY KEY,
	ADD FOREIGN KEY (work_for) REFERENCES movie_theaters(id);

ALTER TABLE cinema_administrators 
    MODIFY person_id INT(11) NOT NULL PRIMARY KEY,
	ADD FOREIGN KEY (person_id) REFERENCES persons(id);

ALTER TABLE cinema_users 
    MODIFY person_id INT(11) NOT NULL PRIMARY KEY,
	ADD FOREIGN KEY (person_id) REFERENCES persons(id);

ALTER TABLE tickets 
	MODIFY id INT(11) AUTO_INCREMENT PRIMARY KEY,
	ADD FOREIGN KEY (buy_by) REFERENCES persons(id),
	ADD FOREIGN KEY (cost) REFERENCES cinema_price(id),
	ADD FOREIGN KEY (concerning) REFERENCES movie_shows(id);
