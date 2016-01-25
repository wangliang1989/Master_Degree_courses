%实验3.3
fun=inline('x^4-2^x');
fplot(fun,[-2 2])
disp('fplot函数要求端点函数值异号，做图发现区间应该为[-2 2]')
fzero(fun,[-2 1])
fzero(fun,[1 2])
