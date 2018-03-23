function W = test_hilb(n)
    A = hilb(n);
    x = ones(n, 1);
    b = A*x;
    z = A\b;
    W = norm(x-z)/norm(x);
end
