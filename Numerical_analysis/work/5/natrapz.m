function t=natrapz(fname,a,b,n)
h=(b-a)/n;
fa=feval(fname,a);
fb=feval(fname,b);
f=feval(fname,a+h:h:b-h+0.001*h);
t=h*(0.5*(fa+fb)+sum(f));
