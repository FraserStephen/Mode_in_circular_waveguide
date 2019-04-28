function [E_theta, E_r, Hz] = TE_mn(m, n, THETA, R, Z, phi, R_waveguide, w)
%Input:
    %m, n 模式数
    %THETA， R，Z 坐标系（柱坐标）
    %phi 初始相位
    %R_waveguide 圆形波导的半径
    %w 角频率
%Output:
    %E_theta, E_r, Hz  柱坐标系下电场分量（Hz纵向磁场分量）
    j = sqrt(-1);
    miu = 4*pi*1e-7;
    u_mn = [3.832, 7.016, 10.173; 1.841, 5.332, 8.536; 3.054, 6.705, 9.969; 4.201, 8.015, 11.346];
    k_c = u_mn(m+1,n)/R_waveguide;% m>=0
    Hz = besselj(m,k_c*R) .* cos(n*(THETA + phi)) .* exp(-j*Z);
    E_r = j*w*m*miu./(k_c^2*R).*sin(m*(THETA+phi)).*besselj(m, k_c*R)*exp(-j*Z);
    E_theta = j*w*miu/k_c.*cos(m*(THETA+phi)).*Diff_Bessel(m, k_c*R)*exp(-j*Z);
end %function