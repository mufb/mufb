

%Parametry do zmiany przez u¿ytkownika

%Roz³aduj lub ³aduj bateriê. Ladowanie dla C_R == 1, roz³adowywanie, gdy
%C_R ==0
C_R=0;



%Parametry nie do zmiany

%Pocz¹tkowy ³adunek baterii(w As). Przy ka¿dej zmianie nale¿y
%zrekonfigurowaæ parametry baterii!
Q=1000;

%Sta³e napiêcie, które chcemy uzyskaæ na wyjœciu(w V). Przy ka¿dej zmianie 
%nale¿y zrekonfigurowaæ parametry baterii!
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

