-- PL/SQL : Procedure(절차,순서) , 기존의 단순한 SQL이 확장된 언어
--			변수,제어문(if,반복문)을 사용하여 프로그래밍언어와 같이 sql 실행의 흐름을 제어

-- 주의 : 디비버는 프로시저의 디버깅 기능이 없습니다.
DECLARE   -- 변수선언부  
	--vcustomid varchar2(20);
	--vage number(3,0);
	vname tbl_custom.name %TYPE;
	vage tbl_custom.age %TYPE;


BEGIN		--프로시저 시작
-- 프로시저 내부에는 주로 DML 명령문들을 작성.(함께 실행해야할 여러 SQL : 트랜잭션)
	SELECT name,age 
	INTO vname , vage	-- 프로시저 구문: 검색결과를 변수에 저장
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='mina012';		-- 1개 행만 결과 조회되는 조건
									-- 여러개 행 조회될떄는 다른 cursor 필요.
-- 변수값을 콘솔에 출력(프로시저 명령)
	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || vname);
	DBMS_OUTPUT.PUT_LINE('고객나이 : ' || vage);
	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   -- 예외 이름은 다양합니다. 예시 : no_data_found
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');
END;

-- 오라클 객체 프로시저 생성 : 검색할 값을 매개변수로 전달하기
CREATE OR REPLACE PROCEDURE search_custom(
	c_id IN tbl_custom.CUSTOM_ID %TYPE 
)
IS 
--일반변수 선언
	vname tbl_custom.name %TYPE;
	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name,age 
	INTO vname , vage	-- 프로시저 구문: 검색결과를 변수에 저장
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;

	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || vname);
	DBMS_OUTPUT.PUT_LINE('고객나이 : ' || vage);
	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');
END;
--프로시저 실행
BEGIN 
	search_custom('wonder');
END;

--출력(리턴값)이 있는 프로시저
CREATE OR REPLACE PROCEDURE search_custom2(	-- 프로시저 이름 설정
	c_id IN tbl_custom.CUSTOM_ID %TYPE,		-- 매개변수 IN 
	c_name OUT tbl_custom.NAME %TYPE		-- 리턴값 프로시저 출력 OUT
)
IS 
	-- 일반 변수 선언
--	vname tbl_custom.name %TYPE;	-- 지정된 테이블의 컬럼과 동일형식의 변수
--	vage tbl_custom.age %TYPE;
BEGIN 
	SELECT name
	INTO c_name 	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID =c_id;		-- 1개 행만 결과 조회되는 조건
	
	DBMS_OUTPUT.PUT_LINE('고객을 검색하였습니다.' || c_id);  
	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');	
		c_name := 'no match';
END;

-- 출력(리턴값)이 있는 프로시저 실행 : 출력값 저장을 위한 변수 필요
DECLARE 
vname tbl_custom.name %TYPE;
BEGIN
	search_custom2('mina012',vname);
	DBMS_OUTPUT.PUT_LINE('고객이름:'||vname);
END;


CREATE TABLE tbl_temp
AS
SELECT * FROM tbl_custom WHERE CUSTOM_ID ='0';

--SELECT 한결과를 insert 하기
INSERT INTO TBL_TEMP (SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID='wonder');






