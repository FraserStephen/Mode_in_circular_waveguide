
clear
close all

%绘制TE11+j*TE11模式的横向电场

j = sqrt(-1);

lamda = 100*1e-3; %0.3m 传输波长
freq = 1e9;
w = 2*pi*freq;
R_waveguide = 300e-3;

%模式
m = 1;
n = 1;

Z = 0;




%%%%%%%%%%%%%%%%
%绘制场强分布
%%%%%%%%%%%%%%%%

%生成网格
r = 0:0.1:(R_waveguide*1e3); % 0 <= r <= 100mm  圆形波导的半径
r = r*1e-3;
theta = 0:0.01:2*pi; % 柱坐标系下theta坐标范围
[THETA, R] = meshgrid(theta, r); % 生成网格
[E_theta1, E_r1] = TE_mn(m,n,THETA,R, Z, 0, R_waveguide,w);
[E_theta2, E_r2] = TE_mn(m,n,THETA,R, Z, pi/2, R_waveguide,w);

%TE11 + jTE11
E_r = E_r1 + j*E_r2;
E_theta = E_theta1 + j*E_theta2;

%柱坐标转换成直角坐标
Ey = E_r.*cos(THETA) - E_theta.*sin(THETA);
Ex = E_r.*sin(THETA) + E_theta.*cos(THETA);
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);

E_abs = sqrt(abs(Ex).^2 + abs(Ey).^2);
E_abs = E_abs/max(max(E_abs));%归一化

mesh(X, Y, E_abs);
colormap Jet
colorbar
view(0,-90);
hold on


%%%%%%%%%%%%%%%%
%绘制向量场分布
%%%%%%%%%%%%%%%%
%绘制向量网格密度过高，会导致绘制箭头过密，而看不清场分布，所以应该适当减小精度
r = 0:50:(R_waveguide*1e3); % 0 <= r <= 100mm  圆形波导的半径
r = r*1e-3;
theta = 0:0.3:2*pi; % 柱坐标系下theta坐标范围
[THETA, R] = meshgrid(theta, r); % 生成网格

[E_theta1, E_r1] = TE_mn(m,n,THETA,R, Z, 0, R_waveguide,w);
[E_theta2, E_r2] = TE_mn(m,n,THETA,R, Z, pi/2, R_waveguide,w);

%TE11 + jTE11
E_r = E_r1 + j*E_r2;
E_theta = E_theta1 + j*E_theta2;
Ex = -(E_r.*cos(THETA) - E_theta.*sin(THETA));
Ey = -(E_r.*sin(THETA) + E_theta.*cos(THETA));%因为最后观察方向是-90度，所以应多加一个负号
%绘图
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);
quiver(X, Y, real(Ex), real(Ey));