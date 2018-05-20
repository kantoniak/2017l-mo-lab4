function S = integrate_trapeze(f, a, b, n)
  X = [1 : (n+1)];
  X_lin = linspace(a, b, n+1);

  S = 0;
  for i=1:n
    h = X_lin(i+1) - X_lin(i);
    S = S + (f(X_lin(i)) + f(X_lin(i+1))) * h;
  end
  S = S/2;
end