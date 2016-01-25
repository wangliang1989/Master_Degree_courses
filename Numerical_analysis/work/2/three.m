%实验2.5
%产生一个n阶hilbert矩阵，并计算其相关信息，再用hilb函数计算对比
clear all;
n=input('请输入n的值:');
A=zeros(n,n);
for i=1:n
for j=1:n
A(i,j)=1/(i+j-1);
end
end
A
disp('2-条件数')
cond(A,2)
disp('逆矩阵')
inv(A)
disp('norm(inv(A)*A-eye(n))')
norm(inv(A)*A-eye(n))
disp('det(A)*det(inv(A))-1')
det(A)*det(inv(A))-1
