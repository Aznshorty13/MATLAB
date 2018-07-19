
function x = test_cases
    x = functiontests(localfunctions);
end

function test_domain(t)

    syms x;

    a = randi([1, 5]);
    b = a + randi([1, 5]);
    c = b + randi([1, 5]);

    f(x) = (x - a)*(x - b)*(x - c);

    % The function passed in should have exactly 2 unique solutions.
    verifyError(t, @() signchart(f), 'signchart:solutions');

end

% All 8 possibilities are below (in groups of 2).

function test_1(t)
    syms x;

    for i = 1 : 5
        aa = randi([1, 5]);
        bb = aa + randi([1, 5]);

        for n = 0 : 2 : 10
            a = aa * 10^(-n);
            b = bb * 10^(-n);
            zs1 = [a; b];

            f(x) = (x - a)*(x - b); %#ok
            [zs0, ss0] = signchart(f);
            ss1 = [1; -1; 1];
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);

            f = -f;
            [zs0, ss0] = signchart(f);
            ss1 = -ss1;
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);
        end
    end
end

function test_2(t)
    syms x;

    for i = 1 : 5
        aa = randi([1, 5]);
        bb = aa + randi([1, 5]);

        for n = 0 : 2 : 10
            a = aa * 10^(-n);
            b = bb * 10^(-n);
            zs1 = [a; b];

            f(x) = (x - a)*(x - b)^2; %#ok
            [zs0, ss0] = signchart(f);
            ss1 = [-1; 1; 1];
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);

            f = -f;
            [zs0, ss0] = signchart(f);
            ss1 = -ss1;
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);
        end
    end
end

function test_3(t)
    syms x;

    for i = 1 : 5
        aa = randi([1, 5]);
        bb = aa + randi([1, 5]);

        for n = 0 : 2 : 10
            a = aa * 10^(-n);
            b = bb * 10^(-n);
            zs1 = [a; b];

            f(x) = (x - a)^2*(x - b); %#ok
            [zs0, ss0] = signchart(f);
            ss1 = [-1; -1; 1];
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);

            f = -f;
            [zs0, ss0] = signchart(f);
            ss1 = -ss1;
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);
        end
    end
end

function test_4(t)
    syms x;

    for i = 1 : 5
        aa = randi([1, 5]);
        bb = aa + randi([1, 5]);

        for n = 0 : 2 : 10
            a = aa * 10^(-n);
            b = bb * 10^(-n);
            zs1 = [a; b];

            f(x) = (x - a)^2*(x - b)^2; %#ok
            [zs0, ss0] = signchart(f);
            ss1 = [1;  1; 1];
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);

            f = -f;
            [zs0, ss0] = signchart(f);
            ss1 = -ss1;
            verifyEqual(t, double(zs0), zs1, 'RelTol', 0.0001);
            verifyEqual(t, double(ss0), ss1, 'RelTol', 0.0001);
        end
    end
end

