Uniform function that reverses the items of its argument.

Example
-------
```q
q)reverse 1 2 3 4
4 3 2 1
q)(|)1 2 3 4
4 3 2 1
```

On atoms, returns the atom; on dictionaries, reverses the keys; and on tables, reverses the columns:

```q
q)d:`a`b!(1 2 3;"xyz")
q)reverse d
b| x y z
a| 1 2 3
q)reverse each d
a| 3 2 1
b| z y x
q)reverse flip d
a b
---
3 z
2 y
1 x
```

See also
--------

-   [rotate](reference/rotate)