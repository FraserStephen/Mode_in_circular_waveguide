
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


d = 0;
[E_theta1, E_r1, H_z1, H_theta1, H_r1] = TE_mn(1,1,THETA,R, d, 0, R_waveguide,w);%TE11
[E_theta2, E_r2, H_z2,  H_theta2, H_r2] = TE_mn(1,1,THETA,R, d, pi/2, R_waveguide,w);%TE11(pi/2)
H_z = H_z1 + j*H_z2;%TE11 + j*TE11

[X, Y, Hz] = pol2cart(THETA, R, H_z);%坐标轴变换

%相位图
figure
title('Phase')
mesh(X, Y, angle(Hz));
colormap Jet
colorbar
view(0,90);

%幅度分布图
figure
title('Mag');
mesh(X, Y, abs(Hz));
colormap Jet
colorbar
view(0, 90);






