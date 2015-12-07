PROGRAM sort
!--THIS ARTICLE IS WRITTEN IN ANSI（GB18030）--
!
!本程序读取一个实数数据组，然后把这些数由小到大排列。数据录入要求：数据应该放在一个程序能够有权限读取的顺序文件中，其每一行应为一个实数。
!
!编写时间：2014年11月7日，作者：王亮
IMPLICIT NONE
!数据字典和变量申明
	INTEGER::i
	INTEGER::nvals=0
	INTEGER::status
	REAL::temp
	LOGICAL::done
	CHARACTER(len=20)::filename
	REAL,ALLOCATABLE,DIMENSION(:)::a
!程序执行部分
!告知用户程序使用方法
WRITE(*,*)'==================================================================='
WRITE(*,*)'程序功能：本程序读取一个实数数据组，然后把这些数由小到大排列。'
WRITE(*,*)'数据录入要求：数据应该放在一个程序有权限读取的文件名小于20个字符的顺序文件中，其每一行应为一个实数。'
WRITE(*,*)'编写时间：2014年11月7日，作者：王亮'
WRITE(*,*)'==================================================================='
!获取数据文件名称
WRITE(*,*)'现在，请输入文件名！'
READ(*,1000)filename
1000 FORMAT(A20)
!打开数据文件
OPEN(UNIT=1,FILE=filename,STATUS='OLD',ACTION='READ',IOSTAT=status)
!判断数据文件是否打开成功
IF(status==0) THEN !如果打开成功，数据录入给数组a
	!检索文件中数据，将文件中的实数个数赋值给nvals
	DO
		READ(1,*,IOSTAT=status) temp
		IF(status/=0) EXIT
		nvals=nvals+1
	END DO
	!回到文件的开头
	REWIND(UNIT=1)
	!给可分配数组a确定其大小
	ALLOCATE(a(1:nvals),STAT=status)
	IF(status/=0)THEN !如果出现数据过大等情况，告知用户内存不够而分配不成功，程序终止
		WRITE(*,*)'内存不足，程序终止'
		STOP
	END IF
	!如果文件能够成功打开且能将数据正常赋值给可分配数组，向用户回显原始数据
	WRITE(*,*)'文件打开成功，您输入的原始数据是'
	DO i=1,nvals
		READ(1,*) a(i)
		WRITE(*,*)i,a(i)
	END DO
ELSE!如果文件打开不成功，告知用户,并终止程序
	WRITE(*,*)'文件打开失败，程序终止！'
	STOP
END IF
!用冒泡算法计算结果：在inner循环中，检查i和i+1两个实数的大小，如果前者大就调换其顺序，
!循环i=1,navls-1对应第1个数据到倒数第二个（因为循环内命令出现i+1，所以最后一个
!实数是参与比较了的，如果i=1,navls反而会造成越界错误）。
!outer循环：不断执行inner，以反复调换实数，当不存在需要调换情况时，done变量将保持真，被EXIT命令捕捉，退出循环。
outer: DO
	done=.TRUE.
	inner:DO i=1,nvals-1
		IF(a(i)>a(i+1)) THEN
			temp=a(i)
			a(i)=a(i+1)
			a(i+1)=temp
			done=.FALSE.
		END IF
	END DO inner
	IF(done)EXIT
END DO outer
!屏幕上输出结果
WRITE(*,*)'计算完成，结果是'
DO i=1,nvals		
	WRITE(*,*)i, a(i)
END DO
DO
	WRITE(*,*)'是否需要将文件输出为文件？y/Y=是，n/N=否'
	READ(*,*)filename
	IF( (filename=='y').OR.(filename=='Y') )EXIT
	IF( (filename=='n').OR.(filename=='N') )THEN
		WRITE(*,*)'您输入的是',TRIM(ADJUSTL(filename)),'。程序结束，再见！'
		STOP
	ELSE 
		WRITE(*,*)'您输入的是',TRIM(ADJUSTL(filename))
		WRITE(*,*)'本程序只能接受y/Y或者n/N'
		WRITE(*,*)'为了保护数据，除非按规则输入，程序不会正常停止！'
	END IF
END DO
!询问用户输出文件的输出名，创建数据文件，并且最大程度保护计算结果和其他数据
DO
	WRITE(*,*)'请键入输出结果文件名。文件名不超过20个字符'
	READ(*,*)filename
	OPEN(UNIT=3,FILE=filename,STATUS='NEW',ACTION='READWRITE',IOSTAT=status)
	IF(status==0) THEN !如果打开成功，数据录入给数组a
		WRITE(*,*)'文件创建成功!'
		DO i=1,nvals		
			WRITE(3,*)i, a(i)
		END DO
		WRITE(*,*)'数据存储完成，程序结束，再见！'
	ELSE!如果文件打开不成功，告知用户重新输入文件名
		WRITE(*,*)'文件创建失败，可能是已经存在同名文件或文件夹'
		WRITE(*,*)'为保护数据，除非输入可以使用的文件，程序才正常结束'
	END IF
	IF(status==0) EXIT
END DO
END PROGRAM sort
