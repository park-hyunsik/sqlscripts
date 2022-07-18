-- PL/SQL : Procedure(����,����) , ������ �ܼ��� SQL�� Ȯ��� ���
--			����,���(if,�ݺ���)�� ����Ͽ� ���α׷��־��� ���� sql ������ �帧�� ����

-- ���� : ������ ���ν����� ����� ����� �����ϴ�.
DECLARE   -- ���������  
	--vcustomid varchar2(20);
	--vage number(3,0);
	vname tbl_custom.name %TYPE;
	vage tbl_custom.age %TYPE;


BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT name,age 
	INTO vname , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='mina012';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
									-- ������ �� ��ȸ�ɋ��� �ٸ� cursor �ʿ�.
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�. ���� : no_data_found
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;

-- ����Ŭ ��ü ���ν��� ���� : �˻��� ���� �Ű������� �����ϱ�
CREATE OR REPLACE PROCEDURE search_custom(
	c_id IN tbl_custom.CUSTOM_ID %TYPE 
)
IS 
--�Ϲݺ��� ����
	vname tbl_custom.name %TYPE;
	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name,age 
	INTO vname , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;

	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;
--���ν��� ����
BEGIN 
	search_custom('wonder');
END;

--���(���ϰ�)�� �ִ� ���ν���
CREATE OR REPLACE PROCEDURE search_custom2(	-- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE,		-- �Ű����� IN 
	c_name OUT tbl_custom.NAME %TYPE		-- ���ϰ� ���ν��� ��� OUT
)
IS 
	-- �Ϲ� ���� ����
--	vname tbl_custom.name %TYPE;	-- ������ ���̺��� �÷��� ���������� ����
--	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name
	INTO c_name 	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	
	DBMS_OUTPUT.PUT_LINE('���� �˻��Ͽ����ϴ�.' || c_id);  
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');	
		c_name := 'no match';
END;

-- ���(���ϰ�)�� �ִ� ���ν��� ���� : ��°� ������ ���� ���� �ʿ�
DECLARE 
vname tbl_custom.name %TYPE;
BEGIN
	search_custom2('mina012',vname);
	DBMS_OUTPUT.PUT_LINE('���̸�:'||vname);
END;


CREATE TABLE tbl_temp
AS
SELECT * FROM tbl_custom WHERE CUSTOM_ID ='0';

--SELECT �Ѱ���� insert �ϱ�
INSERT INTO TBL_TEMP (SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID='wonder');






