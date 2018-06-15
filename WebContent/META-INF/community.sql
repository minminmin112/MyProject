
create table users(
    id varchar2(50) primary key,
    password varchar2(50) not null,
    name varchar2(50) not null
);

create sequence seq_users_id;


create table visit(
    id number primary key,
    u_id varchar2(50) references users(id) on delete cascade,
    content varchar2(300) not null,
    regdate timestamp
);

create sequence seq_visit_id;


create table photo(
    id number primary key,
    u_id varchar2(50) references users(id) on delete cascade,
    content varchar2(300) not null,
    uri varchar2(100) not null,
    regdate timestamp
);

create sequence seq_photo_id;

select * from users;
select * from visit;
select * from photo;

delete from visit where id = 7;

delete from users where id = '1111';

delete from photo where id = 10;

alter table users modify password varchar2(70);

