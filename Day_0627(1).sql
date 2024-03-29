-- 데이터 타입 number 연습 테이블
-- number : 자바에서 정수, 실수 타입에 해당
-- 			number(정밀도,소수점이하자리수)


CREATE TABLE tbl_number(
	col1 NUMBER,	--정밀도 지정안하면 최대 38자리
	col2 NUMBER (5),	--정수로 5자리
	col3 NUMBER (7,2),	--전체 7자리수, 소수점이하 2자리
	col4 NUMBER (2,5)
);

INSERT INTO tbl_number 
VALUES (1234567,12345,12345.67,0.00012);


-- 오류 테스트1 : col12 값 자리수 초과
INSERT INTO TBL_NUMBER 
VALUES (123456789,123456,12345.67,0.00012);

--정상 테스트2 : col13 값 소수 이하 자리수 초과
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345.6789,0.00012);

-- 오류 테스트2 : col12 값 전체자리수 초과
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345.6789,0.00012);

--정상 테스트3 : col13에 소수점이하 값이 없을 때
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,12345,0.00012);

--오류 : col3 필드 전체 자리수 초과
INSERT INTO TBL_NUMBER 
VALUES (123456789,1234,123456,0.00012);

--정상테스트4
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