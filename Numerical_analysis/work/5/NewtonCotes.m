function [y,Ck,Ak]=NewtonCotes(fun,a,b,n)
%NewtonCotes：牛顿-柯特斯数值积分法
%a：积分下限
%b：积分上限
%n：积分阶数；n=1，为梯形积分；n=2,为辛普森积分；n<=8,否则难保积分的稳定性
%fun为被积函数：fun=@（x）被积函数具体表达式
if nargin==1
    [mm,nn]=size(fun);
    if mm>8
        error
    end
 xk=fun(1,:);
 fk=fun(2,:);
 a=min(xk);
 b=max(xk);
 n=mm-1;
end
if nargin==4
    xk=linspace(a,b,n+1);
    if isa(fun,'function_handle')
       fx=fun(xk);
    end 
end
    Ck=cotescoeff(n);
    Ak=(b-a)*Ck;
y=Ak*fx';
