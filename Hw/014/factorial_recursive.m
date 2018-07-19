function m = factorial_recursive(n)

    if ~isnumeric(n)
        error('factorial_recursive:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        error('factorial_recursive:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('factorial_recursive:integer', 'Argument must be an integer.')
    elseif n < 0
        error('factorial_recursive:nonnegative', 'Argument must be non-negative.')
    end

    if n == 0
        m = 1;
    else
        m = n*factorial_recursive(n - 1);
    end
end
