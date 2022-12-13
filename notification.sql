CREATE DATABASE belajar_mysql_notification;

USE belajar_mysql_notification;

SHOW TABLES;

# User

CREATE TABLE user
(
    id   VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW TABLES;

INSERT INTO user(id, name)
VALUES ('kresna', 'Fajar Kresna');
INSERT INTO user(id, name)
VALUES ('pahlawan', 'Fajar Pahlawan');

SELECT *
FROM user;