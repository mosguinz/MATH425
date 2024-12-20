%% Question 1

A = [1 1 1 1;
    1 2 1 0;
    1 1 2 1;
    1 0 1 1]
b = [2; -1; 1; 2]

% 1(a)
% A = QR => QRx = b
[Q, R] = qr(A)

% 1(b)
% Rx = Q'b => x = R \ Q'b
x = R \ Q' * b
% sanity check
% A \ b;

%% Question 2

A = [0 .5 .5;
    .5 0 .5;
    .5 .5 0]

% 2(a)
[Q, L] = eig(A)

% 2(b)
u = rand(3, 1)

% 2(c)-(e)
% When you raise A to a large enough k, e.g. here k = 100, the matrix
% basically becomes rank 1. Here, all entries of A^100 are basically
% 0.333... So, multiplying a random vector to this matrix produces a column
% vector whose entries are all the same, which is the "same" as the
% eigenvector that corresponds to the eigenvalue lambda = 1, the last
% column of Q.

% For the sake of completion...

% 1st run: A^100 * u = [ 0.3912;  0.3912;  0.3912 ]
% Got a vector whose entries are all basically the same. Just like the
% eigenvector that corerspond to lambda = 1, the last column of Q.
A^100 * u
Q

% 2nd run: A^100 * u = [ 0.5904;  0.5904;  0.5904 ]
% Got a vector whose entries are all basically the same. Just like the
% eigenvector that corerspond to lambda = 1, the last column of Q.
A^100 * u
Q

% 3rd run: A^100 * u = [ 0.7664;  0.7664;  0.7664 ]
% Got a vector whose entries are all basically the same. Just like the
% eigenvector that corerspond to lambda = 1, the last column of Q.
A^100 * u
Q

%% Question 3

A = [4 -2 4.999 4;
    11.001 -3 5 1;
    8 -4.001 10 8;
    15 -5 10 4.999]

% 3(a)
[P, S, Q] = svd(A)

% 3(b)
% looking at Sigma, there are four positive singular values.
% Therefore, the rank is 4.

% 3(c)
% Looking at Sigma, the "true rank" should really be 2.
% Because there is a large drop off after the sigma_2 i.e.
% from 6.7 to 0.0010. The last two singular values are basically zeroes.

% 3(d)
% From 3(c), we decided this should really be rank 2. So, we are going to
% make a rank-2 approximation of A, denoted A_2. Basically by using the
% truncated version of the SVD.
P_2 = P(:,2)
S_2 = S(2,2)
Q_2 = Q(:,2)
A_2 = P_2 * S_2 * Q_2'
