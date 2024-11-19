A_3x3 = [
    3 1 2;
    1 3 1;
    2 1 3
];

A_0 = A_3x3;


function A_k = compute_Ak(A, k)
    A_k = A;
    Q_k = eye(size(A));
    for i = 1:k
        [Q, R] = qr(A_k);
        A_k = R * Q;
        Q_k = Q_k * Q;
    end
    fprintf("A_%d =\n", k)
    disp(A_k)
    fprintf("Q_%d =\n", k)
    disp(Q_k)
end

% (1)
% L is always in increasing order of eigvenvalues
[Q, L] = eig(A_3x3)
Q * L * Q';             % this bitch flipped; on paper it's A = Q'LQ
compute_Ak(A_3x3, 11)    % needs k >= 12 to converge (4 d.p.)

% (2)-(3)
A_4x4 = [
    31 -1 30 -9;
    -1 14 -2 -1;
    30 -2 31 -4;
    -9 -1 -4 22
]

[Q, L] = eig(A_4x4)
compute_Ak(A_4x4, 32)  % needs k >= 32 to converge (4 d.p.)
