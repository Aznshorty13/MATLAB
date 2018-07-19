
function x = test_cases
    x = functiontests(localfunctions);
end

function test_domain(t)
    for i = 1 : 10
        x = randi(100);
        verifyError(t, @() divmod(x, 0), 'divmod:positive');
    end

    for i = 1 : 10
        x = -randi(100);
        y = randi(100);
        verifyError(t, @() divmod(x, y), 'divmod:nonnegative');
        verifyError(t, @() divmod(y, x), 'divmod:positive');
    end

    for i = 1 : 10
        x = randi(100) + 0.1 + rand()*0.8;
        y = randi(100);
        verifyError(t, @() divmod(x, y), 'divmod:integer');
        verifyError(t, @() divmod(y, x), 'divmod:integer');
    end
end

function test_x_lt_y(t)
    for i = 1 : 100
        x = randi(30);
        y = x + randi(100);
        [q1, r1] = divmod_key(x, y);
        [q2, r2] = divmod(x, y);
        verifyEqual(t, [q2, r2], [q1, r1]);
    end
end

function test_x_gt_y(t)
    for i = 1 : 100
        y = randi(30);
        x = y + randi(100);
        [q1, r1] = divmod_key(x, y);
        [q2, r2] = divmod(x, y);
        verifyEqual(t, [q2, r2], [q1, r1]);
    end
end

function test_x_eq_ky(t)
    for i = 1 : 100
        y = randi(30);
        x = y*randi(100);
        [q1, r1] = divmod_key(x, y);
        [q2, r2] = divmod(x, y);
        verifyEqual(t, [q2, r2], [q1, r1]);
    end
end

function test_seq(t)
    for i = 1 : 10
        y = randi(30);
        x = y*randi(100);
        for j = 0 : y
            xj = x + j;
            [q1, r1] = divmod_key(xj, y);
            [q2, r2] = divmod(xj, y);
            verifyEqual(t, [q2, r2], [q1, r1]);
        end
    end
end

function test_large(t)
    for i = 1 : 4
        y = randi(100);
        x = randi([10^10, 2*10^10]);
        [q1, r1] = divmod_key(x, y);
        [q2, r2] = divmod(x, y);
        verifyEqual(t, [q2, r2], [q1, r1]);
    end
end

