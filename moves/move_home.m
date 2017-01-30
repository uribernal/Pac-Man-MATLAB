function [game, atHome] = move_home(game, k)
    atHome = false;
    G = game.MAP.Graph;
    POS = game.MAP.POS;
    if k==0
         [b,a] = find(POS == game.pacman.startPos);
         game.pacman.ypos = b;
         game.pacman.xpos = a;
         game.pacman.yp = 6.5*game.settings.SquareDimension;
         game.pacman.xp = (a-0.5)*game.settings.SquareDimension;
    else 
        tile_killer = POS(game.KILLERS(k).ypos, game.KILLERS(k).xpos);
        tile_home = game.KILLERS(k).startPos;
        path = shortestpath(G,tile_killer,tile_home,'Method','unweighted');
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
            game = draw_killer(game, k); 
        else
            atHome = true;
        end
    end
end
