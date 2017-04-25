Precision of floats is a tricky issue since floats (doubles in other languages) are actually binary rational approximations to real numbers. Whenever you are concerned with precision, set `\P 0` before doing anything else, so that you can see what’s really going on.

Due to the finite accuracy of the binary representation of floating-point numbers, the last decimal digit of a float is not reliable. This is not peculiar to q.
```q
q)\P 0
q)1%3
0.33333333333333331
```
Efficient algorithms for complex calculations such as log and sine introduce imprecision. Moreover, even basic calculations raise issues of rounding. The IEEE floating-point spec addresses many such issues, but the topic is complex.

Q takes this into account in its implementation of the equality operator `=`, which should actually be read as “tolerantly equal.” Roughly speaking, this means that the difference is relatively small compared to some acceptable representation error. This makes the following hold:
```q
q)r7:1%7
q)sum 7#r7
0.99999999999999978
q)1.0=sum 7#r7
1b
```
Only zero is tolerantly equal to zero and you can test any two numbers for intolerant equality with `0=x-y`. Thus, we find:
```
q)0=1.0-sum 7#r7
0b
``
The following example appears inconsistent with this:
```q
q)r3:1%3
q)1=r3+r3+r3
1b
q)0=1-r3+r3+r3
1b
```
It is not. The quantity `r3+r3+r3` is exactly 1.0. This is part of the IEEE spec, not q, and seems to be related to rounding conventions for binary floating point operations.

Only the `=` operator uses tolerant equality semantics. Other primitives do not:
```q
q)96.100000000000009 = 96.099999999999994
1b
q)0=96.100000000000009-96.099999999999994
0b
q)deltas 96.100000000000009 96.099999999999994
96.100000000000009 -1.4210854715202004e-014
q)differ 96.100000000000009 96.099999999999994
10b
q)96.100000000000009 96.099999999999994 ? 96.099999999999994
1
q)group 96.100000000000009 96.099999999999994
96.100000000000009| 0
96.099999999999994| 1
```

!!! note "Not transitive"
    Tolerant equality does not obey transitivity:
    ```q
    q)a:96.099999999999994
    q)b:96.10000000001
    q)c:96.10000000002
    q)a
    96.099999999999994
    q)b
    96.100000000009999
    q)c
    96.100000000020003
    q)a=b
    1b
    q)b=c
    1b
    q)a=c
    0b
    ```

The moral of this story is that we should think of floats as being “fuzzy” real values and never use them as keys or where precise equality is required – e.g., in `group` or `?`.

For those interested in investigating these issues in depth, we recommend the excellent exposition by David Goldberg [What Every Computer Scientist Should Know about Floating Point Arithmetic.](http://docs.sun.com/source/806-3568/ncg_goldberg.html)


## Q SIMD sum

The l64 builds of q now have a faster SIMD [`sum`](/ref/arith-integer/#sum) implementation using SSE. With the above paragraph in mind, it is easy to see why the results of the older and newer implementation may not match.

Consider the task of calculating the sum of `1e-10*til 10000000`.

The SIMD code is equivalent to the following (`\P 0`):
```q
q){x+y}over{x+y}over 0N 8#1e-10*til 10000000
4999.9995000000017
```
While the older, “direct” code yields:
```q
q){x+y}over 1e-10*til 10000000
4999.9994999999635
```
The observed difference is due to the fact that the order of addition is different, and floating-point addition is not associative.

Worth noting is that the left-to-right order is not in some way “more correct” than others, seeing as even reversing the order of the elements yields different results:
```q
q){x+y}over reverse 1e-10*til 10000000
4999.9995000000026
```
If you need to sum numbers with most precision, you can look into implementing a suitable algorithm, like the ones discussed in [Accurate floating point summation](http://www.cs.berkeley.edu/~demmel/AccurateSummation.pdf) by Demmel et al.

<i class="fa fa-hand-o-right"></i> [Comparison Tolerance](comparison-olerance)
