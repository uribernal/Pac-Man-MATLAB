function draw_map(game)    
% DRAW_MAP plots the tiles of the maze. The colors depend on the settings struct inside the input game. 
%
%   View image-help in images(help)/draw_map.

    C = game.settings.SquareDimension;
    M = game.MAP.M;
    init_x = 0;    
    init_y = 0 + C*length(M(:,1)) +C;    
    hold on;
    for i=1:length(M(1,:))
        for j=1:length(M(:,1))

            x1=[(init_x +(i-1)*C), (init_x +(i-1)*C +C), (init_x +(i-1)*C +C), (init_x +(i-1)*C)]; 
            y1=[(init_y-(j-1)*C),(init_y-(j-1)*C), (init_y-(j-1)*C -C),(init_y-(j-1)*C -C)];

            if (M(j,i) == 1 || M(j,i) == 4) 
                fill(x1,y1,game.settings.Background1Color);
                plot(sum(x1)/4, sum(y1)/4, game.settings.FoodShapeAndColor);
            elseif (M(j,i) == 0) 
                fill(x1, y1, game.settings.Background0Color);
            elseif (M(j,i) == 2) 
                fill(x1,y1,game.settings.PacmanStartPositionColor); 
            else
                fill(x1,y1,game.settings.KillerStartPositionColor); 
            end

            if ((M(j,i) == 1) || (M(j,i) ==3)|| (M(j,i) ==2))           
                if (M(j,i +1) ==0)
                    plot([x1(2),x1(3)],[y1(2),y1(3)],game.settings.BackgroundLineColor,'LineWidth',3);
                end
                if (M(j,i -1) ==0)
                    plot([x1(1),x1(4)],[y1(1),y1(4)],game.settings.BackgroundLineColor,'LineWidth',1);
                end
                if (M(j +1,i) ==0)
                    plot([x1(3),x1(4)],[y1(3),y1(4)],game.settings.BackgroundLineColor,'LineWidth',3);
                end
                if (M(j-1,i) ==0)
                    plot([x1(1),x1(2)],[y1(1),y1(2)],game.settings.BackgroundLineColor,'LineWidth',1);
                end
            elseif (M(j,i) == 4)   
                plot([x1(3),x1(4)],[y1(3),y1(4)],game.settings.BackgroundLineColor,'LineWidth',3);
                plot([x1(1),x1(2)],[y1(1),y1(2)],game.settings.BackgroundLineColor,'LineWidth',1);
            end

        end
    axis off
    end
end