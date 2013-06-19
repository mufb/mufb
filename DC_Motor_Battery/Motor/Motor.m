


classdef Motor

    properties
        
        %Parametry nie do zmiany

        %Op�r obwodu wzbudzenia [Ohm]
        Rw;

        %Indukcyjno�� obwodu wzbudzenia [H]
        Lw;

        %Moment bezw�adno�ci wa�u silnika [kg*m^2]
        J;

        %Sta�a elektryczna
        Ke;

        %Sta�a mechaniczna
        Km;

        %Sta�a tarcia proporcjonalna do pr�dko�ci(przybli�enie)
        B;

        %Moment obci��enia
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
