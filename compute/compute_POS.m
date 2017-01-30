function POS = compute_POS(M) 
% COMPUTE_POS  sets an ID to each tile in the map. 
%   M is a Matrix of basically 1's and 0's that indicates the ways of the
%   maze.
%
%   View image-help in images(help)/compute_POS.

    cont = 1;
    POS = zeros(length(M(:,1)),length(M(1,:)));
    for j =1:length(M(:,1))
        for i = 1:length(M(1,:))
            if(M(j,i) ~=0)
                POS(j,i) = cont;
                cont = cont+1;
            else
                POS(j,i) = 0;
            end
        end
    end
end