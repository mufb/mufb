classdef (Abstract) RandomGenerator < handle
   properties
       seed
       X
   end
   methods
       function obj = RandomGenerator(seed)
           obj.seed = seed;
           obj.X = seed;
       end
       
       function v = randVector(obj, n)
          v = zeros(n,1);
          for i=1:n
             v(i) = obj.rand(); 
          end
       end
   end
   methods(Abstract) 
       r = rand(obj);
   end
end