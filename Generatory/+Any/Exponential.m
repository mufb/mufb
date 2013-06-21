classdef Exponential < Any.AnyWithCumulativeInverseRGN
    %Metod¹ dystrybuanty odwrotnej
   properties
       lambda
   end
   methods
       function obj = Exponential(seed, uRGN, lambda)
           obj = obj@Any.AnyWithCumulativeInverseRGN(seed, uRGN);
           obj.lambda = lambda;
       end
       
       function y = inverse_cumulative_distro(obj, x)
           y = -(1/obj.lambda)*log(1 - x);
       end
       
   end
end