function[x,y]=nark4v(dyfun,xspan,y0,e,h)
if nargin<5,h=(xspan(2)-xspan(1))/10;end
n=1;x(n)=xspan(1);y(n)=y0;
[y1,y2]=comput(dyfun,x(n),y(n),h);
while x(n)<xspan(2)-eps
if abs(y2-y1)/10>e
while abs(y2-y1)/10>e
h=h/2;
[y1,y2]=comput(dyfun,x(n),y(n),h);
end
else
while abs(y2-y1)/10<=e
h=2*h;
[y1,y2]=comput(dyfun,x(n),y(n),h);
end
h=h/2;h=min(h,xspan(2)-x(n));
[y1,y2]=comput(dyfun,x(n),y(n),h);
end
n=n+1;x(n)=x(n-1)+h;y(n)=y2;
[y1,y2]=comput(dyfun,x(n),y(n),h);
end
x=x';y=y';
function[y1,y2]=comput(dyfun,x,y,h)
y1=rk4(dyfun,x,y,h);
y21=rk4(dyfun,x,y,h/2);
y2=rk4(dyfun,x+h/2,y21,h/2);
function y=rk4(dyfun,x,y,h);
k1=feval(dyfun,x,y);
k2=feval(dyfun,x+h/2,y+h/2*k1);
k3=feval(dyfun,x+h/2,y+h/2*k2);
k4=feval(dyfun,x+h,y+h*k3);
y=y+h*(k1+2*k2+2*k3+k4)/6;
