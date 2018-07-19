function z = interval_intersect(x , y)
    if x(1)< y(1)
        if x(2) >= y(1)
            z = [max(x(1),y(1)), min(x(2),y(2))];
        else
            z = [];
        end
    elseif x(1) > y(1)
        if y(2) >= x(1)
            z = [max(x(1),y(1)), min(x(2),y(2))];
        else
            z = [];
        end
    else
        z = [max(x(1),y(1)), min(x(2),y(2))];
    end
end