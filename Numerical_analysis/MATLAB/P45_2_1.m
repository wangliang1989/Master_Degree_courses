A=[4 1 -1; 3 2 -6; 1 -5 3 ];a=det(A),B=inv(A)
[V,D]=eig(A)
[norm(A),norm(A,1),norm(A,inf)]
[cond(A),cond(A,1),cond(A,inf)]