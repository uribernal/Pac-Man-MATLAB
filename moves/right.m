function [game, bol] = right(game, object) 
    M = game.MAP.M;
    cte = game.settings.SquareDimension;
	if(object == 0)
    	game.pacman.dir = 'E';
    	game = delete_pacman(game);
        xp =  game.pacman.xp +cte;
        xpos = game.pacman.xpos+1;
        ypos= game.pacman.ypos;
        if (game.MAP.HasConnections == 1)
            conn = game.MAP.MapConnections;
            if ((xpos-1 == conn(3))&&(ypos == conn(4)))
                game.pacman.xpos = conn(1);
                game.pacman.ypos = conn(2);
                game.pacman.xp = 2.5;
                game.pacman.yp = 62.5;
            elseif M(ypos,xpos)~=0
                game.pacman.xpos = xpos;
                game.pacman.xp = xp;
                bol = true;
            end
        else
            if M(ypos,xpos)~=0
                game.pacman.xpos = xpos;
                game.pacman.xp = xp;
            end
        end
	else
        game.KILLERS(object).lastPOS = game.MAP.POS(game.KILLERS(object).ypos,game.KILLERS(object).xpos);
        game = delete_killer(game, object);
        xp =  game.KILLERS(object).xp +cte;
        xpos = game.KILLERS(object).xpos+1;
        ypos= game.KILLERS(object).ypos;
        
        if M(ypos,xpos)~=0
            game.KILLERS(object).xpos = xpos;
            game.KILLERS(object).xp = xp;
        end
	end
    guidata(game.fig_field, game);
end