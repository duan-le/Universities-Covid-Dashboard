DROP TABLE IF EXISTS universities;
DROP TABLE IF EXISTS alberta;
DROP TABLE IF EXISTS quebec;
DROP TABLE IF EXISTS manitoba;
DROP TABLE IF EXISTS ontario;

CREATE TABLE universities (
    university_name VARCHAR (30) NOT NULL,
    location VARCHAR (50),
    PRIMARY KEY (university_name)
) engine InnoDB;

CREATE TABLE alberta (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range, university_name),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE quebec (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range, university_name),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE manitoba (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range, university_name),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE ontario (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range, university_name),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

 INSERT INTO `universities` (`university_name`, `location`) VALUES
('McGill University', '845 Sherbrooke St W, Montreal, Quebec H3A 0G4'),
('University of Calgary', '2500 University Dr NW, Calgary, AB T2N 1N4'),
('University of Manitoba', '66 Chancellors Cir, Winnipeg, MB R3T 2N2'),
('University of Toronto', '27 King\'s College Cir, Toronto, ON M5S');