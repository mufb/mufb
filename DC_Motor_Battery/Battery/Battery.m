classdef Battery
    
    properties
        %Parametry do zmiany przez u¿ytkownika

        %Roz³aduj lub ³aduj bateriê. Ladowanie dla C_R == 1, roz³adowywanie, gdy
        %C_R ==0
        C_R=0;


        %Parametry nie do zmiany

        %Pocz¹tkowy ³adunek baterii(w As). Przy ka¿dej zmianie nale¿y
        %zrekonfigurowaæ parametry baterii!
        Q=1000;

        %Sta³e napiêcie, które chcemy uzyskaæ na wyjœciu(w V). Przy ka¿dej 
        %zmianie nale¿y zrekonfigurowaæ parametry baterii!
        E0=10;

        %Sta³a czasowa filtru dolnoprzepustowego. Zmieniaæ, jak pojawi¹ siê
        %zak³ócenia przy pustej baterii
        T=1000;

        %Parametry odpowiedzialne za napiêcie przy ca³kowicie na³adowanej baterii.
        %Utrzymywaæ A niskie C wysokie.
        A=0.1;
        C=100;

        %Parametr, który musimy redefiniowaæ przy ka¿ej zmianie Q i E0. Nie ma
        %ustalonej regu³y przekszta³cenia. Lepiej dzia³a dla du¿ych Q. Im mniejsze
        %K, tym wiêksze zak³ócenia. Nale¿y wtedy zmieniæ T.
        K=0.00005;
        
    end
    
    methods
        function obj = Battery(c_r)
            obj.C_R = c_r;
            obj.Q = 1000;
            obj.E0 = 10;
            obj.T = 1000;
            obj.A = 0.1;
            obj.C = 100;
            obj.K = 0.00005;
    end
    
    end
    
end
