% Lab 1, 2018-03-09

% WPROWADZENIE

% Podstawowe operacje
2*3
sqrt(-1)
pi
tan(pi)

% Dokładność arytmetyki
((10.1-10)*10-1)*10^16  % Zwraca wartość inną od 0
eps                     % Zwraca dokładność arytmetyki

% Sposób wyświetlania
format long
format longe
format short

% Sprawdzanie ustalonych zmiennych
who    % Lista wszystkich
whos   % Lista ze szczegółami
clear  % Czyści ustalone zmienne

% Praca z macierzami
A = [1 2 3; 4 5 6; 7 8 9]  % Definicja macierzy; wiersz po wierszu oddzielone średnikiem
A(2,3)                     % == 6
B = [A A]                  % Dwie macierze obok siebie
B = [A; A]                 % Jedna macierz nad drugą
C(2,3) = 6                 % Macierz C jeszcze nie istnieje, powstanie macierz 2x3 zainicjowana zerami i 6 w ustalonym miejscu
C(5,2) = 1                 % Rozszerzy macierz C do wymaganego rozmiaru

% Macierze specjalne
eye(5), eye(5,6)  % Macierz jednostkowa 5x5, 5x6
eye(10, 1)        % Wektor jednostkowy
ones(5)           % Macierz jedynek 5x5
[0; eye(9, 1)]    % Wektor jednostkowy e2 w R10

% Liczby losowe
rand          % Liczba losowa od 0 do 1
rand(10, 10)  % Macierz losowych liczb 10x10
randn         % Losowa z rokładem Gaussa

% Zakresy
[1:5; 5:9] % Macierz 2x5 z liczbami od 1 do 9, 5 się powtarza
1:2:11 % Liczby nieparzyste od 1 do 11
2:pi:50 % Skok może być dowolny; dostaniemy liczby 2, 2+pi, ..., ~49.12

% Podmacierze
clear; A = [1:5; 6:10; 11:15]
A(2:3, 4:5)  % Zwraca macierz [9 10; 14 15]
A(:, 4:end)  % Zwraca kolumny 4 i 5

% Operacje na macierzach
B = [1:5; 6:10; 11:15] + eye(3, 5)
C = A(1:3, 1:3)
A+B
A-B
A*B'  % Standardowy iloczyn macierzy, wymiary muszą być odpowiednie
A.*A  % Iloczyn po elemencie, podnosi wszystko w A do kwadratu
A'    % Sprzężenie - transpozycja w R
A/B   % Oblicza A*B^-1.
A\B   % Oblicza A^-1*B
A./B
A.\B
C^2   % potegowanie macierzy
C.^2  % potegowanie wyrazow w macierzy

% Uwaga do macierzy odwrotnych: A/B to nie jest dokładnie to samo co A*inv(B) - program wybiera algorytm zależny od własności konkretnej
% macierzy i reprezentowana wartość może być nieco inna. Na przykład, przy mnożeniu A\b=x => Ax=b, rozwiązujemy układ równań co jest
% łatwiejsze niż liczenie odwrotności.

% Wektoryzacja - większość funkcji obsługuje macierz jako argument, wtedy wartości są liczone dla każdego wyrazu.
sin(A)

% RYSOWANIE WYKRESÓW 2D
clear

% Wysujemy sinusa na [0; 2pi] - linie pomiędzy wartościami liczonymi co 0.01
X = 0:0.01:2*pi
Y = sin(1./X)
plot(X, Y)

% Z użyciem linspace
X = linspace(0, 2*pi, 101)
plot(X, sin(X))

% Kilka wykresów na jednym rysunku
plot(X, sin(X), X, cos(X))

% Różne przybliżenia wykresu z użyciem hold
X = linspace(0, 2*pi, 50);
Y = linspace(0, 2*pi, 10);
Z = linspace(0, 2*pi, 5);
hold on          % Pojawia się pusty wykres
plot(X, sin(X))  % Dorysowuje się do wykresu
plot(Y, sin(Y))
plot(Z, sin(Z))
hold off         % Zwalniamy blokadę


% INSTRUKCJE STERUJĄCE
N = 5;
for k = 1:N
  k
end

if N == 2
  disp("Should never happen")
else
  N = 3
end

while N > 0
  N--
end

% ĆWICZENIA
clear
N = 10; % Rozmiar macierzy

% Ćwiczenie 1:
%
%   1   0   0   1
%  -1   1   0   1
%  -1  -1   1   1
%  -1  -1  -1   1
%
A = eye(N, N-1);
for k = 1:N-1
  A(k+1:N, k) = ones(N-k, 1) * -1;
end
A(:, N) = ones(N, 1);
A

% Ćwiczenie 2:
%
%  1   1   1   1
%  1   2   2   2
%  1   2   3   3
%  1   2   3   4
%
B = ones(N)
for k = 2:N
  B(k:end, k:end) += ones(N-k+1, N-k+1);
end
B