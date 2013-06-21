classdef GeneralizedLinear < Uniform.UniformRGN
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %coeff
        A
        b
    end
    
    methods
        function obj = GeneralizedLinear(seed, A, b, M)
           obj = obj@Uniform.UniformRGN(seed, M);
           obj.A = A;
           obj.b = b;
        end
       
        function r = rand(obj)
           if(size(obj.A,2) > size(obj.X,2))
               Xn = mod(obj.A(1:size(obj.X,2))*obj.X' + obj.b, obj.M);
               obj.X = [Xn, obj.X];
           else
              Xn = mod( obj.A*obj.X' + obj.b, obj.M); 
              obj.X = [Xn, obj.X(1:size(obj.A,2)-1)];
           end
           r = Xn/obj.M;
        end
    end
    
end

