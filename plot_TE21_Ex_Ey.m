
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


d = 3*pi/2;
[E_theta, E_r, E_z] = TM_mn(0,1,THETA,R, d, 0, R_waveguide,w);

Ey = E_r.*cos(THETA) - E_theta.*sin(THETA);
Ex = E_r.*sin(THETA) + E_theta.*cos(THETA);

%��ͼ
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);


figure
mesh(X, Y, angle(Ex));
title('Ex phase');
colormap Jet
colorbar
view(0,90);

figure
mesh(X, Y, abs(Ex));
title('Ex mag');
colormap Jet
colorbar
view(0,90);

figure
mesh(X, Y, angle(Ey));
title('Ey phase');
colormap Jet
colorbar
view(0,90);

figure
mesh(X, Y, abs(Ey));
title('Ex mag');
colormap Jet
colorbar
view(0,90);










