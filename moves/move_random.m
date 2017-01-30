function move = move_random(moves)
% MOVE_RANDOM  decides one move between the arrays moves randomly.
%     

    a = 100*rand();
    inc = 100/length(moves);
    for i=1:length(moves)
        if (a < inc)
            move = moves(i);
            break;
        else
            inc = inc + 100/length(moves);
        end
    end
    
end
