-- ������ Ÿ�� number ���� ���̺�
-- number : �ڹٿ��� ����, �Ǽ� Ÿ�Կ� �ش�
-- 			number(���е�,�Ҽ��������ڸ���)


CREATE TABLE tbl_number(
	col1 NUMBER,	--���е� �������ϸ� �ִ� 38�ڸ�
	col2 NUMBER (5),	--������ 5�ڸ�
	col3 NUMBER (7,2),	--��ü 7�ڸ���, �Ҽ������� 2�ڸ�
	col4 NUMBER (2,5)
);

INSERT INTO tbl_number 
VALUES (1234567,12345,12345.67,0.00012);


-- ���� �׽�Ʈ1 : col12 �� �ڸ��� �ʰ�
INSERT INTO TBL_NUMBER 
VALUES (123456789,123456,12345.67,0.00012);

--���� �׽�Ʈ2 : col13 �� �Ҽ� ���� �ڸ��� �ʰ�
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345.6789,0.00012);

-- ���� �׽�Ʈ2 : col12 �� ��ü�ڸ��� �ʰ�
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345.6789,0.00012);

--���� �׽�Ʈ3 : col13�� �Ҽ������� ���� ���� ��
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345,0.00012);

--���� : col3 �ʵ� ��ü �ڸ��� �ʰ�
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,123456,0.00012);

--�����׽�Ʈ4
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,123456,0.00012);

--1
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,1234,0.0002);
--2
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345,0.000126);
--3
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,123456,0.0012);