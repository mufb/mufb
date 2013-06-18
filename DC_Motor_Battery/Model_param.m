

%Parametry do zmiany przez u�ytkownika

%Roz�aduj lub �aduj bateri�. Ladowanie dla C_R == 1, roz�adowywanie, gdy
%C_R ==0
C_R=0;



%Parametry nie do zmiany

%Pocz�tkowy �adunek baterii(w As). Przy ka�dej zmianie nale�y
%zrekonfigurowa� parametry baterii!
Q=1000;

%Sta�e napi�cie, kt�re chcemy uzyska� na wyj�ciu(w V). Przy ka�dej zmianie 
%nale�y zrekonfigurowa� parametry baterii!
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

