!--THIS ARTICLE IS WRITTEN IN ANSI（GB18030）--
!
!本程序要求输入一个文件名称，判断这个文件是否存在，如果存在就把它删除，不存在就显示错误信息。
!
!编写时间：2014年12月16日，作者：王亮
IMPLICIT NONE
	CHARACTER(len=20)::filename,err_str
	INTEGER::i
WRITE(*,*)'请输入文件名，此文件将被删除！'
READ(*,*)filename
OPEN(UNIT=1,FILE=filename,STATUS='OLD',IOSTAT=i)
IF (i==0)THEN
	CLOSE(UNIT=1,STATUS='DELETE',IOSTAT=i)
ELSE
WRITE(*,*)'错误，没有这个文件'
END IF
END
