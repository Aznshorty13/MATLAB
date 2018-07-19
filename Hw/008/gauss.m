function m = gauss(n)

    % == tests for equivalence
    % ~= is the negation of ==

    if ~isnumeric(n)
        error('gauss:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('gauss:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('gauss:integer', 'Argument must be an integer.')
    elseif n < 0
        error('gauss:positive', 'Argument must be non-negative.')
    elseif n == 0
        error('gauss:positive', 'Argument must be positive.')
    end
    
    if n == 1
        m = 1;
    else
        m = n + gauss(n - 1);
    end
end
