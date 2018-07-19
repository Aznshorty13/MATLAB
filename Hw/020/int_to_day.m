function day = int_to_day(i)
    switch i
        case 0
            day = 'Monday';
        case 1
            day = 'Tuesday';
        case 2
            day = 'Wednesday';
        case 3
            day = 'Thursday';
        case 4
            day = 'Friday';
        case 5
            day = 'Saturday';
        case 6
            day = 'Sunday';
        otherwise
            error('int_to_day:bad_input', 'Bad input.');
    end
end
