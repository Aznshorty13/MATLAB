# Your Task

This exercise is about iteration (i.e., loops) and comparing them to recursion.
The Gauss function is a function from the Naturals `N = {1, 2, 3, ...}` to the Naturals
defined as:
```
gauss(n) = 1 + 2 + 3 + ... + n
```
You implemented a recursive definition of this function in `hw/008`. Besides this, you
probably knew the formula already:
```
1 + 2 + 3 + ... + n = n*(n + 1)/2
```
Your task in this exercise is to implement 3 functions.

1. `function m = gauss_recursive(n)`, which is a recursive implementation of the Gauss function.
You should be able to copy your implementation from `hw/008`, changing its name and error IDs as appropriate.
2. `function m = gauss_iterative(n)`, which is an iterative (loop) implementation of the Gauss function.
3. `function m = gauss_formula(n)`, which uses the formula above to compute the Gauss function.

A generous starting point has been provided to you by giving you analogous iterative and recursive
implementations of the factorial function in `factorial_recursive.m` and `factorial_iterative.m`,
respectively.

# Validation Testing

The validation script for this homework is `test.m`.
Your edits will be correct when:
```
>> test
Running test_cases
....
Done test_cases
__________

>> 
```
I.e., when you see no errors.

## Hint

In order to get all the validation tests to pass, you may
need to look at the file `test_cases.m` to determine the error IDs
the test function is expecting.

# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
