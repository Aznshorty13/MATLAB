function [ m] = gauss_formula( n )
    if ~isnumeric(n)
        error('gauss_formula:numeric', 'Argument must be numeric.')
    elseif ~isscalar(n)
        error('gauss_formula:scalar', 'Argument must be a scalar.')
    elseif n ~= floor(n)
        error('gauss_formula:integer', 'gauss_iterative:integer')
    elseif n < 0
        error('gauss_formula:natural', 'gauss_iterative:natural')
    elseif n == 0
        error('gauss_formula:natural', 'Argument must be positive.')
    end
    m =n*(n+1)/2;
end

