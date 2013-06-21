function Hist2DUnitar(uRGN, iter, size)
    hdata = zeros(size + 1,1);
    x = 0;
    for i = 1:iter
           uRGN.rand();
           x = round(size*uRGN.unitar) + 1;
           hdata(x) = hdata(x) + 1;
    end
    plot(hdata);
end