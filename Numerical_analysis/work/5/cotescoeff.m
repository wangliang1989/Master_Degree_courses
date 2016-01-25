function Ck=cotescoeff(n)  %求柯特斯积分系数
    for i=1:n+1
       k=i-1;     
       Ck(i)=(-1)^(n-k)/factorial(k)/factorial(n-k)/n*quadl(@(t)intfun(t,n,k),0,n);
end
