function MAP = compute_graph(MAP) 
% COMPUTE_GAPH  Creates the graph associated with the maze M. 
%   M is a Matrix of basically 1's and 0's that indicates the ways of the
%   maze.
%
%   See also compute_movements, compute_POS.

    M = MAP.M;
    C = compute_movements(M);
    POS = compute_POS(M);
    A = zeros(max(max(POS)),max(max(POS)));
    for j = 1:length(M(:,1))
        for i = 1:length(M(1,:))
            num = POS(j,i);
            s = cell2mat(C(j,i));
            if (s ~= '0')
                camins = strsplit(cell2mat(C(j,i)),',');
                for k =1:length(camins)
                    if camins{k}~='0'
                        switch (camins{k})
                            case 'l'
                                xpos = i-1;
                                ypos= j;
                                n = POS(ypos,xpos);
                            case 'r'
                                xpos = i+1;
                                ypos= j;  
                                n = POS(ypos,xpos);
                            case 'u'
                                xpos = i;
                                ypos= j-1;
                                n = POS(ypos,xpos);
                            case 'd'
                                xpos = i;
                                ypos= j+1;
                                n = POS(ypos,xpos);
                        end
                        A(num, n) = n;
                        A(n, num) = n;
                    end
                end           
            end
        end
        node_names = {1,max(max(POS))};
        for i=1:max(max(POS))
            node_names{i} = int2str(i);
        end
        MAP.movements = C;
        MAP.POS = POS;
        MAP.Graph = graph(A,node_names);
    end
end