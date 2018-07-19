# Your Task

Your task to implement a function which computes 3-region sign chart, given a polynomial.

1. Create a function with signature `function [zs, ss] = signchart(f)`.
2. The `f` input to `signchart` will be a symbolic polynomial (see below).
3. The `zs` output is a column vector of the unique zeros of the `f`.
4. The `ss` output is a column vector of the signs in regions. For example, if the sign pattern is `--+` then `ss == [-1; -1; 1]`.

Here is an example of how `f` will be constructed.
```
>> syms x
>> f(x) = x^2 + 10*x + 16
 
f(x) =
 
x^2 + 10*x + 16
 
>> f(3)
 
ans =
 
55
 
>> solve(f == 0)
 
ans =
 
 -8
 -2
 
>> 
```

# Hints

## 1

The `solve` will return solutions according to their multiplicity. 
The function `length` will tell you the number of elements in a vector.

## 2

You can see how to use the functions: 
```
>> help solve
>> help length
>> help unique
```

## 3

What if the zeros are very close? How could you make sure you *always* select a point between them?

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
