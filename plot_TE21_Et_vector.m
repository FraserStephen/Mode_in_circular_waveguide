
clear
close all

%绘制TE21模式的横向电场

j = sqrt(-1);

lamda = 100*1e-3; %0.3m 传输波长
freq = 1e9;
w = 2*pi*freq;
R_waveguide = 300e-3;

%调用绘图函数
TE_mn_tran_vector(1,1, 2*pi/4, 0, R_waveguide, w);
