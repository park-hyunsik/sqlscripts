--���� ���� ������ create table, alter table ���� �մϴ�.

-- ���� ���� 1 ) not null
CREATE TABLE tbl# (
	col1 varchar2(10),
	col2 number(3) NOT NULL 
);

INSERT  INTO tbl#(col2) VALUES  (98);
INSERT  INTO tbl#(col1) VALUES  ('korean'); -- ���� : col2 �÷��� NOT NULL �������� ����
INSERT  INTO tbl# VALUES ('korean',78);
INSERT  INTO tbl# VALUES ('korean',88);
--Ȯ��
SELECT * FROM tbl#;
-- ���ο� �������� 2) unique �� ���� col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;

-- ������ �μ�Ʈ �߿��� ������ �߻��ϴ� ����?
INSERT  INTO tbl#(col1) VALUES ('english');--����
INSERT  INTO tbl#(col2) VALUES (77);
INSERT  INTO tbl#(col3) VALUES ('english');--����
INSERT  INTO tbl#(col1,col2) VALUES ('english',88);
INSERT  INTO tbl#(col2,col3) VALUES (88,'science');
INSERT  INTO tbl#(col1,col3) VALUES ('science',88);--����
--���Ἲ ���� ����(C##IDEV.SYS_C008351)�� ����˴ϴ�
INSERT  INTO tbl#(col1,col2,col3) VALUES ('english',89,'science');

INSERT  INTO tbl#(col1,col2,col3) VALUES ('english',89,'math');
--üũ ���� : ����ũ �÷��� �� ���˴ϴ�.

--���� ����3 ) �⺻Ű �� ���� �� ����ũ ����������

CREATE  TABLE tbl2# (
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE 
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM tbl2#;
--���Ἲ ���� ����(pk�⺻Ű �÷�)�� ����˴ϴ�
INSERT INTO tbl2#(tno) VALUES (123); --����ũ
INSERT INTO tbl2#(tid) VALUES (123);--����

--�������� 4) check : �÷����� ������ ����
ALTER  TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT  INTO TBL2#(tno,tid,age) VALUES (222,123,20);
INSERT  INTO TBL2#(tno,tid,age) VALUES (222,124,90);
--���� ���� �÷��߰�
ALTER TABLE "TBL2#" ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO "TBL2#"(tno,GENDER) VALUES (224,'F');
INSERT INTO "TBL2#"(tno,GENDER) VALUES (225,'M');
INSERT INTO "TBL2#"(tno,GENDER) VALUES (226,'m');--���� üũ ������������

-- ���� ���� �÷��� �������� ������ ������ �߰��ؾ���
ALTER  TABLE "TBL2#" DROP CONSTRAINT tbl2_chk_gender;
ALTER  TABLE "TBL2#" ADD CONSTRAINT tbl2_chk_gender2
CHECK (gender IN ('M','F','m','f'));
--���� ���� �÷��� �������� �����ϴ� ���� �ٸ���ɾ�� �ؾ���
-- ALTER  table ~ drop constraints �� ���� ���� ���� �����ؾ���
ALTER TABLE "TBL2#" MODIFY gender char(1) CHECK (gender IN ('M','F','m','f'));
INSERT INTO "TBL2#"(tno,GENDER) VALUES (226,'m');
INSERT INTO "TBL2#"(tno,GENDER) VALUES (227,'f');







