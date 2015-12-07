function I=S_quad(x,y)
n=length(x);m=length(y);
if n~=m
error('The lengths of X and Y must be equal');
return;
end
N=(n-1)/2;h=(x(n)-x(1))/N;a=zeros(1,n);
for k=1:N
a(2*k-1)=a(2*k-1)+1;a(2*k)=a(2*k)+4;
a(2*k+1)=a(2*k+1)+1;
end
I=h/6*sum(a.*y);
