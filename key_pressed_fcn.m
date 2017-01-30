function [] = key_pressed_fcn(H, E)  
    game = guidata(H);
   
    if game.running == 1
        switch E.Key
            case 'rightarrow'
                game.pacman.dir = 'E';
                %%game = right(game,0);
%                 game = move_pacman(game);
%                 game = draw_pacman(game); 
            case 'leftarrow'
            	game.pacman.dir = 'W';
                %%game = left(game,0);  
%                 game = move_pacman(game);
%                 game = draw_pacman(game); 
            case 'uparrow'
                game.pacman.dir = 'N';
                %%game = forward(game,0);  
%                 game = move_pacman(game);
%                 game = draw_pacman(game); 
            case 'downarrow'   
                game.pacman.dir = 'S';
                %%game = backward(game,0);
%                 game = move_pacman(game);
%                 game = draw_pacman(game); 
            case 'space'            
                if (game.pause == 0)
                    game.pause = 1;
                    disp('PAUSE');
                    pause
                else
                   game.pause = 0;
                   disp('PLAY');
                end
            case 'escape'        
                game.running = 0;
                game.collision = 1;
                game.lives = 0;
                disp('bye');                 
            otherwise              
        end
        
        guidata(game.fig_field, game);
    end
end
