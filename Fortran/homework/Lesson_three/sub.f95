!--THIS ARTICLE IS WRITTEN IN ANSI��GB18030��--
SUBROUTINE sub(n,result)
IMPLICIT NONE
INTEGER(KIND=8)::i
INTEGER(KIND=8),INTENT(IN)::n
INTEGER(KIND=8),INTENT(OUT)::result
result=1
DO i=1,n
	result=result*i
END DO
END SUBROUTINE
