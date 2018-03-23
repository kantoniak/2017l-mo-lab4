function W = test_matrix1(n)
    A = matrix1(n);
    x = ones(n, 1);
    b = A*x;
    z = A\b;
    W = norm(x-z)/norm(x);
end
