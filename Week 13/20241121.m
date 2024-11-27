A = [2 1 0; 3 4 5]
K = A'*A

rank(K) % = 2

% as such, the number of positive eigenvalues must be 2

% here we see one zero eigenvalue. this is in ker(K)
[Q, L] = eig(K)

% testing it, multiplying K to the first column
% gives us basically zero vector.
K * Q(:,1)

% this means that the other two columns of Q
% corresponds to the other two positive eigenvalues

% by convention, we list the singular values to be
% in decreasing order. So:

sigma_1 = sqrt(L(3,3))
sigma_2 = sqrt(L(2,2))
% note that the first entry is the zero

% the singular vectors of A are the corresponding
% columns of L (i.e. the eigenvectors of K)