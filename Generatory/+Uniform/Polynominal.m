classdef Polynominal < Uniform.UniformRGN
    
    properties
        %coeff
        A
    end
    
    methods
        function obj = Polynominal(seed, A, M)
           obj = obj@Uniform.UniformRGN(seed, M);
           obj.A = A;
        end
       
        function r = rand(obj)
            obj.X = mod(polyval(obj.A, obj.X), obj.M);
            r = obj.unitar;
        end
    end
    
end


