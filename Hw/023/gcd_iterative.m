function d = gcd_iterative(x, y)
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
    else
        for i=1:x
            if mod(x,y)==0
                break
            else
                r = x-floor(x/y)*y;
                x=y;
                y=r;
            end
        end
        d=y;
    end
end

