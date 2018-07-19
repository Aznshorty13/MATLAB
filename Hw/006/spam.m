function m = spam(n)
    % Finishing authoring this function so that:
    %
    % 1. If n is a negative number then the output is 3.
    %
    % 2. If n is 2370 then the output is 'MATH'.
    %
    % 3. If n is any other positive number then the output is 9.
    %
    % 4. If n is zero then report an error with error id
    %    'spam:zero' and tell the user 'Zero is not allowed.'.
    %
    % 5. If n is 'meow' then the output is 'wuff'.
    %
    % 6. If n is 'spam' then the output is 'eggs'.
    %
    % 7. If n is 'nospam' then the report an error
    %    with id 'spam:vikings' and tell the user
    %    'Spam! Here come the vikings.'.
    %
    % 8. In every other case the output is 'OK'.
    %
    
    % Not everything is numeric.
    % For example, we could have n = 'meow'
    % which is a called a character string,
    % or more commonly, a string. So there are
    % various functions that being with *is*
    % (like isbanana(n) would be true if n was
    % a banana).
    
    if isnumeric(n)
        % If you're in here then n is a numeric.
        if n == 0
            error('spam:zero', 'Zero is not allowed.')
            %     ^^^^^^^^^^^  ^^^^^^^^^^^^^^^^^^^^^^
            %         |                 |
            %         |                 |
            %         |                 |
            % This ---- is the          |
            % called the error id.      |
            %                           |
            % This ----------------------
            % is the message that will printed
            % for the user.
        elseif n < 0
            m = 3;
        elseif n == 2370
            m = 'MATH';
        elseif n > 0
            m = 9;
        end
    elseif ischar(n)
        % If you're in here then n is a string.
        % Strings are not compared with the same
        % <, >, ==, et cetera, which numbers are
        % compared with. Rather, there is whole
        % family of functions that begin with str.
        % For example, strcmp(x, y) returns true
        % if strings x and y are identical.
        if strcmp(n, 'meow')
            m = 'wuff';
        elseif strcmp(n,'spam')
            m = 'eggs';
        elseif strcmp(n,'nospam')
            error('spam:vikings','Spam! Here come the vikings.')
        else
            m = 'OK';
        end
    else
        m = 'OK';
    end
end
