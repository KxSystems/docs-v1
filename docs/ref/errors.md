<i class="fa fa-hand-o-right"></i> [List of all errors](/ref/error-list)


## abort

System command: type `\`  at the debugger prompt `q))` prompt to return to the interactive session.
```q
q)f:{g[]}
q)g:{'`xyz}
q)f[]
{g[]}
'xyz
@
{'`xyz}
::
q))\
q)
```


## `exit`

`Syntax`: `exit x`

where `x` is a positive integer, `exit` terminates the q process with `x` as the exit code.
```q
q)exit 0        / typical successful exit status
..

q)exit 42
guest@localhost:~$ echo $?
42
```
<i class="fa fa-hand-o-right"></i> [`.z.exit`](dotz/#zexit-action-on-exit) (action on exit)


## `'` (signal)

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
_Trap_ always receives a string regardless of the type of `x`.

!!! warning "Signal has some restrictions"
    <pre><code class="language-q">
    q)f 1         / signals a type error indicating ' will not signal a number
    "trap:stype"
    q)f"a"        /q will not signal a char
    "trap:stype"
    </code></pre>
    Using an undefined word signals the word as an error
    <pre><code class="language-q">
    q)'word
    'word
    </code></pre>
    which is indistinguishable from
    <pre><code class="language-q">
    q)word
    'word
    </code></pre>


### Error-trap modes

At any point during execution, the behaviour of _signal_ (`'`) is determined by the internal error-trap mode:

- `0`  abort execution (set by _trap_ `@` or `.`)
- `1`  suspend execution and run the debugger
- `2`  collect stack trace and abort (set by `.Q.trp`)

During abort, the stack is unwound up to the nearest [trap](errors/#trap) (`@` or `.` or [`.Q.trp`](dotq/#qtrp-extend-trap)). The error-trap mode is always initially set to 

-   1 for console input
-   0 for sync message processing

`\e` sets the mode applied before async and HTTP callbacks run. Thus, `\e 1` will cause the relevant handlers to break into the debugger, while `\e 2` will dump the backtrace either to the server console (for async), or into the socket (for HTTP).
```q
q)\e 2
q)'type             / incoming async msg signals 'type
  [2]  f@:{x*y}
            ^
  [1]  f:{{x*y}[x;3#x]}
          ^
  [0]  f `a
       ^
q)\e 1
q)'type             
  [2]  f@:{x*y}
            ^
q))                 / the server is suspended in a debug session
```



## `.` `@` (trap)

Syntax: `@[f;fx;e]`  
Syntax: `.[g;gg;e]`

Where

- `f` is a unary function and `fx` is its argument
- `g` is a multi-argument function and `gg` is a list of its arguments
- `e` is an expression, typically a function

_Trap_ will evaluate function `e` if evaluation of `f` or `g` fails. It is similar to try/catch in other languages.

When there is no signal, `@` behaves like binary `@`.
```q
q)@[string;42;`err]
"42"
```
When there is a signal the result of the trap is `e`.
```q
q)@[{'x};"signal this";`err]
`err
```
If `e` is a function, it is called with the signal as argument.
```q
q)@[2+;"42";{"Caught: ",x}]
"Caught: type"
```
This can be used to return a result unambiguously indicating whether the function succeeded. Here, the first item of the pair indicates success or failure, while the second item is either the result or the error. This is useful when `0` or `()` might be valid results. 
```q
q)@[(1b;){1+x}@;0;(0b;)]
1b
1
q)@[(1b;){1+x}@;`a;(0b;)]
0b
"type"
q)
```

!!! warning "Limit of the trap"
    _Trap_ catches only errors signalled in the applications of `f` or `g`. Errors in the evaluation of `fx` or `gg` themselves are not caught.
    <pre><code class="language-q">
    q)@[2+;"42";\`err]
    \`err
    q)@[2+;"42"+3;\`err]
    'type
      [0]  @[2+;"42"+3;\`err]
                    ^
    </code></pre>

`@[f;fx;e]` is equivalent to `.[f;enlist fx;e]`. "dot" trap is used for multi-argument `f`.
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

!!! tip "When e is not a function"
    If `e` is a function it will be evaluated _only_ if `f` or `g` fails. It will however be _parsed_ before any of the other expressions are evaluated.
    <pre><code class="language-q">
    q)@[2+;"42";{)}]
    ')
      [0]  @[2+;"42";{)}]
                      ^
    </code></pre>
    If `e` is any _other_ kind of expression it will _always_ be evaluated – and _first_, in the usual right-to-left sequence. In this respect _trap_ is unlike try/catch in other languages. 
    <pre><code class="language-q">
    q)@[string;42;a:100] / expression not a function
    "42"
    q)a // but a was assigned anyway
    100
    q)@[string;42;{b::99}] / expression is a function
    "42"
    q)b // not evaluated
    'b
      [0]  b
           ^
    </code></pre>
    For most purposes, you will want `e` to be a function.

<i class="fa fa-hand-o-right"></i> [`.Q.trp`](dotq/#qtrp-extend-trap "extend trap")