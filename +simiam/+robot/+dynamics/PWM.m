


classdef PWM

    properties
        
        %Parametry do zmiany przez u¿ytkownika

        %Okres jednego impulsu w sterowaniu PWM (aby uzyskaæ czas w sekundach 
        %nale¿y pomno¿yæ przez Smpl)
        Period=12;

        %Czas trwania w stanie wysokim w czasie jednego impulsu (aby uzyskaæ czas 
        %w sekundach nale¿y pomno¿yæ przez Smpl)
        Ton=12;

        %Czas próbkowania podany w sekundach
        Smpl=0.1;


        %Parametry nie do zmiany

        %Uwzglêdnienie zera w liczniku(innaczej impuls by³by d³u¿szy o jeden czas 
        %próbkowania)
        R_per=Period-1;

        %Realizacja licznika odliczaj¹cego w dó³, by mo¿liwa by³a realizacja
        %instrukcji dopuszczaj¹cej w switchu
        R_ton=Period-Ton;
        
    end
    
    methods

    end
    
    end
    
end
