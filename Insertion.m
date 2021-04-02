function newPerm = Insertion(perm, i1, i2)
    if i1 < i2
        newPerm = perm([1:i1-1 i1+1:i2 i1 i2+1:end]);
    else
        newPerm = perm([1:i2 i1 i2+1:i1-1 i1+1:end]);
    end
end
