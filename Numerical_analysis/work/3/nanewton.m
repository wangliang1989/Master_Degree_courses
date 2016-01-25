function x=nanewton(fname,dfname,x0,e,N)
if nargin<5,N=500;end
if nargin<4,e=1e-4;end
x=x0;x0=x+2*e;k=0;
while abs(x0-x)>e&k<N,
k=k+1;
x0=x;x=x0-feval(fname,x0)/feval(dfname,x0);
disp(x)
end
if k==N,warning('已达迭代次数上限');end
