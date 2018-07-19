function x = referee(n, k, p1, p2, watch)
    p = {p1, p2};
    i = 0;
    choices = 1 : k;
    while 1
        x = i + 1;
        m = p{x}(n, k);
        if watch
           fprintf(1, '%d: player %d removes %d\n', n, x, m);
        end
        if sum(m == choices) ~= 1
            error('referee:illegal_choice', 'Illegal choice.');
        elseif m > n
            error('referee:too_many', 'Too many.');
        end
        n = n - m;
        if n == 0
            break
        end
        i = 1 - i;
    end
    if watch
        fprintf(1, 'player %d wins\n', x);
    end
end
