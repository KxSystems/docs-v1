## `0N!` (display)

Syntax: `0N!x`

Returns `x` after printing its unformatted text representation to console. This is useful for debugging, or avoiding formatting which may obscure the data’s structure.
```q
q)2+0N!3
3
5
```


## `show`

Syntax: `show x`

Formats `x` and writes it to the console, returns the identity function `(::)`.
```q
q)a:show til 5
0 1 2 3 4
q)a~(::)
1b
```

!!! tip "Display intermediate values"
    ```q
    q)f:{a:x<5;sum a}
    q)f 2 3 5 7 3
    3
    q)f:{show a:x<5;sum a}    / same function, showing value of a
    q)f 2 3 5 7 3
    11001b
    3
    ```

