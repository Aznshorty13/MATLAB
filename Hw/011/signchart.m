function [zs ,ss] = signchart(f) 
    if length(unique(solve(f==0)))~=2
        error('signchart:solutions', 'signchart:solutions')
    else
        zs = unique(solve(f == 0));
        ss = [sign(f(zs(1)-1)); sign(f((zs(2)+zs(1))/2)) ; sign(f(zs(2)+1))];
    end
end
