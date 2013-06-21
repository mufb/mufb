classdef Quadratic < Uniform.UniformRGN
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
   properties
       a
       b
       c
   end
   methods
       function obj = Quadratic(seed, a, b, c, M)
           obj = obj@Uniform.UniformRGN(seed, M);
           obj.a = a;
           obj.b = b;
           obj.c = c;
       end
       
       function r = rand(obj)
           obj.X = mod(obj.a * obj.X^2 + obj.b * obj.X + obj.c, obj.M);
           r = obj.unitar;
       end
   end
end

