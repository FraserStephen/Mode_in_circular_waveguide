
clear
close all

%����TE11+j*TE11ģʽ�ĺ���糡

j = sqrt(-1);

lamda = 100*1e-3; %0.3m ���䲨��
freq = 1e9;
w = 2*pi*freq;
R_waveguide = 300e-3;

%ģʽ
m = 1;
n = 1;

Z = 0;




%%%%%%%%%%%%%%%%
%���Ƴ�ǿ�ֲ�
%%%%%%%%%%%%%%%%

%��������
r = 0:0.1:(R_waveguide*1e3); % 0 <= r <= 100mm  Բ�β����İ뾶
r = r*1e-3;
theta = 0:0.01:2*pi; % ������ϵ��theta���귶Χ
[THETA, R] = meshgrid(theta, r); % ��������
[E_theta1, E_r1] = TE_mn(m,n,THETA,R, Z, 0, R_waveguide,w);
[E_theta2, E_r2] = TE_mn(m,n,THETA,R, Z, pi/2, R_waveguide,w);

%TE11 + jTE11
E_r = E_r1 + j*E_r2;
E_theta = E_theta1 + j*E_theta2;

%������ת����ֱ������
Ey = E_r.*cos(THETA) - E_theta.*sin(THETA);
Ex = E_r.*sin(THETA) + E_theta.*cos(THETA);
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);

E_abs = sqrt(abs(Ex).^2 + abs(Ey).^2);
E_abs = E_abs/max(max(E_abs));%��һ��

mesh(X, Y, E_abs);
colormap Jet
colorbar
view(0,-90);
hold on


%%%%%%%%%%%%%%%%
%�����������ֲ�
%%%%%%%%%%%%%%%%
%�������������ܶȹ��ߣ��ᵼ�»��Ƽ�ͷ���ܣ��������峡�ֲ�������Ӧ���ʵ���С����
r = 0:50:(R_waveguide*1e3); % 0 <= r <= 100mm  Բ�β����İ뾶
r = r*1e-3;
theta = 0:0.3:2*pi; % ������ϵ��theta���귶Χ
[THETA, R] = meshgrid(theta, r); % ��������

[E_theta1, E_r1] = TE_mn(m,n,THETA,R, Z, 0, R_waveguide,w);
[E_theta2, E_r2] = TE_mn(m,n,THETA,R, Z, pi/2, R_waveguide,w);

%TE11 + jTE11
E_r = E_r1 + j*E_r2;
E_theta = E_theta1 + j*E_theta2;
Ex = -(E_r.*cos(THETA) - E_theta.*sin(THETA));
Ey = -(E_r.*sin(THETA) + E_theta.*cos(THETA));%��Ϊ���۲췽����-90�ȣ�����Ӧ���һ������
%��ͼ
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);
quiver(X, Y, real(Ex), real(Ey));