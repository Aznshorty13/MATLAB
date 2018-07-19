# Your Task

Your task is to implement a version of the guess-the-number function like you did in `hw/010/play.m` or `hw/016/play_iterative.m`.
This one needs to be named `play_strict.m`.
It can be iterative or recursive.
The difference is that this time the upper-bound on the number of guesses is strict!
You should start out by trying one of your previous implementations -- maybe it already works!

# Hint

```
(A) I'm thinking of a number: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
(B) Is it 5?
(A) Too low!
(B) So it's one of 5, 6, 7, 8, 9, 10?
(A) No it's one of 6, 7, 8, 9, 10 because I already told you 5 was too low.
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
