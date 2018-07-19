# Your Task

Your task is to implement a version of the guess-the-number function like you have on other occasions,
except this one:

1. Is played on an n-dimensional board.
2. You must meet strict complexity requirements.

Your function must have the following signature.
```matlab
function y = play(a, b, f)
```
Where:

1. `a` is row vector of length `n` for `n > 0`.
2. `b` is row vector with `length(a) == length(b)`.
3. `f` is the oracle.
4. The unknown point has integer coordinates and is in the rectangle
with lower-left corner `a` and upper-right corner `b`.

# Example

```
>> a = [20, 1, 94]

a =

    20     1    94

>> c = a + [30, 60, 2]

c =

    50    61    96

>> b = c + [100, 200, 300]

b =

   150   261   396

>> f = oracle(c)

f = 

    @(x)g(x)

>> play(a, b, f)

ans =

    50    61    96 % the same as c above

>> 
```

# Hint

Just like the previous versions of this game, you will need to have a loop
body or a recursion. In the 2D version of the game, you may have handled
the two dimensions in two separate cases. But because the dimension is
now arbitrary, you'll need a loop-within-loop structure.
```matlab
for i = 1 : p
    for j = 1 : q
        % do something interesting
    end
end
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
