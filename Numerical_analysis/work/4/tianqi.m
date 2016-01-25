clear all
c=14.0;
x=[0:1:24];
y=[15,14,14,14,14,15,16,18,20,22,23,25,28,31,32,31,29,27,25,24,22,20,18,17,16];
y1=log(y);
x1=x;
for i=1:25
x1(i)=(x(i)-c)*(x(i)-c);
end
a1=polyfit(x,y,2);         %二次多项式拟合%
a2= polyfit(x,y,3);           %三次多项式拟合%
a3= polyfit(x,y,4) ;           %四次多项式拟合%
a4= polyfit(x1,y1,1); 
b=-1*a4(1);
a=exp(a4(2));

b1= polyval(a1,x);
b2= polyval(a2,x);
b3= polyval(a3,x);
for i=1:25
b4(i)=a*exp(-1*b*(x(i)-c)*(x(i)-c));
end
r1= sum((y-b1).^2)           %二次多项式误差平方和%
r2= sum((y-b2).^2)          %三次多项式误差平方和%
r3= sum((y-b3).^2)          %四次多项式误差平方和%
r4= sum((y-b4).^2) 
plot(x,y,'*')          %用*画出x,y图像%
hold on
plot(x,b1, 'r')          %用红色线画出x,b1图像%
hold on
plot(x,b2, 'g')         %用绿色线画出x,b2图像%
hold on
plot(x,b3, 'b')         %用蓝色o线画出x,b3图像%    
hold on
plot(x,b4, 'k')   
hold off
