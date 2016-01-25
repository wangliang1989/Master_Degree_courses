function p=naorthfit(x,y,m)
psi=fliplr(eye(m+1,m+1));
p=zeros(1,m+1);
psi(2,m+1)=-sum(x)/length(x);
for k=2:m
t=polyval(psi(k,:),x);
t1=polyval(psi(k-1,:),x);
a=(x.*t)*t'/(t*t');
b=(t*t')/(t1*t1');
psi(k+1,:)=conv([1 -a],psi(k,2:m+1))-b*psi(k-1,:);
end 
for k=1:m 
t=polyval(psi(k+1,:),x);
p(k+1)=y*t'/(t*t'); 
end 
p=p*psi; 