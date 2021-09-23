-- 회원가입
create table member (
id varchar2(10) not null,
passwd varchar2(20) not null,
name varchar2(50) not null, 
mail varchar2(50)not null,
primary key (id)
);

select * from member;

-- 자유게시판
create sequence seq_num ;

create table freeBoard (
id_num number(10) not null ,
name varchar2(50) not null, 
subject varchar2(100) not null,
content varchar2(500) not null,
create_date date,
hits number(5),
primary key (id_num)
);

select * from freeBoard;

-- 자료실
create sequence file_seq_num ;

create table fileBoard (
id_num number(10) not null ,
name varchar2(50) not null, 
subject varchar2(100) not null,
content varchar2(500) not null,
file_name varchar(200),
realFile_name varchar(200),
create_date date,
hits number(5),
primary key (id_num)
);

create table PCRank(
rank varchar2(5) not null,
name varchar2(100) not null,
game_type varchar2(30) not null,
game_company varchar2(100) not null,
m_share varchar2(30) not null,
link varchar2(150) not null,
image varchar2(50) not null
);

create table MobileRank(
rank varchar2(5) not null,
name varchar2(100) not null,
game_company varchar2(100) not null,
game_type varchar2(50) not null,
image varchar2(50) not null
);

select * from PCRank;
delete from PCRank;
select * from fileBoard;
delete from fileBoard;
drop sequence file_seq_num ;
drop table PCRank ;

select instance from v$thread;