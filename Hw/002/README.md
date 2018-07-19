# Your Task

This exercise is your first introduction to a Matlab *function*.

1. A Matlab function *f* is always contained in a file called `f.m`.

2. The distinction between a *function* file and a *script* file is that
function files contain a function definition.

3. For example, here could be the contents of `f.m`.
```matlab
function y = f(x)
    y = x^2
end
```
That is, *f* is a function which accepts one argument *x* and produces one
return value *y*. This is the Matlab way to write the quadratic y = x^2.
You could then invoke *f* from the command line:
```
>> f(3)

ans =

     9

>> 
```

This exercise is about a function we'll call *return_2370*: it takes no arguments
and it supposed to always return 2370.
But it's broken! When you first download this assignment:
```
>> return_2370()

ans =

     0

>> 
```
It's returning 0! Please fix this by editing `return_2370.m`.
You will know it is working when you see:
```
>> return_2370()

ans =

     2370

>> 
```

# Validation Testing

This homework has an validation test script `test.m` (take a look at the contents of that file:
can you see why it is a *script* file and not a *function* file?).
This is the output of the script when you first download this assignment.
```
>> test
Running test_cases

================================================================================
Verification failed in test_cases/test_2370.

    ---------------------
    Framework Diagnostic:
    ---------------------
    verifyEqual failed.
    --> The values are not equal using "isequaln".
    --> Failure table:
                Actual    Expected    Error    RelativeError
                ______    ________    _____    _____________
            
                0         2370        -2370    -1           
    
    Actual double:
             0
    Expected double:
                2370

    ------------------
    Stack Information:
    ------------------
    In test_cases.m (test_2370) at 13
================================================================================
.
Done test_cases
__________

Failure Summary:

     Name                  Failed  Incomplete  Reason(s)
    ===================================================================
     test_cases/test_2370    X                 Failed by verification.
    
>> 
```
The part where it says `Failure Summary:` is a description of the manner in which the validation failed.
When you have correctly edited the `return_2370.m` file, the output of *tests* will look like:
```
>> test
Running test_cases
.
Done test_cases
__________

>> 
```
No more failures!
When this is what you see, it is time to upload your `return_2370.m` file to GitHub!

# Grading

Your work will be graded by the validation test. 
So be sure to check the output of *test*.
