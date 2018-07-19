# Your Task

This exercise is about conditionals and recursion.
You have been provided with a working version of a recursive
factorial function in the `fact.m` file. Read this file
and the comments within to understand how it works.

Your task is use `fact.m` as a starting place and create a *new* function `gauss`
in file `gauss.m` which accepts a positive integer `n` and returns the sum `1 + 2 + ... + n`.
This sum has to be calculated *recursively* (which means that `gauss` will call itself,
just like `fact` calls itself).
For example
```
>> gauss(5)

ans =

    15

>>
```
There are many shorter, better ways to calculate the sum `1 + 2 + ... + n`.
For example, Matlab can do this without writing any function at all!
Here are the numbers 1 through 5
```
>> 1:5

ans =

     1     2     3     4     5

>> 
```
and here is their sum
```
>> sum(1:5)

ans =

    15

>>
```
But the purpose of this exercise is for to figure out how to write a *recursive* function.
So you won't recieve credit unless you do that.

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
the test function is expecting `gauss` to throw.


# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
