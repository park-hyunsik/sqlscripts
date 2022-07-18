--제약 조건 설정은 create table, alter table 에서 합니다.

-- 제약 조건 1 ) not null
CREATE TABLE tbl# (
	col1 varchar2(10),
	col2 number(3) NOT NULL 
);

INSERT  INTO tbl#(col2) VALUES  (98);
INSERT  INTO tbl#(col1) VALUES  ('korean'); -- 오류 : col2 컬럼의 NOT NULL 제약조건 위반
INSERT  INTO tbl# VALUES ('korean',78);
INSERT  INTO tbl# VALUES ('korean',88);
--확인
SELECT * FROM tbl#;
-- 새로운 제약조건 2) unique 를 갖는 col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE;

-- 다음중 인서트 중에서 오류가 발생하는 것은?
INSERT  INTO tbl#(col1) VALUES ('english');--오류
INSERT  INTO tbl#(col2) VALUES (77);
INSERT  INTO tbl#(col3) VALUES ('english');--오류
INSERT  INTO tbl#(col1,col2) VALUES ('english',88);
INSERT  INTO tbl#(col2,col3) VALUES (88,'science');
INSERT  INTO tbl#(col1,col3) VALUES ('science',88);--오류
--무결성 제약 조건(C##IDEV.SYS_C008351)에 위배됩니다
INSERT  INTO tbl#(col1,col2,col3) VALUES ('english',89,'science');

INSERT  INTO tbl#(col1,col2,col3) VALUES ('english',89,'math');
--체크 사항 : 유니크 컬럼은 널 허용됩니다.

--제약 조건3 ) 기본키 는 낫널 과 유니크 제약조건임

CREATE  TABLE tbl2# (
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE 
);

INSERT INTO tbl2#(tno) VALUES (123);
SELECT * FROM tbl2#;
--무결성 제약 조건(pk기본키 컬럼)에 위배됩니다
INSERT INTO tbl2#(tno) VALUES (123); --유니크
INSERT INTO tbl2#(tid) VALUES (123);--낫널

--제약조건 4) check : 컬럼값의 범위를 설정
ALTER  TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT  INTO TBL2#(tno,tid,age) VALUES (222,123,20);
INSERT  INTO TBL2#(tno,tid,age) VALUES (222,124,90);
--성별 젠더 컬럼추가
ALTER TABLE "TBL2#" ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO "TBL2#"(tno,GENDER) VALUES (224,'F');
INSERT INTO "TBL2#"(tno,GENDER) VALUES (225,'M');
INSERT INTO "TBL2#"(tno,GENDER) VALUES (226,'m');--오류 체크 제약조건위반

-- 성병 젠더 컬럼의 제약조건 변경은 삭제후 추가해야함
ALTER  TABLE "TBL2#" DROP CONSTRAINT tbl2_chk_gender;
ALTER  TABLE "TBL2#" ADD CONSTRAINT tbl2_chk_gender2
CHECK (gender IN ('M','F','m','f'));
--현재 젠더 컬럼의 제약조건 변경하는 경우는 다른명령어로 해야함
-- ALTER  table ~ drop constraints 로 기존 제약 조건 삭제해야함
ALTER TABLE "TBL2#" MODIFY gender char(1) CHECK (gender IN ('M','F','m','f'));
INSERT INTO "TBL2#"(tno,GENDER) VALUES (226,'m');
INSERT INTO "TBL2#"(tno,GENDER) VALUES (227,'f');







