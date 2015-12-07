!gfortran -o new main.f95 MBW.f90 UK1.f90 UKE1.f90 ub1.f90 ldlt.f90
IMPLICIT NONE
 CHARACTER(len=20)::filename1
INTEGER::ND,NE,ND1,status,i,j,iw,IE,N
INTEGER,ALLOCATABLE,DIMENSION(:,:)::I3
INTEGER,ALLOCATABLE,DIMENSION(:)::NB1
REAL,ALLOCATABLE,DIMENSION(:)::U,U1,P
REAL,ALLOCATABLE,DIMENSION(:,:)::XY,SK,A
	j=1
	WRITE(*,*)'  输入0，进入自动读取文件模式！'
	READ(*,*)j
	if(j==0) then
		NE=16
		ND=15
		ND1=12
		ALLOCATE(I3(1:3,1:NE))
		filename1='i3'
		OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
		i=1
		DO 
			IF(i>NE)EXIT	
			READ(0,*)I3(1,i),I3(2,i),I3(3,i)
			i=i+1
		END DO
		CLOSE(UNIT=0)
       filename1='xy'
		ALLOCATE(XY(1:2,1:ND))
		OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
		i=1
		DO 
			IF(i>ND)EXIT	
			READ(0,*)XY(1,i),XY(2,i)
			i=i+1
		END DO
		CLOSE(UNIT=0)
		filename1='nb1'
		ALLOCATE(NB1(1:ND1))
		OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
		i=1
		DO 
			IF(i>ND1)EXIT	
			READ(0,*)NB1(i)
			i=i+1
		END DO
		CLOSE(UNIT=0)
		filename1='u1'
	ALLOCATE(U1(1:ND1))
	OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
	i=1
	DO 
		IF(i>ND1)EXIT	
		READ(0,*)U1(i)
		i=i+1
	END DO
	CLOSE(UNIT=0)
	else
	
WRITE(*,*)'请输入单元总数！'
READ(*,*)NE
WRITE(*,*)'请输入节点总数！'
READ(*,*)ND
WRITE(*,*)'请输入第一类边界节点数！'
READ(*,*)ND1
WRITE(*,*)'请输入单元节点编号文件！'
READ(*,*)filename1
ALLOCATE(I3(1:3,1:NE))
OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
i=1
DO 
	IF(i>NE)EXIT	
	READ(0,*)I3(1,i),I3(2,i),I3(3,i)
	i=i+1
END DO
CLOSE(UNIT=0)
WRITE(*,*)'请输入节点坐标文件！'
READ(*,*)filename1
ALLOCATE(XY(1:2,1:ND))
OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
i=1
DO 
	IF(i>ND)EXIT	
	READ(0,*)XY(1,i),XY(2,i)
	i=i+1
END DO
CLOSE(UNIT=0)
WRITE(*,*)'请输入第一类边界节点号文件！'
READ(*,*)filename1
ALLOCATE(NB1(1:ND1))
OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
i=1
DO 
	IF(i>ND1)EXIT	
	READ(0,*)NB1(i)
	i=i+1
END DO
CLOSE(UNIT=0)
WRITE(*,*)'请输入第一类边界节点场值文件！'
READ(*,*)filename1
ALLOCATE(U1(1:ND1))
OPEN(UNIT=0,FILE=filename1,STATUS='OLD',ACTION='READ',IOSTAT=status)
i=1
DO 
	IF(i>ND1)EXIT	
	READ(0,*)U1(i)
	i=i+1
END DO
CLOSE(UNIT=0)
	END IF
WRITE(*,*)'数据录入完成，请检查数据！'
WRITE(*,*)'ND=',ND
WRITE(*,*)'NE=',NE
WRITE(*,*)'ND1=',ND1
i=1
DO
	IF(i>NE)EXIT	
	WRITE(*,*)I3(1,i),I3(2,i),I3(3,i)
	i=i+1
END DO
i=1
DO
	IF(i>ND)EXIT	
	WRITE(*,*)XY(1,i),XY(2,i)
	i=i+1
END DO
i=1
DO 
	IF(i>ND1)EXIT	
	WRITE(*,*)NB1(i)
	i=i+1
END DO
i=1
DO 
	IF(i>ND1)EXIT	
	WRITE(*,*)U1(i)
	i=i+1  
END DO
WRITE(*,*)'下面开始计算'
	CALL MBW(NE,i3,iw)
WRITE(*,*)'MBW子程序完成，结果iw是',iw
ALLOCATE(SK(1:ND,1:IW))
	CALL UK1(ND,NE,IW,I3,XY,SK)
WRITE(*,*)'UK1子程序完成，结果SK是'
DO I=1,ND
	WRITE(*,*)SK(I,1:iw)
END DO
ALLOCATE(U(1:ND))
 CALL UB1(ND1,NB1,U1,ND,IW,SK,U)
WRITE(*,*)'UB1子程序完成，结果SK是'
DO I=1,ND
	WRITE(*,*)SK(I,1:iw)
END DO
WRITE(*,*)'结果U是'
DO I=1,ND
	WRITE(*,*)U(I)
END DO
N=ND
ALLOCATE(A(1:N,1:IW))
ALLOCATE(P(1:N))
A=SK
P=U
 CALL LDLT(A,N,IW,P,IE)
SELECT CASE(IE)
	CASE(0)
		WRITE(*,*)'计算成功'
	CASE(1)
		WRITE(*,*)'出现奇异矩阵，计算失败'
	CASE DEFAULT
		WRITE(*,*)'出现不明错误，计算失败'	
END SELECT
WRITE(*,*)'结果是'
DO I=1,N
	WRITE(*,*)I,P(I)
END DO
END PROGRAM
