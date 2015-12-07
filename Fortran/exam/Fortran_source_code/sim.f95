!--THIS ARTICLE IS WRITTEN IN ANSI（GB18030）
REAL FUNCTION sim(a,b,sum,h,n)
IMPLICIT NONE
INTEGER(KIND=8)::i!i是循环计数器
REAL(KIND=8)::temp
!temp用来临时存放复合辛普森公式中各项求和值，最终将值传给输出结果
!INTENT(IN)属性的变量和主程序中意义相同
INTEGER(KIND=8),INTENT(IN)::n
REAL(KIND=8),INTENT(IN)::sum,h
REAL(KIND=8),INTENT(IN),DIMENSION(1:n)::b
REAL(KIND=8),INTENT(IN),DIMENSION(1:n-1)::a
temp=sum
DO i=1,n-1
temp=temp+2.*a(i)
END DO
DO i=1,n
temp=temp+4.*b(i)
END DO
sim=(temp*h)/6.
end function sim
