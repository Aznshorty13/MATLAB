function d = gcd_recursive(x, y)
    if x < 0
        error('gcd:nonnegative', 'gcd:nonnegative')
    elseif x ~= floor(x)
        error('gcd:integer', 'gcd:integer')
    elseif y < 0
        error('gcd:nonnegative', 'gcd:nonnegative')
    elseif y ~= floor(y)
        error('gcd:integer', 'gcd:integer')
    elseif x == 0
        if y == 0
            error('gcd:domain', 'gcd:domain')
        else
            d=y;
        end
    elseif y == 0
        if x == 0
            error('gcd:domain', 'gcd:domain')
        else
            d=x;
        end
    elseif mod(x,y)== 0
        d=y;
    else
        r = x-floor(x/y)*y;
        d = gcd_recursive(y,r);
    end
end

