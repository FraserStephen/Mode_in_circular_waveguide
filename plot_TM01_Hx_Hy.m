
clear
close all

j = sqrt(-1);

lamda = 100*1e-3; %0.3m ���䲨��
freq = 1e9;
w = 2*pi*freq;
R_waveguide = 300e-3;
r = 0:0.1:(R_waveguide*1e3); % 0 <= r <= 100mm  Բ�β����İ뾶
r = r*1e-3;
theta = 0:0.01:2*pi; % ������ϵ��theta���귶Χ
Z = 0;

[THETA, R] = meshgrid(theta, r); % ��������


d = 0;
[E_theta, E_r, Hz, H_theta, H_r] = TM_mn(0,1,THETA,R, d, 0, R_waveguide,w);

Hx = H_r.*cos(THETA) - H_theta.*sin(THETA);
Hy = H_r.*sin(THETA) + H_theta.*cos(THETA);

%��ͼ
[X, Y, H_x] = pol2cart(THETA, R, Hx);
[X, Y, H_y] = pol2cart(THETA, R, Hy);


figure
mesh(X, Y, angle(H_x));
title('Hx phase');
colormap Jet
colorbar
view(0,90);

figure
mesh(X, Y, abs(H_x));
title('Hx mag');
colormap Jet
colorbar
view(0,90);

figure
mesh(X, Y, angle(Hy));
title('Hy phase');
colormap Jet
colorbar
view(0,90);

figure
mesh(X, Y, abs(Hy));
title('Hy mag');
colormap Jet
colorbar
view(0,90);

