-- 문자열 타입
-- CHAR(길이) : 고정길이 , 단위는 바이트 
-- VARCHAR(길이) : 오라클에서 존재하지만 사용하지 않는 예비자료형.
-- VARCHAR2(길이) : 가변형길이 단위 바이트, 길이는 최대길이이고 실제로 메모리는 데이터크기만큼 사용합니다.
--				최대 2000바이트입니다. UTF-8 인코딩에서 한글은 3바이트, 영문/숫자/기호는 1바이트

CREATE TABLE tbl_string (

	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)

);

--char 타입
INSERT  INTO tbl_string(acol) values('abcdefghij');
INSERT  INTO tbl_string(acol) values('abcdef');
INSERT  INTO tbl_string(acol) values('abcdefghijklm');

SELECT * FROM  tbl_string;

INSERT  INTO tbl_string(acol) VALUES('가나다');
INSERT  INTO tbl_string(acol) VALUES('가나다라');
INSERT  INTO tbl_string(acol) VALUES('가나');