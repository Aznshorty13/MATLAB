
function x = test_cases
    x = functiontests(localfunctions);
end

function test_int_to_day(t)
    verifyEqual(t, int_to_day(0), 'Monday');
    verifyEqual(t, int_to_day(1), 'Tuesday');
    verifyEqual(t, int_to_day(2), 'Wednesday');
    verifyEqual(t, int_to_day(3), 'Thursday');
    verifyEqual(t, int_to_day(4), 'Friday');
    verifyEqual(t, int_to_day(5), 'Saturday');
    verifyEqual(t, int_to_day(6), 'Sunday');

    verifyError(t, @() int_to_day(7), 'int_to_day:bad_input');
    verifyError(t, @() int_to_day(-1), 'int_to_day:bad_input');
    verifyError(t, @() int_to_day('meow'), 'int_to_day:bad_input');
end

function test_day_to_int(t)
    verifyEqual(t, day_to_int('Monday'), 0);
    verifyEqual(t, day_to_int('Tuesday'), 1);
    verifyEqual(t, day_to_int('Wednesday'), 2);
    verifyEqual(t, day_to_int('Thursday'), 3);
    verifyEqual(t, day_to_int('Friday'), 4);
    verifyEqual(t, day_to_int('Saturday'), 5);
    verifyEqual(t, day_to_int('Sunday'), 6);

    verifyError(t, @() day_to_int('Frogday'), 'day_to_int:bad_input');
    verifyError(t, @() day_to_int(12), 'day_to_int:bad_input');
    verifyError(t, @() day_to_int('meow'), 'day_to_int:bad_input');
end

function test_what_day(t)
    for i = 0 : 6
        day0 = int_to_day(i);
        for j = i : 6 - i
            day1 = int_to_day(i + j);
            for k = 1 : 10
                n = k*7 + j;
                m = -k*7 + j;
                day2 = what_day(day0, n);
                verifyEqual(t, day2, day1);
                day3 = what_day(day0, m);
                verifyEqual(t, day3, day1);
            end
        end
        for j = 0 : i
            day1 = int_to_day(i - j);
            for k = 1 : 10
                n = k*7 - j;
                m = -k*7 - j;
                day2 = what_day(day0, n);
                verifyEqual(t, day2, day1);
                day3 = what_day(day0, m);
                verifyEqual(t, day3, day1);
            end
        end
    end
end

