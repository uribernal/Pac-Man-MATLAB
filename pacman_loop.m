function pacman_loop(game)
% PACMAN_LOOP  This function moves the pacman depending on its direction (controlled by the user).
%   It also moves the ghosts depending on its difficulty   
%
%   See also move_pacman, move_easy, move_medium, move_hard.

    if(game.settings.mute == 0)
        %% INITIAL SOUND
        [y,Fs] = audioread('sounds/pacman_beginning.wav');
        sound(y,Fs);
    end
    moves_wait = [0, 10, 20, 30]; %Ghosts start chasing at different moments
    
    %% Initial display
    disp(strcat('Lives = ', num2str(game.lives)));
    disp('3...');
    pause(1.33);  
    disp('2...');
    pause(1.33); 
    disp('1...');
    pause(1.33); 
    disp('GO!');
    
    %% The main loop  
	while game.running
        %% Actualize 
        game = guidata(game.fig_field);

        %% MOVE THE PAC-MAN
        game = move_pacman(game);
        game.moves = game.moves+1;

        %% MOVE THE GHOSTS
        for i=1:game.n_killers
            if (game.moves>moves_wait(i)) 
                switch(game.KILLERS(i).level) %Each ghost has a level assigned.
                    case 1 %EASY
                        game = move_easy(game,i); 
                    case 2 %MEDIUM
                        game = move_medium(game,i); 
                    case 3 %HARD
                        game = move_hard2(game,i); 
                end
            end
        end

        %% Check collision
        if game.collision == 1
            %% DEATH SOUND
            if(game.settings.mute == 0)
                [y,Fs] = audioread('sounds/pacman_death.wav');
                sound(y,Fs);
            end

            game.lives = game.lives -1;
            game.moves = 0;
            if game.lives == 0
                game.running = 0;
                %% GAME OVER SOUND
                if(game.settings.mute == 0)
                    [y,Fs] = audioread('sounds/pacman_death.wav');
                    sound(y,Fs);
                end
                disp('GAME OVER')
                break;
            else
                game.collision = 0;
                disp(strcat('Lives = ', num2str(game.lives)));
                game = move_scatter(game);
                disp('3...');
                pause(0.2);  
                disp('2...');
                pause(0.2); 
                disp('1...');
                pause(0.2); 
                disp('GO!');
            end
        end
        
        %% Actualize
        guidata(game.fig_field, game);
        pause(0.3);  %defines the velocity of the game
        percent = game.MAP.food/game.MAP.n_food;
        title(strcat('mypacman v1.0 (', num2str(percent*100), ' %)'));
	end
    
    %% WINNING SOUND
    if (game.collision == 0) && (game.settings.mute == 0)
        [y,Fs] = audioread('sounds/pacman_ringtone_interlude.mp3');
        sound(y,Fs);
    end
    
    %% Display score
    disp(strcat('score: ', num2str(game.MAP.food)))
    close 
end