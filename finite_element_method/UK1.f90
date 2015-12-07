SUBROUTINE UK1(ND,NE,IW,I3,XY,SK)
IMPLICIT NONE
INTEGER::i,j,K,L,NJ,NK
INTEGER,INTENT(IN)::ND,NE,IW
INTEGER,INTENT(IN),DIMENSION(1:3,1:NE)::I3
REAL,DIMENSION(1:3)::X,Y
REAL,DIMENSION(1:3,1:3)::KE
REAL,INTENT(IN),DIMENSION(1:2,1:ND)::XY
REAL,INTENT(OUT),DIMENSION(1:ND,1:IW)::SK
DO 10 i=1,ND
DO 10 j=1,IW
10 SK(I,J)=0
DO 20 L=1,NE
DO 30 J=1,3
I=I3(J,L)
X(J)=XY(1,I)
 30 Y(J)=XY(2,I)
 CALL UKE1(X,Y,KE)
DO 40 J=1,3
NJ=I3(J,L)
DO 40 K=1,J
NK=I3(K,L)
IF (NJ.LT.NK)GOTO 50
NK=NK-NJ+IW
SK(NJ,NK)=SK(NJ,NK)+KE(J,K)
GOTO 40
50 NJ=NJ-NK+IW
SK(NK,NJ)=SK(NK,NJ)+KE(J,K)
NJ=NJ+NK-IW
40 CONTINUE
20 CONTINUE
RETURN
END











