function best_param = find_best_param(index, p_range, i_range, d_range, stepn)
    global parameters

    simOut = sim("Expert_Online_2021a.slx");
    [e2_sum, ~, ~, ~, ~] = evaluate(simOut);

    min_e2sum = e2_sum;
    best_param = parameters;
    
    p0 = parameters(3*index-1);
    i0 = parameters(3*index);
    d0 = parameters(3*index+1);
    
    for p = p0 - p_range: p_range / stepn: p0 + p_range
        for i = i0 - i_range: i_range / stepn: i0 + i_range
            for d = d0 - d_range: d_range / stepn: d0 + d_range
                parameters(3*index-1: 3*index+1) = [p, i, d];
                simOut = sim("Expert_Online_2021a.slx");
                [e2_sum, ~, ~, ~, ~] = evaluate(simOut);
                disp(parameters)
           
                if e2_sum < min_e2sum
                    disp(e2_sum)
                    best_param = parameters;
                    min_e2sum = e2_sum;
                end
            end
        end
    end
    parameters = best_param;
end