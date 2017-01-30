function game = move_hard2(game,k)
    
    G = game.MAP.Graph;
    POS = game.MAP.POS;
    possible_ways = neighbors(G, POS(game.KILLERS(k).ypos,game.KILLERS(k).xpos));
    ways = length(possible_ways);
       
    if ways == 1
        move = possible_ways;
    elseif ways == 2
        if game.KILLERS(k).lastPOS == possible_ways(1)
            move = possible_ways(2);
        else
            move = possible_ways(1);
        end
    else
        possible_ways(possible_ways==game.KILLERS(k).lastPOS)=[]; %Delete previous position
        move = move_with_prob(game, possible_ways, 0.9, k);
    end
    game.KILLERS(k).lastPOS = POS(game.KILLERS(k).ypos,game.KILLERS(k).xpos);

    [b,a] = find(POS == move);
    if (game.KILLERS(k).ypos<b)
        game = backward(game,k);
    elseif (game.KILLERS(k).ypos>b)
        game = forward(game,k);
    elseif (game.KILLERS(k).xpos<a)
        game = right(game,k);
    elseif (game.KILLERS(k).xpos>a)
        game = left(game,k);
    end
    
    if((game.KILLERS(k).xpos == game.pacman.xpos)&&(game.KILLERS(k).ypos == game.pacman.ypos))
    	game.collision = 1;
    else
        if game.collision == 0
            game = draw_killer(game, k);
        end
    end 
end