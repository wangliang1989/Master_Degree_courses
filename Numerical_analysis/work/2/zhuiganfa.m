function x=zhuiganfa(A,d)
a=[0 diag(A,-1)'];
b=diag(A)';
c=diag(A,1)';
n=length(b);
u0=0;y0=0;a(1)=0;
L(1)=b(1)-a(1)*u0;
y(1)=(d(1)-y0*a(1))/L(1);
u(1)=c(1)/L(1);
for i=2:(n-1)
L(i)=b(i)-a(i)*u(i-1);
y(i)=(d(i)-y(i-1)*a(i))/L(i);
u(i)=c(i)/L(i);
end
L(n)=b(n)-a(n)*u(n-1);
y(n)=(d(n)-y(n-1)*a(n))/L(n);
x(n)=y(n);
for i=(n-1):-1:1
x(i)=y(i)-u(i)*x(i+1);
end
