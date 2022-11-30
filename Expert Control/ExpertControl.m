clear
clc

global parameters

pid0 = [-15, -0.01, -1]; % 加速收敛
pid1 = [-15, -0.01, -1]; % 减速远离
pid2 = [-15, -0.01, -1]; % 减速收敛

parameters = set_parameters(pid0, pid1, pid2);

% find best pid0
parameters = find_best_param(1, 3, 0.3, 0.3, 3);
% find best pid1
parameters = find_best_param(2, 3, 0.3, 0.3, 3);
% find best pid2
parameters = find_best_param(3, 3, 0.3, 0.3, 3);

% find best pid0
parameters = find_best_param(1, 1, 0.1, 0.1, 3);
% find best pid1
parameters = find_best_param(2, 1, 0.1, 0.1, 3);
% find best pid2
parameters = find_best_param(3, 1, 0.1, 0.1, 3);

parameters