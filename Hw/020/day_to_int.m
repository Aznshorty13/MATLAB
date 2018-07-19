function i = day_to_int(day)
    switch day
        case 'Monday'
            i = 0;
        case 'Tuesday'
            i = 1;
        case 'Wednesday'
            i = 2;
        case 'Thursday'
            i = 3;
        case 'Friday'
            i =4 ;
        case 'Saturday'
            i = 5;
        case 'Sunday'
            i = 6;
        otherwise
            error('day_to_int:bad_input', 'Bad input.');
    end
end