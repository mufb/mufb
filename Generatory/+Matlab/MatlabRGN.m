classdef MatlabRGN < RandomGenerator
   properties
      method 
   end
   
   methods
       function obj = MatlabRGN(method)
          obj = obj@RandomGenerator(10);
          obj.method = method;
       end
       
       function r = rand(obj)
          r = obj.method(); 
       end
   end
end