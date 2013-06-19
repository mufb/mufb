


classdef Motor

    properties
        
        %Parametry nie do zmiany

        %Opór obwodu wzbudzenia [Ohm]
        Rw;

        %Indukcyjnoœæ obwodu wzbudzenia [H]
        Lw;

        %Moment bezw³adnoœci wa³u silnika [kg*m^2]
        J;

        %Sta³a elektryczna
        Ke;

        %Sta³a mechaniczna
        Km;

        %Sta³a tarcia proporcjonalna do prêdkoœci(przybli¿enie)
        B;

        %Moment obci¹¿enia
        Mobc;
        
    end
    
    methods
        function obj = Motor()
            obj.Rw = 2;
            obj.Lw = 0.1;
            obj.J = 0.1;
            obj.Ke = 0.1;
            obj.Km = 0.1;
            obj.B = 0.5;
            obj.Mobc = 0.1;
    end
    
    end
    
end
