% You don't need to understand this file yet.
function x = test_cases
    x = functiontests(localfunctions);
end

function test_eval(t) 
    expected = 'boat';
    actual = banana(0);
    verifyEqual(t, actual, expected)
end

