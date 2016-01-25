function a=multifit(x,y,m)
% 多项式曲线拟合
% (x, y)为原始数据点对
% m：多项式的最高次数:
% a：拟合多项式的系数
N=length(x);
M=length(y);
if(N ~= M)
    error('x,y维数不一致');
end
c(1:(2*m+1))=0;
b(1:(m+1))=0;
for j=1:(2*m+1)          %求出c和b
    for k=1:N
        c(j)=c(j)+x(k)^(j-1);
        if(j<(m+2))
            b(j)=b(j)+y(k)*x(k)^(j-1);
        end
    end
end
C(1,:)=c(1:(m+1));
for s=2:(m+1)
    C(s,:)=c(s:(m+s));
end
a=C\ b';   % 求出拟合系数

