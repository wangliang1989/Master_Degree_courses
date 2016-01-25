function x=nabisect(fname,a,b,e)
if nargin<4,e=1e-4;end;
fa=feval(fname,a);fb=feval(fname,b);
if fa*fb>0,error('函数在两端点值必须异号');end
x=(a+b)/2
while (b-a)>(2*e),
fx=feval(fname,x);
if fa*fx<0,b=x;fb=fx;else a=x;fa=fx;end
x=(a+b)/2
end
