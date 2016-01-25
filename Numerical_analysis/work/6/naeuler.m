%欧拉格式解微分方程
function[x,y]=naeuler(dyfun,xspan,y0,h)
x=xspan(1):h:xspan(2);
y(1)=y0;
for n=1:length(x)-1
y(n+1)=y(n)+h*feval(dyfun,x(n),y(n));
end
x=x';y=y';
