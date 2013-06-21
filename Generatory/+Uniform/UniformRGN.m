classdef (Abstract) UniformRGN < RandomGenerator
   properties
       M
   end
   properties(Dependent, Access = protected)
       unitar
   end
   methods
       function obj = UniformRGN(seed, M)
           obj = obj@RandomGenerator(seed);
           obj.M = M;
       end
       
       function value = get.unitar(obj)
           value = obj.X / obj.M;
       end
   end
end