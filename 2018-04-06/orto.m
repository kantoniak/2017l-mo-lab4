% ORTONORMALIZACJA

% Funkcja orto dla danej macierzy A (o wymiarach m wierszy, n kolumn) bierze
% jej kolumny i traktuje je jako wektory. Jesli te wektory sa liniowo
% niezalezne, funkcja orto zwroci macierz, ktorej:
% 1) kolumny tworza uklad ortonormalny;
% 2) pierwsze j kolumn tworzy baze przestrzeni rozpietej przez pierwsze j
% kolumn macierzy A.

% A(:,k) to k-ta kolumna macierzy A
% A' to transponowana macierz A
% size(A, 1) to liczba wierszy macierzy A
% size(A, 2) to liczba kolumn macierzy A

function Q = orto(A)
  m = size(A, 1);
  n = size(A, 2);

  if m<n
    disp(['Nie zgadzaja sie wymiary! Liczba wektorow jest wieksza niz wymiar przestrzeni R^',num2str(m)]);
  end

  Q(:,1) = A(:,1) / norm(A(:,1));

  for k = 2:n
    C = A(:,k);
    for i = 1:k-1
      C = C - Q(:,i)*(A(:,k)'*Q(:,i));
    end
    Q(:,k) = C / norm(C);
  end  
end