function [xp, yp] =circle(x,y,r)
    ang=0:0.01:2*pi; 
    xp=x + r*cos(ang);
    yp=y + r*sin(ang);
end