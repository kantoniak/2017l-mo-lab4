% SKRYPT opisujacy dzialanie i dokladnosc funckcji orto

disp('Podaj wymiary macierzy, ktora chcesz uzyc do testu');
n = input('Liczba kolumn: ');
m = input('Liczba wierszy: ');
disp('Losowa macierz o podanych wymiarach, to:');
A = rand(m,n);
disp('Przeksztalcona macierz A, ktorej kolumny sa ortonormalne, to:');
Q = orto(A);

disp('Czy macierz Q jest znaleziona dobrze? Jesli ponizsza liczba jest bliska zero, to OK.');
disp('(ponizsza liczba to norma roznicy macierzy: jednostkowej i iloczynu Q(transponowane)*Q. Jesli mielibysmy do czynienia z arytmetyka idealna, norma ta powinna byc rowna 0, jako ze ta roznica powinna byc macierza zerowa.');
disp(norm(eye(n)-Q'*Q));

% tutaj sprawdzamy dzialanie funkcji orto na specjalnie skonstruowanej
% macierzy typu:
% 1+10^-12   1           1           1
% 1          1+10^-12    1           1
% 1          1           1+10^-12    1
% 1          1           1           1+10^-12

disp('Sprawdzmy, czy funkcja orto dobrze zachowuje sie dla ponizszej macierzy R (jest to macierz, ktorej wszystkie elementy sa rowne 1, oprocz przekatnej, na ktorej sa wyrazy rowne 1+10^(-12)):';
format long e
n = input('najpierw jednak podaj wymiar macierzy: ');

R = ones(n)+10^(-12)*eye(n)
    for i=1:3 % tutaj mozemy zmieniac ilosc powtorzen ortonormalizacji, np. zamiast 3 wpisac 7 i sprawdzic, jak zmienia sie norma eye(20)-R'*R; mozna tez sprawdzic, ile wynosi norma przy jednokrotnej ortonormalizacji, czyli wystarczy zostawic for i=1.
        disp('Przeksztalcona macierz R, ktorej kolumny sa ortonormalne, to:';
        R = orto(R)
        disp('ponizsza liczba to norma roznicy macierzy: jednostkowej i iloczynu Q(transponowane)*Q. Jesli mielibysmy do czynienia z arytmetyka idealna, norma ta bylaby rowna 0, jako ze ta roznica powinna byc macierza zerowa; im liczba ta jest blizsza zero, tym lepiej)';
        disp(norm(eye(n)-R'*R);
    end
format short