function z=romberg(f,a,b,e)%f是被积函数
h=(b-a);
TT(1,1)=h.*(f(b)+f(a))/2;
k=2;
TT(1,2)=TT(1,1)./2+h/2.*f(a+h/2);
TT(2,1)=TT(1,2).*4/3-TT(1,1)./3;
z=TT(2,1);
while abs((TT(k,1)-TT(k-1,1))./TT(k,1))>=e
    k=k+1;h=h./2;
    for j2=1:2.^(k-2)
    ff(1,j2)=f(a+h*(j2-1/2));
end
fff=sum(ff).*h/2;
TT(1,k)=TT(1,k-1)./2+fff;
for j1=2:k
    TT(j1,k-j1+1)=4^(j1-1).*TT(j1-1,k-j1+2)./(4^(j1-1)-1)-TT(j1-1,k-j1+1)/(4^(j1-1)-1);
    z=TT(j1,k-j1+1);
end
end
