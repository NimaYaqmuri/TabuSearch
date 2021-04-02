function newPerm = Swap(perm, i, j)
    newPerm = perm;
    newPerm([i j]) = newPerm([j i]);   
end
