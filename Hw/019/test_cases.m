
function x = test_cases
    x = functiontests(localfunctions);
end

function test_accuracy(t)

    % Check that the correct number is found.
    for i = 1 : 5
        a = randi(1000, [1, 2]);
        c = a + randi([1000, 2000], [1, 2]);
        b = c + randi([1000, 2000], [1, 2]);

        f = oracle(c);
        d = play_2d(a, b, f);
        verifyEqual(t, d, c);
    end
end

function test_complexity(t)

    % Check that the complexity is approximately log2.
    for i = 1 : 5
        a = randi(1000, [1, 2]);
        c = a + randi([5000, 20000]);
        b = c + randi([5000, 20000]);

        f = oracle(c);
        play_2d(a, b, f);
        k = f('guess-count');
        l = log2(max(b - a));
        l = ceil(l);
        verifyLessThan(t, k, l*2);
    end
end

