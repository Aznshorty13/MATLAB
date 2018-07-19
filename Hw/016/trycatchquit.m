% DO NOT edit this file.

diary on;

try
    x = runtests('test_cases.m');
    for i = 1 : length(x)
        if ~x(i).Passed
            me = MException('tests:failure', 'Some tests failed.');
            throw(me)
        end
    end
catch me
    getReport(me)
    quit(42)
end

wallwhine

quit