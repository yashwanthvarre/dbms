Installing MySQL with APT
	1) Install MySQL by the following command:
	shell> sudo apt-get install mysql-server
	 installs the package for the MySQL server, as well as the packages for the client and for the 	database common files.

            2) Starting and Stopping the MySQL Server
	 sudo service mysql status( INFO about the database is active or not.)
	 sudo service mysql stop( Stops the database running).
	 sudo service mysql start


Main process

1) Open the terminal.
2) Enter the following command.
	Mysql -u root -p(run it)
3) Enter the password which you have  created while installing mysql.
4) Enter the following command.
	SHOW DATABASES;( Check if the database has been created)
	USE db_name;(pick the database in which you want to create the table with a USE statement:)
5)CREATE TABLE table_name ( attribute, datatype, null or not null);( For creating tables run this command).
6) INSERT INTO table_name (col1, col2, . . ) VALUES (‘val1’,’val2’,. . .);( Run this command for inserting of data).


Steps for creating PAPERREVIEW  DATABASE:-
	1) CREATE TABLE AUTHOR(
    		 Emailaddress VARCHAR(255) NOT NULL,
    		 Firstname VARCHAR(255) NOT NULL,
   		  Lastname  varchar(255) NOT NULL,
    		  PRIMARY KEY(Emailaddress));
 	2) CREATE TABLE PAPER(
    		paperid INT(3) unsigned NOT NULL,
   		 title  VARCHAR(255),
   		 abstract  VARCHAR(255),
   		 filename  VARCHAR(255),
   		 Emailaddress VARCHAR(255) NOT NULL,
   		 PRIMARY KEY(paperid),
   		 FOREIGN KEY(Emailaddress) REFERENCES AUTHOR(Emailaddress));

	3) CREATE TABLE REVIEWER(
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

	4) CREATE TABLE TOPIC(
   		  topicid  INT(3) unsigned NOT NULL,
   		  topicname   VARCHAR(255),
     		  reviewerid INT(3) unsigned NOT NULL,
    		  PRIMARY KEY(topicid),
     		   FOREIGN KEY(reviewerid) REFERENCES REVIEWER(reviewerid));

	5) CREATE TABLE REVIEW(
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

    • For dumping the code into  an .sql file run the following code:-
		mysqldump -u root -p PAPERREVIEW> ~/PAPERREVIEW-dump.sql

