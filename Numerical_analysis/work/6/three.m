%实验6.5
clear;dyfun=inline('x+y');
disp('结果1') 
[x,y]=nark4(dyfun,[0,0.4],1,0.01);[x,y]
disp('结果2') 
format long;[x,y]=nark4v(dyfun,[0,0.4],1,1e-5,0.01);[x,y],format short;
