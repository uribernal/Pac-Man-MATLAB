function game = draw_pacman(game)  
% DRAW_PACMAN plots the pacman in the maze. The colors depend on the settings struct inside the input game. 

%   View image-help in images(help)/draw_pacman.

        cte = game.settings.PacmanRadius;
        [xp, yp] =circle(game.pacman.xp,game.pacman.yp,cte);
        fill(xp, yp, game.settings.PacmanColor,'EdgeColor',game.settings.PacmanLineColor);
        a = game.pacman.xp;
        b = game.pacman.yp;
        
        if (game.pacman.mouth == 1)
            game.pacman.mouth = 0;
            [xp1, yp1] = mouth(a,b,cte,game.pacman.dir); 
            fill([a, xp1], [b, yp1], game.settings.Background1Color,'EdgeColor',game.settings.PacmanLineColor);
            plot(xp1, yp1, game.settings.Background1Color);   
        else
            game.pacman.mouth = 1;
            switch(game.pacman.dir)
                case 'E' 
                    xp = a + (cte)*cos(0);
                    yp = b + (cte)*sin(0);
                case 'W'
                    xp = a + (cte)*cos(pi);
                    yp = b + (cte)*sin(pi);
                case 'N'
                    xp = a + (cte)*cos(pi/2);
                    yp = b +(cte)*sin(pi/2);
                case 'S'
                    xp = a + (cte)*cos(-pi/2);
                    yp = b + (cte)*sin(-pi/2);
            end
            game.plot_pacman = plot([a,xp],[b,yp],game.settings.Background0Color);                   
        end
end
    
