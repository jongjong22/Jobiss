--board53.sql
drop table board53;
show tables;
select * from board53; 

create table board53(
    board_num int auto_increment primary key
  , board_name varchar(50) not null
  , board_pass varchar(30) not null
  , board_subject varchar(100) not null
  , board_content varchar(4000) not null
  , board_re_ref int
  , board_re_lev int
  , board_re_seq int
  , board_readcount int
  , board_date date 
);

insert into board53(board_name,board_pass,board_subject,board_content,
 board_re_ref,board_re_lev,board_re_seq,board_readcount,board_date)
values('홍길동','1234','게시판연습','게시판 내용',1,0,0,0,sysdate());

                



