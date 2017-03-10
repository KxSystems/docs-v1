## `0N!` display

Syntax: `0N!x`

With a 0N on the left hand side, returns `x` after printing its unformatted text representation to console. This is useful for debugging, or avoiding formatting which may obscure the data’s structure.
```q
q)2+0N!3
3
5
```


## `show`

Syntax: `show x`

Displays `x` on the console. Enables assignment and display in a single expression.
```q
q)show x:42
42
```

