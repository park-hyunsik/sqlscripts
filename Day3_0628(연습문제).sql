CREATE TABLE Students(
	Student_ID CHAR(7) PRIMARY KEY ,
	name varchar(20) NOT NULL,
	age NUMBER,
	adds char(25)
	);
	
INSERT INTO Students VALUES (2021001,'����',16,'���ʱ�');
INSERT INTO Students VALUES (2019019,'������',18,'������');

SELECT * FROM Students s ;

CREATE TABLE Scores(
	Student_ID CHAR(7) NOT NULL,
	subject varchar(6) NOT NULL,
	score NUMBER NOT NULL,
	techer varchar(9) NOT NULL,
	semester varchar(6) NOT NULL
);
ALTER  TABLE Scores
			ADD CONSTRAINT pk_Scores PRIMARY KEY (Student_ID,subject);
ALTER  TABLE Scores
			ADD CONSTRAINT fk_Scores PRIMARY KEY (Student_ID);
			REFERENCES Students (Student_ID);
		
INSERT INTO Scores VALUES (2021001,'����',89,'�̳���','2022_1');
INSERT INTO Scores VALUES (2021001,'����',79,'��浿','2022_1');
INSERT INTO Scores VALUES (2021001,'����',67,'�ڼ���','2021_2');
INSERT INTO Scores VALUES (2019019,'����',92,'�̳���','2019_2');
INSERT INTO Scores VALUES (2019019,'����',85,'������','2019_2');
INSERT INTO Scores VALUES (2019019,'����',88,'�ڼ���','2020_1');

SELECT * FROM Scores s ;