Case
====

On the right of an integer vector of length n, turns the vector v into an n-ary function that for each i-th argument selects its v\[i\]-th element. All arguments must be of the same length or scalar. Scalar arguments treated as infinitely repeated values.

    q)0 1 2'[1 2 3;10 20 30;100]
    1 20 100
