# Your Task

Your task to is implement a function which determines if a given input to a rational function
will be a *hole*, a *vertical asymptote* or a *regular point*.

1. Create a function with signature `function t = hole_or_va(n, d, s)`.
2. The `n` input is a symbolic polynomial and is the numerator of the rational function.
3. The `d` input is a symbolic polynomial and is the denominator of the rational function.
4. The `s` input is the input to the rational function you are to classify.
5. The `t` output is:
    1. The character string `'hole'` when `s` is a *hole*.
    2. The character string `'va'` when `s` is a *vertical asymptote*.
    3. The character string `'regular'` when `s` is a *regular point*.

For example
```
>> hole_or_va((x - 1)*(x - 3), (x - 3)*(x - 5), 3)

ans =

hole 

>> hole_or_va((x - 1)*(x - 3), (x - 3)*(x - 5), 5)

ans =

va

>> hole_or_va((x - 1)*(x - 3), (x - 3)*(x - 5), 12)

ans =

regular

>>
```

# Hints

## Counting things
```
>> help solve
>> help sum
```
Suppose you had a vector `a` and you wanted to know how many `2`s were present in `a`.
```
>> a = [1 2 2 2 3]

a =

     1     2     2     2     3

>> a == 2

ans =

     0     1     1     1     0

>> sum(a == 2)

ans =

     3
>>
```
There were three `2`s in `a`.

## Symbolic vs Numeric
Be aware that matlab distinguishes between symbolic and numeric variables.
When you use the `solve` function on a symbolic polynomial, matlab will return symbolic solutions.
But to use the counting technique described above, you'll need numeric solutions.
```
>> f(x) = x^2 - 10*x + 16
 
f(x) =
 
x^2 - 10*x + 16
 
>> sol = solve(f == 0)
 
sol =
 
 2
 8
 
>> sol == 2 % This will create a vector of equations, not what we want :(
 
ans =
 
 2 == 2 
 8 == 2
 
>> dsol = double(sol) % This casts the symbolic solutions to numeric solutions.

dsol =

     2
     8

>> dsol == 2

ans =

     1
     0
>> % yay
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
