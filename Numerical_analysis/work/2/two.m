%实验2.2.4
%产生一个三对角n阶矩阵，并计算其行列式，逆，特征值，特征向量，各种范数，条件数
clear all;
n=input('请输入n的值:');
A=zeros(n,n);
for i=1:n
A(i,i)=5;
end
for i=1:n-1
A(i,i+1)=6;
end
for i=2:n
A(i,i-1)=1;
end
A
disp('矩阵的行列式')
det(A)
disp('矩阵的逆矩阵')
inv(A)
disp('矩阵的特征值和特征向量')
[v,d]=eig(A)
disp('矩阵的2-范数')
norm(A,2)
disp('矩阵的1-范数')
norm(A,1)
disp('矩阵的无穷-范数')
norm(A,inf)
disp('矩阵的2-条件数')
cond(A,2)
disp('矩阵的1-条件数')
cond(A,1)
disp('矩阵的无穷-条件数')
cond(A,inf)
disp('矩阵的倒条件数')
rcond(A)
