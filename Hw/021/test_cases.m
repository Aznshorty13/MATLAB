
function x = test_cases
    x = functiontests(localfunctions);
end

function test_against_play_random(t)
    watch = 0;

    p1 = @(nn, kk) play(nn, kk);
    p2 = @(nn, kk) play_optimal(nn, kk);
    p3 = @(nn, kk) play_random(nn, kk);

    for n = 50 : 10 : 100
        for k = 3 : ceil(n/5)
            i13 = referee(n, k, p1, p3, watch);
            i23 = referee(n, k, p2, p3, watch);
            verifyEqual(t, i13, i23);

            i31 = referee(n, k, p3, p1, watch);
            i32 = referee(n, k, p3, p2, watch);
            verifyEqual(t, i31, i32);
        end
    end
end

function test_against_play_constant(t)
    watch = 0;

    p1 = @(nn, kk) play(nn, kk);
    p2 = @(nn, kk) play_optimal(nn, kk);

    for n = 50 : 10 : 100
        for k = 3 : ceil(n/5)
            for c = 1 : k
                p3 = @(nn, kk) play_constant(nn, kk, c);

                i13 = referee(n, k, p1, p3, watch);
                i23 = referee(n, k, p2, p3, watch);
                verifyEqual(t, i13, i23);

                i31 = referee(n, k, p3, p1, watch);
                i32 = referee(n, k, p3, p2, watch);
                verifyEqual(t, i31, i32);
            end
        end
    end
end

function test_against_play_optimal(t)
    watch = 0;

    p1 = @(nn, kk) play(nn, kk);
    p2 = @(nn, kk) play_optimal(nn, kk);

    for k = 3 : 10
        for i = 5 : 10
            % player 2 wins
            n = i*(k + 1);

            m = referee(n, k, p1, p2, watch);
            verifyEqual(t, m, 2);

            m = referee(n, k, p2, p1, watch);
            verifyEqual(t, m, 2);

            for j = 1 : k
                % player 1 wins
                n = i*(k + 1) + j;

                m = referee(n, k, p1, p2, watch);
                verifyEqual(t, m, 1);

                m = referee(n, k, p2, p1, watch);
                verifyEqual(t, m, 1);
            end
        end
    end
end

