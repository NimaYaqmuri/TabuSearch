function PlotSolution(solution, x, y)

    xmin = min(x);
    xmax = max(x);
    ymin = min(y);
    ymax = max(y);

    perm = solution.permutation; 
    perm = [perm perm(1)];
    
    plot(x(perm), y(perm), 'k-o', ...
        'MarkerSize', 10, ...
        'MarkerFaceColor', 'r', ...
        'LineWidth', 1.5);
    
    xlabel('x');
    ylabel('y');
    
    axis equal;
    grid on;
    
	alpha = 0.1;
	
    dx = xmax - xmin;
    xmin = floor((xmin - alpha*dx)/10)*10;
    xmax = ceil((xmax + alpha*dx)/10)*10;
    xlim([xmin xmax]);
    
    dy = ymax - ymin;
    ymin = floor((ymin - alpha*dy)/10)*10;
    ymax = ceil((ymax + alpha*dy)/10)*10;
    ylim([ymin ymax]);

end