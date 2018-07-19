function m = play(n,k)
    if mod(n, k+1) ~=0
        m = mod(n, k+1);
    else
        m = randi([1,min(n,k)]);
    end
end

