
function x = test_cases
    x = functiontests(localfunctions);
end

function test_hole(t)
    syms x;
    for i = 1 : 5
        p = cumsum(randi([1, 5], 1, 3));

        a = p(1);
        b = p(2);
        c = p(3);

        k = randi([2, 5]);
        l = k + randi([2, 5]);

        n(x) = (x - a)^l*(x - b); %#ok
        d(x) = (x - a)^k*(x - c); %#ok

        actual = hole_or_va(n, d, a);
        expected = 'hole';
        verifyEqual(t, actual, expected);
    end
end

function test_va(t)
    syms x;
    for i = 1 : 5
        p = cumsum(randi([1, 5], 1, 3));

        a = p(1);
        b = p(2);
        c = p(3);

        k = randi([2, 5]);
        l = k + randi([2, 5]);

        n(x) = (x - a)^k*(x - b); %#ok
        d(x) = (x - a)^l*(x - c); %#ok

        actual = hole_or_va(n, d, a);
        expected = 'va';
        verifyEqual(t, actual, expected);
    end
end

function test_regular(t)
    syms x;
    for i = 1 : 5
        p = cumsum(randi([1, 5], 1, 3));

        a = p(1);
        b = p(2);
        c = p(3);

        k = randi([2, 5]);
        l = k + randi([2, 5]);

        n(x) = (x - a)^k*(x - b); %#ok
        d(x) = (x - a)^l*(x - c); %#ok

        actual = hole_or_va(n, d, c + 10);
        expected = 'regular';
        verifyEqual(t, actual, expected);

        actual = hole_or_va(n, d, b);
        expected = 'regular';
        verifyEqual(t, actual, expected);
    end
end

