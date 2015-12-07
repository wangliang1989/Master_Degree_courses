!--THIS ARTICLE IS WRITTEN IN ANSI£¨GB18030£©--
RECURSIVE SUBROUTINE factorial(n,result)
IMPLICIT NONE
INTEGER(KIND=8),INTENT(IN)::n
INTEGER(KIND=8),INTENT(OUT)::result
INTEGER(KIND=8)::temp
IF(n>=1)THEN
	CALL factorial(n-1,temp)
	result=n*temp
ELSE
	result=1
END IF
END SUBROUTINE factorial
