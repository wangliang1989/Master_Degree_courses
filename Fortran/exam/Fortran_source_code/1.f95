!--THIS ARTICLE IS WRITTEN IN ANSI（GB18030）
!
!本程序用辛普森法计算三个函数的积分。
!三个函数分别是：f(x)=sin3x+cosx, g(x)=5x^3+2x-10, h(x)=1/(1+x^2)
!积分区间分别是：(0，pi/6)，(0,10), (0,1)
!按要求，本程序将辛普森算法的实现写入子函数中
!本程序用gfortran编译通过，编译命令为：gfortran 1.f95 sim.f95
!注意：sim.f95存放子函数，为编译所必须！
!
!编写时间：2014年12月23日，作者：王亮
IMPLICIT NONE
!数据字典和变量申明
INTEGER(KIND=8)::status,n,i!status存储IOSTAT字句返回的值，n是分区的总数，i是循环计数器
CHARACTER(LEN=30)::j1
REAL(KIND=8),PARAMETER::pi=3.14159265358979!pi是圆周率
REAL(KIND=8)::h,sum,result!h是步长，sum是端点函数值之和，result是最终的计算结果
REAL(KIND=8),ALLOCATABLE,DIMENSION(:)::a,b!a存放公式中各i项，b存放公式中各i-1/2项
REAL(KIND=8)::sim!sim是辛普森法对应的函数
!程序执行部分
!告知用户程序使用方法
1000 FORMAT(A)
1010 FORMAT(A,A)
WRITE(*,1000)'==================================================================='
WRITE(*,1000)'程序功能：本程序用辛普森法计算三个函数的积分'
WRITE(*,1000)'三个被积函数分别是：f(x)=sin3x+cosx, g(x)=5x^3+2x-10, h(x)=1/(1+x^2)'
WRITE(*,1000)'积分区间分别是：(0，pi/6)，(0,10), (0,1)'
WRITE(*,1000)'==================================================================='
!f(x)开始
!获取步长
WRITE(*,1000)'请输入f(x)分割为多少区间'
READ(*,*,IOSTAT=status)n
IF(.NOT.(status==0))THEN
	WRITE(*,*)'输入值非整数，程序结束。'
	STOP
END IF
IF(.NOT.((n>0)))THEN
	WRITE(*,*)'输入值小于1，子区间至少要有一个！程序结束'
	STOP
END IF
!数据读入完成，向用户回显输入值
WRITE(j1,*)n
WRITE(*,1010)'您输入的分区个数分别是',TRIM(ADJUSTL(j1))
!计算开始
h=(pi/6.)/REAL(n)
ALLOCATE(a(1:n-1))
ALLOCATE(b(1:n))
DO i=1,n-1
a(i)=(SIN(3.*(h*i)))+COS((h*i))
END DO
DO i=1,n
b(i)=(SIN(3.*((h*i)-(h/2.))))+COS(((h*i)-(h/2.)))
END DO
sum=(SIN(0.)+COS(0.))+(SIN(pi/6.)+COS(pi/6.))
result=sim(a,b,sum,h,n)
WRITE(j1,*)result
WRITE(*,1010)'结果是',TRIM(ADJUSTL(j1))
DEALLOCATE(a)
DEALLOCATE(b)
!f(x)计算结束
!g(x)开始
!获取步长
WRITE(*,1000)'请输入g(x)分割为多少区间'
READ(*,*,IOSTAT=status)n
IF(.NOT.(status==0))THEN
	WRITE(*,*)'输入值非整数，程序结束。'
	STOP
END IF
IF(.NOT.((n>0)))THEN
	WRITE(*,*)'输入值小于1，子区间至少要有一个！程序结束'
	STOP
END IF
!数据读入完成，向用户回显输入值
WRITE(j1,*)n
WRITE(*,1010)'您输入的分区个数分别是',TRIM(ADJUSTL(j1))
!计算开始
h=10./REAL(n)
ALLOCATE(a(1:n-1))
ALLOCATE(b(1:n))
DO i=1,n-1
a(i)=5.*((h*i)**3)+2.*(h*i)-10.
END DO
DO i=1,n
b(i)=5.*(((h*i)-(h/2.))**3)+2.*((h*i)-(h/2.))-10.
END DO
sum=5.*(0.**3)+2.*0.-10.+5.*(10.**3)+2.*10.-10.
result=sim(a,b,sum,h,n)
WRITE(j1,*)result
WRITE(*,1010)'结果是',TRIM(ADJUSTL(j1))
DEALLOCATE(a)
DEALLOCATE(b)
!h(x)计算结束
!h(x)开始
!获取步长
WRITE(*,1000)'请输入h(x)分割为多少区间'
READ(*,*,IOSTAT=status)n
IF(.NOT.(status==0))THEN
	WRITE(*,*)'输入值非整数，程序结束。'
	STOP
END IF
IF(.NOT.((n>0)))THEN
	WRITE(*,*)'输入值小于1，子区间至少要有一个！程序结束'
	STOP
END IF
!数据读入完成，向用户回显输入值
WRITE(j1,*)n
WRITE(*,1010)'您输入的分区个数分别是',TRIM(ADJUSTL(j1))
!计算开始h(x)=1/(1+x^2)
h=1./REAL(n)
ALLOCATE(a(1:n-1))
ALLOCATE(b(1:n))
DO i=1,n-1
a(i)=1./(1.+(h*i)**2)
END DO
DO i=1,n
b(i)=1./(1.+((h*i)-(h/2.))**2)
END DO
sum=1./(1.+0.**2)+1./(1.+1.**2)
result=sim(a,b,sum,h,n)
WRITE(j1,*)result
WRITE(*,1010)'结果是',TRIM(ADJUSTL(j1))
DEALLOCATE(a)
DEALLOCATE(b)
!g(x)计算结束
END
