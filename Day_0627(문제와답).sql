SELECT  * FROM EMPLOYEES;

--1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

SELECT FIRST_NAME,LAST_NAME,EMAIL FROM EMPLOYEES tm WHERE hire_date < '2006-01-01';

--2. lastname�� 'Jones' �� ������ ��� �÷�
SELECT * FROM  EMPLOYEES WHERE LAST_NAME = 'Jones';

--3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ
SELECT LAST_NAME,FIRST_NAME,JOB_ID FROM EMPLOYEES WHERE salary >= 5000 

--4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ
SELECT LAST_NAME,FIRST_NAME,salary FROM EMPLOYEES WHERE JOB_ID LIKE '%ACCOUNT%'

--5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
SELECT EMPLOYEE_ID,LAST_NAME,FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID  IN (50,60,80,90);






