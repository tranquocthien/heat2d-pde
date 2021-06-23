function a=f(x,y,t)
a=(1+2*pi^2)*exp(t)*sin(pi*x)*sin(pi*y);

% file u0.m; tao ham u0. Day la dieu kien dau.

% file g.m.
function a=g(x,y,t)
a=0;
% file change.m. Viet lai chi so diem.
function num=change(N,i,j)
num=(N+1)*(i-1)+j;
