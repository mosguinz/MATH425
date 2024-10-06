% Homework 3

%% Question 2

a_1 = [1; 2; 0; 1];
a_2 = [0; -1; 3; 0];
a_3 = [2; 0; 1; -1];
b = [3; 0; -1; 2];

rref([a_1, a_2, a_3, b])

%% Question 3

v_1 = [1; 0; 2];
v_2 = [3; -1; 1];
v_3 = [2; -1; -1];
v_4 = [4; -1; 3];

% 3(a)
% Just augument and see if they are full rank.
rank([v_1, v_2, v_3, v_4])  % rank = 2, so no.