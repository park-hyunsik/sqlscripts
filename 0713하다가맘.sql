-- tbl_custom 참조하는 외래키 삭제
ALTER TABLE TBL_BUY DROP CONSTRAINT SYS_C008474;
-- on delete 옵션으로 다시 외래키 생성
ALTER TABLE TBL_BUY ADD CONSTRAINT FK1_CUSTOM 
FOREIGN KEY (CUSTOM_ID) REFERENCES TBL_CUSTOM(CUSTOM_ID) ON DELETE CASCADE;






-- ALTER TABLE 테이블명 DROP CONSTRAINT 외래키명