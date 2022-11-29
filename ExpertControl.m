pid0 = [-18, -0.01, -1];
pid1 = [-15, -0.01, -1];
pid2 = [-15, -0.01, -1];
parameters = set_parameters(pid0, pid1, pid2);

simOut = sim("Expert_Online.slx");

plot(simOut)