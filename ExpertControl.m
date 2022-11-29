clc

pid0 = [-15, -0.01, -1];
pid1 = [-15, -0.01, -1];
pid2 = [-15, -0.01, -1];
parameters = set_parameters(pid0, pid1, pid2);

simOut = sim("Expert_Online_2021a.slx");
tout = simOut.tout;
n = length(t);
yout = simOut.yout{1}.Values.Data();
% 累计误差平方积分
e2_sum = simOut.yout{2}.Values.Data(end);
d_e = simOut.yout{3}.Values.Data();
% 计算峰值ymax
[ymax ,ind] = max(yout);
% 第一次y = 0的时间t0
t0_i = find(abs(yout) < 1e-6, 1, 'first');
t0 = tout(t0_i);
% 峰值时间
t1_i = find(abs(d_e(t0_i: end)) < 1e-6, 1, "first");
t1 = tout(t0_i + t1_i);
% 计算调节时间ts
for i  = n: -1: 1
    if abs(yout(i)) > 1e-3
        ts = tout(i);
        break
    end
end

