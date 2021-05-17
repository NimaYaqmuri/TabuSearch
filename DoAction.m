function newPerm = DoAction(perm, a)

    switch a(1)
    	% swap
        case 1
            newPerm = Swap(perm, a(2), a(3));
        % reversion
        case 2
            newPerm = Reversion(perm, a(2), a(3));  
        % insertion
        case 3
            newPerm = Insertion(perm, a(2), a(3));         
    end

end