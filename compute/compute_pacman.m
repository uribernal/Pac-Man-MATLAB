function pacman = compute_pacman(map, settings)
% COMPUTE_PACMAN  Computes the initial variables of the pacman struct.
%   Depending on the map -> Change in pacman's initial position.
%

pacman.isPacman = 1; 
pacman.mouth = 1; %indicates if mouth is open/close
pacman.dir='E'; %direction of pacman (north, south, east, west). 

switch(map)
    case(1) %SHORT MAZE
        %Setting Pacman's start position.
        pacman.xp = 1.5*settings.SquareDimension; 
        pacman.yp = 6.5*settings.SquareDimension;
        pacman.xpos = 2;
        pacman.ypos = 2;
        pacman.startPos = 1;

    case(2)%LONG MAZE   
        %Setting Pacman's start position.
        pacman.xp = 9.5*settings.SquareDimension; 
        pacman.yp = 6.5*settings.SquareDimension;
        pacman.xpos = 10;
        pacman.ypos = 17;
        pacman.startPos = 145;
end 
end