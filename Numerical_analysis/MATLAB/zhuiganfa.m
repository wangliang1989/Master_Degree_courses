function x=zhuiganfa(A,B,flag)
n=length(B);
Q=zeros(1,n);P=zeros(1,n);O=zeros(1,n);
for i=1:n
    if i==1
        Q(i)=0;P(i)=A(i,i);O(i)=A(i,i+1);
    elseif i==n
        Q(i)=A(i,i-1);P(i)=A(i,i);O(i)=0;
    else
        Q(i)=A(i,i-1);P(i)=A(i,i);O(i)=A(i,i+1);
    end
end
d=B;
L0=0;y0=0;Q(1)=0;
%“追”的过程
L(1)=P(1)-Q(1)*L0;
y(1)=d(1)-y0*Q(1)/L(1);
for m=2:(n-1)   
    L(m)=P(m)-Q(m)*L(m-1);    
    y(m)=d(m)-y(m-1)*Q(m)/L(m);    
end
L(n)=P(n)-Q(n)*L(n-1);
y(n)=d(n)-y(n-1)*Q(n)/L(n);
%“赶”的过程
x(n)=y(n);
for m=(n-1):-1:1   
    x(m)=y(m)-L(m)*x(m+1);
end