% You don't need to understand this file yet.
function x = test_cases
    x = functiontests(localfunctions);
end

function test_eval(t) 
    % The file 'expected.mat' has correct Fibonacci values.
    % The load('expected.mat') command creates a variable
    % called expected.
    load('expected.mat')
    for i = 1 : 30
        verifyEqual(t, fibonacci(i), expected{i}) %#ok
    end
end

function test_domain(t)
    % Ensure error for non-positive values.
    verifyError(t, @() fibonacci(0), 'fibonacci:positive');
    for i = 1 : 100
        verifyError(t, @() fibonacci(-i), 'fibonacci:positive');
    end

    % Ensure error for non-integers.
    verifyError(t, @() fibonacci(10.5), 'fibonacci:integer');

    % Ensure error for non-numeric.
    verifyError(t, @() fibonacci('spam'), 'fibonacci:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() fibonacci([1, 2]), 'fibonacci:scalar');
end

