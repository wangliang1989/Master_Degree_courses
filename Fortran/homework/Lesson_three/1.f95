!--THIS ARTICLE IS WRITTEN IN ANSI（GB18030）--
!
!本程序计算数e的近似值。计算公式为：
!e=1+1/1!+1/2!+……+1/n!+……
!
!本程序使用了函数子程序、子例行程序、内部子程序和递归方法分别计算。当n！>1E8时停止计算。
!
!本程序编译时应包含1.f95（本文件）、digui.f95、sub.f95和fun.f95，若用gfortran编译，命令为：
!gfortran 1.f95 digui.f95 sub.f95 fun.f95
!
!编写时间：2014年12月4日，作者：王亮
IMPLICIT NONE
INTEGER(KIND=8)::n,result
INTEGER::fun
REAL(KIND=8)::e
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI（GB18030）'
WRITE(*,*)'程序功能：计算e的近似值。计算公式为：e=1+1/1!+1/2!+……+1/n!+……'
WRITE(*,*)'编写时间：2014年12月4日，作者：王亮'
WRITE(*,*)'==================================================================='
!====函数子程序方法======
e=0.
n=0
result=0
DO
	result=fun(n)
	e=e+(1/REAL(result))!包括其他三种计算方法：为避免整型变量和实型变量的除法混合计算，用REAL转换函数处理
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'函数子程序方法'
WRITE(*,*)'e='
WRITE(*,*)e
!====函数子程序方法======
!====子例行程序方法======
e=0.
n=0
result=0
DO
	CALL sub(n,result)
	e=e+(1/REAL(result))
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'子例行程序方法'
WRITE(*,*)'e='
WRITE(*,*)e
!====子例行程序方法======
!====内部子程序方法======
e=0.
n=0
result=0
DO
	result=jiechen(n)
	e=e+(1/REAL(result))
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'内部子程序方法'
WRITE(*,*)'e='
WRITE(*,*)e
!====内部子程序方法======
!====递归方法======
e=0.
n=0
result=0
DO
	CALL factorial(n,result)
	e=e+(1/REAL(result))
	IF(result>1e8)EXIT
	n=n+1
END DO
WRITE(*,*)'递归方法'
WRITE(*,*)'e='
WRITE(*,*)e
!====递归方法======
CONTAINS
	INTEGER FUNCTION jiechen(n)
	INTEGER(KIND=8)::i,j,n
	j=1
	DO i=1,n
		j=j*i
	END DO
	jiechen=j
	END
END
