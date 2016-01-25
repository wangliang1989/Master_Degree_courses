%实验5.5
fun=inline('sin(x)/x')
disp('变步长梯形法')
bbctxf(fun,eps,1,5e-7)
disp('romberg')
romberg(fun,eps,1,5e-7)
