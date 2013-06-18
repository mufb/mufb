


classdef Motor

    properties
        
        %Parametry nie do zmiany

        %Op�r obwodu wzbudzenia [Ohm]
        Rw=2;

        %Indukcyjno�� obwodu wzbudzenia [H]
        Lw=0.1;

        %Moment bezw�adno�ci wa�u silnika [kg*m^2]
        J=0.1;

        %Sta�a elektryczna
        Ke=0.1;

        %Sta�a mechaniczna
        Km=0.1;

        %Sta�a tarcia proporcjonalna do pr�dko�ci(przybli�enie)
        B=0.5;

        %Moment obci��enia
        Mobc=0.1;
        
    end
    
    methods

    end
    
    end
    
end
