CREATE TABLE member (
	id VARCHAR(20) NOT NULL,
	passwd VARCHAR(20) NULL,
	firstname VARCHAR(20) NULL,
	lastname VARCHAR(20) NULL,
	phone1 VARCHAR(3) NULL,
	phone2 VARCHAR(4) NULL,
	phone3 VARCHAR(4) NULL,
	email VARCHAR(30) NULL,
	bday VARCHAR(8) NULL
	PRIMARY KEY (id)
)

CREATE TABLE zipcode(
	zipcode char(7) NOT NULL,
	area1 char(10) NULL,
	area2 char(20) NULL,
	area3 char(40) NULL,
	area4 char(20) NULL
)



