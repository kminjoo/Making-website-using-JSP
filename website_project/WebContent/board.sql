CREATE TABLE board (
  idx int primary key,
  name varchar(30),
  email varchar(50),
  title varchar(50),
  content varchar(2000),
  pwd varchar(10),
  wdate date,
  hit int
);

select * from board;
delete from board where idx >= 1;
create sequence board_idx_seq increment by 1 start with 1;
drop sequence board_idx_seq;
drop table board;