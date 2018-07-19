# Your Task

Your task is to implement the optimal strategy for the subtraction game described in lecture.

1. There are `n > 0` objects in a pile.
2. A fixed `k` with `1 < k < n` is chosen.
3. Two players alternate removing `1, 2, 3, ...` or `k` objects from the pile.
4. The player who removes the last object wins.

Write a function with signature
```matlab
function m = play(n, k)
```
which always computes the optimal amount `m` to remove where `n` and `k` are described above.
The `mod` function will be useful.
```
>> help mod
```

# Example

The `referee` function has signature
```matlab
function x = referee(n, k, p1, p2, watch)
```

1. `x` is the player who won: `1` or `2`.
2. `n` and `k` are described above.
3. `p1` and `p2` are function handles to the players.
4. `watch` is a flag that, when true, the state of the game will be printed (useful for debugging).

For example:
```
>> n = 20; k = 3; watch = 1;
>> p1 = @(n, k) play_optimal(n, k);
>> p2 = @(n, k) play_random(n, k);
>> referee(n, k, p1, p2, watch)
20: player 1 removes 3
17: player 2 removes 2
15: player 1 removes 3
12: player 2 removes 3
9: player 1 removes 1
8: player 2 removes 2
6: player 1 removes 2
4: player 2 removes 1
3: player 1 removes 3
player 1 wins

ans =

     1

>> 
```

# p-code

Before Matlab executes your code it actually compiles it to a binary format called p-code.
I wrote the `play_optimal.m` function, but I didn't want you to be able to see the source code
(its you're job to make your own!), so I compiled it to p-code. The contents of `play_optimal.p`
are perfectly intelligible to Matlab, but it won't help you.

One cute way to get the test to pass immediately is to do:
```matlab
function m = play(n, k)
    m = play_optimal(n, k);
end
```
That is, to just call the ready-to-go optimal function! That will pass the test function,
but I read all of your code and you won't receive credit when I see it.

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
