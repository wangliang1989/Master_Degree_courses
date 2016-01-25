%李林瑞
%拉格朗日插值方法,也就是所说的线性插值和抛物线插值
function yy = lagrange(x,y,xx);
m = length (x);
n = length (y);
if m ~= n, error('向量x，y的长度必须一致');
end
s=0;
for i = 1: n
    t = ones(1, length(xx));
    for j = 1: n
        if j ~= i,
            t = t.*( xx - x(j) )/( x(i) - x(j) );
        end
    end
    s = s + t * y(i);
end
yy = s;
%105页第3题插值法
% x = [100 121] ; y = [10 11]; xx = 115;
% yy1 = lagrange (x, y, xx)
% x = [100 121 144] ; y = [10 11 12]; xx = 115;
% yy2 = lagrange (x, y, xx)
