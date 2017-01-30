function show_map(map)
game.settings.Background0Color = 'k';
game.settings.Background1Color = 'k';
game.settings.PacmanStartPositionColor = 'g';
game.settings.KillerStartPositionColor = 'r';
game.settings.BackgroundLineColor = 'b';
switch(map)
    case 1
        B = [0 0 0 0 0 0 0 0 0 0;
            0 2 1 1 1 1 1 1 1 0;
            0 1 0 0 1 0 1 0 1 0;
            0 1 1 1 1 0 1 0 1 0;
            0 1 0 0 1 0 1 0 1 0;
            0 1 1 1 1 1 1 1 3 0;
            0 0 0 0 0 0 0 0 0 0];
        axis([0 10 1 8]);

    case 2
       B = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0;
            0 1 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0;
            0 1 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0;
            0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
            0 1 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 1 0;
            0 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 1 0;
            0 0 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 0 0;
            0 0 0 0 1 0 1 1 1 1 1 1 1 0 1 0 0 0 0;
            0 0 0 0 1 0 1 0 0 5 0 0 1 0 1 0 0 0 0;
            4 1 1 1 1 0 1 0 3 3 3 0 1 0 1 1 1 1 4;
            0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0;
            0 0 0 0 1 0 1 1 1 1 1 1 1 0 1 0 0 0 0;
            0 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0 0 0 0;
            0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0;
            0 1 0 0 1 0 0 0 1 0 1 0 0 0 1 0 0 1 0;
            0 1 1 0 1 1 1 1 1 2 1 1 1 1 1 0 1 1 0;
            0 0 1 0 1 0 1 0 0 0 0 0 1 0 1 0 1 0 0;
            0 1 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 1 0;
            0 1 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 1 0;
            0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
        axis([0 19 1 23]);
end
C = 1;
init_x = 0;    
init_y = 0 + C*length(B(:,1)) +C;    
hold on;
for i=1:length(B(1,:))
    for j=1:length(B(:,1))
        
        x1=[(init_x +(i-1)*C), (init_x +(i-1)*C +C), (init_x +(i-1)*C +C), (init_x +(i-1)*C)]; 
        y1=[(init_y-(j-1)*C),(init_y-(j-1)*C), (init_y-(j-1)*C -C),(init_y-(j-1)*C -C)];
        
        if (B(j,i) == 1 || B(j,i) == 4) 
            fill(x1,y1,game.settings.Background1Color);
        elseif (B(j,i) == 0) 
            fill(x1, y1, game.settings.Background1Color);
        elseif (B(j,i) == 2) 
            fill(x1,y1,game.settings.PacmanStartPositionColor); 
        else
            fill(x1,y1,game.settings.KillerStartPositionColor); 
        end
        
        if ((B(j,i) == 1) || (B(j,i) ==3)|| (B(j,i) ==2))           
        	if (B(j,i +1) ==0)
            	plot([x1(2),x1(3)],[y1(2),y1(3)],game.settings.BackgroundLineColor,'LineWidth',3);
        	end
            if (B(j,i -1) ==0)
            	plot([x1(1),x1(4)],[y1(1),y1(4)],game.settings.BackgroundLineColor,'LineWidth',1);
            end
            if (B(j +1,i) ==0)
            	plot([x1(3),x1(4)],[y1(3),y1(4)],game.settings.BackgroundLineColor,'LineWidth',3);
            end
            if (B(j-1,i) ==0)
            	plot([x1(1),x1(2)],[y1(1),y1(2)],game.settings.BackgroundLineColor,'LineWidth',1);
            end
        elseif (B(j,i) == 4)   
        	plot([x1(3),x1(4)],[y1(3),y1(4)],game.settings.BackgroundLineColor,'LineWidth',3);
            plot([x1(1),x1(2)],[y1(1),y1(2)],game.settings.BackgroundLineColor,'LineWidth',1);
        end
    end
end
end