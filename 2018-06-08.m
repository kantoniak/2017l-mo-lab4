% Lab 7, 2018-06-08
oldFolder = cd('2018-06-08'); % Zmieniamy folder roboczy na ten dotyczący zajęć. Dzięki temu możemy ładować funkcje z plików.

% CAŁKOWANIE NUMERYCZNE - CIĄG DALSZY

% Kwadratura Romberga
% Polega na zagęszczaniu punktów podziału kwadratury trapezów i ekstrapolacji Richardsona wyników,
% żeby otrzymać lepsze przybliżenie. Dobry artykuł na Wikipedii:
% https://en.wikipedia.org/wiki/Romberg%27s_method

f = @(x) sin(x);
a = 0;
b = pi;
s = 8;
A = romberg(f, a, b, s);

% Pokazuje całe drzewo Romberga. Finalny błąd bezwględny w dolnym prawym rogu.
A - 2*ones(s+1)

cd(oldFolder); % Wracamy do głównego folderu.