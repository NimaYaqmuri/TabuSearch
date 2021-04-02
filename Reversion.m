function newPerm = Reversion(perm, i1, i2)
    newPerm = perm;
    if i1 < i2
        newPerm(i1 : i2) = perm(i2 : -1 : i1);
    else
        newPerm(i1 : -1 : i2) = perm(i2 : i1);
    end
end
