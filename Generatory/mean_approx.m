function z = mean_approx(RGN, n)
    acc = zeros(n,1);

    for i = 1:n
        acc(i) = RGN.rand();
    end
    
    z = mean(acc);
end