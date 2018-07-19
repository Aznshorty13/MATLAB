# Your Task

Your task is to implement a function which computes the intersection of two real intervals.

1. Create a function with signature `function z = interval_intersect(x, y)`.
2. The `x` input is a row vector of length 2 and represents a closed interval. For example, `x = [3, 8]` represents the closed interval from 3 to 8.
3. The `y` input is the other interval.
4. The `z` output is a row vector of length 2 which represents the intersection. In the case that intersection is empty, `z == []`.

Here is an example of how `f` will be constructed.
```
>> interval_intersect([3, 15], [7, 19])

ans =

     7    15

>> interval_intersect([3, 15], [80, 90])

ans =

     []

>>
```

# Hints

```
>> help min
>> help max
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
