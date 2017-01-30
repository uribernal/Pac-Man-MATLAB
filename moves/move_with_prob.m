function move = move_with_prob(game, moves, p, k)
% MOVE_WITH_PROB  random move with probability P.
%     
    G = game.MAP.Graph;
    POS = game.MAP.POS;
    casella_killer = POS(game.KILLERS(k).ypos, game.KILLERS(k).xpos);
    casella_pacman = POS(game.pacman.ypos, game.pacman.xpos);
    path = shortestpath(G,casella_killer,casella_pacman,'Method','unweighted'); 
    
    a = 100*rand(); %Random value
    inc = p*100;
    if (a <= inc)
        if(length(path)>1)
            move = path(2); %Optimal move
        else
            move = path(1); %Optimal move
        end
    else
        move = move_random(moves); %Random move
    end

end