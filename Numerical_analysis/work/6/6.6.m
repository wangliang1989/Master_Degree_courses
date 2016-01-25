clear;dyfun=inline('y-2*x/y');
[x,y]=naeuler(dyfun,[0,1],1,0.2);[x,y]
[x,y]=naeulerb(dyfun,[0,1],1,0.2);[x,y]
[x,y]=naeuler2(dyfun,[0,1],1,0.2);[x,y]
clear;
dyfun=inline('-50*y')
