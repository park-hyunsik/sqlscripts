-- hr스키마를 이용하여 조인과 group by 를 포함해서 SELECT 로 검색하는 문제를 10개 만들기
-- group by 결과로도 조인을 할수 있습니다. ex : 부서 인원이 가장 많은 부서명은?
--1. EMPLOYEES 테이블의 모든데이터 조회.
SELECT * FROM EMPLOYEES ;
--2. EMPLOYEES 테이블에서 EMPLOYEE_ID 가 150이상 180이하인 인원 조회.
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID BETWEEN 150 AND 180;
--3.
SELECT * FROM EMPLOYEES INNER JOIN  










