function W = silnia(n)
  if (0 == n)
    W = 1;
  else
    W = n * silnia(n - 1);
  end
end
