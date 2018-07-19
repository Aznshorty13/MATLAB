% You don't need to understand this file yet.
function x = test_cases
    x = functiontests(localfunctions);
end

function test_2370(test_case) 
    for i = 1 : 100
        x0 = rand();
        y0 = rand();
        [x1, y1] = swapper(x0, y0);
        expected = [y0, x0];
        verifyEqual(test_case, [x1, y1], expected)
    end
end
