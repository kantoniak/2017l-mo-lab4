function Q = orto(A)
  [rows, cols] = size(A);
  
  if rank(A) < cols
    disp('Wektory liniowo zależne - nie tworzą bazy');
    return;
  end
  
  % Pierwszy wiersz bez zmian
  a_1 = A(:, 1);
  % Alternatywnie: Q(1:rows, 1) = a_1 / (a_1'*a_1);
  Q(1:rows, 1) = a_1 / norm(a_1);
  
  for i = 2:cols
     a = A(:, i);
     c = a;
     for j = 1:i-1
       q_j = Q(:, j);
       c = c - (a'*q_j) / norm(q_j) * q_j;
     end
     Q(1:rows, i) = c / norm(c);
  end
end