classdef (Abstract) AnyWithCumulativeInverseRGN < Any.AnyRGN
    %Metod¹ dystrybuanty odwrotnej
   properties
   end
   methods
       function obj = AnyWithCumulativeInverseRGN(seed, uRGN)
           obj = obj@Any.AnyRGN(seed, uRGN);
           obj.uRGN = uRGN;
       end
       
       function r = rand(obj)
           r = obj.inverse_cumulative_distro(obj.uRGN.rand());
       end
   end
   
   methods(Abstract) 
       y = inverse_cumulative_distro(obj, x)
   end
end