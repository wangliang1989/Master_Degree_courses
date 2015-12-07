!--THIS ARTICLE IS WRITTEN IN ANSI（GB18030）--
!
!本程序计算计算sum=sqrt(x^3+y^4)+tan(x^2+y^2)
!
!本程序编译时应包含2.f95（本文件）、tan.f95和sqrt.f95，若用gfortran编译，命令为：
!gfortran 2.f95 sqrt.f95 tan.f95
!
!编写时间：2014年12月4日，作者：王亮
IMPLICIT NONE
	REAL::a,b,x,y,mytan
	INTEGER::j
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI（GB18030）'
WRITE(*,*)'程序功能：计算sum=sqrt(x^3+y^4)+tan(x^2+y^2)'
WRITE(*,*)'编写时间：2014年12月4日，作者：王亮'
WRITE(*,*)'==================================================================='
WRITE(*,*)'请输入x'
READ(*,*,IOSTAT=j)x
IF(.NOT.(j==0))THEN
	WRITE(*,*)'输入的不是数字'
	WRITE(*,*)'程序结束'
	STOP
END IF
WRITE(*,*)'请输y'
READ(*,*,IOSTAT=j)y
IF(.NOT.(j==0))THEN
	WRITE(*,*)'输入的不是数字'
	WRITE(*,*)'程序结束'
	STOP
END IF
IF((x**3+y**4)<0)THEN
	WRITE(*,*)'负数不能开方'
	WRITE(*,*)'程序结束'
	STOP
END IF
IF(ABS((x**2+y**2)-3.14159)<0.0001)THEN
	WRITE(*,*)'k*pi+pi/2无正切值'
	WRITE(*,*)'程序结束'
	STOP
END IF
		CALL mysqrt(a,x,y)
b=mytan
WRITE(*,*)a+b
END PROGRAM
