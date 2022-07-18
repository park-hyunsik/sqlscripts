CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE 
);

INSERT INTO tbl_member VALUES (1,'김모모','momo@naver.com','2022-03-02');
INSERT INTO tbl_member(mno,name)
VALUES (2,'이나나');

INSERT INTO tbl_member
VALUES (3,'최다현','dahy@naver.com','2022-03-04 16:47'); --오류 : 날짜형식으로 자동변환 못함.

INSERT INTO tbl_member
VALUES (3,'최다현','dahy@naver.com',to_date('2022-03-04 16:47','YYYY-MM-DD HH24:MI'));

--현재 시스템의 날짜와 시간 : sysdate 함수
INSERT  INTO TBL_MEMBER  VALUES (4,'쯔위','aaa@gmail.com',sysdate);

SELECT  * FROM tbl_member;
-- 처음 만든 테이블 구조 중 mno 컬럼을 정밀도 5로 축소 변경
-- 축소 변강할때는 mno 컬럼에 값이 없어야 합니다.

SELECT name FROM TBL_MEMBER ;
SELECT  name,JOIN_DATE FROM TBL_MEMBER ;
SELECT  * FROM TBL_MEMBER ;
SELECT  * FROM TBL_MEMBER WHERE = '최다현';
SELECT  * FROM TBL_MEMBER tm WHERE mno > 2;
SELECT  * FROM TBL_MEMBER tm WHERE JOIN_DATE > '2022-03-03';
SELECT name,email FROM TBL_MEMBER tm WHERE JOIN_DATE > '2022-03-03';
-- null값 조회
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL;

--문자열의 부분검색 : like 연산
SELECT * FROM  TBL_MEMBER WHERE NAME LIKE '%다현'; --%는 dont care
SELECT * FROM  TBL_MEMBER WHERE NAME LIKE '다현'; --조회결과는?
SELECT * FROM  TBL_MEMBER WHERE NAME LIKE '%다현%';--조회결과는?
-- or 연산 : mno값이 1또는 2또는 4
SELECT  *FROM  TBL_MEMBER 
WHERE MNO = 1 OR MNO =2 OR MNO =4;
-- 오라클의 or 대체연산자 : in (동일컬럼에 대한 조건식일때)
SELECT  * FROM  TBL_MEMBER WHERE MNO  IN (1,2,4);
SELECT  * FROM  TBL_MEMBER WHERE MNO  NOT IN (1,2,4);
SELECT  * FROM  TBL_MEMBER WHERE name IN ('김모모','최다현');







