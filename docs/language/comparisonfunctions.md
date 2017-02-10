Six comparative operators:

## equal `=`
## greater than `>`
## greater than or equal `>=`
## less than `<`
## less than or equal `<=`
## not equal `<>`

Syntax: (eg) `x = y` (binary, atomic) 

These binary operators work intuitively on numerical values (converting types when necessary), and apply also to lists, dicts, and tables.

Returns `1b` where `x` and `y` are equal, else 0b. 
```q
q)"hello" = "world"
00010b
q)5h>4h
1b
q)0x05<4j
0b
q)0>(1i;-2j;0h;1b;0N;-0W)
010011b
q)5>=(`a`b!4 6)
a| 1
b| 0
```
Unlike _match_, not strict about type.
```q
q)1~1h
0b
q)1=1h
1b
```
Comparison tolerance applies when matching floats.
```q
q)(1 + 1e-13) = 1
1b
```

!!! tip 
    For booleans, `<>` is the same as _exclusive or_ (XOR).

!!! warning "Non numerical arguments"
    The comparison operators also work on non-numerical values (characters, temporal values, symbols) – not always intuitively.
    ```q
    q)"0" < ("4"; "f"; "F"; 4)  / characters are treated as their numeric value
    1110b
    q)"alpha" > "omega"         / strings are char lists
    00110b
    q)`alpha > `omega           / but symbols compare atomically
    0b
    ```


## `differ`

Syntax: `differ x` (unary, uniform)

Returns a boolean list indicating where consecutive pairs of items in `x` differ. 
It applies to all data types.
The first item of the result is always `1b`:

    r[i]=1b                 for i=0
    r[i]=not A[i]~A[i-1]    otherwise

```
q)differ`IBM`IBM`MSFT`CSCO`CSCO
10110b
q)differ 1 3 3 4 5 6 6
1101110b
```
Split a table with multiple dates into a list of tables with distinct dates.
```q
q)d:2009.10.01+asc 100?30
q)s:100?`IBM`MSFT`CSCO
q)t:([]date:d;sym:s;price:100?100f;size:100?1000)
q)i:where differ t[`date]    / indices where dates differ
q)tlist:i _ t                / list of tables with one date per table
q)tlist 0
date       sym  price    size
-----------------------------
2009.10.01 IBM  37.95179 710
2009.10.01 CSCO 52.908   594
2009.10.01 MSFT 32.87258 250
2009.10.01 CSCO 75.15704 592
q)tlist 1
date       sym  price   size
----------------------------
2009.10.02 MSFT 18.9035 26
2009.10.02 CSCO 12.7531 760
```


## match `~`

Syntax: `x ~ y` (binary)

Returns `0b` unless `x` and `y` are identical. Comparison tolerance is used when matching floats. 
```q
q)(1 2 3+4 5 6)~4 5 6+1 2 3   / the arguments are identical
1b
q)(1 2 3-4 5 6)~4 5 6-1 2 3   / these are not identical
0b
q)1 2 3 ~`a`b                 / any two data objects can be compared
0b
```
_Match_ depends on the data type of the arguments, not just the values.
```q
q)1~1h
0b
q)3~3.0
0b
```
This means the same symbols from different enumerations do not match, even when equal.
```q
q)l1:`a`b`c
q)l2:`a`b`c
q)(`l1$`a)~`l2$`a
0b
q)(`l1$`a)=`l2$`a
1b
```
Match ignores attributes on lists.
```q
q)1 2 3~`s#1 2 3
1b
```
Two tables match even if they differ in attributes.
```q
q)t1:([]x:1 2 3)
q)t2:([]x:`s#1 2 3)
q)meta t1
c| t f a
-| -----
x| i
q)meta t2
c| t f a
-| -----
x| i   s
q)t1~t2
1b
```
