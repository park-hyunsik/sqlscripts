--���� : ���� �׷�ȭ �մϴ�. ����ϴ� ������ �Ʒ�ó�� �մϴ�.
--SELECT �׷��Լ� form ���̺� �̸�
-- [WHERE] �׷�ȭ �ϱ����� ����� ���ǽ�
-- GROUP by �׷�ȭ�� ����� �÷���
-- [having] �׷�ȭ ����� ���� ���ǽ�
-- [order by] �׷�ȭ ��� ������ �÷���� ���

SELECT pcode , count(*) FROM TBL_BUY tb GROUP BY PCODE ;

SELECT PCode , COUNT(*) ,sum(quantity)
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	GROUP BY 2;

SELECT PCode , COUNT(*) ,sum(quantity) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	GROUP BY cnt;

SELECT PCode , COUNT(*) ,sum(quantity) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	--HAVING total >=3 --having ���� �÷� ��Ī ��� ����. ���̺� �÷����� ����Ҽ�����.
	HAVING sum(QUANTITY) >=3
	GROUP BY cnt;

--���ų�¥ 2022 04 01 ������ �͸� �׷��Ͽ� ��ȸ
SELECT PCode , COUNT(*) ,sum(quantity) total
	FROM TBL_BUY tb 
	WHERE BUY_DATE >='2022-04-01'
	GROUP BY PCODE 
	GROUP BY cnt;


--day2 ����
--��� �Լ� : count,avg,max,min,sum. ����Լ��� �׷��Լ���� �մϴ�.
--			�ش� �Լ� ������� ���ϱ� ���� Ư�� �÷� ����Ͽ� ���� �����͸� �׸�ȭ�� �� ����.



SELECT COUNT(*) FROM EMPLOYEES e; 
SELECT MAX(SALARY) FROM EMPLOYEES e;
SELECT MIN(SALARY) FROM EMPLOYEES e; 
SELECT AVG(SALARY) FROM EMPLOYEES e;
SELECT SUM(SALARY) FROM EMPLOYEES e; 