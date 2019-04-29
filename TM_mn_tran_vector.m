function [] = TM_mn_tran_vector(m, n, Z, phi, R_waveguide, w)
%function������TMģʽ�£�����糡�ֲ�������ͼ��ǿ�ȷֲ�ͼ
%Input:
    %m, n ģʽ��
    %phi ��ʼ��λ
    %R_waveguide Բ�β����İ뾶
    %w ��Ƶ��
%Output:
    %E_theta, E_r, Hz, H_theta, H_r  ������ϵ�µ糡������Hz����ų�������

%%%%%%%%%%%%%%%%
%���Ƴ�ǿ�ֲ�
%%%%%%%%%%%%%%%%

%��������
r = 0:0.1:(R_waveguide*1e3); % 0 <= r <= 100mm  Բ�β����İ뾶
r = r*1e-3;
theta = 0:0.01:2*pi; % ������ϵ��theta���귶Χ
[THETA, R] = meshgrid(theta, r); % ��������
[E_theta, E_r] = TM_mn(m,n,THETA,R, Z, phi, R_waveguide,w);

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
[E_theta, E_r] = TM_mn(m,n,THETA,R, Z, phi, R_waveguide,w);
Ex = -(E_r.*cos(THETA) - E_theta.*sin(THETA));
Ey = -(E_r.*sin(THETA) + E_theta.*cos(THETA));%��Ϊ���۲췽����-90�ȣ�����Ӧ���һ������
%��ͼ
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);
quiver(X, Y, real(Ex), real(Ey));





    
