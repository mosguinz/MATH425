% (1)
% rank is 5
A = [1.0001 1 -1;
    2 2.0001 -2;
    3 3 -3.0001]
rank(A)

% (2)
% if you round, the rank is 1.
rank(round(A))

% (3)
% notice that the deltas between the sigmas are huge:
% the last two are basically zeroes.
% technically, you DO have three positive singular values, hence rank 3.
[P, S, Q] = svd(A)

% (4)
% A_1 is the rank-one approximation of A -- which is basically round(A).
P_1 = P(:,1)
S_1 = S(1,1)
Q_1 = Q(:,1)
A_1 = P_1 * S_1 * Q_1'
norm(A - A_1)

% (5)
% the basis would be q_2 and q_3; they are vectors that are basically zero
% note that A is still rank 3, so nullity is still zero.
% But if you find round(A), rank is 1, therefore nullity is two.
% So, the *closest* basis would be the q-vectors corresponding to the
% basically-zero (sig_2, sig_3) singular values.

% (6)
disp("here is a rank-2 5x5 matrix.");
B = [1 2 3 4 5
    6 7 8 9 10
    1 1 1 1 1;
    1 1 1 1 1;
    1 1 1 1 1];
disp(B);
rank(B)

disp("now we deliberately make it rank-5 by adding 0.0001 to diag entries");
B = [1 2 3 4 5
    6 7 8 9 10
    1 1 1.0001 1 1;
    1 1 1 1.0001 1;
    1 1 1 1 1.0001];
disp(B);
rank(B)

[P, S, Q] = svd(B)
disp("now with the SVD, we notice that the last three sigmas are approx. zero");
disp("so yes, while it's rank 5. The true rank is really 2.");
disp("that means nullity of A *should* be 3, and the approx. basis for ker(A)");
disp("are the q_i corresponding to the basically-zero sigmas");

% (7)
% skip that


% Hilbert

H_4 = hilb(4)
rank(H_4)
[P, S, Q] = svd(H_4)

H_5 = hilb(5)
rank(H_5)
[P, S, Q] = svd(H_5)

H_6 = hilb(6)
rank(H_6)
[P, S, Q] = svd(H_6)

H_8 = hilb(8)
rank(H_8)
[P, S, Q] = svd(H_8)

% Condition number

fprintf("Condition number for H_%d: %f\n", 4,)