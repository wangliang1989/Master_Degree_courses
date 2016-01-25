%%%%%%%%%%%多项式拟合（最小二成拟合）%%%%%%%%%%
function p=nafit(x,y,m)
A=zeros(m+1,m+1);
for i=0:m
    for j=0:m
        A(i+1,j+1)=sum(x.^(i+j));
    end
    b(i+1)=sum(x.^i.*y);
end
a=A\b';
p=fliplr(a');

%x=[-1 0 1 2 3];y=[-3 -1 3 25 161];
%nafit(x,y,3)