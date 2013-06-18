classdef Battery
    
    properties
        %Parametry do zmiany przez u�ytkownika

        %Roz�aduj lub �aduj bateri�. Ladowanie dla C_R == 1, roz�adowywanie, gdy
        %C_R ==0
        C_R=0;


        %Parametry nie do zmiany

        %Pocz�tkowy �adunek baterii(w As). Przy ka�dej zmianie nale�y
        %zrekonfigurowa� parametry baterii!
        Q=1000;

        %Sta�e napi�cie, kt�re chcemy uzyska� na wyj�ciu(w V). Przy ka�dej 
        %zmianie nale�y zrekonfigurowa� parametry baterii!
        E0=10;

        %Sta�a czasowa filtru dolnoprzepustowego. Zmienia�, jak pojawi� si�
        %zak��cenia przy pustej baterii
        T=1000;

        %Parametry odpowiedzialne za napi�cie przy ca�kowicie na�adowanej baterii.
        %Utrzymywa� A niskie C wysokie.
        A=0.1;
        C=100;

        %Parametr, kt�ry musimy redefiniowa� przy ka�ej zmianie Q i E0. Nie ma
        %ustalonej regu�y przekszta�cenia. Lepiej dzia�a dla du�ych Q. Im mniejsze
        %K, tym wi�ksze zak��cenia. Nale�y wtedy zmieni� T.
        K=0.00005;
        
    end
    
    methods

    end
    
    end
    
end
