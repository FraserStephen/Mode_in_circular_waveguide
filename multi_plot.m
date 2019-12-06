clear
close all

%%
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
phi = 2*pi;
%%
figure
TE_mn_tran_vector(0, 1, Z, phi, R_waveguide, w)
title('TE01');

figure
TE_mn_tran_vector(1, 1, Z, phi, R_waveguide, w)
title('TE11');

figure
TM_mn_tran_vector(0, 1, Z, phi, R_waveguide, w)
title('TM01');

figure
TM_mn_tran_vector(1, 1, Z, phi, R_waveguide, w)
title('TM11');

figure
TM_mn_tran_vector(0, 2, Z, pi/2, R_waveguide, w)
title('TM02');
%%

