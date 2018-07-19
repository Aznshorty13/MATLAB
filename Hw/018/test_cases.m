
function x = test_cases
    x = functiontests(localfunctions);
end

function test_domain(t)

    a = randi(1000);
    b = a + randi([1000, 2000]);
    c = randi([a, b]);
    f = oracle(c);

    % Boundaries must be integers.
    verifyError(t, @() play_strict(a - 0.5, b, f), 'play_strict:a:integer');
    verifyError(t, @() play_strict(a, b + 0.5, f), 'play_strict:b:integer');

end

function test_accuracy(t)

    % Check that the correct number is found.
    for i = 1 : 5
        a = randi(1000);
        b = a + randi([1000, 2000]);
        c = randi([a, b]);
        f = oracle(c);

        d = play_strict(a, b, f);
        verifyEqual(t, d, c);
    end
end

function test_complexity(t)

    % Check that the complexity is approximately log2.
    for i = 1 : 5
        a = randi(1000);
        b = a + randi([5000, 20000]);

        for c = a : b
            f = oracle(c);
            play_strict(a, b, f);
            k = f('guess-count');
            l = log2(b - a);
            l = ceil(l) + 1;
            verifyLessThan(t, k, l);
        end
    end
end

