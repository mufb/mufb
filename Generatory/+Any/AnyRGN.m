classdef (Abstract) AnyRGN < RandomGenerator
    %Metod� dystrybuanty odwrotnej
   properties
       uRGN
   end
   methods
       function obj = AnyRGN(seed, uRGN)
           obj = obj@RandomGenerator(seed);
           obj.uRGN = uRGN;
       end
   end
end