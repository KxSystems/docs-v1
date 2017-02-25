## `inv`

Syntax: `inv x` (unary)

**Matrix inverse**: returns the inverse of non-singular _float_ matrix `x`.
```q
q)a:3 3#2 4 8 3 5 6 0 7 1f
q)inv a
-0.4512195  0.6341463  -0.195122
-0.03658537 0.02439024 0.1463415
0.2560976   -0.1707317 -0.02439024
q)a mmu inv a
1             -2.664535e-15 5.828671e-16
-2.664535e-15 1             -1.19349e-15
3.885781e-16  -4.163336e-16 1
q)1=a mmu inv a
100b
010b
001b
```


`lsq`
-----

Syntax: `x lsq y` (binary)

**Matrix divide**: where: 

- `x` and `y` are _float_ matrices with the same number of columns
- the number of rows of `y` do not exceed the number of columns
- the rows of `y` are linearly independent

returns the least-squares solution of `x = (x lsq y) mmu y`. That is, if
```q
d:x - (x lsq y) mmu y
```
then `sum d*d` is minimized. If `y` is a square matrix, `d` is the zero matrix, up to rounding errors.
```q
q)a:1f+3 4#til 12
q)b:4 4#2 7 -2 5 5 3 6 1 -2 5 2 7 5 0 3 4f
q)a lsq b
-0.1233333 0.16      0.4766667 0.28
0.07666667 0.6933333 0.6766667 0.5466667
0.2766667  1.226667  0.8766667 0.8133333
q)a - (a lsq b) mmu b
-4.440892e-16 2.220446e-16 0             0
0             8.881784e-16 -8.881784e-16 8.881784e-16
0             0            0             1.776357e-15
q)a ~ (a lsq b) mmu b      / tolerant match
1b

q)b:3 4#2 7 -2 5 5 3 6 1 -2 5 2 7f
q)a lsq b
-0.1055556 0.3333333 0.4944444
0.1113757  1.031746  0.7113757
0.3283069  1.730159  0.9283069
q)a - (a lsq b) mmu b     / minimum squared difference
0.5333333 -0.7333333 -0.2       0.7333333
1.04127   -1.431746  -0.3904762 1.431746
1.549206  -2.130159  -0.5809524 2.130159
```

!!! tip "Polynomial fitting"
    `lsq` can be used to approximate `x` and `y` values by polynomials.
    ```q
    lsfit:{(enlist y) lsq x xexp/: til 1+z} / fit y to poly in x with degree z
    poly:{[c;x]sum c*x xexp til count c}    / polynomial with coefficients c
    x:til 6
    y:poly[1 5 -3 2] each x   / cubic
    lsfit[x;y] each 1 2 3     / linear,quadratic,cubic(=exact) fits
    -33 37.6
    7 -22.4 12
    1 5 -3 2
    ```

## `mmu`

Syntax: `x mmu y` (binary)

**Matrix multiply**: returns the matrix product of _float_ matrixes `x` and `y`, which must conform in the usual way, i.e. the columns of `x` must correspond to the rows of `y`.
```q
q)a:2 4#2 4 8 3 5 6 0 7f
q)b:4 3#"f"$til 12
q)a mmu b
87 104 121
81 99  117
q)c:3 3#2 4 8 3 5 6 0 7 1f
q)1=c mmu inv c
100b
010b
001b
```

!!! tip "Parallel lines"
    Use slave threads via `peach`.
    ```q
    q)mmu[;b]peach a
    87 104 121
    81 99  117
    ```

