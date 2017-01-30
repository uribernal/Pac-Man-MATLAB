function [Nfood, food, foodMap] = compute_food(M) 
% COMPUTE_FOOD  Creates the map associated to the tiles with food inside. 
%   M is a Matrix of basically 1's and 0's that indicates the ways of the
%   maze.
%
%   NFOOD indicates the total number of tiles with food inside.
%   FOOD indicates the number of groceries eaten by PAC-MAN (it is always 0
%   until the game starts).
%   FOODMAP is a matrix with 1's in those tiles where there is food, and
%   0's where there isn't.

    food = 0;
    Nfood = 0;
    foodMap = zeros(length(M(:,1)),length(M(1,:)));
    for i=1:length(M(1,:))
        for j=1:length(M(:,1))
            if ((M(j,i) == 1) || (M(j,i) ==4))
                Nfood = Nfood +1;
                foodMap(j,i) = 1;
            else
                foodMap(j,i) = 0;
            end
        end
    end
end