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

## `.Q.s` (plain text)

Formats as plain text, as used by console.  
<i class="fa fa-hand-o-right"></i> [`.Q.s`](dotq/#qs-plain-text)


## `.z`

<table class="kx-compact" markdown="1">
<tr><td>[`.z.pi`](dotz/#zpi-input)</td><td>input handler</td></tr>
<tr><td>[`.z.ts`](dotz/#zts-timer)</td><td>set timer intervals</td></tr>
<tr><td>[`.z.vs`](dotz/#zvs-value-set)</td><td>value set</td></tr>
</table>