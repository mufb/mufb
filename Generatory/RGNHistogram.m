function hist_data = RGNHistogram(RGN, iter, bins)
    hist_data = zeros(iter,1);
    for i=1:iter
       hist_data(i) = RGN.rand();
    end
    histnorm(hist_data, bins, 1);
end