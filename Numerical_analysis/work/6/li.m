clear;dyfun=inline('y-2*x/y');
disp('欧拉格式')
[x,y]=naeuler(dyfun,[0,1],1,0.2);[x,y]
disp('隐式欧拉格式')
[x,y]=naeulerb(dyfun,[0,1],1,0.2);[x,y]
disp('改进欧拉格式')
[x,y]=naeuler2(dyfun,[0,1],1,0.2);[x,y]
