classdef Beta < Any.AnyRGN
   properties
       alpha
       beta
   end
   
   properties(Access = private)
       Xg
       Yg
   end
   methods
       
       function obj = Beta(seed, uRGN, alpha, beta)
          obj = obj@Any.AnyRGN(seed, uRGN);
          obj.alpha = alpha;
          obj.beta = beta;
          obj.Xg = Any.Gamma(seed, uRGN, alpha, 1);
          obj.Yg = Any.Gamma(seed, uRGN, beta, 1);
       end
       
       function r = rand(obj)
           X = obj.Xg.rand();
           r = X/(X + obj.Yg.rand());
       end
   end
end