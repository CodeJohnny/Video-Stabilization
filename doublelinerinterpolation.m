%% 解单帧的x/y方向的角点相对位移，并表示内部位移
%%输入:待求点坐标（u，v）可输入多维，但要注意对应；图像的高h，宽w； 以上获得的四个角点的相对位移dx1234/dy1234
function d_uv=doublelinerinterpolation(u,v,dxy1234,h,w)

%求dxy(u,v)------>用dx(u,v)=N1(u,v)*dx1+N2(u,v)*dx2+N3(u,v)*dx3+N4(u,v)*dx4;
%用dx1,dx2,dx3,dx4表示dx(u,v)，此时u，v为自变量(x坐标，y坐标)，dx1,dx2,dx3,dx4由上一步已知
% a=w/2;      %宽的一半
% b=h/2;
N1=(u-w).*(v-h)./((1-w).*(1-h));       %型函数（4*1）
N2=(u-1).*(v-h)./((w-1).*(1-h));
N3=(u-1).*(v-1)./((w-1).*(h-1));
N4=(u-w).*(v-1)./((1-w).*(h-1));
d_uv=N1*dxy1234(1)+N2*dxy1234(2)+N3*dxy1234(3)+N4*dxy1234(4);

end