function [e2_sum, emax, t0, tm, ts] = evaluate(simOut)
tout = simOut.tout;
yout = simOut.yout{1}.Values.Data();
n = length(yout);
if isempty(yout)
    e2_sum = Inf;
    emax = Inf;
    t0 = Inf;
    tm = Inf;
    ts = Inf;
    return
end

if sum(yout(end-10: end)) / 10 > 1e-2
    e2_sum = Inf;
    emax = Inf;
    t0 = Inf;
    tm = Inf;
    ts = Inf;
    return
end

% 累计误差平方积分
e2_sum = simOut.yout{2}.Values.Data(end);

% 第一次y = 0的时间t0
t0_i = find(abs(yout) < 1e-3, 1, 'first');
t0 = tout(t0_i);
% 峰值时间
[emax, tm_i] = max(abs(yout(t0_i: end)));
if t0_i + tm_i > length(yout)
    tm = Inf;
else
    tm = tout(t0_i + tm_i);
end
% 计算调节时间ts
for i  = n: -1: 1
    if abs(yout(i)) > 1e-4
        ts = tout(i);
        break
    end
end
end