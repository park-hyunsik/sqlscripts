--�����ͺ��̽� Ʈ���� : INSERT ,UPDATE ,delete �� ���� �����ϴ� ���ν���
-- Ư�� ���̺� ������ �ִ� ��ü

CREATE OR REPLACE  TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom
BEGIN 
	IF TO_char(sysdate , 'HH24:MI') BETWEEN '13:00' AND '15:00'THEN 
	raise_application_error(-20000,'���� ���� 1��~3�ô� �۾�x');
END if;
	
END;

DELETE FROM tbl_custom WHERE CUSTOM_ID = 'twice';

CREATE OR REPLACE  TRIGGER backup_custom
AFTER DELETE ON tbl_custom
BEGIN 
	--ȸ��Ż���� ������ tbl_temp �ӽ����̺� �μ�Ʈ�ϱ�
	
	
END;

CREATE VIEW v_buy
AS

SELECT tb.CUSTOM_ID,tb.PCODE ,tc.email,tb.QUANTITY 
FROM TBL_BUY tb ,TBL_CUSTOM tc 
WHERE tb.CUSTOM_ID =tc.CUSTOM_ID ;












