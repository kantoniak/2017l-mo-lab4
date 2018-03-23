% Lab 2, 2018-03-23
oldFolder = cd('2018-03-23'); % Zmieniamy folder roboczy na ten dotyczący zajęć. Dzięki temu możemy ładować funkcje z plików.

disp('Tak wyświetlamy tekst na konsoli')


% SKRYPTY I FUNKCJE

% Składnia funkcji
function W = nazwa(parametry, funkcji)
  % ...
  % W = wartość na wyjściu;
end

% Taką funkcję powinniśmy zapisać w pliku nazwa.m

% Ćwiczenie 1: Przygotować funkcję matrix1 zwracającą macierz jak poniżej o rozmiarze zależnym od n:
%
%   1   0   0   1
%  -1   1   0   1
%  -1  -1   1   1
%  -1  -1  -1   1
%
% Rozwiązanie: matrix1.m
matrix1(10)

% Funkcja może wywoływać samą siebie
% Ćwiczenie 2: Przygotować funkcję silnia obliczającą silnię z n
% Rozwiązanie: silnia.m
silnia(6)

% Argumentem funkcji może być również funkcja
function W = wywolaj_funkcje(f, x)
  W = f(x);
end

% Podając funkcję jako argument poprzedzamy nazwę '@'
wywolaj_funkcje(@sin, 5)

% Funkcje lambda - definiowane ad hoc w miejscu wywołania
% Składnia: @(parametr1, parametr2, ...) wyrażenie
f = @(x,y)(x^2 + y^2);
f(3, 4)

% Można podać lambdę jako argument
wywolaj_funkcje(@(x)(x^2), 5)


% ELIMINACJA GAUSSA
% Standardowo szukamy x takiego, że Ax = b
n = 10
A = rand(10)
b = rand(10, 1)

% Możemy po prostu odpalić
x = A\b
% Octave dobierze metodę odpowiednią do własności macierzy itd.

% Możemy wymusić rozkład PA=LU
[L, U, P] = lu(A)
x = U\(L\P*b)

% Eliminacja Gaussa nie zawsze daje dobry wynik:
% (test_matrix1 zwraca błąd względny dla układu takiego, że x = ones(n, 1); jest rozwiązaniem)
test_matrix1(10)  % 0
test_matrix1(30)  % 0
test_matrix1(54)  % 0
test_matrix1(55)  % 0.1348, od 55 zaczyna się sypać
test_matrix1(80)  % 3.8891

% Dlaczego tak się dzieje? Przecież
% 1. Algorytm jest numerycznie poprawny
% 2. Jest dobre uwarunkowanie
cond(test_matrix1(55)) % ans = 1

% Problemem jest reprezentacja liczb całkowitych. Wiemy, że dla naszego algorytmu zachodzi
% ‖x - fl𝜈(x)‖ <=~ K(n)𝜈 * cond(A) * ‖x‖
% Akurat jest tak, że tutaj
% K(n) ~= 2^n
% 𝜈 ~= 10^-16 ~= 2^55
% Liczby całkowite w Octave są traktowane jak rzeczywiste. Powyżej pewnej wartości ich końcówka zostaje zaookrąglona i to powoduje błąd.

% Dla macierzy Hilberta to już w ogóle działa tragicznie
% (test_hilb działa jak test_matrix1, tylko korzysta z macierzy Hilberta)
test_hilb(5)  % 3.0124e-012
test_hilb(10) % 1.7291e-004
test_hilb(11) % 0.0032482
test_hilb(12) % warning: matrix singular to machine precision, rcond = 2.47212e-017
% W tym przypadku możnaby to naprawić biorąc element maksymalny z całej podmacierzy, nie z samej kolumny.

cd(oldFolder); % Wracamy do głównego folderu.