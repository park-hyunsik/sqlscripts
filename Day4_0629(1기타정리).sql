-- DDL : CREATE , ALTER ,DROP 
-- (����� user ,table , sequence , view , .. �� truncate �� ���̺�)
-- DML : insert , update , delete ,TRUNCATE 

DROP TABLE STUDENTS0 ; -- ���� : students0 ���̺� ���� �����ϸ�
					--���� :�ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
DROP TABLE scores0;

--UPDATE ���̺�� set �÷��� = ��, �÷��� = ��, �÷��� =��,...
--WHERE �����÷� �����
--delete from ���̺�� where �����÷������
--���� ���� : update�� delete �� where ���� ����ϴ� ���� ������ ����.
		--��� �����͸� �����Ҷ��� DELETE ��� truncate ���
SELECT * FROM  STUDENTS0 s ;
-- UPDATE , delete , select ���� where �� �÷��� �⺻Ű �÷��̸�
-- ����Ǵ� ��ϱ��? �ִ�1��
UPDATE STUDENTS0  SET age =17 WHERE STUNO = 2021001;
--rollback , commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 �Ŵ���� ����)
--������� �����ϼ���
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�',age = 16 WHERE STUNO  =2021001;
ROLLBACK;
SELECT  * FROM  STUDENTS0 ;
UPDATE  STUDENTS0 SET ADDRESS = '���ϱ�',age = 16 WHERE STUNO  =2021001;
COMMIT;
SELECT * FROM STUDENTS0 ;
ROLLBACK; 
SELECT * FROM STUDENTS0 ;
---------------------������� ù��������
-------Ʈ����ǰ������ : �ѹ� Ŀ��
DELETE FROM scores0 ;
ROLLBACK;
SELECT * FROM SCORES0 ;
DELETE FROM SCORES0 WHERE STUNO  = 2019019;
SELECT * FROM SCORES0 ;
--�� ������� Ʈ����� ��������̹Ƿ� SELECT ����� 2019019�� �����ϴ�.
--�ٸ�������� �ٸ� Ŭ���̾�Ʈ �̹Ƿ� ���� ���·κ�����
ROLLBACK;
SELECT * FROM SCORES0 ;

-----------------------------������� �ι�° ����
TRUNCATE  TABLE SCORES0 ;					-- ��絥���͸� ���� �ѹ�Ȯ��
												-- �� : �ѹ�Ұ�
-----------








