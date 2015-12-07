!--THIS ARTICLE IS WRITTEN IN ANSI (GB18030)
!
!本程序读取数个二维坐标。这数个二维实数组是任意函数的部分点的横纵坐标，然后依据这些坐标，求其均差
!数据录入要求：数据应该放在一个程序能够有权限读取的顺序文件中。文件的每一行一个点的横纵坐标。第一个是横坐标，第二个是纵坐标
!本程序优秀之处：数据输出和输入全部使用文件；最大程度保护用户数据；录入数据可不按照大小顺序录入，程序可自动排序
!
!编写时间：2014年11月21日，作者：王亮
IMPLICIT NONE
!数据字典和变量申明
	INTEGER::i,j
	INTEGER::nvals=0
	INTEGER::status
	REAL::temp1,temp2
	LOGICAL::done
	CHARACTER(len=20)::filename
	REAL,ALLOCATABLE,DIMENSION(:,:)::a
!程序执行部分
!告知用户程序使用方法
WRITE(*,*)'==================================================================='
WRITE(*,*)'THIS PROGRAM IS SHOWN IN ANSI（GB18030）'
WRITE(*,*)'程序功能：本程序根据任意函数的部分点的横纵坐标，计算其均差。'
WRITE(*,*)'数据录入要求：数据应放在一个文件中。文件的每一行为一个点的横纵坐标。第一个是横坐标，第二个是纵坐标。'
WRITE(*,*)'编写时间：2014年11月21日，作者：王亮'
WRITE(*,*)'==================================================================='
!获取数据文件名称
WRITE(*,*)'现在，请键入输入文件名！文件名字符不得超过20个字符！'
READ(*,1000)filename
1000 FORMAT(A20)
!打开数据文件
OPEN(UNIT=1,FILE=filename,STATUS='OLD',ACTION='READ',IOSTAT=status)
!判断数据文件是否打开成功
IF(status==0) THEN !如果打开成功，数据录入给数组a
	!检索文件中数据，将文件中的实数个数赋值给nvals
	DO
		READ(1,*,IOSTAT=status) temp1,temp2
		IF(status/=0) EXIT
		nvals=nvals+1
	END DO
	!回到文件的开头
	REWIND(UNIT=1)
	!给可分配数组a确定其大小
	ALLOCATE(a(0:nvals-1,-1:nvals-1),STAT=status)
	IF(status/=0)THEN !如果出现数据过大等情况，告知用户内存不够而分配不成功，程序终止
		WRITE(*,*)'内存不足，程序终止'
		STOP
	END IF
	!如果文件能够成功打开且能将数据正常赋值给可分配数组，向用户回显原始数据
	WRITE(*,*)'文件打开成功，您输入的原始数据是'
	DO i=0,nvals-1
		READ(1,*) a(i,-1),a(i,0)
		WRITE(*,*)i,a(i,-1),a(i,0)
	END DO
ELSE!如果文件打开不成功，告知用户,并终止程序
	WRITE(*,*)'文件打开失败，程序终止！'
	STOP
END IF
WRITE(*,*)'您的原始数据共',nvals,'组','将计算到',nvals-1,'阶均差'
!用冒泡算法对数据按横坐标由小到大排序：在inner1循环中，检查i和i+1两个实数的大小，如果前者大就调换其顺序，
!循环i=1,navls-1对应第1个数据到倒数第二个（因为循环内命令出现i+1，所以最后一个
!数是参与比较了的，如果i=1,navls反而会造成越界错误）。
!outer1循环：不断执行inner1，以反复调换实数，当不存在需要调换情况时，done变量将保持真，被EXIT命令捕捉，退出循环。
!屏幕上输出结果
outer1: DO
	done=.TRUE.
	inner1:DO i=0,nvals-2
		IF(a(i,0)>a(i+1,0)) THEN
			temp1=a(i,-1)
			temp2=a(i,0)
			a(i,-1)=a(i+1,-1)
			a(i,0)=a(i+1,0)
			a(i+1,-1)=temp1
			a(i+1,0)=temp2
			done=.FALSE.
		END IF
	END DO inner1
	IF(done)EXIT
END DO outer1
WRITE(*,*)'调序完成：'
DO i=0,nvals-1		
	WRITE(*,*)i, a(i,-1),a(i,0)
END DO
WRITE(*,*)'==============================='
WRITE(*,*)'计算完成！'
WRITE(*,*)'==============================='
!下面的outer2循环是本程序的核心代码，核心代码仅5行
!outer2循环计算的是第j阶均差的结果。
!inner2循环计算的各阶均差的结果，依据就是均差的定义式
!注意：a循环存放输入数据和输出数据。行：0开始，列：-1开始。前两列放的是输入数据，之后的部分放入输出数据
!输出数据放入的元素是按照均差表排序的
!本算法的缺点是如果计算n个数据点的均差，会浪费1/2×（n×（n-1））各元素的内存，浪费率几乎为一半
outer2: DO j=1,nvals-1
	WRITE(filename,*)j
	WRITE(*,*)'#',TRIM(ADJUSTL(filename)),'阶差商结果开始'
	inner2: DO i=j,nvals-1
		a(i,j)=(a(i,j-1)-a(i-1,j-1))/(a(i,-1)-a(i-j,-1))
		WRITE(*,*)a(i,j)
	END DO inner2
	WRITE(*,*)'#',TRIM(ADJUSTL(filename)),'阶差商结果结束'
END DO outer2
!询问用户是否输出文件，最大程度保护计算结果，直到明确用户用途才关闭程序
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
		DO j=1,nvals-1
			WRITE(filename,*)j
			WRITE(3,*)'#',TRIM(ADJUSTL(filename)),'阶差商结果开始'
			DO i=j,nvals-1
				WRITE(3,*)a(i,j)
			END DO
			WRITE(3,*)'#',TRIM(ADJUSTL(filename)),'阶差商结果结束'
		END DO
		WRITE(*,*)'数据存储完成，程序结束，再见！'
	ELSE!如果文件打开不成功，告知用户重新输入文件名
		WRITE(*,*)'文件创建失败，可能是已经存在同名文件或文件夹'
		WRITE(*,*)'为保护数据，除非输入可以使用的文件，程序才正常结束'
	END IF
	IF(status==0) EXIT
END DO
END PROGRAM
