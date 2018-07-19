function m = play_iterative(a, b, f)
    if ~isnumeric(a)
        error('play_iterative:a:integer', 'play:a:integer')
    elseif ~isscalar(a)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('play:a:scalar', 'play:a:scalar')
    elseif a ~= floor(a)
        error('play_iterative:a:integer', 'play:a:integer')
    elseif a < 0
        error('play:a:positive', 'play:a:positive')
    
   
    
    elseif ~isnumeric(b)
        error('play_iterative:b:integer', 'play:b:integer')
    elseif ~isscalar(b)
        % Scalar as opposed to a vector
        % (we have not discussed vectors yet).
        error('play:b:scalar', 'play:b:scalar')
    elseif b ~= floor(b)
        error('play_iterative:b:integer', 'play:b:integer')
    elseif b < 0
        error('play:b:positive', 'play:b:positive')
    
    end
  
  m = floor((a+b)/2);
    for i = 1 : log(b-a)+5
        n=f(floor(m));
        if n == 0
            m = m;
            break
        elseif n == 1
           m = floor(m - (b-a)/(2^i));
        else 
           m = ceil(m + (b-a)/(2^i));  
       
          
        end
    end
        y=m;
    
end
