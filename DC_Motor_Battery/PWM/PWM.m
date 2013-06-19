classdef PWM < handle

    properties
        
        %Parametry do zmiany przez u�ytkownika

        %Okres jednego impulsu w sterowaniu PWM (aby uzyska� czas w sekundach 
        %nale�y pomno�y� przez Smpl)
        Period

        %Czas trwania w stanie wysokim w czasie jednego impulsu (aby uzyska� czas 
        %w sekundach nale�y pomno�y� przez Smpl)
        Ton

        %Czas pr�bkowania podany w sekundach
        Smpl


        %Parametry nie do zmiany

        %Uwzgl�dnienie zera w liczniku(innaczej impuls by�by d�u�szy o jeden czas 
        %pr�bkowania)
        R_per

        %Realizacja licznika odliczaj�cego w d�, by mo�liwa by�a realizacja
        %instrukcji dopuszczaj�cej w switchu
        R_ton
        
    end
    
    methods
        function obj = PWM(per, ton, smpl)
            obj.Period = per;
            obj.Ton = ton;
            obj.Smpl = smpl;
            obj.R_per = per-1;
            obj.R_ton = per-ton;
            
        end
    end
    
end
