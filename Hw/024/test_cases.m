
function x = test_cases
    x = functiontests(localfunctions);
end

function test_accuracy(t)

    % Check that the correct number is found.
    for n = 1 : 5 : 100
        for i = 1 : 10
            a = randi(1000, [1, n]);
            c = a + randi([1000, 2000], [1, n]);
            b = c + randi([1000, 2000], [1, n]);

            f = oracle(c);
            d = play(a, b, f);
            verifyEqual(t, d, c);
        end
    end
end

function test_complexity(t)

    % Check that the complexity is approximately log2.
    for n = 1 : 5 : 100
        for i = 1 : 10
            a = randi(1000, [1, n]);
            c = a + randi([5000, 20000]);
            b = c + randi([5000, 20000]);

            f = oracle(c);
            play(a, b, f);
            k1 = f('guess-count');

            f = oracle(c);
            play_key(a, b, f);
            k2 = f('guess-count');

            verifyLessThan(t, k1, k2 + 1);
        end
    end
end

