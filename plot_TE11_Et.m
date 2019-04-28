
clear
close all

j = sqrt(-1);

lamda = 100*1e-3; %0.3m 传输波长
freq = 1e9;
w = 2*pi*freq;
R_waveguide = 300e-3;
r = 0:0.1:(R_waveguide*1e3); % 0 <= r <= 100mm  圆形波导的半径
r = r*1e-3;
theta = 0:0.01:2*pi; % 柱坐标系下theta坐标范围
Z = 0;

[THETA, R] = meshgrid(theta, r); % 生成网格


d = 3*pi/2;
[E_theta, E_r, E_z] = TE_mn(2,1,THETA,R, d, 0, R_waveguide,w);

Ey = E_r.*cos(THETA) - E_theta.*sin(THETA);
Ex = E_r.*sin(THETA) + E_theta.*cos(THETA);

%绘图
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);
%surf(X, Y, abs(Ex)+abs(Ey));
%colormap Jet
mesh(X, Y, sqrt(abs(Ex).^2 + abs(Ey).^2));
colormap Jet
colorbar
view(0,-90);




