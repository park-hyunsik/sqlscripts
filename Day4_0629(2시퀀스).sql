--����Ŭ�� �������� �̿��Ͽ� �ڵ����� �Ǵ� ���� ����� �̸� ���̺��� �÷� ������ insert �Ѵ�
--mysql���ٸ����
CREATE SEQUENCE test_seq1 ;

--dual�� ����, �Լ�������� Ȯ���Ҷ� ����ϴ� �ӽ����̺��̴�.
SELECT 2+3 FROM dual;


SELECT test_seq1.nextval FROM dual;
--��ó�� nextval�� �����ؾ� currval ���డ��.
SELECT test_seq1.currval FROM dual;

CREATE TABLE tbl_seq (
	tno number(7),
	name nvarchar2(10)

);

INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'���');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'����');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'����');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'����');
INSERT INTO tbl_seq(tno,name) VALUES (test_seq1.nextval,'��ȿ');
SELECT * FROM tbl_seq;

CREATE SEQUENCE test_seq2
	INCREMENT BY 2
	START WITH 20001;

SELECT test_seq2.nextval FROM dual;
SELECT test_seq2.currval FROM dual;




