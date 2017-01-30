function movements = compute_movements(M) 
% COMPUTE_MOVEMENTS  Creates a matrix that indicates the possible moves in each tile. 
%   The possible movements are right, left, up, down.
%   M is a Matrix of basically 1's and 0's that indicates the ways of the
%   maze.

movements = cell(size(M));
for i=1:length(M(1,:))
    for j=1:length(M(:,1))
        if (M(j,i) ~= 0)&&(M(j,i) ~= 4)
            cont = 0;
            str = '';
            if  M(j+1,i) ~= 0
                cont = 1;
                str = 'd';          
            end
            if  M(j-1,i) ~= 0
               if(cont>0)
               	str = strcat(str, ',');
               end
               str = strcat(str, 'u');
               cont = 1;
            end
            if  M(j,i-1) ~= 0
               if(cont>0)
               	str = strcat(str, ',');
               end
               str = strcat(str, 'l');
               cont = 1;
            end
            if  M(j,i+1) ~= 0
               if(cont>0)
                str = strcat(str, ',');
               end
               str = strcat(str, 'r');
            end
            movements{j,i} = str;
        else
            movements{j,i} = '0';
        end
    end
end
end