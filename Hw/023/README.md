# Your Task

Your task is to implement GCD functions with the following signature.
```matlab
function d = gcd_iterative(x, y)
function d = gcd_recursive(x, y)
```

1. Argument `x` is a nonnegative integer.
2. Argument `y` is a nonnegative integer.

This is how your function must be implemented:

1. The `gcd_iterative` function must be implemented with iteration (a loop).
2. The `gcd_recursive` function must be implemented with recursion.
3. You may use Matlab's builtin `mod` function.
4. You must not use any other builtin functions: e.g., Matlab already has a `gcd` function.

# Example

```
>> gcd_recursive(54, 36)

ans =

    18

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
