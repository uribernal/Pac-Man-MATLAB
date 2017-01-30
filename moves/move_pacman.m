function game = move_pacman(game) 
    
    foodMap = game.MAP.foodMap;
    switch(game.pacman.dir)
        case 'E'
            game = right(game,0);
        case 'W'
            game = left(game,0);
        case 'N'
            game = forward(game,0);
        case 'S'
            game = backward(game,0);
    end
    game = draw_pacman(game); 
    if foodMap(game.pacman.ypos,game.pacman.xpos) == 1
         %% EATING SOUND
        if(game.settings.mute == 0)
            [y,Fs] = audioread('sounds/pacman_chomp.wav');
            sound(y,Fs);
        end
        %%
        game.MAP.foodMap(game.pacman.ypos,game.pacman.xpos) = 0;
        game.MAP.food = game.MAP.food +1;
    end
    if (game.MAP.food == game.MAP.n_food)
        game.running = 0;
        disp('LEVEL COMPLETE');
    end
    guidata(game.fig_field, game);
end