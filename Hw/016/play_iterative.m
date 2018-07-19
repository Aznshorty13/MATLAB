function y = play_iterative(a, b, f)
    if ~isnumeric(a)
        error('play_iterative:a:integer', 'play:a:integer')
    elseif ~isscalar(a)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('play:a:scalar', 'play:a:scalar')
    elseif a ~= floor(a)
        error('play_iterative:a:integer', 'play:a:integer')
    elseif a < 0
        error('play:a:positive', 'play:a:positive')
    elseif ~isnumeric(b)
        error('play_iterative:b:integer', 'play:b:integer')
    elseif ~isscalar(b)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('play:b:scalar', 'play:b:scalar')
    elseif b ~= floor(b)
        error('play_iterative:b:integer', 'play:b:integer')
    elseif b < 0
        error('play:b:positive', 'play:b:positive')
    end
    
    for i = 1 : 2*log2(b-a)
        c = floor((a+b)/2);
        n = f(c);
        if n == 0
            m = c ;
            break
        elseif n==1
            b = c - 1;
        else
            a = c + 1;
        end
    end
    y=m;
end
