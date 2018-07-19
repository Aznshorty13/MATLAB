function [z , w] = swapper(x, y)
    %                    ^^^^
    %                    |
    %                    The function has two arguments: "x" and "y".
    %
    % This function is always supposed to return two values
    % in the opposite order they were passed in.
    z = y;
    w = x;
end
