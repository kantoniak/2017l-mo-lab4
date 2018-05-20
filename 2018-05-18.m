% Lab 6, 2018-05-18
oldFolder = cd('2018-05-18'); % Zmieniamy folder roboczy na ten dotyczący zajęć. Dzięki temu możemy ładować funkcje z plików.

% CAŁKOWANIE NUMERYCZNE
% W Matlabie są wbudowane matody quad i (bardziej polecana) integral.
% Możemy korzystać z podstawowych kwadratur. Problemem jest wolna zbieżność - musimy przejść do nieskończoności z liczbą przedziałów przybliżenia.

% Złożona kwadratura prostokątów
% Najprostsza metoda: możemy aproksymować kawałkami wielomianami stopnia zero na podprzedziałach.
% I_f = Σ[f(x_i + x_(i+1)) * 1/2 * h]

% Złożona kwadratura trapezów
% Bardzo podobnie, w każdym przedziale obliczamy pole trapezu zamiast prostokąta
f = @(t) t.^3 ./ (1+t.^4);
a = 1; b = 8;
n = 50; % liczba podziałów

X = [1 : (n+1)];
X_lin = linspace(a, b, n+1);
% plot(X_lin, f(X_lin));

% Zobacz integrate_trapeze.m
s = integrate_trapeze(f, a, b, n);

% Złożona kwadratura parabol
% Dobieramy parabole tak, żeby przechodziła na każdym przedziale przez x_i, [x_i + x_(i+1)] / 2, x_i
% Pole pojedycznego obszaru:  P(f) = (b-a)/6* [f(a)+ 4f((a+b)/2)+f(b)]
s = integrate_simpson_partial(f, a, b, n);

% Kwadratura adaptacyjna
% Liczba podziałów rośnie wykładniczo aż do osiągnięcia oczekiwanej dokładności.
[s, n] = integrate_adaptive(f, a, b, 0.001);

cd(oldFolder); % Wracamy do głównego folderu.