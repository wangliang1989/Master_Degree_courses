function x=nags(A,b,x0,e,N)
n=length(b);
if nargin<5,N=500;end
if nargin<4,e=1e-4;end
if nargin<3,x0=zeros(n,1);end
x=x0;x0=x+2*e;
k=0;Al=tril(A);iAl=inv(Al);
while norm(x0-x,inf)>e&k<N,
k=k+1;
x0=x;x=-iAl*(A-Al)*x0+iAl*b;
disp(x')
end
if k==N,warning('已达迭代次数上限');end
