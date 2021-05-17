clc;
clear;
close all;

%% Initialization

% Initializate Necessary Variables
InitializeGraph;

% Evaluation Function
CalcCost = @(perm) EvaluationFunction(perm, coords);    

% Action List
actionList = CreateActionList(n);

% Number of Actions
nAction = numel(actionList);

%% Tabu Search Parameters

% Maximum Number of Iterations
MaxIt = 100;

% Initialize Action Tabu Counters
TC = zeros(nAction, 1);

% Tabu Length
TL = round(0.1 * nAction);

% Random Start Configuration
bestEver.permutation = randperm(n);
bestEver.cost = CalcCost(bestEver.permutation);

best = bestEver;

% Variables needed for Random Restart Algorithm
cnt = 0;
savedCost = bestEver.cost;

% Array to Hold Best Costs
bestCost = zeros(MaxIt, 1);

%% Tabu Search Main Loop

for it = 1:MaxIt
    
    newBest.cost = inf;
    
    % Apply Actions
    for i = 1 : nAction
        tmp.permutation = DoAction(best.permutation, actionList{i});
        tmp.cost = CalcCost(tmp.permutation);
        tmp.actionIndex = i;
        
        if TC(i) <= it % this move is not tabu
            if tmp.cost < newBest.cost
                newBest = tmp;
            end
        else % Aspiration Criteria
            if tmp.cost < bestEver.cost
                newBest = tmp;
            end
        end
    end
    
    % Update Tabu List
    TC(newBest.actionIndex) = it + TL;

    % Update Best Solution Ever Found
    if newBest.cost < best.cost
        best = newBest;
        if best.cost < bestEver.cost
           bestEver = best;
        end
    end
    
    % Save Best Cost Ever Found
    bestCost(it) = bestEver.cost;
       
    if best.cost == savedCost
        cnt = cnt + 1;
        if cnt >= 10
           % Restart
           best.permutation = randperm(n);
           best.cost = CalcCost(best.permutation);
           cnt = 0;
        end
    else
        savedCost = best.cost;
        cnt = 0;
    end
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestCost(it))]);
    
    % Plot Best Solution
    figure(1);
    PlotSolution(bestEver, x, y);
    pause(0.01);
    
end

%% Results

figure;
plot(bestCost, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
