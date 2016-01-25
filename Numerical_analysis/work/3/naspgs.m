function x=naspgs(A,b,x0,e,N)
n=length(b);
if nargin<5,N=500;end
if nargin<4,e=1e-4;end
if nargin<3,x0=zeros(n,1);end
x0=sparse(x0);b=sparse(b);A=sparse(A);
x=x0;x0=x+2*e;x0=sparse(x0);
k=0;Al=tril(A);iAl=inv(Al);
while norm(x0-x,inf)>e&k<N,
k=k+1;
x0=x;x=-iAl*(A-Al)*x0+iAl*b;
end
x=full(x);
if k==N,warning('已达迭代次数上限');end
