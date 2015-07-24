CREATE TABLE member(
	id VARCHAR(20) PRIMARY KEY NOT NULL,
	passwd VARCHAR(20) NULL,
	firstname VARCHAR(20) NULL,
	lastname VARCHAR(20) NULL,
	phone1 VARCHAR(3) NULL,
	phone2 VARCHAR(4) NULL,
	phone3 VARCHAR(4) NULL,
	email VARCHAR(30) NULL,
	bday VARCHAR(8) NULL
)

select * from member;
insert into member values ('wydeld','yound123','Minjoo','Kwon','248','505','2651','zeptra17@gmail.com','19960223')
delete from member where firstname is "Kwon";

create sequence board2_idx_seq increment by 1 start with 1;
DROP TABLE member;
DROP TABLE zipcode;




