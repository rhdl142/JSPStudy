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