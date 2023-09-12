DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`
(
    id      bigint(20) NOT NULL AUTO_INCREMENT,
    name    varchar(255),
    address varchar(255),
    PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;