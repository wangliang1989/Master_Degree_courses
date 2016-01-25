function z=bianbuchang(f,a,b,e)%f是被积函数
h=(b-a);
t(1)=h*(f(b)+f(a))/2;
t(2)=1/2*t(1)+h/2*f(a+h/2);
k=2;
while (abs(t(k)-t(k/2)))>e
	h=h*0.5;
	k=k*2;
	m=0;
	for i=1,k/2
		m=m+f(a+i*h/2);
	end
	t(k)=t(k/2)/2+h/2*m;
end
z=t(k)
