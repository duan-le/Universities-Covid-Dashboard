DROP TABLE IF EXISTS Universities;
DROP TABLE IF EXISTS Alberta;
DROP TABLE IF EXISTS Quebec;
DROP TABLE IF EXISTS Manitoba;
DROP TABLE IF EXISTS Ontario;
DROP TABLE IF EXISTS Summary;

CREATE TABLE Universities (
    uni_Name VARCHAR (30) NOT NULL,
    location VARCHAR (50),
    PRIMARY KEY (uni_name)
) engine InnoDB;

CREATE TABLE Alberta (
    
    uni_name VARCHAR (30),
    acases VARCHAR (30),
    tdeaths VARCHAR (30),
    tcases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)

) engine InnoDB;

CREATE TABLE Quebec (
    
    uni_name VARCHAR (30),
    acases VARCHAR (30),
    tdeaths VARCHAR (30),
    tcases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Manitoba (
    
    uni_name VARCHAR (30),
    acases VARCHAR (30),
    tdeaths VARCHAR (30),
    tcases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Ontario (
    
    uni_name VARCHAR (30),
    acases VARCHAR (30),
    tdeaths VARCHAR (30),
    tcases VARCHAR (30),
    cdate VARCHAR (60),
    PRIMARY KEY (cdate),
    FOREIGN KEY (uni_name) REFERENCES Universities(uni_name)
) engine InnoDB;

CREATE TABLE Summary (
    province VARCHAR (30),
    ndeaths VARCHAR (30),
    ncase VARCHAR (30),
    acases VARCHAR (30),
    tdeaths VARCHAR (30),
    tcase VARCHAR (30),
    PRIMARY KEY (province)
 ) engine InnoDB;