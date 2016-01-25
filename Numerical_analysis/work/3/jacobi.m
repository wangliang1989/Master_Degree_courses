function [x,k,index]=Jacobi(A,b,ep,it_max)
%求线性方程组的雅可比迭代法；
%A为方程组的系数矩阵；
%b为方程组的右瑞项；
%x为方程组的解；
% ep为精度要求，缺省值为1e-5；
%it_max为最大迭代次数，缺省值为100；
%k为迭代次数；
%index为指标变量，index=0表示计算失败，index=1表示计算成功；
if nargin<4
    it_max=100;
end
if nargin<3
    ep=1e-5;
end
n=length(A);k=0;x=zeros(n,1);y=zeros(n,1);index=1;
while k<=it_max
    for i=1:n
       if abs(A(i,i))<1e-10 
            index=0;
            return;
       end
       y(i)=(b(i)-A(i,1:n)*x(1:n)+A(i,i)*x(i))/A(i,i);
end
if norm(y-x,inf)<ep
        break;
        end
    k=k+1;
    x=y;
end
