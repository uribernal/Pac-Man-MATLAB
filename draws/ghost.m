function [X, Y] =ghost(x,y,r)
% GHOST computes the perimeter coordinates of a ghost. 
%
%   View image-help in images(help)/draw_killer.

    ang=0.01*9:0.01:(pi-0.01*7); 
    ang2=0.1*9:0.1:(10*pi-0.1*7); 
    
    xp =r*cos(ang);
    yp =r*sin(ang);
   
    xx =0.2*cos(ang2);
    xx(1) = yp(1);
    xx(length(xx)) = yp(length(yp));
    
    X = [xp, flip(xp)]+x;
    Y = [yp, xx]+y;
    fill(X,Y,'r')
end