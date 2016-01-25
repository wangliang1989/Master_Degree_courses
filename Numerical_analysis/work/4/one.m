%实验4.1.3
disp('线性插值')
x=[100 121];
y=[10 11];
xx=115;
yy22=polyfit(x,y,1)
yy22(1)*xx+yy22(2)
%yy1=nalagr(x,y,xx)
%yy12=interp1(x,y,xx)
disp('抛物线插值')
x=[100 121 144];
y=[10 11 12];
xx=115;
%yy2=nalagr(x,y,xx)
yy22=polyfit(x,y,2)
yy22(1)*xx^2+yy22(2)*xx+yy22(3)
