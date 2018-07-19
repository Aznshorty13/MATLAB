
function x = test_cases
    x = functiontests(localfunctions);
end

function test_overlap(t)
    for i = 1 : 5
        a = cumsum(rand(1, 4));

        x = a(1:2:end);
        y = a(2:2:end);
        z = [a(2), a(3)];

        verifyEqual(t, interval_intersect(x, y), z);
        verifyEqual(t, interval_intersect(y, x), z);
    end
end

function test_empty(t)
    for i = 1 : 5
        a = cumsum(rand(1, 4));

        x = a(1:2);
        y = a(3:4);
        z = [];

        verifyEqual(t, interval_intersect(x, y), z);
        verifyEqual(t, interval_intersect(y, x), z);
    end
end

function test_inclusion(t)
    for i = 1 : 5
        a = cumsum(rand(1, 4));

        x = [a(1), a(4)];
        y = a(2:3);
        z = y;

        verifyEqual(t, interval_intersect(x, y), z);
        verifyEqual(t, interval_intersect(y, x), z);
    end
end

