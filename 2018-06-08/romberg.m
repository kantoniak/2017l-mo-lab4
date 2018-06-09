function T = romberg(f, a, b, s)
  T(1,1) = (b-a)/2 * (f(a) + f(b));
  k = 1;
  for i = 2:(s+1)
    sum = 0;
     for j = 1:k
       sum = sum + f(a + (j - 1/2)/k * (b-a));
     end
    T(i,1) = 0.5*(T(i-1,1) + (b-a)/k * sum);
    k = 2*k;
  end
  for i = 2:(s+1)
    for j = (s+1):-1:i
        T(j,i) = (4^(i-1)*T(j,i-1) - T(j-1,i-1))/(4^(i-1) - 1);
    end
  end
end