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