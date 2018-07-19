function f = oracle(n)

    k = 0;

    function y = g(x)
        if strcmp(x, 'guess-count')
            y = k;
        else
            y = sign(x - n);
            k = k + 1;
        end
    end

    f = @(x) g(x);

end
