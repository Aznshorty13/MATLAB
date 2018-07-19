# Your Task

Your task to implement a better version of the guess-the-number function in `play.m`.
The current version guesses linearly (It it 1? Is it 2? Is it 3? ...), but it is possible to do better.

Here are the requirements.

1. Your `play` function must be recursive.
2. You must not change the signature of the `play` function.
That is, the declaration of the function must be `function y = play(a, b, f)`.
3. Your `play` function must be able to guess the correct number in approximately logarithm base 2 of the size of the interval.

The `f` argument to `play` will be a function handle constructed by the function in `oracle.m`.
This means you can call `f` like any other function.
`f`'s signature is `function y = f(x)`.
It returns the following values.

1. `f(x) == -1`: Your guess `x` was too low.
2. `f(x) == 0`: Your guess `x` was correct.
3. `f(x) == 1`: Your guess `x` was too high.
4. `f('guess-count') == ` the number of guesses you have tried.
For example,
```
>> f = oracle(2370);
>> f('guess-count')

ans =

     0

>> f(2312)

ans =

    -1

>> f(2451)

ans =

     1

>> f('guess-count')

ans =

     2

>>          
```
The `a` and `b` arguments to play are the lower and upper boundaries of the interval in which the unknown number lies.

# Copy-and-Paste Examples

If you're having difficulty with the `test` script then you can try to focus on these simple examples 
which can be copy/pasted to the console.

```
>> f = oracle(73), y = play(1, 100, f), k = f('guess-count')
>> f = oracle(1), y = play(1, 100, f), k = f('guess-count')
>> f = oracle(100), y = play(1, 100, f), k = f('guess-count')
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

# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
