function MAP = compute_map(map)
% COMPUTE_MAP  Defines the maze matrix.
%   1's are tiles where pacman and ghosts can move.
%   0's are tiles where pacman and ghosts can not move.
%   2 is for pacman start position.
%   3's is for ghosts start position.
%   4's are for connected tiles (teleports)
%   5's are for tiles without groceries.
%
%   See also compute_food, compute_Graph.

switch(map)
        case(1) %SHORT MAZE
            MAP.M =   [0 0 0 0 0 0 0 0 0 0;
                       0 2 1 1 1 1 1 1 1 0;
                       0 1 0 0 1 0 1 0 1 0;
                       0 1 1 1 1 0 1 0 1 0;
                       0 1 0 0 1 0 1 0 1 0;
                       0 1 1 1 1 1 1 1 3 0;
                       0 0 0 0 0 0 0 0 0 0];
            MAP.HasConnections = 0; %indicates if there are connected tiles in the maze .
            
        case(2)%LONG MAZE   
            MAP.M = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0;
                    0 1 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0;
                    0 1 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0;
                    0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                    0 1 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 1 0;
                    0 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 1 0;
                    0 0 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 0 0;
                    0 0 0 0 1 0 1 1 1 1 1 1 1 0 1 0 0 0 0;
                    0 0 0 0 1 0 1 0 0 5 0 0 1 0 1 0 0 0 0;
                    4 1 1 1 1 0 1 0 3 3 3 0 1 0 1 1 1 1 4;
                    0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0;
                    0 0 0 0 1 0 1 1 1 1 1 1 1 0 1 0 0 0 0;
                    0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0;
                    0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0;
                    0 1 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0;
                    0 1 1 0 1 1 1 1 1 2 1 1 1 1 1 0 1 1 0;
                    0 0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 0;
                    0 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 1 0;
                    0 1 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 1 0;
                    0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

        MAP.HasConnections = 1; %indicates if there are connected tiles in the maze.
        MAP.MapConnections = [1,11,19,11;]; %indicates the connections.
end 
    
[MAP.n_food, MAP.food, MAP.foodMap] = compute_food(MAP.M); %Food information
MAP = compute_graph(MAP); %Graph associated to the MAZE.
    
end