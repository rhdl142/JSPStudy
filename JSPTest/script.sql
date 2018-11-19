-- 1. hr 로그인
-- 2. 주소록 테이블 생성

drop table tblAddress;

create table tblAddress(
    seq number primary key, --주소록 번호
    name varchar2(30) not null, --이름
    address varchar2(300) not null, --주소
    age number(3) not null,  --나이
    gender char(1) not null, --성벌(m,f)
    tel varchar2(20) not null --연락처
);

create sequence address_seq;

--R
select * from tblAddress;

--C
insert into tblAddress (seq, name, address, age, gender, tel)   
    values (address_seq.nextval, '홍길동', '서울시 강남구 역삼동', 20, 'm', '010-1234-5678');
    
--U
update tblAddress set
    name = '아무개',
    address = '서울시 영등포구 당산동',
    age = 22,
    gender = 'f',
    tel = '010-8945-4919'
        where  seq = 1;
        
--D
delete from tblAddress where seq = 1;





-----------------------------------------------------------




--인증 테이블
drop table tblAuth;

create table tblAuth(
    id varchar2(30) primary key,     --아이디
    pw varchar2(30) not null,       --암호
    name varchar2(30) not null,     --이름
    lv number(1) not null            --등급 (1-일반, 2-관리자)
);

insert into tblAuth values('hong','1111','홍길동', 1);
insert into tblAuth values('test','1111','테스트', 1);
insert into tblAuth values('lee','1111','이순신', 2);

commit;

select * from tblAuth;





-----------------------------------------------------------
--코드
drop table tblMember cascade constraints;
drop table tblCategory cascade constraints;

create table tblMember(
    id varchar2(30) primary key,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    lv number(1) not null
);


create table tblCategory(
    seq number primary key,
    name varchar2(100) not null
);


create table tblCode(
    seq number primary key, --게시물 번호
    subject varchar2(500) not null, --게시물 제목
    content varchar2(1000) not null, --설명
    category number not null references tblCategory(seq), --카테고리
    regdate date default sysdate not null, --등록일
    id varchar2(30) not null references tblMember(id), --작성자
    filename varchar2(100) not null  --소스파일명
);

create sequence code_seq;

--회원 정보
insert into tblMember values('hong','1111','홍길동', 1);
insert into tblMember values('test','1111','테스트', 1);
insert into tblMember values('lee','1111','이순신', 2);

--카테고리
insert into tblCategory values (1, 'Java');
insert into tblCategory values (2, 'SQL');
insert into tblCategory values (3, 'HTML');
insert into tblCategory values (4, 'CSS');
insert into tblCategory values (5, 'JavaScript');

commit;


select * from tblCode;



select
	seq,
	subject,
    (select name from tblMember where id=c.id) as name,
    regdate, 
    (select name from tblCategory where seq = c.category) as categoryName
from tblCode c 
order by seq desc;



select 
    c.*, 
    (select name from tblMember where id=c.id) as name,
    (select name from tblCategory where seq = c.category) as categoryName
from tblCode c;



select 
    m.*, 
    (select count(*) from tblCode where id=m.id) as cnt
from tblMember m;






