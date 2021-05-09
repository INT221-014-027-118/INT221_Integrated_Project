ALTER USER 'adminUser'@'%' IDENTIFIED BY 'password';
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


INSERT INTO `product` (`productid`, `productname`, `price`, `description`, `brandid`, `typeid`, `warranty`, `launchdate`, `imageUrl`) VALUES
(1, 'H100', '280.00', 'H100 ได้รับการออกแบบให้มีความแข็งแรงและทนทานซึ่งเหมาะสำหรับอายุการใช้งานที่ยาวนาน\nฟองน้ำรองหูฟังที่สวมใส่สบายและระบายอากาศได้ดีเหมาะสำหรับการเล่นเกมเป็นเวลานาน\nพูดด้วยความมั่นใจว่าไมโครโฟนจะถ่ายทอดเสียงของคุณด้วยความดังและความชัดเจนที่เหมาะสม\nด้วยตัวขับเสียงขนาด 50 มม. H100 มอบประสิทธิภาพที่แข็งแกร่งในการสร้างเสียงความถี่ต่ำและสูง\nสายสัญญาณเสียงหลักได้รับการเสริมสมรรถภาพเพื่อให้ได้คุณภาพที่ยาวนาน', 1008, 301, 1, '2017-03-15', 'hp_h100.jpg'),
(2, 'H500', '749.00', 'ลำโพงขนาด 50มม.ความต้านทานลำโพง 22โอมห์\nUSB LED Backlight. Volume Control\nไมค์โครโฟนตัดสัญญาณเสียงรบกวน\nAudio Jack 3.5มม.\nสายยาว 2.15 เมตร', 1008, 301, 1, '2017-03-15', 'hp_h500.jpg'),
(3, 'H300', '625.00', 'Headset that uses 4D analog loudspeaker displacement technology to let you feel the sound.\\nConvenient Control - Flexible mic for uncompromised vocal clarity.\\nVolume control is a wheel design on the back the left ear of Headset.\\nActivate the vibration driver by pressing the control button to deliver powerful amplified bass effects.\\nThe 3.5mm audio connections allow for multiple device compatibility and quality sound. The USB connection is for powering the LED lighting effects only.', 1008, 301, 1, '2017-03-16', 'hp_h300.jpg'),
(4, 'H220', '330.00', 'แสงไฟ LED ทำให้คุณโดดเด่นท่ามกลางจากฝูงชน\nที่อุดหูที่เป็นมิตรต่อผิวหนังและระบายอากาศได้ดีเพื่อความสบายที่ยั่งยืน\nไมโครโฟนป้องกันเสียงรบกวนสูงเพื่อป้องกันเสียงรบกวน\n40mm speaker delivers stable and elegant sound\nลำโพง 40 มม. ให้เสียงที่มีเสถียรภาพและหรูหรา', 1008, 301, 2, '2018-03-16', 'hp_h220.jpg'),
(5, 'HyperX Cloud Stinger', '1599.99', 'HyperX Cloud Stinger™ คือชุดหูฟังที่เหมาะอย่างยิ่งสำหรับเกมเมอร์ที่กำลังมองหาชุดหูฟังน้ำหนักเบาที่สวมใส่ได้สบาย\nให้คุณภาพเสียงระดับสุดยอดและมีฟังก์ชั่นอำนวยความสะดวกในการใช้งาน\nอุปกรณ์มีน้ำหนักเพียง 275 กรัม\nคล้องคอได้โดยไม่รำคาญ\nที่ครอบหูหมุนได้ 90 องศาเพื่อให้โอบกระชับได้พอดีมากที่สุด\nไดร์เวอร์กำหนดทิศทางขนาด 50 มม. ช่วยกำหนดตำแหน่งเสียงได้โดยตรงไปยังช่องหู ทำให้จ่ายเสียงได้อย่างแม่นยำและมีคุณภาพครบทุกรายละเอียดตามมาตรฐานเกมเมอร์\nสวมใส่ได้สบายเป็นเวลานานขณะเล่นเกม เลือกใช้เมมโมรี่โฟม HyperX ที่มีคุณภาพสูง', 1005, 301, 1, '2019-07-10', 'hpx_cloud_singer.jpg'),
(6, 'HyperX Cloud Alpha S', '3990.00', 'ระบบเสียง 7.1 เซอร์ราวด์ปรับแต่งเฉพาะโดย HyperX\nแถบเลื่อนปรับเสียงเบส\nไดร์เวอร์ HyperX สองช่องทาง\nความลงตัวทั้งในเกมและโปรแกรมแชท\nความสบายในแบบ HyperX\nโครงทำจากอะลูมิเนียมมีความทนทาน\nมิกเซอร์ควบคุมเสียงระดับสูง\nไมค์ตัดเสียงรบกวนแบบถอดแยกได้พร้อมสายถัก', 1005, 301, 1, '2018-10-10', 'hpx_cloud_alpha_s.jp'),
(7, 'KEYBOARD RAZER CYNOSA V2', '1490.00', 'แต่งแต้มสีสันการเล่นของคุณให้สมจริงด้วย Razer Cynosa V2 คีย์บอร์ดเกมไฟ RGB\nในแต่ละครั้งที่กดจะมีเสียงที่เงียบและรองรับแรงกระแทกทำให้ใช้งานได้อย่างสบายเป็นพิเศษสำหรับการเล่นเกมเป็นเวลานาน\nปรับแต่งคีย์บอร์ดเกม RGB ในแบบของคุณด้วยสีมากกว่า 16.8 ล้านสีและชุดเอฟเฟกต์ให้เลือก\nเอฟเฟกต์แสงแบบไดนามิกที่เกิดขึ้นในขณะที่คุณเล่นเกมในเกมที่รวม Chroma กว่า 150 รายการเช่น Fortnite, Apex Legends, Warframe\nเล่นเกมได้อย่างมีประสิทธิภาพมากขึ้นด้วยการทำแผนที่คำสั่งของคุณผ่าน Razer Synapse 3', 1010, 302, 0, '2017-12-10', 'razer_cynoa_v2.jpg'),
(8, 'KEYBOARD RAZER ORNATA V2', '2490.00', 'Razer Hybrid Mecha-Membrane Technology\nMulti-Function Digital Wheel and Media Keys\nPowered by Razer Chroma Rgb', 1010, 302, 0, '2018-05-20', 'razer_ornata_v2.jpg'),
(9, 'One 2 Horizon TKL Mechanical', '3490.00', 'One2 เป็นคีย์บอร์ดจากค่ายเกมมิ่งเกียร์ Ducky ของไต้หวัน ออกแบบด้วยดีไซนืคลาสสิคและใช้สีโทนสว่างสดใส่อยู่ เทา-ฟ้า และมีการสุ่ม Key Caps ของปุ่มสำคัญ ๆ แถมมาให้ใน 4 สีที่แตกต่างกันไปได้แก่ แดง เหลือง น้ำเงิน เขียว ส่วนราคานั้นก็จัดอยู่ในเกณฑ์ปานกลางสามารถเข้าถึงได้ง่าย ๆ ตัวบอร์ดมีลูกเล่น LED ส่องสว่างอยู่ใต้แป้นพิมพ์ และสามารถ กันฝุ่นกันน้ำในระดับหนึ่ง ฉะนั้นเหมาะสมกับคนที่ใช้โต๊ะคอมแทนโต๊ะอาหารได้เป็นอย่างดี ตัวคีย์บอร์ดมาพร้อมกับ Cherry Red MX ของแท้จากเยอรมันที่รองรับการกดได้ถึง 50 ล้านครั้งเป็นอย่างน้อย อีกทั้งยังมีความโดดเด่นในเรื่องของจังหวะการกดที่รวดเร็วลื่นไหล ตอบสนองความต้องการของเกมเมอร์สายไหวพริบดีทด้วยระยะการออกคำสัง่ที่สั้นเพียง 4 mm เท่านั้น', 1011, 302, 0, '2019-02-08', 'ducky_one2.jpg'),
(10, 'G915 TKL', '6990.00', 'G915 TKL มาพร้อมกับระบบไร้สายเกรดมือโปร LIGHTSPEED ระบบ LIGHTSYNC RGB ขั้นสูง และสวิตช์เชิงกลโครงต่ำประสิทธิภาพสูง สร้างขึ้นอย่างพิถีพิถันจากวัสดุคุณภาพพรีเมี่ยม G915 TKL จึงมีดีไซน์ที่ล้ำสมัย ด้วยความงาม ความแข็งแกร่ง และประสิทธิภาพที่ไม่มีใครทัดเทียม ทั้งหมดนี้อัดแน่นอยู่ในรูปทรงขนาดกะทัดรัดกว่าที่เคย G915 TKL มิติใหม่แห่งการเล่น', 1004, 302, 1, '2020-10-20', 'logitech_g915_tkl');




INSERT INTO `productcolor` (`productid`, `colorid`) VALUES
(1, 901),
(2, 901),
(2, 902),
(2, 903),
(3, 901),
(3, 902),
(3, 905),
(4, 901),
(4, 903),
(5, 901),
(6, 901),
(6, 904),
(6, 905),
(7, 901),
(8, 901),
(8, 904),
(8, 907),
(9, 906),
(10, 902),
(10, 903);


