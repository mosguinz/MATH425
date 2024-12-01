%% Question 4

S = [-1 2 0; 1 -1 1; 0 1 3]
L = [0 0 0; 0 2 0; 0 0 -2]
S_inv = inv(S)

A = S*L*S_inv
eig(A)