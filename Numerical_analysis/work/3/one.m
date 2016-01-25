%实验3.2
fun=inline('x*log(sqrt(x^2-1)+x)-sqrt(x^2-1)-0.5*x');
disp('二分法')
%fplot(fun,[-5,5])
x=nabisect(fun,1,5,0.0001)
disp('Newton迭代法')
dfun=inline('log(sqrt(x^2-1)+x)+x*1/(sqrt(x^2-1)+x)*(1+x*1/sqrt(x^2-1))-0.5-x*1/sqrt(x^2-1)');
nanewton(fun,dfun,1.5,0.5e-3)
