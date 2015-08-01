CREATE TABLE board (
  idx int primary key,
  firstname varchar(10),
  lastname varchar(10),
  email varchar(50),
  homepage varchar(50),
  title varchar(50),
  content varchar(2000),
  pwd varchar(10),
  wdate date,
  hit int
);

create sequence board_idx_seq increment by 1 start with 1;

