-- MaxTrain Capstone Project Purchase Request System(PRS)
-- Built by Justin Snyder(GITHUB:SnyderJA)


-- Drop, Create and Use Database
drop database if exists prs_db_ddl;
create database prs_db_ddl;
use prs_db_ddl;

-- DDL - Create Tables
-- Tables Created: User, PurchaseRequest, Product, PurchaseRequestLineItem, Vendor

create table User (
	id 					int 			primary key auto_increment,
	userName			VARCHAR(20)		NOT NULL,
	password			VARCHAR(10)		NOT NULL,
	firstName			VARCHAR(20)		NOT NULL,
	lastName			VARCHAR(20)		NOT NULL,
	phoneNumber			VARCHAR(12)		NOT NULL,
	email				VARCHAR(75)		NOT NULL,
	isReviewer			TINYINT(1),
	isAdmin				TINYINT(1),
    CONSTRAINT uname unique (userName)
	);
    
create table Vendor (
	id 					int 			primary key auto_increment,
	code 				VARCHAR(10) 	NOT NULL,
	name 				VARCHAR(255) 	NOT NULL,
	address 			VARCHAR(255)	NOT NULL,
	city				VARCHAR(255)	NOT NULL,
	state 				VARCHAR(2)		NOT NULL,
	zip					VARCHAR(5)		NOT NULL,
	phoneNumber			VARCHAR(12)		NOT NULL,
	email 				VARCHAR(100)	NOT NULL,
	CONSTRAINT vcode unique (code)
	);
    
create table PurchaseRequest (
	id 					int 			primary key auto_increment,
	userID				int 			NOT NULL unique,
	description			VARCHAR(100)	NOT NULL,
	justification		VARCHAR(255)	NOT NULL,
	dateNeeded			DATE 			NOT NULL,
	deliveryMode		VARCHAR(25)		NOT NULL,
	status				VARCHAR(20)		NOT NULL,
	total				DECIMAL(10,2)	NOT NULL,
	submittedDate		DATETIME		NOT NULL,
	reasonForRejection	VARCHAR(100),
	FOREIGN KEY (userid) REFERENCES user(id)
    );
    
create table Product (
	id 					int 			primary key auto_increment,
    vendorID			int 			not null,
    partNumber			VARCHAR(50)		not null,
    name 				VARCHAR(150)	not null,
    price				DECIMAL(10,2)	not null,
    unit 				VARCHAR(255),
    photoPath			VARCHAR(255),
    FOREIGN KEY (vendorID) REFERENCES vendor(id),
    CONSTRAINT vendor_part unique (vendorID, partNumber)
    );
    
create table PurchaseRequestLineItem (
	id 					int 			primary key auto_increment,
	purchaseRequestID	int 			not null,
	productID			int 			not null,
	quantity			int 			not null,
	FOREIGN KEY (productID) REFERENCES product(id),
	FOREIGN KEY (purchaseRequestID) REFERENCES purchaseRequest(id),
	CONSTRAINT req_pdt unique (purchaseRequestID, productID)
    );
    
    
-- TEST DATA INSERTS
-- TEST USER DATA

insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (1, 'nprowting0', 'password', 'Nicki', 'Prowting', '344-623-7271', 'nprowting0@purevolume.com', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (2, 'fodulchonta1', 'password', 'Franciskus', 'O''Dulchonta', '206-774-5940', 'fodulchonta1@shareasale.com', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (3, 'kdobing2', 'password', 'Kristoforo', 'Dobing', '168-987-7867', 'kdobing2@digg.com', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (4, 'slorenzo3', 'password', 'Suki', 'Lorenzo', '761-809-8740', 'slorenzo3@ustream.tv', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (5, 'mfearn4', 'password', 'Meredith', 'Fearn', '795-660-7803', 'mfearn4@spiegel.de', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (6, 'kdoull5', 'password', 'Kristal', 'Doull', '860-112-3365', 'kdoull5@trellian.com', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (7, 'fmessingham6', 'password', 'Flory', 'Messingham', '614-119-0700', 'fmessingham6@flavors.me', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (8, 'cduffyn7', 'password', 'Chloette', 'Duffyn', '843-835-2872', 'cduffyn7@ebay.com', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (9, 'wroofe8', 'password', 'Wendy', 'Roofe', '720-874-3785', 'wroofe8@bing.com', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (10, 'aanthony9', 'password', 'Amalita', 'Anthony', '905-784-1046', 'aanthony9@hud.gov', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (11, 'gguillaina', 'password', 'Gerhardt', 'Guillain', '579-635-1532', 'gguillaina@epa.gov', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (12, 'gpendlentonb', 'password', 'Gideon', 'Pendlenton', '264-198-6382', 'gpendlentonb@youtu.be', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (13, 'bzornc', 'password', 'Binni', 'Zorn', '526-841-6416', 'bzornc@privacy.gov.au', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (14, 'klesekd', 'password', 'Kristina', 'Lesek', '559-462-3793', 'klesekd@independent.co.uk', null, null);
insert into user (id, userName, password, firstName, lastName, phoneNumber, email, isReviewer, isAdmin) values (15, 'cchessune', 'password', 'Celeste', 'Chessun', '311-670-3551', 'cchessune@sciencedaily.com', null, null);

-- TEST VENDOR DATA
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (1, '34-504-964', 'Trilith', '41167 Dahle Alley', 'Santo Niño', 'OH', 46408, '678-567-2786', 'jwesthoff0@google.pl');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (2, '78-101-777', 'Fivechat', '66161 Elmside Place', 'Seget', 'KY', 47236, '730-421-6684', 'msabin1@reference.com');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (3, '26-460-218', 'Linkbuzz', '5 Debra Drive', 'Al Matlīn', 'OH', 46350, '986-197-7088', 'iholworth2@artisteer.com');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (4, '59-612-271', 'InnoZ', '44 Granby Street', 'Moju', 'KY', 46028, '965-557-0128', 'chazeldene3@google.co.uk');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (5, '71-135-340', 'Dynabox', '5495 Eggendart Hill', 'Baoshan', 'OH', 47748, '244-468-0999', 'aprescott4@china.com.cn');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (6, '27-166-744', 'Janyx', '2603 Marcy Road', 'Charneca', 'OH', 45967, '485-477-3801', 'arate5@biblegateway.com');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (7, '12-361-417', 'Mynte', '865 Forest Run Drive', 'Longmiao', 'KY', 46670, '788-399-8958', 'aomar6@ebay.co.uk');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (8, '52-208-846', 'Edgeblab', '472 Melby Circle', 'Cavadas', 'KY', 46991, '677-593-0494', 'acantor7@qq.com');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (9, '12-324-186', 'Tagchat', '03 Namekagon Drive', 'Lok', 'IN', 45876, '815-396-3925', 'vgeraudel8@delicious.com');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (10, '36-995-310', 'Mita', '1 Claremont Alley', 'Sarband', 'OH', 46334, '638-986-8971', 'tstevani9@gmpg.org');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (11, '13-980-367', 'Skibox', '20292 Daystar Lane', 'Dongtian', 'KY', 45974, '120-899-3268', 'amoakesa@nydailynews.com');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (12, '01-421-563', 'Feedmix', '21 Morning Terrace', 'Balīlā', 'OH', 46318, '740-978-3886', 'eeggleb@wikipedia.org');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (13, '43-718-661', 'Topiclounge', '2 7th Center', 'Ardino', 'OH', 47481, '530-580-9713', 'msimondc@google.ru');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (14, '50-540-883', 'Innotype', '89 Lakeland Crossing', 'Bera', 'OH', 47015, '248-520-2620', 'hgilliardd@pbs.org');
insert into vendor (id, code, name, address, city, state, zip, phoneNumber, email) values (15, '08-113-012', 'Jaxbean', '06 Lerdahl Drive', 'Glubokiy', 'IN', 46049, '785-595-5039', 'gtraine@house.gov');


-- TEST PRODUCT DATA
insert into product (id, vendorID, partNumber, name, price) values (1, '1', 123, 'Bar Mix - Lemon', '24.43');
insert into product (id, vendorID, partNumber, name, price) values (2, '2', 234, 'Beef - Tongue, Fresh', '97.72');
insert into product (id, vendorID, partNumber, name, price) values (3, '3', 345, 'Sage - Ground', '98.20');
insert into product (id, vendorID, partNumber, name, price) values (4, '4', 456, 'Bacardi Raspberry', '28.81');
insert into product (id, vendorID, partNumber, name, price) values (5, '5', 567, 'Juice - Apple, 500 Ml', '85.68');
insert into product (id, vendorID, partNumber, name, price) values (6, '6', 678, 'Wine - Winzer Krems Gruner', '38.72');
insert into product (id, vendorID, partNumber, name, price) values (7, '7', 789, 'Doilies - 8, Paper', '42.36');
insert into product (id, vendorID, partNumber, name, price) values (8, '8', 891, 'Bulgar', '51.12');
insert into product (id, vendorID, partNumber, name, price) values (9, '9', 912, 'Dill Weed - Dry', '71.97');
insert into product (id, vendorID, partNumber, name, price) values (10, '10', 101, 'Lumpfish Black', '60.68');
insert into product (id, vendorID, partNumber, name, price) values (11, '11', 112, 'Otomegusa Dashi Konbu', '26.43');
insert into product (id, vendorID, partNumber, name, price) values (12, '12', 129, 'Beef - Ground Medium', '9.77');
insert into product (id, vendorID, partNumber, name, price) values (13, '13', 139, 'Wine - Sawmill Creek Autumn', '17.98');
insert into product (id, vendorID, partNumber, name, price) values (14, '14', 149, 'Cheese - Ricotta', '16.15');
insert into product (id, vendorID, partNumber, name, price) values (15, '15', 159, 'Turnip - Wax', '13.00');






    


