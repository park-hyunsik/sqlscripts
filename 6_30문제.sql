CREATE TABLE tbl_custom (
	custom_id nvarchar2(20)PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	email varchar2(20),
	age number(3),
	reg_date DATE DEFAULT sysdate
);
--��ǰ ���̺� : ī�װ� ���� a1: ������ǰ, b1: ��ǰ
CREATE TABLE tbl_product(
	pcode varchar2(20)PRIMARY KEY,
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price NUMBER(9) NOT NULL
);
--���� ���̺� : ������� ���� ��ǰ�� �����ϴ°�?
CREATE TABLE tbl_buy(
	custom_id nvarchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL, --����
	buy_date date DEFAULT sysdate
);

INSERT INTO tbl_custom VALUES ('mina012','��̳�','kimm@gmail.com',20,to_date ('2022-03-10 14:23:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_custom VALUES ('hongGD','ȫ�浿','gil@korea.com',32,to_date ('2021-10-21 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_custom VALUES ('twice','�ڸ��','momo@daum.net',29,to_date ('2021-12-25 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_custom VALUES ('wonder','�̳���','lee@naver.com',40,sysdate);

INSERT INTO tbl_product VALUES ('IPAD011','A1','�����е�10',880000);
INSERT INTO tbl_product VALUES ('DOWON123a','B1','������ġ������Ʈ',54000);
INSERT INTO tbl_product VALUES ('dk_143','A2','��ǵ���ũ',234500);

INSERT INTO tbl_buy VALUES ('mina012','IPAD011',1,to_date ('2022-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('hongGD','IPAD011',2,to_date ('2022-06-29 20:37:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('wonder','DOWON123a',3,to_date ('2022-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tbl_buy VALUES ('mina012','dk_143',1,sysdate);
INSERT INTO tbl_buy VALUES ('twice','DOWON123a',2,to_date ('2022-02-09 08:49:55','YYYY-MM-DD HH24:MI:SS'));

ALTER TABLE tbl_buy ADD(buyNO number(8));

UPDATE tbl_buy set buyno = 1001  WHERE custom_id = 'mina012'AND PCODE = 'IPAD011';
UPDATE tbl_buy set buyno = 1002  WHERE custom_id = 'hongGD' AND PCODE = 'IPAD011';
UPDATE tbl_buy set buyno = 1003  WHERE custom_id = 'wonder' AND PCODE = 'DOWON123a';
UPDATE tbl_buy set buyno = 1004  WHERE custom_id = 'mina012' AND PCODE = 'dk_143';
UPDATE tbl_buy set buyno = 1005  WHERE custom_id = 'twice' AND PCODE = 'DOWON123a';

ALTER TABLE tbl_buy ADD PRIMARY KEY(buyNO);

ALTER TABLE tbl_buy MODIFY FOREIGN KEY (custom_id) REFERENCES tbl_custom(custom_id);
ALTER TABLE tbl_buy MODIFY FOREIGN KEY (pcode) REFERENCES tbl_product(pcode);

CREATE SEQUENCE tblbuy_seq
	START WITH 1006;

--. 7���� �������� �̿��Ͽ� insert �ϼ���.
--wonder �� 2022-05-15 ��¥�� 'IPAD011' ��ǰ 1�� ����
INSERT INTO tbl_buy VALUES ('wonder','IPAD011',1,to_date ('2022-05-15 00:00:00','YYYY-MM-DD HH24:MI:SS'),tblbuy_seq.nextval);



--9.1age �� 30�� �̻� ���� ��� �÷� ��ȸ
SELECT * FROM tbl_custom WHERE age >= 30;
--2. custom_id 'twice' �� email ��ȸ
SELECT email FROM tbl_custom WHERE custom_id = 'twice';
--3. category 'A2' �� pname ��ȸ
SELECT pname FROM tbl_product WHERE category = 'A2';
--4. ��ǰ price �� �ְ� ��ȸ
SELECT max(price) FROM tbl_product;
--5. 'IPAD011' �ѱ��� ���� ��ȸ
SELECT sum(quantity) FROM tbl_buy WHERE pcode = 'IPAD011';
--6. custom_id 'mina012' �� ������ ���� ��ȸ
SELECT * FROM tbl_buy WHERE custom_id = 'mina012';
--7. ���� ��ǰ �� pcode �� '0'�� ���Ե� �� ��ȸ
SELECT * FROM tbl_buy WHERE pcode LIKE '%0%';
--8. ���� ��ǰ �� pcode �� 'on'�� �����ϴ� �� ��ȸ(��ҹ��� ���о��� ��ȸ)
SELECT * FROM tbl_buy WHERE LOWER(pcode) LIKE '%on%';






;
