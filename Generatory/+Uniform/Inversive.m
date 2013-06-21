classdef Inversive < Uniform.UniformRGN
   properties
       a
       b
       p
   end
   methods
       function obj = Inversive(seed, a, b, p)
           assert(isprime(p), 'p must be a prime number');
           obj = obj@Uniform.UniformRGN(seed, p);
           obj.a = a;
           obj.b = b;
           obj.p = p;
       end
       
       function r = rand(obj)           
           if(obj.X == 0)
               obj.X = obj.b;
           else
               obj.X = mod(obj.a / obj.X + obj.b, obj.p);
           end
           r = obj.unitar;
       end
   end
end

