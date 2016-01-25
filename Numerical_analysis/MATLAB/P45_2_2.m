A=[4 3 1;3 3 -5;1 -5 3];a=det(A),B=inv(A)
[V,D]=eig(A)
[norm(A),norm(A,1),norm(A,inf)]
[cond(A),cond(A,1),cond(A,inf)]