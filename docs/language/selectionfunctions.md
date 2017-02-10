`except`
--------

Syntax: `x except y` (binary)

Returns all items of list `x` that are not (items of) list or atom `y`.
```q
q)1 2 3 except 2
1 3
q)1 2 3 4 1 3 except 2 3
1 4 1
```


`first`
-------

Syntax: `first x` (unary, aggregate)

Returns the first item of `x`.

Returns an atom from a simple list, and otherwise reduces the level of nesting of a list. Often used with `each` to get the first item of each item of a list, or of each key in a dictionary.
```q
q)first 1 2 3 4 5
1
q)first 42
42
q)RaggedArray:(1 2 3;4 5;6 7 8 9;0)
q)first each RaggedArray
1 4 6 0
q)RaggedDict:`a`b`c!(1 2;3 4 5;"hello")
q)first RaggedDict  / value of first key
1 2
q)first each RaggedDict
a| 1
b| 3
c| "h"
```
Returns the first row of a table.
```q
q)\l sp.q
q)first sp
s  | `s$`s1
p  | `p$`p1
qty| 300
```
`first` is the dual to `enlist`.
```q
q)a:10
q)a~first enlist 10
1b
q)a~first first enlist enlist 10
1b
```



`inter`
-------

Syntax: `x inter y` (binary)

Returns all items of `x` found in `y`, using the result of `x in y` to select items from `x`.

```q
q)1 3 4 2 inter 2 3 5 7 11
3 2
```
Returns common values from dictionaries:
```q
q)show x:(`a`b)!(1 2 3;`x`y`z)
a| 1 2 3
b| x y z
q)show y:(`a`b`c)!(1 2 3;2 3 5;`x`y`z)
a| 1 2 3
b| 2 3 5
c| x y z
q)
q)x inter y
1 2 3
x y z
q)
```
Returns common rows from unkeyed tables.
```q
q)show x:([]a:`x`y`z`t;b:10 20 30 40)
a b
----
x 10
y 20
z 30
t 40
q)show y:([]a:`y`t`x;b:50 40 10)
a b
----
y 50
t 40
x 10
q)x inter y
a b
----
x 10
t 40
```


`last`
------

Syntax: `last x` (unary)

Returns the last item of `x`, or last value where `x` is a dictionary.
```q
q)last til 10
9
q)last `a`b`c!1 2 3
3
```


`next`
------

Syntax: `next x` (unary, uniform)

For each item in `x`, returns the next item. For the last item, it returns a null if the list is simple (a homogeneous list), and an empty list `()` otherwise.
```q
q)next 2 3 5 7 11
3 5 7 11 0N
q)next (1 2;"abc";`ibm)
"abc"
`ibm
`int$()
```
Duration of a quote:
```q
q)update (next time)-time by sym from quote
```


`prev`
------

Syntax: `prev x` (unary, uniform)

For each item in `x`, returns the previous item. For the first item, it returns a null if the list is simple (a homogeneous list), and an empty list `()` otherwise.
```q
q)prev 2 3 5 7 11
0N 2 3 5 7
q)prev (1 2;"abc";`ibm)
`int$()
1 2
"abc"
```
Shift the times in a table:
```q
q)update time:prev time by sym from t
```


`sublist`
---------

Syntax: `x sublist y` (binary)

Returns a sublist of `y`. The result contains only as many items as are available in `y`.

Where 

- `x` is an integer atom, it returns `x` items from the beginning of `y` if positive, or from the end if negative.
```q
q)p:2 3 5 7 11
q)3 sublist p                           / 3 from the front
2 3 5
q)10 sublist p                          / only available values
2 3 5 7 11
q)2 sublist `a`b`c!(1 2 3;"xyz";2 3 5)  / 2 keys from a dictionary
a| 1 2 3
b| x y z
q)-3 sublist sp                         / last 3 rows of a table
s p qty
-------
3 1 200
3 3 300
0 4 400
```
- `x` is an integer pair, it returns `x[1]` items from `y`, starting at item `x[0]`.
```q
q)1 2 sublist p  / 2 items starting from position 1
3 5
```


`where`
-------

Syntax: `where x` (unary)

Where `x` is: 

- a list of non-zero integers, the result is a simple list containing, for each item of `x`, that number of copies of its index. 
```q
q)where 2 3 0 1
0 0 1 1 1 3
q)raze x #' til count x:2 3 0 1
0 0 1 1 1 3
```

!!! tip 
    Where `x` is a boolean list, the result is the indices of the 1s. Thus `where` is often used after a logical test:
    ```q
    q)where 0 1 1 0 1
    1 2 4
    q)x:1 5 6 8 11 17 20 21
    q)where 0 = x mod 2        / indices of even numbers
    2 3 6
    q)x where 0 = x mod 2      / select even numbers from list
    6 8 20
    ```

- a dictionary whose values are non-negative integers, the result is a list of keys repeated as many times as the corresponding value. (If a list is viewed as a mapping from indices to entries, than the definition for the integer list above is a special case.)
    ```q
    q)d:`amr`ibm`msft!2 3 1
    q)where d
    `amr`amr`ibm`ibm`ibm`msft
    q)where 2 3 0 1               / usual operation on integer list
    0 0 1 1 1 3
    q)where 0 1 2 3 ! 2 3 0 1     / same on dictionary with indices as keys
    0 0 1 1 1 3
    ```

See also [where in q-SQL](FIXME)


`xprev`
------

Syntax: `x xprev y` (binary, uniform)

Where `x` is an integer atom and `y` is a list, returns for each item of `y` the item `x` indices before it. The first `x` elements of the result are null, empty or blank as appropriate.

!!! Tip 
    There is no `xnext` function. Fortunately `xprev` with a negative number on the left can achieve this.

```q
q)2 xprev 2 7 5 3 11
0N 0N 2 7 5
q)-2 xprev 2 7 5 3 11
5 3 11 0N 0N
q)1 xprev "abcde"
" abcd"
```


