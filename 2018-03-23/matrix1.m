function result = matrix1(n)
  result = eye(n, n-1);
  for k = 1:n-1
    result(k+1:n, k) = ones(n-k, 1) * -1;
  end
  result(:, n) = ones(n, 1);
end
