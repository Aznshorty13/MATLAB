function m = factorial_iterative(n)

    if ~isnumeric(n)
        error('factorial_iterative:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        error('factorial_iterative:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('factorial_iterative:integer', 'Argument must be an integer.')
    elseif n < 0
        error('factorial_iterative:nonnegative', 'Argument must be non-negative.')
    end

    m = 1;
    for i = 2:n
        m = m*i;
    end
end
