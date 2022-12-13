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