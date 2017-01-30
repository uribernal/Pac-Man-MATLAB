function game = move_hard(game,k)

% hardMove computes the next move for the killer.
    G = game.MAP.Graph;
    POS = game.MAP.POS;
    casella_killer = POS(game.KILLERS(k).ypos, game.KILLERS(k).xpos);
    casella_pacman = POS(game.pacman.ypos, game.pacman.xpos);
    
    path = shortestpath(G,casella_killer,casella_pacman,'Method','unweighted');
    
    if(length(path)>1)
        [b,a] = find(POS == path(2));
        if (game.KILLERS(k).ypos<b)
            game = backward(game,k);
        elseif (game.KILLERS(k).ypos>b)
            game = forward(game,k);
        elseif (game.KILLERS(k).xpos<a)
            game = right(game,k);
        elseif (game.KILLERS(k).xpos>a)
            game = left(game,k);
        end
    end
    
    if((game.KILLERS(k).xpos == game.pacman.xpos)&&(game.KILLERS(k).ypos == game.pacman.ypos))
    	game.collision = 1;
    else
        if game.collision == 0
            game = draw_killer(game, k);
        end
    end 

end