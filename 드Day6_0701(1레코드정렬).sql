--SELECT 기본형식
--SELECT 컬럼1,컬럼2,... from 테이블명 WHERE 검색조건식 oderby 기준컬럼 
SELECT * FROM tbl_buy tb;
SELECT * FROM TBL_CUSTOM tc;
SELECT * FROM TBL_CUSTOM tc order BY custom_id;
SELECT * FROM tbl_buy tb WHERE custom_id ='mina012';
SELECT * FROM tbl_buy tb WHERE custom_id ='mina012'
					ORDER BY buy_date desc;
					