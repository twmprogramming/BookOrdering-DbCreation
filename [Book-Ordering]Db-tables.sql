CREATE database book_ordering_practice;
use book_ordering_practice;
DROP TABLE customers;
CREATE TABLE  customers
(
customer_num int(4) PRIMARY KEY auto_increment,
 lastname varchar(20) NOT NULL,
 firstname varchar(20) NOT NULL,
 email varchar(50),
 address varchar(25),
 city varchar(40),
 state char(2),
 zip varchar(5),
 referred int(4),
 region char(2));
 
drop table orders;

 CREATE TABLE orders
(
order_num int(4) PRIMARY KEY auto_increment,
customer_num int(4),
orderdate date,
shipdate date, 
shipstreet varchar(10),
shipcity varchar(40),
shipstate char(2),
shipzip char(5),
shipcost double(4,2));

ALTER TABLE orders ADD constraint orders_customer_num_fk foreign key(customer_num)	
	references customers(customer_num);

Drop table orderitems;
CREATE TABLE orderitems
(
order_num int(3),
item_num int(10),
isbn char(10),
quantity int(3) NOT NULL,
paideach double(5,2) NOT NULL );

ALTER TABLE orderitems ADD constraint orders_order_num_fk foreign key(order_num)	
	references orders(order_num);
    
ALTER TABLE orderitems ADD constraint order_num_book_fk foreign key(item_num)	
	references books(isbn);

DROP TABLE books;
CREATE TABLE books
(
isbn int(10) PRIMARY KEY,
title varchar(40),
pubdate date,
pubid int(2),
cost double(5,2),
retail double(5,2),
discount double(4,2),
category varchar(20));

ALTER TABLE books ADD constraint books_pubId_fk foreign key(pubId)	
	references publisher(pubid);

drop table promotion;
CREATE TABLE promotion
(
gift varchar(10),
minretail double(5,2),
maxretail double(5,2));

drop table bookauthor;
Create table bookauthor
(
isbn int(10),
authorid int(4));

ALTER TABLE bookauthor ADD constraint author_book_fk foreign key(isbn)	
	references books(isbn);
ALTER TABLE bookauthor ADD constraint order_num_author_fk foreign key(authorid)	
	references AUTHOR(authorid);

drop table publisher;
CREATE TABLE publisher
(
pubId int(3) PRIMARY KEY auto_increment,
name varchar(25),
contact varchar(15),
phone varchar(12));

drop table author;
CREATE TABLE AUTHOR
(
authorid int(4) PRIMARY KEY auto_increment,
lname varchar(20),
fname varchar(20));


SELECT category, title, cost
	FROM books
WHERE cost>
(SELECT cost 
FROM books
Where title = 'hi')
AND category = 'computer';
