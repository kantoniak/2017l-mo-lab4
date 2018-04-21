% Lab 2, 2018-04-20
oldFolder = cd('2018-04-20'); % Zmieniamy folder roboczy na ten dotyczący zajęć. Dzięki temu możemy ładować funkcje z plików.

% PRZYPOMNIENIE - ROZWIĄZYWANIE UKŁADÓW RÓWNAŃ
A = rand(5)
b = rand(5, 1)

% Opcja 1 - dla typowych macierzy robi rozkład PA=LU, stąd err2 i err3 mogą być równe zero
x1 = A\b

% Opcja 2
[L, U, P] = lu(A);
x2 = U\(L\(P*b))
err2 = norm(x2-x1)

% Opcja 3
[L, U, p] = lu(A, 'vector');
x3 = U\(L\b(p))
err3 = norm(x3-x1)

% ROZKŁAD QR
[Q, R] = qr(A)    % Tutaj wymuszamy liczenie Q, ale przecież w ogólności nie jest to potrzebne do rozwiązania LZNK.
[Q, R] = qr(A, 0) % Dodanie 0 jako argument powoduje, że dostajemy macierze bez zerowych kolumn.
norm(A-Q*R)

% Powinno wyjść to samo co w ortogonalizacji GS (modulo znak kolumny)
O = orto(A)

% Rozkład Gaussa nie działał dobrze dla macierzy matrix1(n), rokład QR świetnie daje sobie z tym radę.
n = 10;
A = matrix1(n);
[Q, R] = qr(A);
O = orto(A);

x = ones(n, 1);
b_O = A * x;
y = R\(Q' * b_O);

norm(y-x, inf) % Nawet dla n = 1000 ta norma jest rzędzu 10^-12

% INTERPOLACJA WIELOMIANOWA (LAGRANGE'A)
% f:[a,b]->R
% a < x1 < x2 < x3 < ... < xn < b
% w_f - wielomian stopnia n taki, że w_f(x_i) = f(x_i)
% w_f(x) = a1*x^n + a2*x^(n-1) + ...

% Tutaj f określona na [0, 1]
a = 0;
b = 1;
n = 10;
X = linspace(a, b, n+1);
Y = f(X);
A = polyfit(X, Y, n) % X - wektor punktów, Y - wektor wartości, n - stopień wielomianu
Z = polyval(A, x)    % Wartość wielomianu w punkcie x, x może być wektorem

X1 = linspace(a, b, 100);
Y1 = polyval(A, X1);

% Pozostaje zrobić rysunek (zobacz polyval.pdf)
hold on
plot(X, Y)    % Wyjściowe punkty
plot(X1, Y1)  % Obliczony wielomian
hold off

cd(oldFolder); % Wracamy do głównego folderu.