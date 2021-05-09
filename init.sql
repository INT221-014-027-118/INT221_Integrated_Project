CREATE USER 'adminUser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'adminUser'@'%';

CREATE TABLE brand (
    brandid    SMALLINT NOT NULL,
    brandname  VARCHAR(40) NOT NULL
);

ALTER TABLE brand ADD CONSTRAINT brand_pk PRIMARY KEY ( brandid );

CREATE TABLE color (
    colorid    SMALLINT NOT NULL,
    colorname  VARCHAR(40) NOT NULL,
    hexcolor   VARCHAR(7)
);

ALTER TABLE color ADD CONSTRAINT color_pk PRIMARY KEY ( colorid );

CREATE TABLE product (
    productid    SMALLINT NOT NULL,
    productname  VARCHAR(40) NOT NULL,
    price        DECIMAL(7, 2) NOT NULL,
    description  VARCHAR(500),   
    brandid      SMALLINT NOT NULL,
    typeid       SMALLINT NOT NULL,
    warranty     TINYINT,
    launchdate   DATETIME NOT NULL,
    imageUrl     VARCHAR(20)
);

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( productid );

CREATE TABLE productcolor (
    productid  SMALLINT NOT NULL,
    colorid    SMALLINT NOT NULL
);

ALTER TABLE productcolor ADD CONSTRAINT relation_3_pk PRIMARY KEY ( productid,
                                                                    colorid );

CREATE TABLE type (
    typeid    SMALLINT NOT NULL,
    typename  VARCHAR(20) NOT NULL
);

ALTER TABLE type ADD CONSTRAINT type_pk PRIMARY KEY ( typeid );

ALTER TABLE product
    ADD CONSTRAINT product_brand_fk FOREIGN KEY ( brandid )
        REFERENCES brand ( brandid );

ALTER TABLE product
    ADD CONSTRAINT product_type_fk FOREIGN KEY ( typeid )
        REFERENCES type ( typeid );

ALTER TABLE productcolor
    ADD CONSTRAINT relation_3_color_fk FOREIGN KEY ( colorid )
        REFERENCES color ( colorid );

ALTER TABLE productcolor
    ADD CONSTRAINT relation_3_product_fk FOREIGN KEY ( productid )
        REFERENCES product ( productid );


INSERT INTO `brand` (`brandid`, `brandname`) VALUES
(1001, 'Asus'),
(1002, 'Acer'),
(1003, 'Sony'),
(1004, 'Logitech'),
(1005, 'HyperX'),
(1006, 'Microsoft'),
(1007, 'Signo'),
(1008, 'HP'),
(1009, 'Xiaomi'),
(1010, 'Razer'),
(1011, 'Ducky'),
(1012, 'Signo');

INSERT INTO `type` (`typeid`, `typename`) VALUES
(301, 'headset'),
(302, 'keyboard'),
(303, 'mouse');

INSERT INTO `color` (`colorid`, `colorname`, `hexcolor`) VALUES
(901, 'Black', '#000000'),
(902, 'Ivory', '#fffff0'),
(903, 'Gray79', '#c9c9c9'),
(904, 'Pink', '#ffa5b5'),
(905, 'Light blue', '#57bfff'),
(906, 'Blue', '#365aad'),
(907, 'Green', '#008972'),
(908, 'Purple', '#6857ab');










