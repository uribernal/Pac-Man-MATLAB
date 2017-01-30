function settings = compute_settings(mute)
% COMPUTE_SETTINGS Configures colors and shapes of the map 
%   (SETTINGS of the  game).

    settings.mute = mute; %sound on/off
    settings.SquareDimension = 5; %size of each tile
    settings.PacmanColor = 'y';
    settings.PacmanLineColor = 'g';
    settings.KillerColor = ['m','b','r','w']; %Each difficulty is associated to a color
    settings.KillerLineColor = 'c';
    settings.Background0Color = 'k'; %outside tiles
    settings.Background1Color = 'k'; %inside tiles
    settings.BackgroundLineColor = 'b'; %tile's boundaries color
    settings.PacmanStartPositionColor = 'k';
    settings.KillerStartPositionColor = 'k';
    settings.FoodShapeAndColor = '.w'; %color and shape of the food
    settings.PacmanRadius = settings.SquareDimension/3;
    settings.KillerRadius = settings.SquareDimension/3;
end