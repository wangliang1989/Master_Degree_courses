SUBROUTINE mysqrt(a,x,y)
IMPLICIT NONE
REAL,INTENT(IN)::x,y
REAL,INTENT(OUT)::a
a=sqrt(x**3+y**4)
END
