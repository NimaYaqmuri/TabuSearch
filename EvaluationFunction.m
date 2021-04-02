function cost = EvaluationFunction(perm, coords)

    n = numel(perm);
    
    cost = sqrt( (coords(1, 1) - coords(n, 1)).^2 + (coords(1, 2) - coords(n, 2)).^2 );
    for index = 1 : n - 1
        i = perm(index);
        j = perm(index + 1);
        cost = cost + sqrt( (coords(i, 1) - coords(j, 1)).^2 + (coords(i, 2) - coords(j, 2)).^2 );
    end
end

