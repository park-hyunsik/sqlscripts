-- ȸ���� �� 1���� å�� �뿩�� �� �ִ�.
-- (1) ������ �߰��մϴ�. 'B1102' , '��Ʈ����ũ ������', '��ö��' ,'KBO' , '2020-11-10'
INSERT INTO TBL_BOOK (BCODE, TITLE, WRITER, PUBLISHER, PDATE)
VALUES ('B1103', '��Ʈ����ũ ������', '��ö��', 'KBO', to_date('2020-11-10', 'YYYY-MM-DD'));

-- (2) �ݳ��� ������ ��ü�ϼ��� ����Ͽ� delay_days �÷����� update �մϴ�.
UPDATE TBL_BOOKRENT SET DELAY_DAYS = RETURN_DATE - RENT_DATEa
WHERE RETURN_DATE IS NOT NULL;

SELECT * FROM TBL_BOOKRENT;

-- (3) ���� ���� ������ ��ü�ϼ� ����ؼ� ȸ��IDX, �����ڵ�, ��ü�ϼ� ��ȸ�ϱ�
SELECT mem_idx, bcode, trunc(sysdate) - exp_date 
FROM TBL_BOOKRENT tb WHERE RETURN_DATE IS NULL;

-- (4) ���� �������� ���� �� ��ü�� ȸ���� �̸�,��ȭ��ȣ�� �˻��մϴ�. ���� ��¥ sysdate �������� Ȯ���ϱ�.
SELECT NAME, TEL FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb
ON bm.MEM_IDX = tb.MEM_IDX AND SYSDATE > exp_date AND RETURN_DATE IS NULL;

-- (5) ���� �������� ������ �������ڵ�� ������ �˻��մϴ�.
SELECT tb.BCODE, TITLE FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND RETURN_DATE IS NULL;

-- (6) ���� ������ �뿩�� ȸ���� IDX�� ȸ���̸��� �˻��մϴ�.
SELECT tb.MEM_IDX, bm.NAME FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND RETURN_DATE IS NULL;

-- (7) �������� ������ ȸ���̸�, ������, �ݳ����� �˻��ϱ�.
SELECT bm.NAME, tb2.TITLE, tb.EXP_DATE FROM TBL_BOOKRENT tb 
JOIN BOOK_MEMBER bm ON tb.MEM_IDX = bm.MEM_IDX 
JOIN TBL_BOOK tb2 ON tb.BCODE = tb2.BCODE
AND tb.RETURN_DATE IS NULL;

-- (8) ���� ��ü ���� ������ ȸ��IDX, �����ڵ�, �ݳ������� �˻��մϴ�. ���� ��¥ sysdate �������� Ȯ���ϱ�.
SELECT MEM_IDX, BCODE, EXP_DATE FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE;

-- (9) ȸ�� IDX ��10002���� ���� ������ �������� ���ν����� �ۼ��մϴ�.
DECLARE
	vcnt NUMBER;
BEGIN
	SELECT COUNT(*) 
	INTO vcnt -- SELECT ��ȸ ��� ������ ����. ������ , �� ������ �� ����.
	FROM TBL_BOOKRENT tb
	WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL;
	IF(vcnt = 0) THEN
		DBMS_OUTPUT.put_line('�뿩 ������~');
	ELSE
		DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� ������');
	END IF;
END;

CREATE OR REPLACE PROCEDURE CHECK_MEMBER (
	arg_mem IN BOOK_MEMBER.MEM_IDX %TYPE, --���ν��� ������ �� ���� ���� �Ű�����.
	isOK OUT VARCHAR2 -- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
)
IS
	vcnt NUMBER;
BEGIN
	SELECT COUNT(*) 
	INTO vcnt
	FROM TBL_BOOKRENT tb
	WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;
	IF(vcnt = 0) THEN
		DBMS_OUTPUT.put_line('�뿩 ����');
		isOK := '����';
	ELSE
		DBMS_OUTPUT.put_line('�뿩���� å�� �ݳ��ؾ� ����');
		isOK := '�Ұ���';
	END IF;
END;

-- ���ν��� �����ϱ�
DECLARE
	vresult VARCHAR2(20);
BEGIN
	CHECK_MEMBER(10002, vresult);
	DBMS_OUTPUT.put_line('��� : ' || vresult);
END;
	

-- (10) ������ '�佺Ʈ' ��� ������ ������ �������� ���ν��� �ۼ�. ���ν��� �̸� CHECK_BOOK
DECLARE
	v_bcode VARCHAR2(100);
	v_cnt NUMBER;
BEGIN
	SELECT BCODE INTO v_bcode --v_bcode�� 'A1102'
		FROM TBL_BOOK tb WHERE TITLE LIKE '�佺Ʈ';
	SELECT COUNT(*) INTO v_cnt
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND RETURN_DATE IS NULL; --���̸� �뿩 ����
	IF(v_cnt = 0) THEN
		DBMS_OUTPUT.put_line('�뿩 ����');
	ELSE
		DBMS_OUTPUT.put_line('�뿩���� å');
	END IF;
END;

CREATE OR REPLACE PROCEDURE CHECK_BOOK (
	arg_book IN TBL_BOOK.TITLE %TYPE, --���ν��� ������ �� ���� ���� �Ű�����.
	isOK OUT VARCHAR2 -- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
)
IS
	v_bcode VARCHAR2(100);
	v_cnt NUMBER;
BEGIN
	SELECT BCODE INTO v_bcode 
		FROM TBL_BOOK tb WHERE TITLE = arg_book;
	-- ���� å�̸� �Է��ϸ� ����. bcode ���� �˻��� �ȵȴ�. EXCEPTION ó��.
	SELECT COUNT(*) INTO v_cnt
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND RETURN_DATE IS NULL;
	IF(v_cnt = 1) THEN
		DBMS_OUTPUT.put_line('�뿩 ���� å�̾�');
		isOK := 'FALSE';
	ELSE
		DBMS_OUTPUT.put_line('å �뿩 �����ϴ�');
		isOK := 'TRUE';
	END IF;
END;

-- ���ν��� �����ϱ�
DECLARE
	vresult VARCHAR2(100);
BEGIN
	CHECK_BOOK('Ǫ�����ڿʹϴ�', vresult); -- �ڽ���, Ǫ������ �ʹϴ� �� FALSE
	DBMS_OUTPUT.put_line('��� : ' || vresult);
END;
-------------------------
CREATE OR REPLACE PROCEDURE CHECK_BOOK(
			arg_book IN tbl_book.title%TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
			isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode�� 'A1102'
 		FROM TBL_BOOK tb WHERE title = arg_book;
	-- ���� å�̸� �Է��ϸ� ����. bcode ���� �˻��� �ȵ˴ϴ�.-> Exception 
 	SELECT count(*) INTO v_cnt		-- v_cnt ���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('�뿩 ���� å �Դϴ�.');
		isOK := 'FALSE' ;
  	 ELSE 
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
		isOK := 'TRUE' ;
  	 END IF;
  	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� å�� �����ϴ�.');
		isOK :='no match';
  	-- ���� å�� isOK :='no match';
END;
----------
CREATE OR REPLACE PROCEDURE CHECK_BOOK(
			arg_book IN tbl_book.title%TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
			isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
	v_bcode varchar2(100);
 	v_cnt NUMBER;
 BEGIN
 	SELECT bcode INTO v_bcode		-- v_bcode�� 'A1102'
 		FROM TBL_BOOK tb WHERE title = arg_book;
	-- ���� å�̸� �Է��ϸ� ����. bcode ���� �˻��� �ȵ˴ϴ�.-> Exception 
 	SELECT count(*) INTO v_cnt		-- v_cnt ���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL; 
	 IF (v_cnt = 1) THEN 
		DBMS_OUTPUT.put_line('�뿩 ���� å �Դϴ�.');
		isOK := 'FALSE' ;
  	 ELSE 
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
		isOK := 'TRUE' ;
  	 END IF;
  	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('ã�� å�� �����ϴ�.');
		isOK :='no match';
  	-- ���� å�� isOK :='no match';
END;
------------
CREATE OR REPLACE PROCEDURE CHECK_MEMBER(
			arg_mem IN book_member.MEM_IDX%TYPE,	-- ���ν��� �����Ҷ� ���� ���� �Ű�����
			isOK OUT varchar2		-- �ڹ��� ���ϰ��� �ش��ϴ� �κ�.
	)
	IS 
			vcnt NUMBER;
			vname varchar2(100);
	 BEGIN 
		 -- �Է¸Ű������� ���� ȸ���ΰ��� Ȯ���ϴ� sql�� exception ó��. arg_mem���� ȸ�����̺��� name��ȸ
		 --		������ exception ó��
		 	 SELECT name 
		 	 INTO vname			-- ������ ����. 
		 		FROM BOOK_MEMBER bm WHERE MEM_IDX = arg_mem;
		 
			  SELECT count(*) 
			  INTO vcnt
			  FROM TBL_BOOKRENT tb 
			  WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;		--vcnt �� 0�϶��� �뿩����
			  IF (vcnt = 0) THEN 
				DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
				isOK := '����';
			  ELSE 
				DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
				isOK := '�Ұ���';
			  END IF;
			 EXCEPTION 
			 WHEN no_data_found THEN   
				DBMS_OUTPUT.PUT_LINE('ȸ���� �ƴմϴ�.');
				isOK :='no match';
	END;

