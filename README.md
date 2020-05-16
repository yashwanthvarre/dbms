# PAPER REVIEW DATABASE
Below are the step by step instructions to reproduce the work I have done for this paper review.

## Installing MYSQL
- Install the package for the MySQL server, as well as the packages for the client and for the database common files.

```sh
 sudo apt-get install mysql-server
```
- Starting and Stopping the MySQL Server
```sh
sudo service mysql status
sudo service mysql stop
sudo service mysql start
```
## Main process

- Open the terminal and run the following command, enter the password that you have created.
```sh
Mysql -u root -p
```
- Create a database
```sh
CREATE DATABASE YOUR_DATABASE_NAME;
```
- Enter the following command to know the databases present in the server.
```sh
SHOW DATABASES;
```
- pick the database in which you want to create the table with a USE statement:
```sh
USE YOUR_DATABASE_NAME;
```
- For creating tables run this command 
```sh
CREATE TABLE YOUR_TABLE_NAME ( attribute, datatype, null or not null);
```
- For inserting of data
```sh
INSERT INTO table_name (col1, col2, . . ) VALUES (‘val1’,’val2’,. . .);
```
- View the inserted data in the table
```sh
SELECT * FROM YOUR_TABLE_NAME
```

# Steps for creating PAPERREVIEW  DATABASE:-
```sh
CREATE TABLE AUTHOR(
Emailaddress VARCHAR(255) NOT NULL,
Firstname VARCHAR(255) NOT NULL,
Lastname  varchar(255) NOT NULL,
PRIMARY KEY(Emailaddress));
```

```sh
CREATE TABLE PAPER(
paperid INT(3) unsigned NOT NULL,
title  VARCHAR(255),
abstract  VARCHAR(255),
filename  VARCHAR(255),
Emailaddress VARCHAR(255) NOT NULL,
PRIMARY KEY(paperid),
FOREIGN KEY(Emailaddress) REFERENCES AUTHOR(Emailaddress));
```

```sh
CREATE TABLE REVIEWER(
revewerid INT(3) unsigned NOT NULL,
firstname  VARCHAR(255),
lastname  VARCHAR(255),
Authorfeedback  VARCHAR(255),
Commiteefeedback  VARCHAR(255),
phone  INT(10) unsigned ,
emailaddress VARCHAR(255),
paperid  INT(3) unsigned NOT NULL,
PRIMARY KEY(reviewerid),
FOREIGN KEY(paperid) REFERENCES PAPER(paperid));
```
```sh
CREATE TABLE TOPIC(
topicid  INT(3) unsigned NOT NULL,
topicname   VARCHAR(255),
reviewerid INT(3) unsigned NOT NULL,
PRIMARY KEY(topicid),
FOREIGN KEY(reviewerid) REFERENCES REVIEWER(reviewerid));
```
```sh
CREATE TABLE REVIEW(
reviewid  INT(3) unsigned NOT NULL,
recommendation  VARCHAR(255),
meritscore INT(2) ,
readabilityscore INT(2),
originalityscore INT(2),
relavancescore INT(2),
paperid INT(3) unsigned NOT NULL,
reviewerid INT(3) unsigned NOT NULL,
PRIMARY KEY(reviewid),
FOREIGN KEY (paperid) REFERENCES PAPER(paperid),
FOREIGN KEY (reviewerid) REFERENCES REVIEWER(reviewerid));
```
- For dumping the code into  an .sql file
```sh
mysqldump -u root -p PAPERREVIEW> ~/PAPERREVIEW-dump.sql
```
