classdef mNormal < Matlab.MatlabRGN
   properties
   end
   
   methods
       function obj = mNormal()
          obj = obj@Matlab.MatlabRGN(@randn);
       end
   end
end