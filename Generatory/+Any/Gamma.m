classdef Gamma < Any.AnyRGN
   properties
       alpha
       beta
   end
   methods
       function obj = Gamma(seed, uRGN, alpha, beta)
          obj = obj@Any.AnyRGN(seed, uRGN);
          obj.alpha = alpha;
          obj.beta = beta;
       end
       
       function r = rand(obj)
          r = obj.getGammaAlpha1()/obj.beta;
       end
       
       function y = getGammaAlpha1(obj)
          acc = 0;
          for i = 0:floor(obj.alpha)
              acc = acc + obj.getGamma11();
          end
          if(obj.alpha - floor(obj.alpha) == 0)
              y = acc;
          else
            y = acc + obj.getY();
          end
       end
       
       function y = getGamma11(obj)
          y = -log(obj.uRGN.rand()); 
       end
       
       function y = getY(obj)
          delta = obj.alpha - floor(obj.alpha);
          while(1)
              if(obj.uRGN.rand() < exp(1)/(exp(1) + delta))
                 a = obj.uRGN.rand()^(1/delta); 
                 b = obj.uRGN.rand()*a^(delta - 1);
              else
                 a = 1 - log(obj.uRGN.rand());
                 b = obj.uRGN.rand()*exp(-a);
              end

              if(b <= exp(delta - 1 - a))
                  y = a;
                  return;
              end
          end
       end
        
   end
end