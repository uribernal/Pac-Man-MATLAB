function killer = compute_killer(map, settings)
% COMPUTE_KILLER  Define how many ghost and which level they are.
%   Depending on the map -> multiple ghosts or not.
%   Depending on the level -> different ghosts levels.
%
    killer.isPacman = 0;

    switch(map)
    case(1) %SHORT MAZE
        %% Setting ghosts' start position.
        killer.xp = 8.5*settings.SquareDimension;  
        killer.yp = 2.5*settings.SquareDimension;
        killer.xpos = 9;
        killer.ypos = 6;
        killer.startPos = 30;
        killer.lastPOS = killer.startPos;
        
    case(2)%LONG MAZE   
       %% Setting ghosts' start position.
        killer.xp = 8.5*settings.SquareDimension;  
        killer.yp = 12.5*settings.SquareDimension;
        killer.xpos = 9;
        killer.ypos = 11;
        killer.startPos = 90;
        killer.lastPOS = killer.startPos;
    end 
end