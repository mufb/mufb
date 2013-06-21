classdef Logistic < Any.AnyWithCumulativeInverseRGN
    %Metod¹ dystrybuanty odwrotnej
   properties
       mu
       s
   end
   methods
       function obj = Logistic(seed, uRGN, mu, s)
           obj = obj@Any.AnyWithCumulativeInverseRGN(seed, uRGN);
           obj.mu = mu;
           obj.s = s;
       end
       
       function y = inverse_cumulative_distro(obj, x)
           y = obj.mu + obj.s*log(x/(1-x));
       end
       
   end
end