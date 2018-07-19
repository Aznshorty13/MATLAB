# Your Task

Your task is to implement two functions.
The first function has signature
```matlab
function i = day_to_int(day)
```
It is the inverse function of `function day = int_to_day(i)`, which has been provided for you.
When you implement `day_to_int` you must use a `switch` statement just like in `int_to_day`.

The second function which you must implement is
```matlab
function y = what_day(x, n)
```
which answers the following kind of question: If today is Monday then what day is 342 days from now?
```
>> what_day('Monday', 342)

ans =

Sunday

>> 
```
It should also work for: If today is Wednesday then what day was 5 days ago?
```
>> what_day('Wednesday', -5)

ans =

Friday

>> 
```
When you implement `what_day`, you must use the `mod` function.
```
>> help mod
```

# Validation Testing

The validation script for this homework is `test.m`.
Your edits will be correct when:

```
>> test
Running test_cases
...
Done test_cases
__________

>> 
```
I.e., when there are no errors.

# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
