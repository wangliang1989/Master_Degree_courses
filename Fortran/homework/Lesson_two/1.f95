IMPLICIT NONE
	REAL::i
	INTEGER::j
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI（GB18030）'
WRITE(*,*)'程序功能：学生成绩分类程序'
WRITE(*,*)'成绩应在0到100之间。90-100为优，80-89为良，70-79为中，60-69为及格，低于60为不及格。'
WRITE(*,*)'编写时间：2014年11月27日，作者：王亮'
WRITE(*,*)'==================================================================='
WRITE(*,*)'请输入成绩'
READ(*,*,IOSTAT=j)i
IF(j==0)THEN
	IF((i>=90).AND.(i<=100))THEN
		WRITE(*,*)'成绩为优'
	ELSE IF((i>=80).AND.(i<90))THEN
		WRITE(*,*)'成绩为良'
	ELSE IF((i>=70).AND.(i<80))THEN
		WRITE(*,*)'成绩为中'
	ELSE IF((i>=60).AND.(i<70))THEN
		WRITE(*,*)'成绩为及格'
	ELSE IF((i>=0).AND.(i<60))THEN
		WRITE(*,*)'成绩为不及格'
	ELSE
		WRITE(*,*)'输入的数字不在0到100'
	END IF
ELSE
	WRITE(*,*)'输入的不是数字'
END IF
WRITE(*,*)'程序结束'
END PROGRAM
