function y = what_day(x,n)
    y = int_to_day(mod(day_to_int(x)+n,7));
end

