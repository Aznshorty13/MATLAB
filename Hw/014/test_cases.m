
function x = test_cases
    x = functiontests(localfunctions);
end











% Gauss

function test_gauss_iterative_eval(t) 
    for i = 1 : 10
        expected = i*(i + 1)/2;
        actual = gauss_iterative(i);
        verifyEqual(t, actual, expected)
    end
end

function test_gauss_recursive_eval(t) 
    for i = 1 : 10
        expected = i*(i + 1)/2;
        actual = gauss_recursive(i);
        verifyEqual(t, actual, expected)
    end
end

function test_gauss_formula_eval(t) 
    for i = 1 : 10
        expected = i*(i + 1)/2;
        actual = gauss_formula(i);
        verifyEqual(t, actual, expected)
    end
end

function test_gauss_iterative_domain(t)
    % Ensure error for non-natural.
    for i = 1 : 5
        n = randi([-100, -10]);
        verifyError(t, @() gauss_iterative(n), 'gauss_iterative:natural');
    end
    verifyError(t, @() gauss_iterative(0), 'gauss_iterative:natural');

    % Ensure error for non-integers.
    for i = 1 : 5
        n = randi([1, 100]) + rand();
        verifyError(t, @() gauss_iterative(n), 'gauss_iterative:integer');
    end

    % Ensure error for non-numeric.
    verifyError(t, @() gauss_iterative('spam'), 'gauss_iterative:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() gauss_iterative([1, 2]), 'gauss_iterative:scalar');
end

function test_gauss_recursive_domain(t)
    % Ensure error for non-natural.
    for i = 1 : 5
        n = randi([-100, -10]);
        verifyError(t, @() gauss_recursive(n), 'gauss_recursive:natural');
    end
    verifyError(t, @() gauss_recursive(0), 'gauss_recursive:natural');

    % Ensure error for non-integers.
    for i = 1 : 5
        n = randi([1, 100]) + rand();
        verifyError(t, @() gauss_recursive(n), 'gauss_recursive:integer');
    end

    % Ensure error for non-numeric.
    verifyError(t, @() gauss_recursive('spam'), 'gauss_recursive:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() gauss_recursive([1, 2]), 'gauss_recursive:scalar');
end

function test_gauss_formula_domain(t)
    % Ensure error for non-natural.
    for i = 1 : 5
        n = randi([-100, -10]);
        verifyError(t, @() gauss_formula(n), 'gauss_formula:natural');
    end
    verifyError(t, @() gauss_formula(0), 'gauss_formula:natural');

    % Ensure error for non-integers.
    for i = 1 : 5
        n = randi([1, 100]) + rand();
        verifyError(t, @() gauss_formula(n), 'gauss_formula:integer');
    end

    % Ensure error for non-numeric.
    verifyError(t, @() gauss_formula('spam'), 'gauss_formula:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() gauss_formula([1, 2]), 'gauss_formula:scalar');
end









% Factorial

function test_factorial_iterative_eval(t) 
    for i = 1 : 10
        expected = factorial(i);
        actual = factorial_iterative(i);
        verifyEqual(t, actual, expected)
    end
end

function test_factorial_recursive_eval(t) 
    for i = 1 : 10
        expected = factorial(i);
        actual = factorial_recursive(i);
        verifyEqual(t, actual, expected)
    end
end

function test_factorial_iterative_domain(t)
    % Ensure error for negative values.
    for i = 1 : 5
        n = randi([-100, -10]);
        verifyError(t, @() factorial_iterative(n), 'factorial_iterative:nonnegative');
    end

    % Ensure error for non-integers.
    for i = 1 : 5
        n = randi([1, 100]) + rand();
        verifyError(t, @() factorial_iterative(n), 'factorial_iterative:integer');
    end

    % Ensure error for non-numeric.
    verifyError(t, @() factorial_iterative('spam'), 'factorial_iterative:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() factorial_iterative([1, 2]), 'factorial_iterative:scalar');
end

function test_factorial_recursive_domain(t)
    % Ensure error for negative values.
    for i = 1 : 5
        n = randi([-100, -10]);
        verifyError(t, @() factorial_recursive(n), 'factorial_recursive:nonnegative');
    end

    % Ensure error for non-integers.
    for i = 1 : 5
        n = randi([1, 100]) + rand();
        verifyError(t, @() factorial_recursive(n), 'factorial_recursive:integer');
    end

    % Ensure error for non-numeric.
    verifyError(t, @() factorial_recursive('spam'), 'factorial_recursive:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() factorial_recursive([1, 2]), 'factorial_recursive:scalar');
end

