# Your Task

Your task is to implement a version of the guess-the-number function like you have on other occasions,
except this one is played on a two-dimensional board.
It can be iterative or recursive.
It needs to have the following signature.
```matlab
function y = play_2d(a, b, f)
```
Where:

1. `a` is row vector of length 2 (e.g., `a = [50, 80]`).
2. `b` is row vector of length 2 (e.g., `b = [436, 993]`).
3. `f` is the oracle.
4. The unknown point has integer coordinates and is in the rectangle
with lower-left corner `a` and upper-right corner `b`.

Here is an example of the oracle function.
```
>> f = oracle([23, 70]);
>> f([50, 60])

ans =

     1    -1

>> 
```
Which means your guess of `[50, 60]` was too high in the first coordinate and too low in the second.

# Hint

You might be surprised how similar the implemenation of `play_2d` is to `play` (the 1d version).
You might find the following useful.
```
>> help all
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
