SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `bqt_services`(
    `id` BINARY(16) NOT NULL,
    `reservation_id` BINARY(16) NOT NULL,
    `service_type` BINARY(16) NOT NULL,
    `amount` DECIMAL(11, 2) NULL,
    `commission_amount` DECIMAL(11, 2) NULL,
    `created_at` DATETIME DEFAULT NULL,
    `updated_at` DATETIME DEFAULT NULL,
    `created_by` BINARY(16) DEFAULT NULL,
    `updated_by` BINARY(16) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8

CREATE TABLE `bqt_contractors` (
  `id` binary(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ph_num` varchar(50) NOT NULL,
  `ph_alt_num` varchar(50) DEFAULT NULL,
  `id_card` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `client_id` binary(16) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL,
  `area` varchar(150) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `nearest_place` varchar(50) DEFAULT NULL,
  `flat_no` varchar(50) DEFAULT NULL,
  `country` binary(16) NOT NULL,
  `city` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `bqt_expenses` (
  `ID` binary(16) NOT NULL,
  `CLIENT_ID` binary(16) NOT NULL,
  `AMOUNT` int(50) NOT NULL,
  `NOTE` varchar(50) DEFAULT NULL,
  `EXPENSE_TYPE` binary(16) DEFAULT NULL,
  `IMAGE_ID` binary(16) DEFAULT NULL,
  `BANQUET_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bqt_banquets` (
  `ID` binary(16) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `NAME_AR` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(200) NOT NULL,
  `COUNTRY` binary(16) NOT NULL,
  `CITY` binary(16) NOT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `IMAGE_ID` binary(16) DEFAULT NULL,
  `client_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `bqt_customers` (
  `id` binary(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ph_num` varchar(50) NOT NULL,
  `ph_alt_num` varchar(50) DEFAULT NULL,
  `id_card` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` binary(16) NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `client_id` binary(16) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL,
  `area` varchar(150) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `nearest_place` varchar(50) DEFAULT NULL,
  `flat_no` varchar(50) DEFAULT NULL,
  `country` binary(16) NOT NULL,
  `city` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `bqt_discounts` (
  `ID` binary(16) NOT NULL,
  `HALL_ID` binary(16) NOT NULL,
  `FROM_DATE` date NOT NULL,
  `TO_DATE` date NOT NULL,
  `DISCOUNT` decimal(11,2) NOT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bqt_halls` (
  `ID` binary(16) NOT NULL,
  `HALL_TYPE` binary(16) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `NAME_AR` varchar(50) DEFAULT NULL,
  `AREA` decimal(11,2) DEFAULT '0.00',
  `UOM` binary(16) NOT NULL,
  `CHAIRS_CNT` int(11) NOT NULL,
  `CAPACITY` int(11) NOT NULL,
  `SEC_DEP` decimal(11,2) DEFAULT '0.00',
  `IMAGE_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `banquet_id` binary(16) NOT NULL,
  `client_id` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `bqt_prices` (
  `id` binary(16) NOT NULL,
  `hall_id` binary(16) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `uop` binary(16) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `clients` (
  `ID` binary(16) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `NAME_AR` varchar(40) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(500) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `logo_img` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `images` (
  `ID` binary(16) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `IMAGEURL` varchar(120) DEFAULT NULL,
  `WIDTH` bigint(10) DEFAULT NULL,
  `HEIGHT` bigint(10) DEFAULT NULL,
  `MIMETYPE` varchar(255) DEFAULT NULL,
  `EXT` varchar(60) DEFAULT NULL,
  `CLIENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `modules` (
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `name_ar` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` varchar(500) CHARACTER SET latin1 NOT NULL,
  `client_id` binary(16) NOT NULL,
  `id` binary(16) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` binary(16) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `modules` (`name`, `name_ar`, `description`, `client_id`, `id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
('Administrative Module', 'Administrative Module', 'Administrative Module', 0x30303030303030302d303030302d3030, 0x33626263663536632d616362392d3432, '2019-04-22 07:56:27', 0x30303030303030302d303030302d3030, '2019-04-22 07:56:27', 0x30303030303030302d303030302d3030),
('Banquet Module', 'Banquet Module', 'Banquet Module', 0x30303030303030302d303030302d3030, 0x34383363653264612d336362612d3438, '2019-04-22 07:56:38', 0x30303030303030302d303030302d3030, '2019-04-22 07:56:38', 0x30303030303030302d303030302d3030);

CREATE TABLE `module_clients` (
  `client_id` binary(16) NOT NULL,
  `module_id` binary(16) NOT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `created_by` 


CREATE TABLE `module_screens` (
  `client_id` binary(16) NOT NULL,
  `module_id` binary(16) NOT NULL,
  `screen_id` binary(16) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` binary(16) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `parameters` (
  `ID` binary(16) NOT NULL,
  `TYPE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `NAME_AR` varchar(50) DEFAULT NULL,
  `CODE` varchar(50) NOT NULL,
  `PARENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `ID` binary(16) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `NAME_AR` varchar(60) NOT NULL,
  `CLIENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `role_screens` (
  `ROLE_ID` binary(16) NOT NULL,
  `SCREEN_ID` binary(16) NOT NULL,
  `CLIENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `IS_EDITABLE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `screens` (
  `ID` binary(16) NOT NULL,
  `NAME` varchar(60) NOT NULL,
  `URL` varchar(100) NOT NULL,
  `CLIENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `NAME_AR` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `ID` binary(16) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `USERNAME` varchar(15) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `CLIENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL,
  `NAME_AR` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user_roles` (
  `USER_ID` binary(16) NOT NULL,
  `ROLE_ID` binary(16) NOT NULL,
  `CLIENT_ID` binary(16) DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` binary(16) DEFAULT NULL,
  `UPDATED_BY` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `bqt_banquets`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BQT_UK` (`NAME`),
  ADD KEY `COUNTRY_FK` (`COUNTRY`),
  ADD KEY `CITY_FK` (`CITY`),
  ADD KEY `IMAGE_ID_FK` (`IMAGE_ID`),
  ADD KEY `Client_id_fk` (`client_id`);

ALTER TABLE `bqt_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_card` (`id_card`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `country` (`country`),
  ADD KEY `city` (`city`);

ALTER TABLE `bqt_discounts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `HALL_ID_FK` (`ID`),
  ADD KEY `ID_FK` (`HALL_ID`);

ALTER TABLE `bqt_halls`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME_UK` (`NAME`),
  ADD KEY `HALL_TYPE_FK` (`HALL_TYPE`),
  ADD KEY `UNIT_OF_MEASURE_FK` (`UOM`),
  ADD KEY `IMAGE_ID_FK` (`IMAGE_ID`),
  ADD KEY `banquet_id_fk` (`banquet_id`);

ALTER TABLE `bqt_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HALL_ID_FK` (`hall_id`),
  ADD KEY `UNIT_OF_PRICE_FK` (`uop`);

ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `INJAZ_CLIENT_UK` (`NAME`),
  ADD UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`);

ALTER TABLE `images`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IMAGE_CLIENT_FK` (`CLIENT_ID`);

ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

ALTER TABLE `module_clients`
  ADD PRIMARY KEY (`client_id`,`module_id`),
  ADD KEY `MODULE_CLIENTS_MODULE_FK_idx` (`module_id`);

ALTER TABLE `module_screens`
  ADD PRIMARY KEY (`module_id`,`screen_id`),
  ADD KEY `index2` (`module_id`),
  ADD KEY `module_screens_FK` (`screen_id`);

ALTER TABLE `parameters`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `PARAMETER_UK` (`NAME`,`CODE`),
  ADD UNIQUE KEY `PARA_CODE_UNIQUE` (`CODE`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ROLES_UK2` (`NAME`,`CLIENT_ID`),
  ADD KEY `ROLES_UK1` (`CLIENT_ID`) USING BTREE;

ALTER TABLE `role_screens`
  ADD PRIMARY KEY (`ROLE_ID`,`SCREEN_ID`),
  ADD KEY `ROLE_SCREENS_SCREEN_FK` (`SCREEN_ID`),
  ADD KEY `ROLE_SCREENS_CLIENT_FK` (`CLIENT_ID`);

ALTER TABLE `screens`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SCREENS_UK1` (`NAME`),
  ADD UNIQUE KEY `SCREENS_UK2` (`URL`),
  ADD KEY `SCREENS_CLIENT_FK` (`CLIENT_ID`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_USERS_USERNAME` (`USERNAME`),
  ADD UNIQUE KEY `UK_USERS_EMAIL` (`EMAIL`),
  ADD KEY `INJAZ_USER_CLIENT_FK` (`CLIENT_ID`);

ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`USER_ID`,`ROLE_ID`),
  ADD KEY `USER_ROLES_ROLE_FK` (`ROLE_ID`);

ALTER TABLE `bqt_banquets`
  ADD CONSTRAINT `BANQUET_IMAGE_ID_FK` FOREIGN KEY (`IMAGE_ID`) REFERENCES `images` (`ID`),
  ADD CONSTRAINT `CITY_FK` FOREIGN KEY (`CITY`) REFERENCES `parameters` (`ID`),
  ADD CONSTRAINT `COUNTRY_FK` FOREIGN KEY (`COUNTRY`) REFERENCES `parameters` (`ID`),
  ADD CONSTRAINT `Client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`ID`);

ALTER TABLE `bqt_customers`
  ADD CONSTRAINT `city	` FOREIGN KEY (`city`) REFERENCES `parameters` (`ID`),
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`ID`),
  ADD CONSTRAINT `country` FOREIGN KEY (`country`) REFERENCES `parameters` (`ID`);

ALTER TABLE `bqt_discounts`
  ADD CONSTRAINT `ID_FK` FOREIGN KEY (`HALL_ID`) REFERENCES `bqt_halls` (`ID`);

ALTER TABLE `bqt_halls`
  ADD CONSTRAINT `HALL_TYP_FK` FOREIGN KEY (`HALL_TYPE`) REFERENCES `parameters` (`ID`),
  ADD CONSTRAINT `IMAGE_ID_FK` FOREIGN KEY (`IMAGE_ID`) REFERENCES `images` (`ID`),
  ADD CONSTRAINT `UNIT_OF_MEASURE_FK` FOREIGN KEY (`UOM`) REFERENCES `parameters` (`ID`),
  ADD CONSTRAINT `banquet_id_fk` FOREIGN KEY (`banquet_id`) REFERENCES `bqt_banquets` (`ID`);

ALTER TABLE `bqt_prices`
  ADD CONSTRAINT `HALL_ID_FK` FOREIGN KEY (`hall_id`) REFERENCES `bqt_halls` (`ID`),
  ADD CONSTRAINT `UNIT_OF_PRICE_FK` FOREIGN KEY (`uop`) REFERENCES `parameters` (`ID`);

ALTER TABLE `images`
  ADD CONSTRAINT `IMAGE_CLIENT_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`);

ALTER TABLE `module_clients`
  ADD CONSTRAINT `module_clients_FK` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

ALTER TABLE `module_screens`
  ADD CONSTRAINT `module_screens_FK` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`ID`),
  ADD CONSTRAINT `module_screens_LOGO_FK` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

ALTER TABLE `roles`
  ADD CONSTRAINT `ROLES_CLIENT_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`);

ALTER TABLE `role_screens`
  ADD CONSTRAINT `ROLE_SCREENS_CLIENT_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`),
  ADD CONSTRAINT `ROLE_SCREENS_ROLE_FK` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  ADD CONSTRAINT `ROLE_SCREENS_SCREEN_FK` FOREIGN KEY (`SCREEN_ID`) REFERENCES `screens` (`ID`);

ALTER TABLE `screens`
  ADD CONSTRAINT `SCREENS_CLIENT_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`);

ALTER TABLE `users`
  ADD CONSTRAINT `INJAZ_USER_CLIENT_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`);

ALTER TABLE `user_roles`
  ADD CONSTRAINT `USER_ROLES_ROLE_FK` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  ADD CONSTRAINT `USER_ROLES_USER_FK` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`);

CREATE TABLE `bqt_hall_documents`(
    `ID` BINARY(16) NOT NULL,
    `NAME` VARHCAR(50) NULL,
    `HALL_ID` BINARY(16) NOT NULL,
    `DOCUMENTID` BINARY(16) NOT NULL,
    `CREATED_AT` DATETIME DEFAULT NULL,
    `UPDATED_AT` DATETIME DEFAULT NULL,
    `CREATED_BY` BINARY(16) DEFAULT NULL,
    `UPDATED_BY` BINARY(16) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8; 
ALTER TABLE
    `bqt_discounts` ADD PRIMARY KEY(`ID`),
    ADD KEY `ID_FK`(`HALL_ID`);
ALTER TABLE
    `bqt_discounts` ADD CONSTRAINT `ID_FK` FOREIGN KEY(`HALL_ID`) REFERENCES `bqt_halls`(`ID`);

    ALTER TABLE `bqt_hall_documents` ADD `name` VARCHAR(50) NOT NULL AFTER `ID`;

CREATE TABLE `bqt_reservations`(
    `id` BINARY(16) NOT NULL,
    `customer` BINARY(16) NOT NULL,
    `banquet` BINARY(16) NOT NULL,
    `hall` BINARY(16) NOT NULL,
    `from_date` DATE DEFAULT NULL,
    `to_date` DATE DEFAULT NULL,
    `from_time` TIME DEFAULT NULL,
    `to_time` TIME DEFAULT NULL,
    `status` VARCHAR(10) NULL,
    `notes` VARCHAR(100) NULL,
    `reservation_date` DATETIME NOT NULL,
     `event_type` VARCHAR(25) NULL,
    `no_person` INT NULL,
    `sec_dep` DECIMAL(11,2) NULL,
    `total_ammount` DECIMAL(11,2) NULL,
    `recieved_ammount` DECIMAL(11,2) NULL,
    `total_rent` DECIMAL(11,2) NULL,
    `CREATED_AT` DATETIME DEFAULT NULL,
    `UPDATED_AT` DATETIME DEFAULT NULL,
    `CREATED_BY` BINARY(16) DEFAULT NULL,
    `UPDATED_BY` BINARY(16) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8

ALTER TABLE `bqt_erp`.`bqt_reservations` ADD PRIMARY KEY (`id`);
ALTER TABLE `bqt_erp`.`bqt_reservations` ADD INDEX (`customer`);
ALTER TABLE `bqt_erp`.`bqt_reservations` ADD INDEX (`banquet`);
ALTER TABLE `bqt_erp`.`bqt_reservations` ADD INDEX (`hall`);


ALTER TABLE `bqt_reservations` ADD  CONSTRAINT `banquet` FOREIGN KEY (`banquet`) REFERENCES `bqt_banquets`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bqt_reservations` ADD  CONSTRAINT `hall` FOREIGN KEY (`hall`) REFERENCES `bqt_halls`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bqt_reservations` ADD  CONSTRAINT `customer` FOREIGN KEY (`customer`) REFERENCES `bqt_customers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bqt_erp`.`bqt_reservations` ADD INDEX (`event_type`);
ALTER TABLE `bqt_reservations` ADD `client_id` BINARY(16) NOT NULL AFTER `hall`;
ALTER TABLE `bqt_reservations` ADD CONSTRAINT `c_id` FOREIGN KEY (`client_id`) REFERENCES `clients`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


CREATE TABLE `bqt_payments`(
    `id` BINARY(16) NOT NULL,
    `reservation_id` BINARY(16) NOT NULL,
    `payment_type` BINARY(16) NOT NULL,
    `ammount` DECIMAL(11,2) NULL,
    `created_at` DATETIME DEFAULT NULL,
    `updated_at` DATETIME DEFAULT NULL,
    `created_by` BINARY(16) DEFAULT NULL,
    `updated_by` BINARY(16) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8
ALTER TABLE `bqt_erp`.`bqt_payments` ADD PRIMARY KEY (`id`);
ALTER TABLE `bqt_payments` ADD  CONSTRAINT `reservation_id_fk` FOREIGN KEY (`reservation_id`) REFERENCES `bqt_reservations`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `bqt_payments` ADD  CONSTRAINT `payment_type_fk` FOREIGN KEY (`payment_type`) REFERENCES `parameters`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;


CREATE TABLE DOC_SEQ(
    ID BINARY(16) NOT NULL,
    INCREMENTNO INT DEFAULT 0,
    STARTNO INT DEFAULT 0,
    CURRENTNEXT INT DEFAULT 0,
    TABLE_NAME VARCHAR(30) NOT NULL,
    PREFIX VARCHAR(10) DEFAULT NULL,
    SUFFIX VARCHAR(10) DEFAULT NULL,
    CLIENT_ID BINARY(16) DEFAULT NULL,
    CREATED_AT DATETIME DEFAULT NULL,
    UPDATED_AT DATETIME DEFAULT NULL,
    CREATED_BY BINARY(16) DEFAULT NULL,
    UPDATED_BY BINARY(16) DEFAULT NULL,
    PRIMARY KEY(ID),
    UNIQUE KEY INJAZ_DOC_SEQ_INV_UK(CLIENT_ID, TABLE_NAME),
    CONSTRAINT INJAZ_DOC_SEQ_CLIENT_FK FOREIGN KEY(CLIENT_ID) REFERENCES CLIENTS(id)) ENGINE = INNODB DEFAULT CHARSET = UTF8
    ALTER TABLE `bqt_reservations` ADD `no.` INT NOT NULL AFTER `id`;
    ALTER TABLE `bqt_reservations` ADD `uop` varchar;
