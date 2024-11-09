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

[Q, R] = qr(A, "econ"); % computes only the first n columns of Q and the first n rows of R
x = fixed.backwardSubstitute(R, Q'* b)  % myBackwardSubstitution(R, Q'* b) % goodbye, old friend...

% Method 2: Using Cholesky factorization
R = chol(A' * A);
y = fixed.forwardSubstitute(R, A' * b);
x = fixed.backwardSubstitute(R, y)

%% Question 3

years = [1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999];
prices = [86.4 89.8 92.8 96.0 99.6 103.1 106.3 109.5 113.3 120.0 129.5];

% Construct system Ax = b.
A = ones(11, 2);
A(:, 2) = years';
b = prices';

% Solve A'Ax = A'b
x_star = A' * A \ A' * b;
alpha = x_star(1);
beta = x_star(2);

est_price = @(year) (alpha + beta * year) * 1000;
fprintf("Using y = %.5fx + %.5f\n", alpha, beta)
fprintf("Estimated median price in %d: $%.f\n", 2005, est_price(2005))
fprintf("Estimated median price in %d: $%.f\n", 2010, est_price(2010))