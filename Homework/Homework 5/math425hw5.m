%% Question 1

A = [
    1 0 1;
    2 1 0;
    -1 -2 3;
    0 -1 2
];
b = [1; 1; 2; -2];

rref([A,b])  % clearly, no solution
A * (A \ b)


%% Question 2

A = [
    1 2 -1;
    0 -2 3;
    1 5 -1;
    -3 1 1
];
b = [0; 5; 6; 8];

% Method 1: Find QR and perform backward substitution.

% Bringing back the ol' reliable from HW1.
function x = myBackwardSubstitution(U, c)
    [m, n] = size(U);
    if n ~= m
        error("`U` must be an n x n matrix, got: %d x %d", m, n)
    end

    [p, q] = size(c);
    if q ~= 1
        error("`c` must be a column vector (1 x m), got: %d x %d", p, q)
    elseif p ~= m
        error("Expecting column vector with %d rows, got: %d", m, p)
    end

    x = zeros(m, 1);
    for i = m:-1:1
        if U(i,i) == 0
            error("Zero diagonal entry at row %d", i);
        end
        sum = 0;
        for j = i+1:n  % Perform summation, idk how to with one-line??
            sum = sum + U(i,j) * x(j);
        end
        x(i) = (1 / U(i,i)) * (c(i) - sum);
    end
end

[Q, R] = qr(A, "econ"); % computes only the first n columns of Q and the first n rows of R
myBackwardSubstitution(R, Q'* b)
x = fixed.backwardSubstitute(R, Q'* b)

% Method 2: Using Cholesky factorization
R = chol(A' * A)
y = fixed.forwardSubstitute(R, A' * b)
x = fixed.backwardSubstitute(R, y)