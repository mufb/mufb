classdef Linear < Uniform.UniformRGN
   properties
       g
   end
   methods
       function obj = Linear(seed, g, M)
           obj = obj@Uniform.UniformRGN(seed, M);
           obj.g = g;
       end
       
       function r = rand(obj)
           obj.X = mod(obj.g * obj.X,obj.M);
           r = obj.unitar;
       end
       
       function increment(obj)
          obj.g = obj.g + 1; 
       end
   end
end