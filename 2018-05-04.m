% Lab 5, 2018-05-04
oldFolder = cd('2018-05-04'); % Zmieniamy folder roboczy na ten dotyczący zajęć. Dzięki temu możemy ładować funkcje z plików.

% INTERPOLACJA WIELOMIANOWA - BŁĄD PRZYBLIŻENIA
% Przybliżenie wielomianowe nie jest doskonałe i pojawiają się błędy.
% Mamy 7 punktów: (-10,3), (-2,3), (1,1), (2,7), (5,3), (7,3), (20,3).
% Chcemy wskazać wielomian stopnia 6, który przez nie przechodzi.

X = [-10, -2 ,1, 2, 5, 7, 20];
Y = [3, 3, 1, 7, 3, 3, 3];

% Wykres funkcji przypomina uderzenie serca, z minimum równym 1 i
% maksimum równym 7 (spójrz na wykres-funkcji.pdf)
% plot(X, Y);

A = polyfit(X, Y, 6);

X1 = linspace(-10, 20, 257);
Y1 = polyval(A, X1);

% Wykres przybliżenia kompletnie nie przypomina początkowej funkcji,
% w pewnych miejscach maksimum grubo przekracza 100 kiedy max funkcji
% to 7 (spójrz na wykres-przyblizenia.pdf)
% plot(X1, Y1);

% Przy przybliżaniu funkcji, gdzie węzły są rozmieszczone równomiernie,
% efekt nie jest zadowalający, może się nawet pogarszać. Szczególnie
% źle wyglądają wybuchające końce przybliżanego przedziału. Nazywa się
% to efektem Rungego (https://pl.wikipedia.org/wiki/Efekt_Rungego).

% WĘZŁY CZEBYSZEWA
% Możemy brać wartości funkcji w innych, nierównomiernie rozstawionych
% punktach. Jeśli za X przyjmiemy miejsca zerowe wielomianu Czebyszewa
% (nazywane węzłami Czebyszewa), to dostaniemy optymalne przybliżenie.

% Dla odcinka [-1, 1] i wielomianu stopnia n mamy:
% x_k* = -cos((k - 1/2)/(n + 1) * pi), dla k=1..n+1
% Dla dowolnego odcinka domkniętego [a, b]:
% x_k = (a+b)/2 + x_k* * (b-a)/2

% PRZYKŁAD - PORÓWNANIE BŁĘDÓW PRZYBLIŻEŃ
f = @(t) t.^3 ./ (1+t.^4);

a = -5; b = 5;
n = 8; % stopień wielomianu
X = [1 : (n+1)];
X_lin = linspace(a, b, n+1);
X_test = linspace(a, b, 151);

% Rzeczywiste wartości
Y = f(X_lin)
Y_test = f(X_test);

% Przybliżenie węzłami liniowymi
A_lin = polyfit(X_lin, Y, n);
Y_lin = polyval(A_lin, X_test); 

% Przybliżenie węzłami Czebyszewa
% Funkcja czeb(k) wylicza k-ty węzeł Czebyszewa na [-1,1]
czeb = @(k) -cos((k - (1/2))/(n+1) * pi);
X_czeb = (a+b)/2 + (b-a)/2 * czeb(X);
Y_czeb = f(X_czeb);
A_czeb = polyfit(X_czeb, Y_czeb, n);
Y_czeb = polyval(A_czeb, X_test);

% Błędy
err_Y_lin = norm(Y_lin - Y_test, inf)
err_Y_czeb = norm(Y_czeb - Y_test, inf)

% Wykres
hold on
grid on
plot(X_test, Y_test); % Dokładna wartość
plot(X_test, Y_lin); % Przybliżenie (liniowo)
plot(X_test, Y_czeb); % Przybliżenie (Czebyszew)
legend("f(x)", "Liniowo", "Czebyszew")
hold off

cd(oldFolder); % Wracamy do głównego folderu.