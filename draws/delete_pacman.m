function game = delete_pacman(game)    
% DELETE_PACMAN  fills the killer with the color of the background.
%      
    [xp, yp] =circle(game.pacman.xp,game.pacman.yp,game.settings.PacmanRadius);
    game.plot_pacman = fill(xp, yp, game.settings.Background1Color);

end
