% 变步长梯形法
function K = bbctxf(f,a,b,e)
h = b-a;
fa = feval(f,a);
fb = feval(f,b);
K1 = h*(fa+fb)/2;
K2 = K1/2 + h*feval(f,a+h/2)/2;
n = 1;
while abs(K2-K1)>=e
    h = h/2;
    K1 = K2;
    s = 0;
    x = a + h/2;
    while x<b
        fx = feval(f,x);
        s = s + fx;
        x = x + h;
    end
    K2 = K1/2 + s*h/2;
    n = n + 1;
end
K = K2;
