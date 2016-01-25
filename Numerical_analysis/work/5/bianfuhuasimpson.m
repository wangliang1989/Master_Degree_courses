%变步长辛普森积分法
function  I =bianfuhuasimpson(fx,a,b,epsilon,M) 
% 调用方式： I =fuhuasimpson(@fx,a,b,epsilon) 
% fx -- 求积函数（函数文件） 
% a, b -- 求积区间 
% epsilon -- 计算精度 
%  M--最大允许输出划分数 
n=1; 
h = (b-a)/n; 
T1 = h*(feval(fx,a)-feval(fx,b))/2; 
Hn=h*feval(fx,(a+b)/2); 
S1=(T1+2*Hn)/3; 
n=2*n; 
while n<=M 
   T2=(T1+Hn)/2;    
Hn=0;    
h=(b-a)/n;  
for j=1:n 
x(j)=a+(j-1/2)*h;     
y(j)=feval(fx,x(j));     
Hn=Hn+y(j); 
end 
 Hn=h*Hn; 
 S2=(T2+2*Hn)/3; 
 fprintf(' n=%2d   S2=%-12.9f  S2-S1=%-12.9f\n',n,S2,abs(S2-S1)); 
if  abs(S2-S1)<epsilon    
break; 
else  
T1=T2;     S1=S2;     n=2*n; 
end 
end 
I=S2;
