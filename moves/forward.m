function game = forward(game, object) 
    M = game.MAP.M;
    cte = game.settings.SquareDimension;
	if(object == 0)
    	game.pacman.dir = 'N';
    	game = delete_pacman(game);
        yp =  game.pacman.yp +cte;   
     	xpos = game.pacman.xpos;
    	ypos= game.pacman.ypos-1;
        
        if M(ypos,xpos)~=0
            game.pacman.ypos = ypos;
            game.pacman.yp = yp;
        end
    else
        game.KILLERS(object).lastPOS = game.MAP.POS(game.KILLERS(object).ypos,game.KILLERS(object).xpos);
        game = delete_killer(game,object);
        yp =  game.KILLERS(object).yp +cte;   
        xpos = game.KILLERS(object).xpos;
        ypos= game.KILLERS(object).ypos-1;
        
        if M(ypos,xpos)~=0
            game.KILLERS(object).ypos = ypos;
            game.KILLERS(object).yp = yp;
        end
	end
    guidata(game.fig_field, game);
end