# Your Task

Your task to implement a recursive Fibonacci function called `fibonacci` in the file `fibonacci.m`.
For example
```
>> fibonacci(7)

ans =

    13

>> 
```
There are few different definitions of the Fibonacci sequence. Here is the one we're using.
```
f_1 = 1
f_2 = 1
f_n = f_{n - 1} + f_{n - 2}
```

# Validation Testing

The validation script for this homework is `test.m`.
Your edits will be correct when:

```
>> test
Running test_cases
.
Done test_cases
__________

>> 
```
## Hint

In order to get all the validation tests to pass, you may
need to look at the file `test_cases.m` to determine the error ids
the test function is expecting your function to throw.

## New Piece

A new piece to this assignment which you are not using directly (yet) is in the validator.
I wrote my own version of `fibonacci.m` (but didn't include it!) and used it to compute
the correct values of `fibonacci(1)` through `fibonacci(30)`. I then stored these in
the file `expected.mat` so that I can test you function against these values.
Try it out!
```
>> load('expected.mat')
>> expected

expected = 

  Columns 1 through 13

    [1]    [1]    [2]    [3]    [5]    [8]    [13]    [21]    [34]    [55]    [89]    [144]    [233]

  Columns 14 through 23

    [377]    [610]    [987]    [1597]    [2584]    [4181]    [6765]    [10946]    [17711]    [28657]

  Columns 24 through 30

    [46368]    [75025]    [121393]    [196418]    [317811]    [514229]    [832040]

>> 
```
# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
