function yt=LagInterp2(x,y,xt)
% 拉格朗日插值
% x,y:插值条件
% xt:用拉格朗日插值函数要计算的自变量，可以是多个
% yt:用拉格朗日插值函数计算出x_t对应的函数值数组
n=length(x);
ny=length(y);
if n~=ny
    error('插值节点x与函数值y不一致');
end
m=length(xt);
yt=zeros(1,m);
for k=1:n
    lk=ones(1,m);
    for j=1:n
        if j~=k,
            lk=lk.*(xt-x(j))/(x(k)-x(j));
        end
    end
    yt=yt+y(k)*lk;
end

