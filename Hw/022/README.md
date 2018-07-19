# Your Task

Your task is to implement a function with the following signature.
```matlab
function [q, r] = divmod(x, y)
```

1. Argument `x` is a nonnegative integer.
2. Argument `y` is a positive integer.
3. Outputs `q` and `r` satisfy: `x = q*y + r` with `0 <= r < y`.

Here is the *usual* implementation for this function in Matlab: one using floating point numbers and floor:
```matlab
function [q, r] = divmod(x, y)
    q = floor(x/y);
    r = x - q*y;
end
```

However, this is how your function must be implemented:

1. You must use repeated subtraction.
2. You must use either a loop or recursion.
3. You must not use any other functions or operations, including `rem`, `mod`, `floor` or `/`.

# Example

```
>> [q, r] = divmod(22, 3)

q =

     7


r =

     1

>> 
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
I.e., when there are no errors or warnings.

# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
