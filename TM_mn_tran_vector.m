function [] = TM_mn_tran_vector(m, n, Z, phi, R_waveguide, w)
%function：计算TM模式下，横向电场分布的向量图和强度分布图
%Input:
    %m, n 模式数
    %phi 初始相位
    %R_waveguide 圆形波导的半径
    %w 角频率
%Output:
    %E_theta, E_r, Hz, H_theta, H_r  柱坐标系下电场分量（Hz纵向磁场分量）

%%%%%%%%%%%%%%%%
%绘制场强分布
%%%%%%%%%%%%%%%%

%生成网格
r = 0:0.1:(R_waveguide*1e3); % 0 <= r <= 100mm  圆形波导的半径
r = r*1e-3;
theta = 0:0.01:2*pi; % 柱坐标系下theta坐标范围
[THETA, R] = meshgrid(theta, r); % 生成网格
[E_theta, E_r] = TM_mn(m,n,THETA,R, Z, phi, R_waveguide,w);

%柱坐标转换成直角坐标
Ey = E_r.*cos(THETA) - E_theta.*sin(THETA);
Ex = E_r.*sin(THETA) + E_theta.*cos(THETA);
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);

E_abs = sqrt(abs(Ex).^2 + abs(Ey).^2);
E_abs = E_abs/max(max(E_abs));%归一化

mesh(X, Y, E_abs);
colormap Jet
colorbar
view(0,-90);
hold on


%%%%%%%%%%%%%%%%
%绘制向量场分布
%%%%%%%%%%%%%%%%
%绘制向量网格密度过高，会导致绘制箭头过密，而看不清场分布，所以应该适当减小精度
r = 0:50:(R_waveguide*1e3); % 0 <= r <= 100mm  圆形波导的半径
r = r*1e-3;
theta = 0:0.3:2*pi; % 柱坐标系下theta坐标范围
[THETA, R] = meshgrid(theta, r); % 生成网格
[E_theta, E_r] = TM_mn(m,n,THETA,R, Z, phi, R_waveguide,w);
Ex = -(E_r.*cos(THETA) - E_theta.*sin(THETA));
Ey = -(E_r.*sin(THETA) + E_theta.*cos(THETA));%因为最后观察方向是-90度，所以应多加一个负号
%绘图
[X, Y, E_x] = pol2cart(THETA, R, Ex);
[X, Y, E_y] = pol2cart(THETA, R, Ey);
quiver(X, Y, real(Ex), real(Ey));





    
