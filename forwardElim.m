function[resultA, resultB] = forwardElim(A,B)

[row, colm] = size(A);

if row < 2 
    resultA = A;
    resultB = B;
else
    
    % Doing forward Elimination on the first Column
    for i = 2:1:row
        rowMult = (A(i,1)/A(1,1));
        A(i,:) = A(i,:) - rowMult*A(1,:);  
        B(i) = B(i) - rowMult*B(1);
    end
    
    % arrays one row and one column smaller to be used on recursive call
    C = [];
    D = [];
    
    
    tempFirstRow = [];
    tempFirstColm = [];         % both this is first row include the value at (1,1)
    tempB = B(1,1);
    
    % Copying first row and first column of A into a temp array
    for i = 1:1:row
        tempFirstRow(1,i) = A(1,i);
        tempFirstColm(i,1) = A(i,1);
    end
        
      
    for i = 2:1:row
        for j = 2:1:colm
            C(i-1,j-1) = A(i,j);
        end
    D(i-1,1) = B(i,1);

    end

    [postRecA, postRecB] = forwardElim(C,D);
    
    % adding first row/column back to the result
    resultA = tempFirstRow;
    resultB(1,1) = tempB;
    
    for i = 2:1:row
        resultA(i,1) = tempFirstColm(i,1);
        resultB(i,1) = postRecB(i-1);
        for j = 2:1:colm
            resultA(i,j) = postRecA(i-1,j-1);
        end
    end
       
    
end







