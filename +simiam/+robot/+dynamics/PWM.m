


classdef PWM

    properties
        
        %Parametry do zmiany przez u�ytkownika

        %Okres jednego impulsu w sterowaniu PWM (aby uzyska� czas w sekundach 
        %nale�y pomno�y� przez Smpl)
        Period=12;

        %Czas trwania w stanie wysokim w czasie jednego impulsu (aby uzyska� czas 
        %w sekundach nale�y pomno�y� przez Smpl)
        Ton=12;

        %Czas pr�bkowania podany w sekundach
        Smpl=0.1;


        %Parametry nie do zmiany

        %Uwzgl�dnienie zera w liczniku(innaczej impuls by�by d�u�szy o jeden czas 
        %pr�bkowania)
        R_per=Period-1;

        %Realizacja licznika odliczaj�cego w d�, by mo�liwa by�a realizacja
        %instrukcji dopuszczaj�cej w switchu
        R_ton=Period-Ton;
        
    end
    
    methods

    end
    
    end
    
end
