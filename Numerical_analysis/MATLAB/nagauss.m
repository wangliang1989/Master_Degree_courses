function x=nagauss(a,b,flag)
if nargin<3,flag=0;end
n=length(b);a=[a,b];
for k=1:(n-1)
    a((k+1):n,(k+1):(n+1))=a((k+1):n,(k+1):(n+1))...
        -a((k+1):n,k)/a(k,k)*a(k,(k+1):(n+1));
    a((k+1):n,k)=zeros(n-k,1);
    if flag==0,a,end
end
x=zeros(n,1);
x(n)=a(n,n+1)/a(n,n);
for k=n-1:-1:1
    x(k,:)=(a(k,n+1)-a(k,(k+1):n)*x((k+1):n))/a(k,k);
end