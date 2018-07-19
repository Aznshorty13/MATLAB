function [q, r] = divmod(x, y)
    if y <= 0
        error('divmod:positive', 'divmod:positive')
    elseif x < 0
        error('divmod:nonnegative', 'divmod:nonnegative')
    elseif floor(x)~= x
        error('divmod:integer', 'divmod:integer')
    elseif floor(y)~= y
        error('divmod:integer', 'divmod:integer')
    end
    
    for i=0:x
        if x < y
            break
        else
            x = x-y ;
        end
    end
    q = i;
    r = x;
end

