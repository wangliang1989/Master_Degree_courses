%实验3.7
%A=[4 3 0;3 5 -1;0 -1 4];b=[24 30 -24]';ep=1e-5;it_max=100;
%[x,k,index]=jacobi(A,b,ep,it_max)
A=[5 2 1;-1 3 2; 2 -3 4];
b=[-12 17  -9];
ep=0.5e-2;
it_max=200;
[x,k,index]=jacobi(A,b,ep,it_max)
