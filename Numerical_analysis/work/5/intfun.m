function f=intfun(t,n,k)  %柯特斯系数中的积分表达式
    f=1;
    for i=[0:k-1,k+1:n]
       f=f.*(t-i);
end
