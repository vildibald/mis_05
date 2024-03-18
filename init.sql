USE ais;

CREATE TABLE student
(
    id         INT PRIMARY KEY,
    meno       VARCHAR(255),
    priezvisko VARCHAR(255),
    pohlavie   INT,
    rocnik     INT,
    obor       VARCHAR(255),
    titul      VARCHAR(255)
);

CREATE TABLE predmet
(
    id                INT PRIMARY KEY,
    nazov             VARCHAR(255),
    fakulta           VARCHAR(255),
    ustav             VARCHAR(255),
    odporucany_rocnik INT,
    kredity           INT,
    pocet_hodin       INT
);

CREATE TABLE zapisany_predmet
(
    id         INT PRIMARY KEY,
    student_id INT,
    predmet_id INT,
    opakuje    INT,
    CONSTRAINT fk_zapisany_predmet_student_id FOREIGN KEY (student_id) REFERENCES student (id),
    CONSTRAINT fk_zapisany_predmet_predmet_id FOREIGN KEY (predmet_id) REFERENCES predmet (id)
);

LOAD DATA INFILE '/var/lib/mysql-files/csv/MIS_databaza_student.csv'
INTO TABLE student
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/csv/MIS_databaza_predmet.csv'
INTO TABLE predmet
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE '/var/lib/mysql-files/csv/MIS_databaza_zapisany_predmet.csv'
INTO TABLE zapisany_predmet
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;