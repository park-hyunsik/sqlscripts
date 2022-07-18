-- DDL : CREATE , ALTER ,DROP 
-- (대상은 user ,table , sequence , view , .. 단 truncate 는 테이블만)
-- DML : insert , update , delete ,TRUNCATE 

DROP TABLE STUDENTS0 ; -- 오류 : students0 테이블 먼저 삭제하면
					--원인 :외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
DROP TABLE scores0;

--UPDATE 테이블명 set 컬럼명 = 값, 컬럼명 = 값, 컬럼명 =값,...
--WHERE 조컨컬럼 관계식
--delete from 테이블명 where 조건컬럼관계식
--주의 할점 : update와 delete 는 where 없이 사용하는 것은 위험한 동작.
		--모든 데이터를 삭제할때는 DELETE 대신 truncate 사용
SELECT * FROM  STUDENTS0 s ;
-- UPDATE , delete , select 에서 where 의 컬럼이 기본키 컬럼이면
-- 실행되는 몇개일까요? 최대1개
UPDATE STUDENTS0  SET age =17 WHERE STUNO = 2021001;
--rollback , commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 매뉴얼로 변경)
--순서대로 실행하세요
UPDATE STUDENTS0 SET ADDRESS = '성북구',age = 16 WHERE STUNO  =2021001;
ROLLBACK;
SELECT  * FROM  STUDENTS0 ;
UPDATE  STUDENTS0 SET ADDRESS = '성북구',age = 16 WHERE STUNO  =2021001;
COMMIT;
SELECT * FROM STUDENTS0 ;
ROLLBACK; 
SELECT * FROM STUDENTS0 ;
---------------------여기까지 첫번쨰에시
-------트랜잭션관리명령 : 롤백 커밋
DELETE FROM scores0 ;
ROLLBACK;
SELECT * FROM SCORES0 ;
DELETE FROM SCORES0 WHERE STUNO  = 2019019;
SELECT * FROM SCORES0 ;
--이 편집기는 트랜잭션 수동모드이므로 SELECT 결과가 2019019가 없습니다.
--다른편집기는 다른 클라이언트 이므로 이전 상태로보져짐
ROLLBACK;
SELECT * FROM SCORES0 ;

-----------------------------여기까지 두번째 예시
TRUNCATE  TABLE SCORES0 ;					-- 모든데이터를 지움 롤백확인
												-- 답 : 롤백불가
-----------








