-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE tbl_string (

	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)

);

--char Ÿ��
INSERT  INTO tbl_string(acol) values('abcdefghij');
INSERT  INTO tbl_string(acol) values('abcdef');
INSERT  INTO tbl_string(acol) values('abcdefghijklm');

SELECT * FROM  tbl_string;

INSERT  INTO tbl_string(acol) VALUES('������');
INSERT  INTO tbl_string(acol) VALUES('�����ٶ�');
INSERT  INTO tbl_string(acol) VALUES('����');