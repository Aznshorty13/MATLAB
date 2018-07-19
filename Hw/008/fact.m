function m = fact(n)

    % == tests for equivalence
    % ~= is the negation of ==

    if ~isnumeric(n)
        error('fact:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('fact:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('fact:integer', 'Argument must be an integer.')
    elseif n < 0
        error('fact:nonnegative', 'Argument must be non-negative.')
    end
    
    if n == 0
        m = 1;
    else
        m = n*fact(n - 1);
    end
end
