function [x,y] = euler4mid(f,xspan,y0,h)
x = xspan(1) : h :xspan(2);
y(1) = y0;
for n = 1: length(x)-1
    y(n+1) = y(n)+h*feval(f,x(n)+h/2,y(n)+h*feval(f,x(n),y(n)));
end
x = x';y = y';
% [x,y] = mideuler4(@(x,y)y-2*x/y,[0 1],1,0.2)