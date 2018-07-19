% You don't need to understand this file yet.
function x = test_cases
    x = functiontests(localfunctions);
end

function test_fact_eval(t) 
    for i = 1 : 10
        expected = factorial(i);
        actual = fact(i);
        verifyEqual(t, actual, expected)
    end
end

function test_fact_domain(t)
    % Ensure fact will report an error for negative values.
    verifyError(t, @() fact(-10), 'fact:nonnegative');

    % Ensure fact will report an error for non-integers.
    verifyError(t, @() fact(10.5), 'fact:integer');

    % Ensure fact will report an error for non-numeric.
    verifyError(t, @() fact('spam'), 'fact:numeric');

    % Ensure fact will report an error for non-scalar.
    verifyError(t, @() fact([1, 2]), 'fact:scalar');
end

function test_gauss_eval(t) 
    for i = 1 : 100
        expected = sum(1:i);
        actual = gauss(i);
        verifyEqual(t, actual, expected)
    end
end

function test_gauss_domain(t)
    % Ensure error for non-positive values.
    verifyError(t, @() gauss(0), 'gauss:positive');
    verifyError(t, @() gauss(-10), 'gauss:positive');

    % Ensure error for non-integers.
    verifyError(t, @() gauss(10.5), 'gauss:integer');

    % Ensure error for non-numeric.
    verifyError(t, @() gauss('spam'), 'gauss:numeric');

    % Ensure error for non-scalar.
    verifyError(t, @() gauss([1, 2]), 'gauss:scalar');
end

