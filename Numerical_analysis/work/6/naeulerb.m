function[x,y]=naeulerb(dyfun,xspan,y0,h)
x=xspan(1):h:xspan(2);
y(1)=y0;
for n=1:length(x)-1
y(n+1)=inter(dyfun,x(n+1),y(n),h);
end
x=x';y=y';
function y=inter(dyfun,x,y,h)
y0=y;e=1e-4;K=1e+4;
y=y+h*feval(dyfun,x,y,h);
y1=y+2*e;k=1;
while abs(y-y1)>e
y1=y;
y=y0+h*feval(dyfun,x,y);
k=k+1;
if k>K,error('diedaisanfa');end
end
