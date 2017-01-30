function game = delete_killer(game,k)
% DELETE_KILLER  fills the killer with the color of the background.
%   It checks if there is food in the tile in order to plot it.
%
   [xp,yp] = ghost(game.KILLERS(k).xp, game.KILLERS(k).yp,game.settings.PacmanRadius);
   game.fig_field = fill(xp, yp, game.settings.Background0Color, 'EdgeColor',game.settings.Background1Color);
   if (game.MAP.foodMap(game.KILLERS(k).ypos,game.KILLERS(k).xpos)==1)
       plot(game.KILLERS(k).xp,game.KILLERS(k).yp,game.settings.FoodShapeAndColor);
   end
end
