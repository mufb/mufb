classdef Affine < Uniform.UniformRGN
   properties
       a
       b
   end
   methods
       function obj = Affine(seed, a, b, M)
           obj = obj@Uniform.UniformRGN(seed, M);
           obj.a = a;
           obj.b = b;
       end
       
       function r = rand(obj)
           obj.X = mod(obj.a * obj.X + obj.b,obj.M);
           r = obj.unitar;
       end
   end
end