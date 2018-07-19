function m = gauss_recursive(n)

    % == tests for equivalence
    % ~= is the negation of ==

    if ~isnumeric(n)
        error('gauss_recursive:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('gauss_recursive:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('gauss_recursive:integer', 'Argument must be an integer.')
    elseif n < 0
        error('gauss_recursive:natural', 'Argument must be non-negative.')
    elseif n == 0
        error('gauss_recursive:natural', 'Argument must be positive.')
    end

    if n == 1
        m = 1;
    else
        m = n + gauss_recursive(n - 1);
    end
end
