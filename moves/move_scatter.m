function game = move_scatter(game)

    atHome = zeros(1, game.n_killers);
    while 1
        game = draw_pacman(game); 
        for i=1:game.n_killers
        	[game, atHome(i)] = move_home(game, i);
        end
        if(sum(atHome) == game.n_killers)
            break;
        end
        pause(0.2);
        delete_pacman(game); 
    end
    delete_pacman(game); 
    game = move_home(game, 0);
    game = draw_pacman(game); 
end