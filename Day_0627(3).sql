CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE 
);

INSERT INTO tbl_member VALUES (1,'����','momo@naver.com','2022-03-02');
INSERT INTO tbl_member(mno,name)
VALUES (2,'�̳���');

INSERT INTO tbl_member
VALUES (3,'�ִ���','dahy@naver.com','2022-03-04 16:47'); --���� : ��¥�������� �ڵ���ȯ ����.

INSERT INTO tbl_member
VALUES (3,'�ִ���','dahy@naver.com',to_date('2022-03-04 16:47','YYYY-MM-DD HH24:MI'));

--���� �ý����� ��¥�� �ð� : sysdate �Լ�
INSERT  INTO TBL_MEMBER  VALUES (4,'����','aaa@gmail.com',sysdate);

SELECT  * FROM tbl_member;
-- ó�� ���� ���̺� ���� �� mno �÷��� ���е� 5�� ��� ����
-- ��� �����Ҷ��� mno �÷��� ���� ����� �մϴ�.

SELECT name FROM TBL_MEMBER ;
SELECT  name,JOIN_DATE FROM TBL_MEMBER ;
SELECT  * FROM TBL_MEMBER ;
SELECT  * FROM TBL_MEMBER WHERE = '�ִ���';
SELECT  * FROM TBL_MEMBER tm WHERE mno > 2;
SELECT  * FROM TBL_MEMBER tm WHERE JOIN_DATE > '2022-03-03';
SELECT name,email FROM TBL_MEMBER tm WHERE JOIN_DATE > '2022-03-03';
-- null�� ��ȸ
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL;

--���ڿ��� �κа˻� : like ����
SELECT * FROM  TBL_MEMBER WHERE NAME LIKE '%����'; --%�� dont care
SELECT * FROM  TBL_MEMBER WHERE NAME LIKE '����'; --��ȸ�����?
SELECT * FROM  TBL_MEMBER WHERE NAME LIKE '%����%';--��ȸ�����?
-- or ���� : mno���� 1�Ǵ� 2�Ǵ� 4
SELECT  *FROM  TBL_MEMBER 
WHERE MNO = 1 OR MNO =2 OR MNO =4;
-- ����Ŭ�� or ��ü������ : in (�����÷��� ���� ���ǽ��϶�)
SELECT  * FROM  TBL_MEMBER WHERE MNO  IN (1,2,4);
SELECT  * FROM  TBL_MEMBER WHERE MNO  NOT IN (1,2,4);
SELECT  * FROM  TBL_MEMBER WHERE name IN ('����','�ִ���');







