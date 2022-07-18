--주제 : 행을 그룹화 합니다. 사용하는 순서는 아래처럼 합니다.
--SELECT 그룹함수 form 테이블 이름
-- [WHERE] 그룹화 하기전에 사용할 조건식
-- GROUP by 그룹화에 사용할 컬럼명
-- [having] 그룹화 결과에 대한 조건식
-- [order by] 그룹화 결과 정렬할 컬럼명과 방식

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
	--HAVING total >=3 --having 에는 컬럼 별칭 사용 못함. 테이블 컬럼명은 사용할수있음.
	HAVING sum(QUANTITY) >=3
	GROUP BY cnt;

--구매날짜 2022 04 01 이후인 것만 그룹하여 조회
SELECT PCode , COUNT(*) ,sum(quantity) total
	FROM TBL_BUY tb 
	WHERE BUY_DATE >='2022-04-01'
	GROUP BY PCODE 
	GROUP BY cnt;


--day2 참고
--통계 함수 : count,avg,max,min,sum. 통계함수는 그룹함수라고도 합니다.
--			해당 함수 결과값을 구하기 위해 특정 컬럼 사용하여 여러 데이터를 그릅화한 후 실행.



SELECT COUNT(*) FROM EMPLOYEES e; 
SELECT MAX(SALARY) FROM EMPLOYEES e;
SELECT MIN(SALARY) FROM EMPLOYEES e; 
SELECT AVG(SALARY) FROM EMPLOYEES e;
SELECT SUM(SALARY) FROM EMPLOYEES e; 