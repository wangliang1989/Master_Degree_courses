clear all;
n=input('请输入n的值:');
A=zeros(n,n);
for i=1:n
    for j=1:n
        if i==j
        A(i,j)=5;
        elseif i==j+1
            A(i,j)=1;
        elseif i==j-1
            A(i,j)=6;
        else
            A(i,j)=0;
        end
    end
end
disp('显示所创矩阵')
A
A;a=det(A),B=inv(A)
[V,D]=eig(A)
[norm(A),norm(A,1),norm(A,inf)]
[cond(A),cond(A,1),cond(A,inf)]