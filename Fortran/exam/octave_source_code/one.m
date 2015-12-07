x=0:(pi/600000):(pi/6);y=sin(3*x)+cos(x);
I=S_quad(x,y)
x=0:0.001:10;y=5*x.^3+2*x-10;
I=S_quad(x,y)
x=0:0.001:1;y=1./(1.+x.**2);
I=S_quad(x,y)
