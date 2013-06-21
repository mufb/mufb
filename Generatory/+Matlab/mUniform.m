classdef mUniform < Matlab.MatlabRGN
   properties
   end
   
   methods
       function obj = mUniform()
          obj = obj@Matlab.MatlabRGN(@rand);
       end
   end
end