function [E_theta, E_r, Hz, H_theta, H_r] = TE_mn(m, n, THETA, R, Z, phi, R_waveguide, w)
%Input:
    %m, n 模式数
    %THETA， R，Z 坐标系（柱坐标）
    %phi 初始相位
    %R_waveguide 圆形波导的半径
    %w 角频率
%Output:
    %E_theta, E_r, Hz, H_theta, H_r  柱坐标系下电场分量（Hz纵向磁场分量）
    j = sqrt(-1);
    miu = 4*pi*1e-7;
    u_mn = [3.832, 7.016, 10.173; 1.841, 5.332, 8.536; 3.054, 6.705, 9.969; 4.201, 8.015, 11.346];
    k_c = u_mn(m+1,n)/R_waveguide;% m>=0
    k = w/(3e9);
    beta = sqrt(k^2 - k_c^2);
    
    %A=0 B=1
    Hz = besselj(m,k_c*R) .* cos(m*(THETA + phi)) .* exp(-j*Z);
    H_r = -j*beta/k_c* cos(m*(THETA + phi)).* Diff_Bessel(m, k_c*R)*exp(-j*Z);
    H_theta = j*beta*m./(k_c^2*R).* cos(m*(THETA + phi)) .* exp(-j*Z);
    E_r = j*w*m*miu./(k_c^2*R).*sin(m*(THETA+phi)).*besselj(m, k_c*R)*exp(-j*Z);
    E_theta = j*w*miu/k_c.*cos(m*(THETA+phi)).*Diff_Bessel(m, k_c*R)*exp(-j*Z);
end %function