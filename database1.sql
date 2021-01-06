DROP TABLE IF EXISTS Universities;
DROP TABLE IF EXISTS UofC;
DROP TABLE IF EXISTS UBC;
DROP TABLE IF EXISTS Umanitoba;
DROP TABLE IF EXISTS Mcgill;
DROP TABLE IF EXISTS UofS;
DROP TABLE IF EXISTS UofT;

CREATE TABLE Universities (
    uni_Name VARCHAR (30) NOT NULL,
    location VARCHAR (50),
    PRIMARY KEY (uni_Name)
) engine InnoDB;

CREATE TABLE UofC (
    province VARCHAR (30) NOT NULL,
    uni_Name VARCHAR (30),
    cases NUMERIC (6),
    cdate DATE,
    PRIMARY KEY (province),
    FOREIGN KEY (uni_Name) REFERENCES Universities(uni_Name)
) engine InnoDB;

CREATE TABLE UBC (
    province VARCHAR (30) NOT NULL,
    uni_Name VARCHAR (30),
    cases NUMERIC (6),
    cdate DATE,
    PRIMARY KEY (province),
    FOREIGN KEY (uni_Name) REFERENCES Universities(uni_Name)
) engine InnoDB;

CREATE TABLE Umanitoba (
    province VARCHAR (30) NOT NULL,
    uni_Name VARCHAR (30),
    cases NUMERIC (6),
    cdate DATE,
    PRIMARY KEY (province),
    FOREIGN KEY (uni_Name) REFERENCES Universities(uni_Name)
) engine InnoDB;

CREATE TABLE Mcgill (
    province VARCHAR (30) NOT NULL,
    uni_Name VARCHAR (30),
    cases NUMERIC (6),
    cdate DATE,
    PRIMARY KEY (province),
    FOREIGN KEY (uni_Name) REFERENCES Universities(uni_Name)
) engine InnoDB;

CREATE TABLE UofS (
    province VARCHAR (30) NOT NULL,
    uni_Name VARCHAR (30),
    cases NUMERIC (6),
    cdate DATE,
    PRIMARY KEY (province),
    FOREIGN KEY (uni_Name) REFERENCES Universities(uni_Name)
) engine InnoDB;

CREATE TABLE UofT (
    province VARCHAR (30) NOT NULL,
    uni_Name VARCHAR (30),
    cases NUMERIC (6),
    cdate DATE,
    PRIMARY KEY (province),
    FOREIGN KEY (uni_Name) REFERENCES Universities(uni_Name)
) engine InnoDB;