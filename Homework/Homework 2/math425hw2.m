% Homework 2
 
format default  % Display fractions where possible.

%% Question 1

% 1(a)
function U = myPartialPivot(A)
    [m, n] = size(A);
    if n ~= m
        error("`A` must be an n x n matrix, got: %d x %d", m, n)
    end

    for j = 1:n  % for each column

        % Locate the row with biggest absolute value.
        maxAbsValue = 0;
        maxRowIndex = 0;
        for i = j:m  % for each row from pivot
            absValue = abs(A(i,j));
            if absValue > maxAbsValue
                maxAbsValue = absValue;
                maxRowIndex = i;
            end
        end
        
        % If everything is zero below, skip.
        if maxAbsValue == 0
            continue
        end

        % Perform swap, if necessary.
        if maxRowIndex ~= j
            pivotRow = A(j,:);
            A(j,:) = A(maxRowIndex, :);
            A(maxRowIndex, :) = pivotRow;
        else
            disp("No swap required")
        end
        
        % Eliminate rows.
        for i = j+1:m
            ratio = A(i,j) / A(j,j);
            format long
            A(i,:) = A(i,:) - ratio * A(j,:)
        end
    end
    U = A;
end

% 1(b)
function r = myRank(A)
    [m, n] = size(A);
    if n ~= m
        error("`A` must be an n x n matrix, got: %d x %d", m, n)
    end
    
    U = myPartialPivot(A);
    r = 0;
    for i = 1:n
        if U(i,i) == 0
            break
        end
        r = r + 1;
    end
end


% a = [2 -1 2; -1 -1 3; 3 0 -2];
%a = [1 2 3; 2 4 6; 2 4 6; ];
 a = [1 2 3; 4 5 6; 7 8 9];
myRank(a)
rank(a)