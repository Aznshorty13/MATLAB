function m = fibonacci(n)
    if ~isnumeric(n)
        error('fibonacci:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('fibonacci:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('fibonacci:integer', 'Argument must be an integer.')
    elseif n < 0
        error('fibonacci:positive', 'Argument must be non-negative.')
    end
    
    if n == 1
        m = 1;
    elseif n == 2
        m = 1;
    else
        m = fibonacci(n-1) + fibonacci(n - 2);
    end
end