% This file runs tests against your edits.
% You don't need to understand this file yet.

function x = test_cases
    x = functiontests(localfunctions);
end

function test_spam_1(t)
    for i = -100 : -1
        verifyEqual(t, spam(i), 3)
    end
end

function test_spam_2_and_3(t)
    for i = 2000 : 3000
        if i == 2370
            verifyEqual(t, spam(i), 'MATH')
        else
            verifyEqual(t, spam(i), 9)
        end
    end
end

function test_spam_4(t)
    verifyError(t, @() spam(0), 'spam:zero');
end

function test_spam_5(t)
    verifyEqual(t, spam('meow'), 'wuff');
end

function test_spam_6(t)
    verifyEqual(t, spam('spam'), 'eggs');
end

function test_spam_7(t)
    verifyError(t, @() spam('nospam'), 'spam:vikings');
end

function test_spam_8(t)
    verifyEqual(t, spam('2370'), 'OK');
    verifyEqual(t, spam(@() 1), 'OK');
end

