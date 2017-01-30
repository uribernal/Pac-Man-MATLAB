function [xp, yp] =mouth(x,y,r,dir)
% MOUTH  returns the points of the opened mouth (~triangle) depending on the direction of the pacman. 
%
%   View image-help in images(help)/draw_pacman.

    switch(dir)
    	case 'E'
        	ang=-pi/6:0.01:pi/6; 
        case 'W'
        	ang=pi-pi/6:0.01:pi+pi/6; 
        case 'N'
        	ang=pi/2-pi/6:0.01:pi/2+pi/6; 
        case 'S'
            ang=6*pi/4-pi/6:0.01:6*pi/4+pi/6; 
    end
    xp=x + r*cos(ang);
    yp=y + r*sin(ang);
end