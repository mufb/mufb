classdef Chi2 < Any.AnyRGN
   properties
       nRGN
       k
   end
   methods
       function obj = Chi2(seed, uRGN, k)
          obj = obj@Any.AnyRGN(seed, uRGN);
          obj.k = k;
          obj.nRGN = Any.Normal(10, uRGN, 'CTG', 0, 1);
       end
       
       function r = rand(obj)
          acc = 0;
          for i = 1:obj.k
              acc = acc + obj.nRGN.rand()^2;
          end
          r = acc;
       end
   end
end