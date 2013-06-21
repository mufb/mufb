function TStudentMeanTest(RNG, N, mu, significance)
    vec = RNG.randVector(N);
    v = N - 1 ;
    t_critical = icdf('t', 1- significance, v)

    t = sqrt(N - 1) * (mean(vec) - mu) / var(vec)

    if(t > t_critical)
        fprintf('There is no reason to accept the hypothesis.\n');
    else
        fprintf('There is no reason to reject the hypothesis.\n');
    end
end