%¼ìÑéÓÃ´úÂë£º
%[q,srm,err]=naadapt(inline('1./log(x)'),1.5,5,5e-3)
function[q,srm,err]=naadapt(fname,a,b,e)
srm=zeros(30,6);
it=0;done=1;m=1;
sr=simpson(fname,a,b,e);
srm(1,1:6)=sr;
state=it;
while(state==it)
n=m;
for j=n:-1:1
p=j;
sr0=srm(p, : );
err=sr0(5);e=sr0(6);
if e<=err
state=done;
a=sr0(1);b=sr0(2);err=sr0(5);e=sr0(6);
c=0.5*(a+b);e2=0.5*e;
sr1=simpson(fname,a,c,e2);
sr2=simpson(fname,c,b,e2);
err=abs(sr0(3)-sr1(3)-sr2(3))/10;
if err<e
srm(p, : )=sr0;
srm(p,4)=sr1(3)+sr2(3);
srm(p,5)=err;
else
srm(p+1:m+1, : )=srm(p:m, : );
m=m+1;
srm(p, : )=sr1;
srm(p+1, : )=sr2;
state=it;
end
end
end
end
q=sum(srm( : ,4));
err=sum(abs(srm(:,5)));
srm=srm(1:m, : );
function z=simpson(fname,a,b,e)
h=b-a;c=0.5*(a+b);
f=feval(fname,[a c b]);
s=h*(f(1)+4*f(2)+f(3))/6;
s2=s;err=e;
z=[a b s s2 err e];
