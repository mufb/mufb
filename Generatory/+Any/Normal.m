classdef Normal < Any.AnyRGN
   properties
       mu
       sigma
       method
       methodsd
   end
   methods
       function obj = Normal(seed, uRGN, method, mu, sigma)
          obj = obj@Any.AnyRGN(seed, uRGN);
          obj.mu = mu;
          obj.sigma = sigma;
          obj.methodsd{1} = struct('method', 'CTG', ...
                                   'callback', @obj.CTG);
          obj.methodsd{2} = struct('method', 'BM', ...
                                   'callback', @obj.Box_Muller);
                               
          obj.method = obj.choose_method(method);
       end
       
       function r = rand(obj)
          r = (obj.standard()+obj.mu)*obj.sigma;
       end
       
       function s = standard(obj)
           s = obj.CTG();
       end
       
       function m = choose_method(obj, name)
           for i=1:numel(obj.methodsd)
               if(strcmp(obj.methodsd{i}.method, name))
                   m = obj.methodsd{i}.callback;
                   return;
               end
           end
           
           % return code (rc)
           assert(0, 'no method exists with name %s\n', name);
       end
        
       function r = CTG(obj)
           acc = 0;
           for i = 1:12
               acc = acc + obj.uRGN.rand();
           end
           r = acc - 6;
       end
       
       function r = Box_Muller(obj)
           r = sqrt(-log(obj.uRGN.rand()))*cos(2*pi*obj.uRGN.rand());
       end
   end
end