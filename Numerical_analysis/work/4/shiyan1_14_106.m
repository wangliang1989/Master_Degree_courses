x = -1:3;
y = x.^4+3*x.^3-1;
disp('多项式拟合')
nafit(x,y,3)
disp('正交多项式拟合')
naorthfit(x,y,3)