function [y , z] = butterfly_2370(x)
    %    ^^^^^   ^^^^^^^^^^^^^^ ^
    %    |       |              |
    %    |       |              The function has one argument called "x".
    %    |       |
    %    |       The function's name is "butterfly_2370".
    %    |
    %    The function returns two values, "y" and "z".
    %
    % This function is always supposed to return two values:
    %     the first value is the argument plus 2370
    %     the second value is the argument minus 2370

    y = 2370 + x ; 
    z = x - 2370 ;
  
end
