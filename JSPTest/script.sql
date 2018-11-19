-- 1. hr �α���
-- 2. �ּҷ� ���̺� ����

drop table tblAddress;

create table tblAddress(
    seq number primary key, --�ּҷ� ��ȣ
    name varchar2(30) not null, --�̸�
    address varchar2(300) not null, --�ּ�
    age number(3) not null,  --����
    gender char(1) not null, --����(m,f)
    tel varchar2(20) not null --����ó
);

create sequence address_seq;

--R
select * from tblAddress;

--C
insert into tblAddress (seq, name, address, age, gender, tel)   
    values (address_seq.nextval, 'ȫ�浿', '����� ������ ���ﵿ', 20, 'm', '010-1234-5678');
    
--U
update tblAddress set
    name = '�ƹ���',
    address = '����� �������� ��굿',
    age = 22,
    gender = 'f',
    tel = '010-8945-4919'
        where  seq = 1;
        
--D
delete from tblAddress where seq = 1;





-----------------------------------------------------------




--���� ���̺�
drop table tblAuth;

create table tblAuth(
    id varchar2(30) primary key,     --���̵�
    pw varchar2(30) not null,       --��ȣ
    name varchar2(30) not null,     --�̸�
    lv number(1) not null            --��� (1-�Ϲ�, 2-������)
);

insert into tblAuth values('hong','1111','ȫ�浿', 1);
insert into tblAuth values('test','1111','�׽�Ʈ', 1);
insert into tblAuth values('lee','1111','�̼���', 2);

commit;

select * from tblAuth;





-----------------------------------------------------------
--�ڵ�
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
    seq number primary key, --�Խù� ��ȣ
    subject varchar2(500) not null, --�Խù� ����
    content varchar2(1000) not null, --����
    category number not null references tblCategory(seq), --ī�װ�
    regdate date default sysdate not null, --�����
    id varchar2(30) not null references tblMember(id), --�ۼ���
    filename varchar2(100) not null  --�ҽ����ϸ�
);

create sequence code_seq;

--ȸ�� ����
insert into tblMember values('hong','1111','ȫ�浿', 1);
insert into tblMember values('test','1111','�׽�Ʈ', 1);
insert into tblMember values('lee','1111','�̼���', 2);

--ī�װ�
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






