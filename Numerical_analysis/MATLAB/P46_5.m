clear all;
A=zeros(12,12);
for i=1:12
    for j=1:12
        A(i,j)=1/(i+j-1);
    end
end
disp('ÏÔÊ¾Ëù´´¾ØÕó')
A
[cond(A)]
B=inv(A)
a=det(A),b=det(B)
c=a*b-1