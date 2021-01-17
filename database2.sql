DROP TABLE IF EXISTS Universities;
DROP TABLE IF EXISTS Alberta;
DROP TABLE IF EXISTS British_Columbia;
DROP TABLE IF EXISTS Saskatchewan;
DROP TABLE IF EXISTS Quebec;
DROP TABLE IF EXISTS Manitoba;
DROP TABLE IF EXISTS Ontario;

CREATE TABLE Universities (
    uni_Name VARCHAR (30) NOT NULL,
    location VARCHAR (50),
    PRIMARY KEY (uni_name)
) engine InnoDB;

CREATE TABLE Alberta (
    
    uni_name VARCHAR (30),
    cases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE British_Columbia (
    
    uni_name VARCHAR (30),
    cases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Saskatchewan (
    
    uni_name VARCHAR (30),
    cases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Quebec (
    
    uni_name VARCHAR (30),
    cases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Manitoba (
    
    uni_name VARCHAR (30),
    cases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Ontario (
    
    uni_name VARCHAR (30),
    cases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;