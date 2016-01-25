function Runge()
xt=-5:0.1:5;
x=-5:2:5;
y=1./(1+x.^2);
yt_1 = LagInterp2(x,y,xt);
x=-5:1:5;
y=1./(1+x.^2);
yt_2 = LagInterp2(x,y,xt);
y=1./(1+xt.^2);
plot(xt,y,'k-') % 1/(1+x^2);
hold on
plot(xt,yt_1,'--b') % n=5
hold on
plot(xt,yt_2,'-.r') % n=10
legend('1/(1+x^2)','n=5','n=10')
xlabel('x')
