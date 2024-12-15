% Q(5)
A = imread("notSerkan.jpg");
A = im2gray(A);
A = im2double(A);

[P, S, Q] = svd(A);
singularValues = diag(S);
disp(singularValues);

% Find biggest deltas between two entries.
deltas = abs(diff(singularValues));
[maxDelta, idx] = max(deltas);
sigma_i = idx;          % Index of the first entry
sigma_j = idx + 1;     % Index of the second entry
fprintf("Largest delta between sigma_%d and sigma_%d: %.2f\n", sigma_i, sigma_j, maxDelta);
fprintf("Average delta between sigmas: %.2f\n", mean(deltas));

k = 2;
A_k = P(:, 1:k) * S(1:k, 1:k) * Q(:, 1:k)';
imshow(A_k);
filename = strcat("notSerkan_svd_A_", num2str(k), ".jpg");
imwrite(A_k, filename);
