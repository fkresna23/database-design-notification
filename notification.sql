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

# Notification

CREATE TABLE notification
(
    id        INT          NOT NULL AUTO_INCREMENT,
    title     VARCHAR(255) NOT NULL,
    detail    TEXT         NOT NULL,
    create_at TIMESTAMP    NOT NULL,
    user_id   VARCHAR(100),
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW TABLES;

ALTER TABLE notification
    ADD CONSTRAINT fk_notification_user
        FOREIGN KEY (user_id) REFERENCES user (id);

DESC notification;

INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pesanan', 'Detail Pesanan', CURRENT_TIMESTAMP(), 'kresna');
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Promo', 'Detail Promo', CURRENT_TIMESTAMP(), null);
INSERT INTO notification(title, detail, create_at, user_id)
VALUES ('Contoh Pembayaran', 'Detail Pembayaran', CURRENT_TIMESTAMP(), 'pahlawan');

SELECT *
FROM notification;

SELECT *
FROM notification
WHERE (user_id = 'kresna' OR user_id IS NULL)
ORDER BY create_at DESC;

SELECT *
FROM notification
WHERE (user_id = 'pahlawan' OR user_id IS NULL)
ORDER BY create_at DESC;

# Category

CREATE TABLE category
(
    id   VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW TABLES;

ALTER TABLE notification
    ADD COLUMN category_id VARCHAR(100);

DESCRIBE notification;

ALTER TABLE notification
    ADD CONSTRAINT fk_notification_category
        FOREIGN KEY (category_id) REFERENCES category (id);

DESC notification;

SELECT *
FROM notification;

INSERT INTO category(id, name)
VALUES ('INFO', 'Info');
INSERT INTO category(id, name)
VALUES ('PROMO', 'Promo');

SELECT *
FROM category;

UPDATE notification
SET category_id = 'INFO'
WHERE id = 1;

UPDATE notification
SET category_id = 'PROMO'
WHERE id = 2;

UPDATE notification
SET category_id = 'INFO'
WHERE id = 3;

SELECT *
FROM notification;

SELECT *
FROM notification
WHERE (user_id = 'kresna' OR user_id IS NULL)
ORDER BY create_at DESC;

SELECT *
FROM notification n
         JOIN category c ON (n.category_id = c.id)
WHERE (n.user_id = 'kresna' OR n.user_id IS NULL)
ORDER BY n.create_at DESC;

SELECT *
FROM notification n
         JOIN category c ON (n.category_id = c.id)
WHERE (n.user_id = 'pahlawan' OR n.user_id IS NULL)
ORDER BY n.create_at DESC;

SELECT *
FROM notification n
         JOIN category c ON (n.category_id = c.id)
WHERE (n.user_id = 'pahlawan' OR n.user_id IS NULL)
  AND c.id = 'INFO'
ORDER BY n.create_at DESC;