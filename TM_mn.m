function [E_theta, E_r, Ez, H_r, H_theta] = TM_mn(m, n, THETA, R, Z, phi, R_waveguide, w)
%Input:
    %m, n 模式数
    %THETA， R， Z 坐标系（柱坐标）
    %phi 初始相位
    %R_waveguide 圆形波导的半径
    %w 角频率
%Output:
    %E_theta, E_r, Ez, H_r, H_theta 柱坐标系下三个电场分量
    
    j = sqrt(-1);
    die_con = 8.85e-12;
    v_mn = [2.405, 5.52, 8.654; 3.832, 7.016, 10.173; 5.135, 8.417, 11.620; 6.379, 9.761, 12.015];
    k_c = v_mn(m+1,n)/R_waveguide;
    k = w/(3e8);
    beta = sqrt(k^2 - k_c^2);
    
    %A=0 B=1
    Ez = besselj(m,k_c*R) .* cos(m*(THETA)) .* exp(-j*(Z+phi));
    E_r = -j*beta/(k_c).*cos(m*(THETA)).*Diff_Bessel(m, k_c*R)*exp(-j*(Z+phi));
    E_theta = j*beta*m./(k_c^2*R).*sin(m*(THETA)).*besselj(m, k_c*R)*exp(-j*(Z+phi));
    H_r = -j*w*die_con*m./(k_c^2*R).*sin(m*(THETA)).*besselj(m, k_c*R)*exp(-j*(Z+phi));
    H_theta = j*w*die_con/k_c*cos(m*(THETA)).*Diff_Bessel(m,k_c*R)*exp(-j*(Z+phi));
end %function