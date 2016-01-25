clear all;
n=input('请输入n的值:');
A=zeros(n,n);
B=zeros(n,1);
for i=1:n
    for j=1:n
        if i==j
        A(i,j)=2;
        elseif i==j+1
            A(i,j)=1;
        elseif i==j-1
            A(i,j)=1;
        else
            A(i,j)=0;
        end
    end
end
for i=1:n
    k=mod(i,2);
    if k==1
        B(i,1)=3;
    else
        B(i,1)=4;
    end
end
disp('显示所创矩阵')
A,B
x=zhuiganfa(A,B)