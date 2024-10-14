
A = [
    1 2 0;
    3 -1 1;
    -1 2 1;
    1 -1 -2;
    2 1 -1;
]

b = [1; 0; -1; 2; 2]

rref([A,b])
disp("Inconsistent fourth row (0=1), so no solution.")

disp("Attempting to find a soltion using `A\b`")
x_star = A\b

disp("MATLAB attempts to find the LSS.")
b_hat = A * x_star

%% Method 1: Using QR-factorization

[Q, R] = qr(A)
% Q should be 5x3 but, got 5x5
% R should be 3x3 but, got 5x3

% Truncate Q and R to get the "correct" dimensions.
% Why? So we do not have to work with extra rows and columns.
% We can still obtain A using the same Q and R, but we have to
% do extra computations!
Q = Q(:, 1:3)
R = R(1:3, :)

hopefully_A = Q*R

x_star = R \ Q'*b

disp("This produces the same solution as A\b")

%% Method 2: Solving A^T Ax = A^T b

disp("Method 2: Solving A^T Ax = A^T b")
A' * A \ A' * b
disp("Same as doing A\b")

%% Method 3: Using Cholesky factorization

R = chol(A' * A)

R' * R

%% Question 5.5.2

t = [12 14 17 21 26 30]
y = [60 70 90 100 100 120]

% Using method 2
A = ones(6, 2)
A(:, 2) = t'

b = y'

% alpha and beta
A' * A \ A' * b
