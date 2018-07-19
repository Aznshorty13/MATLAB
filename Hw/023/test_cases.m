
function x = test_cases
    x = functiontests(localfunctions);
end

function test_domain(t)
    verifyError(t, @() gcd_iterative(0, 0), 'gcd:domain');
    verifyError(t, @() gcd_recursive(0, 0), 'gcd:domain');

    for i = 1 : 10
        x = -randi(100);
        y = randi(100);
        verifyError(t, @() gcd_iterative(x, y), 'gcd:nonnegative');
        verifyError(t, @() gcd_recursive(x, y), 'gcd:nonnegative');
        verifyError(t, @() gcd_iterative(y, x), 'gcd:nonnegative');
        verifyError(t, @() gcd_recursive(y, x), 'gcd:nonnegative');
    end

    for i = 1 : 10
        x = randi(100) + 0.1 + rand()*0.8;
        y = randi(100);
        verifyError(t, @() gcd_iterative(x, y), 'gcd:integer');
        verifyError(t, @() gcd_recursive(x, y), 'gcd:integer');
    end
end

function test_x_eq_0(t)
    for i = 1 : 20
        x = 0;
        y = randi(100);
        d1 = gcd_key(x, y);
        d2 = gcd_iterative(x, y);
        d3 = gcd_recursive(x, y);
        verifyEqual(t, d2, d1);
        verifyEqual(t, d3, d1);
    end
end

function test_y_eq_0(t)
    for i = 1 : 20
        x = randi(100);
        y = 0;
        d1 = gcd_key(x, y);
        d2 = gcd_iterative(x, y);
        d3 = gcd_recursive(x, y);
        verifyEqual(t, d2, d1);
        verifyEqual(t, d3, d1);
    end
end

function test_medium(t)
    for i = 1 : 20
        x = randi(100);
        y = randi(100);
        d1 = gcd_key(x, y);
        d2 = gcd_iterative(x, y);
        d3 = gcd_recursive(x, y);
        verifyEqual(t, d2, d1);
        verifyEqual(t, d3, d1);
    end
end

function test_large(t)
    for i = 1 : 20
        x = randi([10^6, 10^7]);
        y = randi([10^6, 10^7]);
        d1 = gcd_key(x, y);
        d2 = gcd_iterative(x, y);
        d3 = gcd_recursive(x, y);
        verifyEqual(t, d2, d1);
        verifyEqual(t, d3, d1);
    end
end

