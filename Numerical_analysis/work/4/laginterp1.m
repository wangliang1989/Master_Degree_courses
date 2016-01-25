%不用
function[yt,L]=laginterp1(x,y,xt)
syms t;
n=length(x);
ny=length(y);
if n~=ny
	error('')
end
L=0.0;
for k=1:n
1k=1;
for j=1:n
if j~=k
1k=1k*(t-x(j))/(x(k)-x(j));
end
end;
L=L+y(k)*1k;
end
simplfy(L);
L=collect(L);
yt=subs(L,'t',xt);
