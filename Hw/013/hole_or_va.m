function t = hole_or_va(n,d,s)
    syms x

    n2 = double(solve(n==0));
    d2 = double(solve(d==0));

    if sum(d2==s)== 0
        t= 'regular';
    elseif sum(n2==s) >= sum(d2==s)
        t = 'hole';
    elseif  sum(n2==s) < sum(d2 == s)
        t = 'va';
    end
end
