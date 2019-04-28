function [E_r, E_theta, Ez] = TM_mn(m, n, THETA, R, Z, phi, R_waveguide, w)
%Input:
    %m, n 模式数
    %THETA， R， Z 坐标系（柱坐标）
    %phi 初始相位
    %R_waveguide 圆形波导的半径
    %w 角频率
%Output:
    %E_theta, E_r, Ez  柱坐标系下三个电场分量
    
    j = sqrt(-1);
    v_mn = [2.405, 5.52, 8.654; 3.832, 7.016, 10.173; 5.135, 8.417, 11.620; 6.379, 9.761, 12.015];
    k_c = v_mn(m+1,n)/R_waveguide;
    Ez = besselj(m,k_c*R) .* cos(n*(THETA + phi)) .* exp(-j*Z);
    k = w/(3e9);
    beta = sqrt(k^2 - k_c^2);
    E_theta = -j*beta/k_c.*cos(m*(THETA+phi)).*Diff_Bessel(m, k_c*R)*exp(-j*Z);
    E_r = j*beta*m./(k_c^2*R).*sin(m*(THETA+phi)).*besselj(m, k_c*R)*exp(-j*Z);
end %function