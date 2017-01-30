function levels = compute_levels(level, map)
% COMPUTE_LEVELS  Define how many ghost and which level they are.
%   Depending on the map -> multiple ghosts or not.
%   Depending on the level -> different ghosts levels.
%
    switch(level) %Setting levels of the ghosts depending on the map
    case(1) %EASY MODE
        if map ==1
            levels = 1; %1 ghost -> EASY
        else
            levels = [1, 1]; %2 ghost -> EASY
        end
    case(2) %MEDIUM MODE
        if map ==1
            levels = 2; %1 ghost -> MEDIUM
        else
            levels = [1, 2, 2, 1]; %2 ghost -> MEDIUM, 2 ghost -> EASY
        end
    case(3) %HARD MODE
        if map ==1
            levels = 3; %1 ghost -> HARD
        else
            levels = [3, 3, 2, 1]; %2 ghost 2 ghost -> HARD, 1 ghost -> EASY, 1 ghost -> MEDIUM
        end
    end
end