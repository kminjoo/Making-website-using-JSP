CREATE TABLE board (
  idx int primary key,
  firstname varchar(30),
  lastname varchar(30),
  email varchar(50),
  title varchar(200),
  content varchar(4000),
  pwd varchar(10),
  wdate date,
  hit int
);

select * from board;
delete from board where idx >= 1;
create sequence board_seq increment by 1 start with 1;
drop sequence board_seq;
drop table board;

insert into  board  values( board_seq.nextval ,'Minjoo','Kwon','zeptra17@gmail.com','it's gonna work','plz','1234',sysdate,0)