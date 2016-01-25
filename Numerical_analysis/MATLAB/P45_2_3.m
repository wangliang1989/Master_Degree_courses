A=[5 7 6 5;7 10 8 7;6 8 10 9;5 7 9 10];a=det(A),B=inv(A)
[V,D]=eig(A)
[norm(A),norm(A,1),norm(A,inf)]
[cond(A),cond(A,1),cond(A,inf)]