function [S, n] = integrate_adaptive(f, a, b, e)
  P1 = integrate_simpson_partial(f, a, b, 1);
  P2 = integrate_simpson_partial(f, a, (a+b)/2, 1) + integrate_simpson_partial(f, (a+b)/2, b, 1);
  if (abs(P1-P2) < 15*e)
    [S, n] = {P2, 1}{:};
  else
    [S_left, n_left] = integrate_adaptive(f, a, (a+b)/2, e/2);
    [S_right, n_right] = integrate_adaptive(f, (a+b)/2, b, e/2);
    [S, n] = {S_left + S_right, n_left + n_right}{:};
  endif
end