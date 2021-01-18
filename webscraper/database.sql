DROP TABLE IF EXISTS universities;
DROP TABLE IF EXISTS alberta;
DROP TABLE IF EXISTS british_columbia;
DROP TABLE IF EXISTS saskatchewan;
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
    PRIMARY KEY (date_range),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE british_columbia (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE saskatchewan (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE quebec (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE manitoba (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;

CREATE TABLE ontario (
    university_name VARCHAR (30),
    cases VARCHAR (30),
    date_range VARCHAR (60),
    PRIMARY KEY (date_range),
    FOREIGN KEY (university_name) REFERENCES universities(university_name)
) engine InnoDB;