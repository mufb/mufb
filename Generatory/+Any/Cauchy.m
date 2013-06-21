classdef Cauchy < Any.AnyWithCumulativeInverseRGN
    %Metod¹ dystrybuanty odwrotnej
   properties
       x0
       gamma
   end
   methods
       function obj = Cauchy(seed, uRGN, x0, gamma)
           obj = obj@Any.AnyWithCumulativeInverseRGN(seed, uRGN);
           obj.x0 = x0;
           obj.gamma = gamma;
       end
       
       function y = inverse_cumulative_distro(obj, x)
           y = obj.x0 - obj.gamma*cot(pi*x);
       end
       
   end
end