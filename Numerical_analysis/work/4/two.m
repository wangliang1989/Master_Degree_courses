%实验4.1.11
%x=[2.2500 2.3000 2.3900 2.4500 2.5300];
%y=[0.5000 0.5477 0.6245 0.6708 0.7280];
%xt=2.4900;
%f0=1.000;
%fn=0.6868;
%[yt b c d]=maspline(x,y,xt,1,f0,fn)
%x=[-1 0 1];
%y=[-1 0 1];
%t=0.5;
%f0=0;
%fn=-1;
%[yt b c d]=maspline(x,y,xt ,2,f0,fn)
x=[-1 0 1 2];
y=[-1 0 1 0];
%xt=-0.5;
%f0=0;
%fn=-1;
%[yt b c d]=maspline(x,y,xt,1,f0,fn)
disp('第一小题')
pp=csape(x,y,'complete',[0,-1])
%xt=-1:.1:2;
%spline(x,y,xt)
pp.coefs
disp('第二小题')
x=[-1 0 1];
y=[-1 0 1];
pp=csape(x,y,'second',[0,-1])
pp.coefs
