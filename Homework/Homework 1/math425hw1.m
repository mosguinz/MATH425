% Homework 1

format rational  % Display fractions where possible.

%% Question 1

% 1(a)
function U = myGaussianElimination(A)
    [m, n] = size(A);
    if n ~= m + 1
        error("Expecting an n x (n+1) matrix, got: %d x %d", m, n)
    end
    
    for i = 1:m
        if A(i,i) == 0
            error("Zero pivot at row %d", i);
        end
        for j = i+1:m  % For each row entry below the pivot
            ell_ij = A(j,i) / A(i,i);
            A(j,:) = A(j,:) - ell_ij * A(i,:);  % Apply row-op
        end
    end

    U = A;
end

% 1(b)
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

% 1(c)
function x = myLinearSolution(A, b)
    [m, n] = size(A);
    if m ~= n
        error("`A` must be an n x n matrix, got: %d x %d", m, n)
    end
    
    [p, q] = size(b);
    if q ~= 1
        error("`b` must be a column vector (1 x m), got: %d x %d", p, q)
    elseif p ~= m
        error("Expecting column vector with %d rows, got: %d", m, p)
    end

    augmented = [A b];
    echelon = myGaussianElimination(augmented);
    U = echelon(:, 1:m);
    c = echelon(:, n+1);
    x = myBackwardSubstitution(U, c);
end

% 1(c) demo

% From handout. Should work.
disp("Testing `myLinearSolution` with valid arguments.")
myLinearSolution([2 -1 2; -1 -1 3; 3 0 -2], [2; 1; 1])

% Bad argument test.
disp("Testing `myLinearSolution` with bad arguments.")
nonSquare = @() myLinearSolution([2 -1 2; -1 -1 3], [2; 1; 1]);
badDimension = @() myLinearSolution([2 -1 2; -1 -1 3; 3 0 -2], [2; 1 ]);
nonColVec = @() myLinearSolution([2 -1 2; -1 -1 3; 3 0 -2], [2 1; 1 1]);
zeroDiag = @() myLinearSolution([0 -1 2; -1 1 3; 3 0 -2], [2; 1; 1]);
for f = { nonSquare, badDimension, nonColVec, zeroDiag }
    try
        f{1}()
    catch err
        warning(err.message)
    end
end


%% Question 2

A = [
    -8 -2 3 1;
    1 -2 0 2;
    -4 -1 3 2;
    4 1 -1 -1 
]

% 2(a)
% 1/8R_1 + R_2 -> R_2
A_1 = A;
A_1(2,:) = (1/8) * A(1,:) + A(2,:)

% 2(b)
E_1 = eye(4);
E_1(2,:) = (1/8) * E_1(1,:) + E_1(2,:)

% 2(c)
% -1/2R_1 + R_3 -> R_3
A_2 = A_1;
A_2(3,:) = (-1/2) * A_2(1,:) + A_2(3,:)

% 2(d)
E_2 = eye(4);
E_2(3,:) = (-1/2) * E_2(1,:) + E_2(3,:)

% 2(e)
% 1/2R_1 + R_4 -> R_4
A_3 = A_2;
A_3(4,:) = (1/2) * A_3(1,:) + A_3(4,:)

E_3 = eye(4);
E_3(4,:) = (1/2) * E_3(1,:) + E_3(4,:)

% -1/3R_3 + R_4 -> R_4
A_4 = A_3;
A_4(4,:) = (-1/3) * A_4(3,:) + A_4(4,:)

E_4 = eye(4);
E_4(4,:) = (-1/3) * E_4(3,:) + E_4(4,:)

my_U = E_4 * E_3 * E_2 * E_1 * A;

% 2(f)
L_1 = inv(E_1);
L_2 = inv(E_2);
L_3 = inv(E_3);
L_4 = inv(E_4);

% 2(g)
my_L = inv(E_1) * inv(E_2) * inv(E_3) * inv(E_4);
[L, U] = lu(A);

disp("Checking if my L and U are good:")
fprintf("my_L == L: %d\n", isequal(my_L, L))
fprintf("my_U == U: %d\n", isequal(my_U, U))

% 2(h)
b = [-2 6 -5 1]';

disp("Step one: Solve Ly = b.")
y = myLinearSolution(L, b);
disp(y)

disp("Step two: Solve Ux = y.")
x_expected = myLinearSolution(U, y);
disp(x_expected)

disp("Verifying if Ax yields b.")
disp(A*x_expected)

%% Question 4

% 4(a)
for i = [2, 3, 5, 6, 7, 10, 15]
    fprintf("i = %d", i)
    H = hilb(i)
    H_inv = inv(H)
end

% 4(b)
x_expected = rand(15, 1)
b = hilb(15) * x_expected
x_actual = inv(hilb(15)) * b

% Specific run illustrated in 4(b)
% x_expected = [
%     1079/3083;
%     358/1821;
%     695/2768;
%     1436/2331;
%     567/1198;
%     339/964;
%     1935/2329;
%     1263/2158;
%     199/362;
%     1595/1739;
%     327/1144;
%     2261/2986;
%     2476/3285;
%     751/1974;
%     967/1703
% ];
% x_actual = [
%     1079/3083;
%     1529/7778;
%     971/3863;
%     1138/1877;
%     419/817;
%     2797/10380;
%     869/544;
%     2405/1111;
%     -1383/217;
%     1855/162;
%     -8031/422;
%     2147/141;
%     -14464/4359;
%     2397/662;
%     -97/1069
% ];

% See delta
format long
x_delta = x_actual - x_expected

% For plotting to see where the largest absolute deltas are.
function writeDeltas()
    fileId = fopen("4b_absdelta.csv", "a")
    for i = 1:100
        x_expected = rand(15, 1);
        b = hilb(15) * x_expected;
        x_actual = inv(hilb(15)) * b;
        format long
        x_delta = x_actual - x_expected
        fprintf(fileId, ...
            "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", ...
            abs(x_delta));
    end
end
% writeDeltas()
