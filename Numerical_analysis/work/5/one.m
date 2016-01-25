%实验5.4
disp('simpson')
f1=@ (x)(1/sqrt(2*pi))*exp(-(x.^2/2));
%y1=0;
%or i=1:10
%[temp,Ck,Ak]=NewtonCotes(f1,0.1*(i-1),0.1*i,2);
%y1=y1+temp;
%end
%y1
x=0:0.1:1;y=(1/sqrt(2*pi))*exp(-(x.^2/2));
I=S_quad(x,y)
%disp('tixingfa')
%[y1,Ck,Ak]=NewtonCotes(f1,0,1,1)
disp('梯形法')
natrapz(f1,0,1,20)
