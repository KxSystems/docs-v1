## exit

Syntax: `exit x`

where `x` is a positive integer, `exit` terminates the q process with `x` as the exit code.
```q
q)exit 0        / typical successful exit status
..

q)exit 42
guest@localhost:~$ echo $?
42
```


## Signal '

Syntax: `'emsg`

where `emsg` is a symbol or char list, _signal_ aborts evaluation and passes `msg` to the interpreter as a string.
```q
q)0N!0;'`err;0N!1
0
'err
```
The only way to detect a signal is to use _trap_.
```q
q)f:{@[{'x};x;{"trap:",x}]}
q)f`err
"trap:err"
```
Trap always receives a string regardless of the type of `x`.

!!! note "Signal has some restrictions"
    ```q
    q)f 1         / signals a type error indicating ' will not signal a number
    "trap:stype"
    q)f"a"        /q will not signal a char
    "trap:stype"
    ```
    Using an undefined word throws a signal
    ```q
    q)'word
    'word
    ```
    which is indistinguishable from
    ```q
    q)word
    'word
    ```


## Trap . @

Syntax: `@[f;x;e]`  
Syntax: `.[g;y;e]`

where 

- `e` is an expression
- `f` is a unary function and `x` is its argument
- `g` is a multi-argument function and `y` is a list of its arguments

_trap_ will evaluate `e` if evaluation of `f` or `g` fails. It is similar to try/catch in other languages.

When there is no signal, `@` behaves like binary `@`.
```q
q)@[string;42;`err]
"42"
```
When there is a signal the result of the trap is the third argument.
```q
q)@[{'x};"signal this";`err]
`err
```
If `z` is a function, it is called with argument `y`.
```q
q)@[{'x};"signal this";(`e;)]
`e
"signal this"
```
This can be used to return a result unambiguously indicating whether the function succeeded. Here, the first element of the pair indicates success or failure, while the second element is either the result or the error. This is useful when `0` or `()` might be valid results. 
```q
q)@[(1b;){1+x}@;0;(0b;)]
1b
1
q)@[(1b;){1+x}@;`a;(0b;)]
0b
"type"
q)
```
`@[f;x;t]` is equivalent to `.[f;enlist x;t]`. "dot" trap is used for multi-argument `f`.
```q
q).[*;(42;42);`err]
1764
```
Examples:
```q
q)@[parse;"1b1";`err]
`err
q)@[parse;"22 1b1 44";::]
"1b1"
```


