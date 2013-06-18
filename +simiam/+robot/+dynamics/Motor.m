


classdef Motor

    properties
        
        %Parametry nie do zmiany

        %Opór obwodu wzbudzenia [Ohm]
        Rw=2;

        %Indukcyjnoœæ obwodu wzbudzenia [H]
        Lw=0.1;

        %Moment bezw³adnoœci wa³u silnika [kg*m^2]
        J=0.1;

        %Sta³a elektryczna
        Ke=0.1;

        %Sta³a mechaniczna
        Km=0.1;

        %Sta³a tarcia proporcjonalna do prêdkoœci(przybli¿enie)
        B=0.5;

        %Moment obci¹¿enia
        Mobc=0.1;
        
    end
    
    methods

    end
    
    end
    
end
