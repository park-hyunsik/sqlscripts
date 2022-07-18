--데이터베이스 트리거 : INSERT ,UPDATE ,delete 하 ㄹ때 동작하는 프로시저
-- 특정 테이블에 속해져 있는 객체

CREATE OR REPLACE  TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom
BEGIN 
	IF TO_char(sysdate , 'HH24:MI') BETWEEN '13:00' AND '15:00'THEN 
	raise_application_error(-20000,'지금 오후 1시~3시는 작업x');
END if;
	
END;

DELETE FROM tbl_custom WHERE CUSTOM_ID = 'twice';

CREATE OR REPLACE  TRIGGER backup_custom
AFTER DELETE ON tbl_custom
BEGIN 
	--회원탈퇴한 데이터 tbl_temp 임시테이블에 인서트하기
	
	
END;

CREATE VIEW v_buy
AS

SELECT tb.CUSTOM_ID,tb.PCODE ,tc.email,tb.QUANTITY 
FROM TBL_BUY tb ,TBL_CUSTOM tc 
WHERE tb.CUSTOM_ID =tc.CUSTOM_ID ;












