IMPLICIT NONE
	INTEGER::i,j,r!i是反弹次数,j是读取正确判断用变量,r是循环计数器
	REAL(KIND=4)::h,s,temp!h是一次的路程,s是总路程
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI（GB18030）'
WRITE(*,*)'本程序是小球反弹作业'
WRITE(*,*)'编写时间：2014年11月27日，作者：王亮'
WRITE(*,*)'==================================================================='
WRITE(*,*)'请输入高度'
READ(*,*,IOSTAT=j)h
IF(.NOT.(j==0))THEN
	WRITE(*,*)'输入值非实数，程序结束。'
	STOP
END IF
IF(h<=0)THEN
	WRITE(*,*)'输入了非正数，程序结束。'
	STOP
END IF
WRITE(*,*)'请输入反弹次数'
READ(*,*,IOSTAT=j)i
IF(.NOT.(j==0))THEN
	WRITE(*,*)'输入值非整数，程序结束。'
	STOP
END IF
IF(i<=0)THEN
	WRITE(*,*)'输入值非正数，程序结束。'
	STOP
END IF
s=h
DO r=1,i
	h=h/2
	temp=(s+(2*h))
	IF(s==temp)THEN
		WRITE(*,*)'因为精度原因，计算提前结束'
		WRITE(*,*)'程序计算到了第',r-1,'次碰撞'
	END IF
	IF(s==temp)EXIT
	s=temp
	write(*,*)h,s
END DO
WRITE(*,*)'最后一次反弹高度是',h,'总的路程是',s-h
WRITE(*,*)'程序结束'
END PROGRAM
