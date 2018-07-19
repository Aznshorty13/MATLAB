function y = play(a, b, f)
    if ~isnumeric(a)
        error('play:a:integer', 'play:a:integer')
    elseif ~isscalar(a)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('play:a:scalar', 'play:a:scalar')
    elseif a ~= floor(a)
        error('play:a:integer', 'play:a:integer')
    elseif a < 0
        error('play:a:positive', 'play:a:positive')
    end
    
    if ~isnumeric(b)
        error('play:b:integer', 'play:b:integer')
    elseif ~isscalar(b)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('play:b:scalar', 'play:b:scalar')
    elseif b ~= floor(b)
        error('play:b:integer', 'play:b:integer')
    elseif b < 0
        error('play:b:positive', 'play:b:positive')
    end
    
    m = floor((a+b)/2);
    n = f(m);
    
    if n == 1
        y = play(a,m-1,f);
    elseif n == -1
        y = play(m+1,b,f);
    else
        y = m;
    end
end
