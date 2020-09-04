
DROP DATABASE   IF     EXISTS TravelByBus;
CREATE DATABASE IF NOT EXISTS TravelByBus;

USE TravelByBus;

CREATE TABLE user (
u_ID INT AUTO_INCREMENT PRIMARY KEY,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(30) NOT NULL,
uname VARCHAR(50) NOT NULL UNIQUE,
password VARCHAR(60) NOT NULL,
type ENUM('Conductor','Customer','Admin'),
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bus (
b_ID INT UNSIGNED AUTO_INCREMENT unique,
b_No VARCHAR(30) NOT NULL primary key,
b_Model VARCHAR(30) NOT NULL,
No_BSeats VARCHAR(50),
add_uid int not null,
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE route (
r_ID INT UNSIGNED AUTO_INCREMENT unique ,
r_No VARCHAR(30) NOT NULL PRIMARY KEY,
point_A VARCHAR(30) NOT NULL,
point_B VARCHAR(30) NOT NULL,
bus_Stop text NOT NULL,
price_per_point DOUBLE not null,
add_uid int not null,
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE schedule (
s_ID INT AUTO_INCREMENT PRIMARY KEY,
b_No VARCHAR(30) not null,
r_No VARCHAR(30) not null,
con_u_ID int not null,
s_date TIMESTAMP not null,
add_uid int not null,
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE temp_user (
temp_UserID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
temp_Fname VARCHAR(60) NOT NULL,
temp_Address VARCHAR(60) NOT NULL,
temp_mobile VARCHAR(20),
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE token (
t_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
t_type ENUM('Token','Card'),
price DOUBLE not null,
t_IssueDate TIMESTAMP not null,
t_ExpireDate TIMESTAMP not null,
token_hashID varchar(254) not null UNIQUE,
cus_uid int not null,
add_uid int not null,
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE tempory_token (
temp_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
s_ID int not null,
temp_spoint VARCHAR(30) NOT NULL,
temp_epoint VARCHAR(30) NOT NULL,
temp_price DOUBLE NOT NULL,
token_hashID varchar(254) not null UNIQUE,
temp_date TIMESTAMP not null,
temp_qty int not null,
add_uid int not null,
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE payment (
p_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cus_uid int not null,
p_spoint VARCHAR(30) NOT NULL,
p_epoint VARCHAR(30) NOT NULL,
p_price DOUBLE NOT NULL,
p_Qty int not null,
token_hashID text not null,
add_uid int not null,
add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
s_ID int not null,
p_status tinyint not null
);

Create Table paymen_method(
pm_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
u_ID int not null,
card_number int not null,
card_type VARCHAR(30) NOT NULL,
expire_date varchar(20) NOT NULL,
security_code int not null,
password int not null,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL
);

create table top_up(
tu_ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
u_ID int Not null,
price double not null,
card_number int not null,
code int not null,
card_type VARCHAR(30) not null
);

CREATE TABLE card_request (
  rid int(11) NOT NULL AUTO_INCREMENT,
  cus_uid varchar(30) NOT NULL,
  price varchar(30) DEFAULT NULL,
  approvalStatus varchar(30) DEFAULT NULL,
  add_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (rid)
);

ALTER TABLE schedule ADD s_time varchar(240);
ALTER TABLE temp_user ADD temp_nic varchar(20);

ALTER TABLE paymen_method ADD CONSTRAINT FK_paymen_method_uid FOREIGN KEY (u_ID) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE top_up ADD CONSTRAINT FK_top_up_uid FOREIGN KEY (u_ID) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE bus ADD CONSTRAINT FK_busAdduid FOREIGN KEY (add_uid) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE route ADD CONSTRAINT FK_routeAdduid FOREIGN KEY (add_uid) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE schedule ADD CONSTRAINT FK_scheduleAdduid FOREIGN KEY (add_uid) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE schedule ADD CONSTRAINT FK_scheduleAddConuid FOREIGN KEY (con_u_ID) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE schedule ADD CONSTRAINT FK_schedulebNo FOREIGN KEY (b_No) REFERENCES bus(b_No) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE schedule ADD CONSTRAINT FK_schedulerNo FOREIGN KEY (r_No) REFERENCES route(r_No) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE token ADD CONSTRAINT FK_tokenAdduid FOREIGN KEY (add_uid) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE tempory_token ADD CONSTRAINT FK_tempory_tokenAdduid FOREIGN KEY (add_uid) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE tempory_token ADD CONSTRAINT FK_tempory_token_sid FOREIGN KEY (s_ID) REFERENCES schedule(s_ID);

ALTER TABLE payment ADD CONSTRAINT FK_paymentAdduid FOREIGN KEY (add_uid) REFERENCES user(u_ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE payment ADD CONSTRAINT FK_payment_sid FOREIGN KEY (s_ID) REFERENCES schedule(s_ID) ON UPDATE CASCADE ON DELETE CASCADE;

