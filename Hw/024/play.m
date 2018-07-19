function y = play(a, b, f)

    n = length(a); % Finding Length of a

    right = zeros(1,n);
    for i=1:n
        right(i) = 0;   % Making a zero vector of lenth n
    end
    
    h = zeros(1,n);
    for i=1:n
        h(i,1) = a(i);     % Redefine things using cartesian cross product and intervals
        h(i,2) = b(i);
    end
    
    m = zeros(1,n);
    for i=1:1000
        for j=1:n
            m(j)= floor((h(j,1)+ h(j,2))/2); % Midpoint of each interval
        end
        o = f(m);
        
        if o == right
            break   % Break if Correct Guess
        else
            for k= 1 : n
                if o(k)== 1
                    h(k,2)= m(k)-1; % Redefining Intervals accordingly
                end
            end
            
            for l=1:n
                if o(l)== -1
                    h(l,1)= m(l)+1; % Redefining Intervals accordingly
                end
            end
        end
    end
    y=m; % Geuss is now corect
end

