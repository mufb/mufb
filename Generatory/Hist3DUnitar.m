function Hist3DUnitar(uRGN, iter, size)
    hdata = zeros(size + 1);
    x = 0;
    y = 0;
    for i = 1:iter
           uRGN.rand();
           x = round(size*uRGN.unitar) + 1;
           uRGN.rand();
           y = round(size*uRGN.unitar) + 1;
           hdata(x,y) = hdata(x,y) + 1;
    end
    mesh(hdata);
end