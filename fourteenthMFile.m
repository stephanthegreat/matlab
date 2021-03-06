clear all
clc


% is matrix diagonal

A = [1 0 0;0 4 0;0 7 5];
[row colm] = size(A);

isDiag = true;
if row == colm
    for i = 1:1:row
        for j = 1:1:colm
            if (i ~= j) && (A(i,j) ~= 0)
                isDiag = false;
            end                
        end
    end
    
    if isDiag
        fprintf('\nMatrix is Diagonal\n')
    else
        fprintf('\nMatrix is not Diagonal\n')
    end
    
else
    fprintf('\nMatrix is not square\n')
end


%% Multiplying two matrices
clear all
clc

A = [2 3 4;1 2 3];
B = [5 6;7 8;9 0];
C = A*B

% doing that ^ in for loops. call output D


[row colm] = size(A);



for i = 1:1:row
    for j = 1:1:row
        D(i,j) = 0;
        for k = 1:1:colm
            D(i,j) = D(i,j) + A(i,k)*B(k,j);
        end
    end
end
D

%% Strictly Diagonally dominant matrix


A = [7 3 -2;5 17 12;1 2 3];
[row colm] = size(A);

isSDDM = true;
for i = 1:1:row
    D = 0;
    for j = 1:1:colm
        if i ~= j 
            D = D + abs(A(i,j));
        end
    end
    if ~(abs(A(i,i)) > D)
        isSDDM = false;
    end
end

isSDDM


%% Not strictly diagonally dominant matrix


A = [7 3 -2;5 17 12;1 2 3];
[row colm] = size(A);

isDDM = true;
for i = 1:1:row
    D = 0;
    for j = 1:1:colm
        if i ~= j 
            D = D + abs(A(i,j));
        end
    end
    if ~(abs(A(i,i)) >= D)
        isDDM = true;
    end
end
isSDDM = false;
for i = 1:1:row
    D = 0;
    for j = 1:1:colm
        if i ~= j 
            D = D + abs(A(i,j));
        end
    end
    if abs(A(i,i)) > D
        isSDDM = true;
    end
end

isDDM = isDDM && isSDDM
















