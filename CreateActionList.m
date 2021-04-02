function ActionList = CreateActionList(n)

    nSwap = n * (n - 1) / 2;
    nReversion = n * (n - 1) / 2;
    nInsertion = n ^ 2;
    nAction = nSwap + nReversion + nInsertion;
    
    ActionList = cell(nAction, 1);
    
    cnt = 0;
    
    % Add SWAP
    for i = 1 : n - 1
        for j = i + 1 : n
            cnt = cnt + 1;
            ActionList{cnt} = [1 i j];
        end
    end

    % Add REVERSION
    for i = 1 : n - 1
        for j = i + 1 : n
            if abs(i - j) > 2
                cnt = cnt + 1;
                ActionList{cnt} = [2 i j];
            end
        end
    end
    
    % Add Insertion
    for i = 1 : n
        for j = 1 : n
            if abs(i - j) > 1
                cnt = cnt + 1;
                ActionList{cnt} = [3 i j];
            end
        end
    end
    
    ActionList = ActionList(1 : cnt);

end