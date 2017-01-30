function game = draw_killer(game,k)    
% DRAW_KILLER plots the k ghost in the maze. The colors depend on the settings struct inside the input game. 
%   The game struct contains an array of ghost named KILLERS. k indicates which killer will be drawn.

%   View image-help in images(help)/draw_killer.

    [xp,yp] = ghost(game.KILLERS(k).xp, game.KILLERS(k).yp,game.settings.PacmanRadius);
    game.plot_killer = fill(xp,yp, game.settings.KillerColor(game.KILLERS(k).level),'EdgeColor',game.settings.KillerLineColor);
end