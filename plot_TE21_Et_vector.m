
clear
close all

%����TE21ģʽ�ĺ���糡

j = sqrt(-1);

lamda = 100*1e-3; %0.3m ���䲨��
freq = 1e9;
w = 2*pi*freq;
R_waveguide = 300e-3;

%���û�ͼ����
TE_mn_tran_vector(1,1, 2*pi/4, 0, R_waveguide, w);
