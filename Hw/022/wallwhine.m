function wallwhine()
    x = what;
    for i = 1 : length(x.m)
        y = checkcode(x.m{i}, '-string');
        if y
            disp(['WARNING: ', x.m{i}, ':']);
            c = strsplit(y, '\n');
            for j = 1 : length(c)
                if ~isempty(c{j})
                    disp(['WARNING: ', '    ', c{j}])
                end
            end
        end
    end
end
