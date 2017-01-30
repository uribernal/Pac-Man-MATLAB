function play(level, map, mute)
% PLAY  Creates the struct game and calls the main loop of the PAC-MAN.
%   level indicates the levele of the game (1 = EASY, 2 = MEDIUM, 3 = HARD)
%   map indicates the size of the maze(1 = short maz, 2 = long maze)
%   mute indicates if there is sound or not
%   PLAY(1,1,1) start playing in (EASY, SHORT, MUTE).
%   PLAY(1,2,1) start playing in (EASY, LONG, MUTE).
%   PLAY(3,2,0) start playing in (HARD, LONG, SOUND).
%
%   See also compute_levels, compute_settings, compute_map, compute_pacman, compute_killer, draw_map, pacman_loop.

    
    %% Compute initial variables of the game.
    pause('on') %Enables pausing
    game.levels = compute_levels(level, map);
    game.pause = 0; %Indicates if game has been paused.
    game.running = 1; %Indicates if game is on/off
    game.collision = 0; %Indicates if ghost catched pac-man
    game.lives = 3; 
    game.n_killers = length(game.levels); %Number of killers (ghosts)
    game.moves = 0; %Indicates the number of moves since last collision
    game.settings = compute_settings(mute);%Configure colors and shapes of the map (SETTINGS of the  game).    
    game.MAP = compute_map(map); %upload map to the game struct.
    
    %% Compute the pacman struct.
    game.pacman = compute_pacman(map, game.settings);
    
    %% Compute the ghosts array.
    killer = compute_killer(map, game.settings);%array of ghosts
    for i=1:game.n_killers
        killer.level = game.levels(i); %set level to each ghost
        game.KILLERS(i) = killer;
    end    
   
    %% Prepare a figure window with specific size   
    game.fig_field = figure('Position', [100, 100, 1049, 895]);
    hold on;
    
    %% Strat Drawing
    draw_map(game); %Drawing the MAZE           
    game = draw_pacman(game); %Draw pacman
    
    for i=1:game.n_killers
        draw_killer(game,i); %Draw all the ghosts
    end
    
    %% Allow data exchange from callback to GUI
    guidata(game.fig_field, game);
    
    %% Start Playing
    init_figure();   %allows user to use keyboard and sets tittle to the figure.  
    pacman_loop(game); % MAIN loop for the game
    
end
