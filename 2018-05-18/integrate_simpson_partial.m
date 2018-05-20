function S = integrate_simpson_partial(f, a, b, n)
  X = [1 : (n+1)];
  X_lin = linspace(a, b, n+1);

  S = 0;
  for i=1:n
    h = X_lin(i+1) - X_lin(i);
    S = S + (f(X_lin(i)) + 4 * f((X_lin(i) + X_lin(i+1))/2) + f(X_lin(i+1))) * h;
  end
  S = S/6;
end