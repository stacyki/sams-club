CREATE DATABASE Samsclub7;
GO

USE Samsclub7;
GO

-- Create tables -- 
CREATE TABLE Suppliers(
  Supplier_ID bigint NOT NULL PRIMARY KEY,
  Product_ID bigint NOT NULL,
  Supplier_Name varchar(200) NOT NULL,
  Supplier_Address varchar(200) NOT NULL,
  Supplier_City varchar(200) NOT NULL,
  Supplier_Region varchar(200) NOT NULL);

CREATE TABLE Product(
  Product_ID bigint NOT NULL PRIMARY KEY,
  Product_Name varchar(200) NOT NULL,
  Product_Description varchar(200) NOT NULL,
  Quantity varchar(200) NOT NULL,
  Unit_Price varchar(200) NOT NULL);

CREATE TABLE Membership(
  Member_ID bigint NOT NULL PRIMARY KEY,
  Member_Firstname varchar(200) NOT NULL,
  Member_Lastname varchar(200) NOT NULL,
  Member_Address varchar(200) NOT NULL,
  City varchar(200) NOT NULL,
  State varchar(200) NOT NULL,
  Zip varchar(200) NOT NULL,
  Membership_Type varchar(200) NOT NULL, 
  Membership_ExpirationDate varchar(200) NOT NULL);

CREATE TABLE Orders(
  Order_ID bigint NOT NULL PRIMARY KEY,
  Order_Date varchar(200) NOT NULL,
  Member_ID bigint NOT NULL,
  Order_Type varchar(200) NOT NULL,
  Product_ID bigint NOT NULL);

CREATE TABLE Payment(
  Payment_ID bigint NOT NULL PRIMARY KEY,
  Member_ID bigint NOT NULL,
  Card_Type varchar(200) NOT NULL,
  Amount_Paid varchar(200) NOT NULL,
  Payment_Type varchar(200) NOT NULL);

CREATE TABLE Stores(
  Store_ID bigint NOT NULL PRIMARY KEY,
  Store_Number varchar(200) NOT NULL,
  Store_Address varchar(200) NOT NULL,
  Store_Region varchar(200) NOT NULL,
  Store_Country varchar(200) NOT NULL);


CREATE TABLE Employee(
  Employee_ID bigint NOT NULL PRIMARY KEY,
  Employee_Firstname varchar(200) NOT NULL,
  Employee_Lastname varchar(200) NOT NULL,
  Phone_Number varchar(200) NOT NULL,
  Employee_Address varchar(200) NOT NULL,
  Hire_Date varchar(200) NOT NULL,
  Employee_Type varchar(200) NOT NULL,
  Store_ID bigint NOT NULL);

CREATE TABLE Shipment(
  Shipment_ID bigint NOT NULL PRIMARY KEY,
  Store_ID bigint NOT NULL,
  Supplier_ID bigint NOT NULL,
  Shipment_Location varchar(200) NOT NULL,
  Ship_Rate varchar(200) NOT NULL,
  Shipment_Date varchar(200) NOT NULL);

CREATE TABLE Department(
  Department_ID bigint NOT NULL PRIMARY KEY,
  Department_Name varchar(200) NOT NULL,
  Product_ID bigint NOT NULL,
  Department_Manager varchar(200) NOT NULL);

 ALTER TABLE Suppliers ADD CONSTRAINT FK_Suppliers_Product
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
  GO

 ALTER TABLE Shipment ADD CONSTRAINT FK_Shipment_Suppliers
  FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
  GO

ALTER TABLE Shipment ADD CONSTRAINT FK_Shipment_Stores
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
  GO

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Stores
  FOREIGN KEY (Store_ID) REFERENCES Stores(Store_ID)
  GO

ALTER TABLE Department ADD CONSTRAINT FK_Department_Product
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
  GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Product
  FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
  GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Membership
  FOREIGN KEY (Member_ID) REFERENCES Membership(Member_ID)
  GO

ALTER TABLE Payment ADD CONSTRAINT FK_Payment_Membership
  FOREIGN KEY (Member_ID) REFERENCES Membership(Member_ID)
  GO

 --Populate Database--
INSERT INTO Product(Product_ID,Product_Name,Product_Description,Quantity,Unit_Price) VALUES
(123, 'apple','fruit','122','0.49'),
(456, 'dove','shampoo','143','2'),
(789, 'applesauce','food','1298','0.59'),
(234, 'marlboro','cigarette','2834','12'),
(567, 'lenovo','laptop','1821','1234'),
(987, 'kleenex','napkin','1238','0.12'),
(543, 'coldstone','icecream','193','1.42'),
(659, 'hp','laptop','1923','1200'),
(149, 'hp','paper','1410','0.99'),
(294, 'woody','table','40','19.99');

INSERT INTO Suppliers(Supplier_ID,Product_ID,Supplier_Name,Supplier_Address,Supplier_Region,Supplier_City) VALUES 
(1, 123,'Jason Corporation','9818 Brewery Ave', 'Beerfield Beach', 'Southern'),
(2, 456,'TY Corporation','8019 Wild Horse St.', 'Oswego', 'Northeastern'),
(3, 789,'Stacy Supply','802 North Sutor Ave', 'Severn', 'Northeastern'),
(4, 234,'','536 Vernon Ave', 'Palmetto', 'Southern'),
(5, 567,'Opaque Camel Wholesale','29 Winding Way Drive', 'Peachtree', 'Western'),
(6, 987,'Smallbox Wholesale Company','7103 Honey Creek St.', 'Valdosta', 'Southern'),
(7, 543,'White Camel Wholesale','7212 E. Shirley Ave', 'Buford', 'Southern'),
(8, 659,'The Piping Glass Wholesale Corps.','5 Paris Hill', 'Owatonna', 'Midwestern'),
(9, 149,'Babson Beaver Wholesale Company','579 Lawrence Drive', 'Sumter', 'Southern'),
(10, 294,'Beta Badger Wholesale','480 Sherman Drive', 'Jacksonville', 'Eastern');

INSERT INTO Membership(Member_ID,Member_Firstname,Member_Lastname,Member_Address,City,State,Zip,Membership_Type,Membership_ExpirationDate) VALUES
(10,'Jenny','Wang','6318 15th ave','Brooklyn','NY','11219','Gold','10/2019'),
(11,'Stacy','Ki','1227 Parto Grande Drive','Diamond Bar','CA', '91765','Silver','11/2020'),
(12,'Shosho','He','11 Grapevine Avenue','Lexington','MA','02421','Bronze','12/2019'),
(13,'Brian','Lim','7450 Old Cutler Road','Miami','FL','33413','Silver','2/2022'),
(14,'Justin','Park','358 Massachusetts Avenue','Lexington','MA','02420','Bronze','4/2021'),
(15,'David','Smith','231 Waltham St.','Lexington','MA','02421','Gold','5/2021'),
(16,'Jon','Hancock','693 Rockwell Avenue','Bridgeport','CT','06606','Silver','5/2018'),
(17,'Marco','Polo','497 Bohemia St.','Owatonna','MN','55060','Gold','12/2017'),
(18,'Dustin','Hofman','284 Rising Star Drive','Walnut','CA','91789','Gold','10/2019'),
(19,'George','Recck','169 Mayflower Rd.','Euless','TX','76039','Silver','11/2018');

INSERT INTO Orders(Order_ID,Order_Date,Member_ID,Product_ID,Order_Type) VALUES
(20,'June 17 2016',10,123,'Online'),
(21,'January 1 2015',11,456,'In Store'),
(22,'June 23 2015',12,789,'Online'),
(23,'February 28 2016',13,234,'In Store'),
(24,'April 21 2015',14,567,'Online'),
(25,'March 3 2016',15,987,'In Store'),
(26,'June 5 2016',16,543,'Online'),
(27,'July 4 2016',17,659,'In Store'),
(28,'March 3 2014',18,149,'Online'),
(29,'November 1 2016',19,294,'In Store');

INSERT INTO Department(Department_ID,Department_Name,Product_ID,Department_Manager) VALUES
(30, 'Produce', 123,'Troxell'),
(31,'Beauty',456,'Ki'),
(32,'Canned Food',789,'Park'),
(33,'Tobacco',234,'Troughton'),
(34,'Electronics', 567,'Karson'),
(35,'Sanitary', 987,'Obama'),
(36,'Frozen Goods',543,'Trump'),
(37,'Electronics',659,'Clinton'),
(38,'Paper',149,'Sanders'),
(39,'Furniture',294,'Gomez');

INSERT INTO Payment(Payment_ID,Member_ID,Card_Type,Amount_Paid,Payment_Type) VALUES
(40,10,'Visa','75','Credit Card'),
(41,11,'Mastercard','134','Credit Card'),
(42,12,'Discover','334','Credit Card'),
(43,13,'','65','Cash'),
(44,14,'Amex','123','Credit Card'),
(45,15,'Visa', '194','Debit Card'),
(46,16,'Discover','26','Credit Card'),
(47,17,'Mastercard','184','Credit Card'),
(48,18,'','79','Cash'),
(49,19,'Visa','89','Debit Card');

INSERT INTO Stores(Store_ID,Store_Number,Store_Address,Store_Region,Store_Country) VALUES
(60,'481','82 West Glenlake St', 'Northeastern','US'),
(61,'202','2 Maple Road', 'Northeastern','US'),
(62,'534','7504 College Rd', 'Northeastern','US'),
(63,'125','9550 West Westminster Avenue','Northeastern','US'),
(64,'21','847 Olive St.','Southern','US'),
(65,'92','507 New Ave.','Northeastern','US'),
(66,'32','6 Baker st.','Northeastern','US'),
(67,'43','86 Marconi Street', 'Western','US'),
(68,'79','8692 North Fairfield Ave','Midwestern','US'),
(69,'500','73 High Point St.','Southern','US');

INSERT INTO Employee(Employee_ID,Employee_Firstname,Employee_Lastname,Phone_Number,Employee_Address,Hire_Date,Store_ID,Employee_Type) VALUES
(70,'Jon','Baker','7186668193', '7864 Stonybrook St','01/2011',60,'Manager'),
(71,'Jonny','Walker','2813850695','231 Forest St', '02/2013',61,'Stocker'),
(72,'Jonny','Appleseed','2957596234', '184 Booker Avenue','03/2001',62,'Cashier'),
(73,'Kit','Jin','184029482','8464 Trenton Street', '04/2002',63,'Bagger'),
(74,'Veo','Chae','1038583458', '69 Trusel Drive','03/2012',64,'Cashier'),
(75,'Jenny','Smith','1925840987','8445 Cambridge Drive','02/2014',65,'Stocker'),
(76,'Stella','Mince','1828495769','7139 Gartner Street','02/2015',66,'Bagger'),
(77,'Amy','Bliss','7816835038','39 Burbank Avenue','12/2009',67,'Manager'),
(78,'George','Cruiz','1846780493','578 Mountainview Rd.','05/2005',68,'Cashier'),
(79,'Kerry','Heeley','7859682739','8842 Ryan Dr.','06/2009',69,'Stocker');
 
INSERT INTO Shipment(Shipment_ID,Store_ID,Supplier_ID,Shipment_Location,Ship_Rate,Shipment_Date) VALUES
(50,60,1,'Region 1','9.99','01/2016'),
(51,61,2,'Region 2','24.99','02/2016'),
(52,62,3,'Region 3','5.95','03/2016'),
(53,63,4,'Region 4','9.99','04/2016'),
(54,64,5,'Region 1','5.95','05/2016'),
(55,65,6,'Region 2','24.99','05/2016'),
(56,66,7,'Region 3','9.99','02/2016'),
(57,67,8,'Region 4','5.99','03/2016'),
(58,68,9,'Region 3','9.99','04/2016'),
(59,69,10,'Region 2','5.99','02/2016');


