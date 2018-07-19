function y = play_2d(a, b ,f)

    e = [a(1),b(1)]; % Redefine in terms of Cartesian product
    k = [a(2),b(2)]; % Redefine in terms of Cartesian product
    
    for i = 1:1000
        c0 = floor((e(1)+ e(2))/2); % Midpoint of interval e
        d0 = floor((k(1)+ k(2))/2); % Midpoint of interval k
        
        c1 =[e(1),c0-1]; % The interval used if c0 is to high
        c2 =[c0+1,e(2)]; % The interval used if c0 is to low
        c3 =[c0,c0];     % The interval used if c0 is correct
        
        d1 =[k(1),d0-1]; % The interval used if d0 is to high
        d2 =[d0+1,k(2)]; % The interval used if d0 is to low
        d3 =[d0,d0];     % The interval used if d0 is correct
        
        c = [c0,d0]; % The midpoint of both a and b
        n = f(c);    % Assigning the oracle vaule to a variable
        
        % From here I list all possible cases and iteratively define the play
        % fuctnion just as we have done before. I constructed it to where it
        % would keep going untill n=[0,0], meaning the geuss is correct and it
        % gives y = m = [c0,d0]
        
        % Also in any scenario I redefine e or k, now notice that e and k must
        % then be outside the loop, other wise it would not work.
        
        if isequal(n , [0,0])== 1
            m = c;
            break
        elseif isequal(n , [0,1])== 1
            e = c3;
            k = d1;
        elseif isequal(n , [0,-1])== 1
            e = c3;
            k = d2;
        elseif isequal(n , [1,0])== 1
            e= c1;
            k= d3;
        elseif isequal(n , [1,1])== 1
            e = c1;
            k = d1;
        elseif isequal(n , [1,-1])== 1
            e = c1;
            k = d2;
        elseif isequal(n , [-1,0])== 1
            e = c2;
            k = d3;
        elseif isequal(n , [-1,1])== 1
            e = c2;
            k = d1;
        elseif isequal(n , [-1,-1])== 1
            e = c2;
            k = d2;
        end
    end
    y = m;
end
