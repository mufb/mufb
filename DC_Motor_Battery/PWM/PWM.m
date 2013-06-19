classdef PWM < handle

    properties
        
        %Parametry do zmiany przez u¿ytkownika

        %Okres jednego impulsu w sterowaniu PWM (aby uzyskaæ czas w sekundach 
        %nale¿y pomno¿yæ przez Smpl)
        Period

        %Czas trwania w stanie wysokim w czasie jednego impulsu (aby uzyskaæ czas 
        %w sekundach nale¿y pomno¿yæ przez Smpl)
        Ton

        %Czas próbkowania podany w sekundach
        Smpl


        %Parametry nie do zmiany

        %Uwzglêdnienie zera w liczniku(innaczej impuls by³by d³u¿szy o jeden czas 
        %próbkowania)
        R_per

        %Realizacja licznika odliczaj¹cego w dó³, by mo¿liwa by³a realizacja
        %instrukcji dopuszczaj¹cej w switchu
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
