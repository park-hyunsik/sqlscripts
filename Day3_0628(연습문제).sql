CREATE TABLE Students(
	Student_ID CHAR(7) PRIMARY KEY ,
	name varchar(20) NOT NULL,
	age NUMBER,
	adds char(25)
	);
	
INSERT INTO Students VALUES (2021001,'김모모',16,'서초구');
INSERT INTO Students VALUES (2019019,'강다현',18,'강남구');

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
		
INSERT INTO Scores VALUES (2021001,'국어',89,'이나연','2022_1');
INSERT INTO Scores VALUES (2021001,'영어',79,'김길동','2022_1');
INSERT INTO Scores VALUES (2021001,'과학',67,'박세리','2021_2');
INSERT INTO Scores VALUES (2019019,'국어',92,'이나연','2019_2');
INSERT INTO Scores VALUES (2019019,'영어',85,'박지성','2019_2');
INSERT INTO Scores VALUES (2019019,'과학',88,'박세리','2020_1');

SELECT * FROM Scores s ;