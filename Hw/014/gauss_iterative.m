function [ m ] = gauss_iterative( n )
    if ~isnumeric(n)
        error('gauss_iterative:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('gauss_iterative:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('gauss_iterative:integer', 'gauss_iterative:integer')
    elseif n < 0
        error('gauss_iterative:natural', 'gauss_iterative:natural')
    elseif n == 0
        error('gauss_iterative:natural', 'Argument must be positive.')
    else
        m=0;
        for i=1:n
            m = m + i;
        end
    end
end

