function parameters = set_parameters(pid0, pid1, pid2)

time = 0;

p_0 = pid0(1);
i_0 = pid0(2);
d_0 = pid0(3);
p_1 = pid1(1);
i_1 = pid1(2);
d_1 = pid1(3);
p_2 = pid2(1);
i_2 = pid2(2);
d_2 = pid2(3);

parameters = [time, p_0, i_0, d_0, p_1, i_1, d_1, p_2, i_2, d_2];

end