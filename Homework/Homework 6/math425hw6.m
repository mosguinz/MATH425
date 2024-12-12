%% Question 4

S = [-1 2 0; 1 -1 1; 0 1 3]
L = [0 0 0; 0 2 0; 0 0 -2]
S_inv = inv(S)

A = S*L*S_inv
eig(A)

%% Question 6
function [V, L] = findEigenvalues(A)
    epsilon = 1e-6;  % The desired accuracy.x
    k = 0;  % Just to see how many iterations is needed, per activity.
    L = A;
    Q_k = eye(size(A));
    while true
        [Q, R] = qr(L);
        Q_k = Q_k * Q;
        L = R * Q;
        k = k + 1;
        
        % Stop when the MOE is acceptable.
        offDiag = L - diag(diag(L));
        if all(abs(offDiag(:)) < 1e-6)
            fprintf("Completed in %d iterations with epsilon = %1.E.\n", k, epsilon);
            break;
        end
    end
    V = Q_k;
end

% Testing 
A = [3 1 2; 1 3 1; 2 1 3];
[Q, L] = eig(A);
disp(Q);
disp(L);
[Q, L] = findEigenvalues(A);
disp(Q);
disp(L);
