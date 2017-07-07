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
Trap always receives a string regardless of the type of `x`.

!!! warning "Signal has some restrictions"
    ```q
    q)f 1         / signals a type error indicating ' will not signal a number
    "trap:stype"
    q)f"a"        /q will not signal a char
    "trap:stype"
    ```
    Using an undefined word signals the word as an error
    ```q
    q)'word
    'word
    ```
    which is indistinguishable from
    ```q
    q)word
    'word
    ```


## `.` `@` (trap)

Syntax: `@[f;fx;e]`  
Syntax: `.[g;gg;e]`

Where

- `e` is an expression, typically a function
- `f` is a unary function and `fx` is its argument
- `g` is a multi-argument function and `gg` is a list of its arguments

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
    ```q
    q)@[2+;"42";`err]
    `err
    q)@[2+;"42"+3;`err]
    'type
      [0]  @[2+;"42"+3;`err]
                    ^
    ```

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
    ```q
    q)@[2+;"42";{)}]
    ')
      [0]  @[2+;"42";{)}]
                      ^
    ```
    If `e` is any _other_ kind of expression it will _always_ be evaluated – and _first_, in the usual right-to-left sequence. In this respect _trap_ is unlike try/catch in other languages. 
    ```q
    q)@[string;42;a:100] // expression not a function
    "42"
    q)a // but a was assigned anyway
    100
    q)@[string;42;{b::99}] // expression is a function
    "42"
    q)b // not evaluated
    'b
      [0]  b
           ^
    ```
    For most purposes, you will want `e` to be a function.


## Errors
<div class="kx-compact" markdown="1">

### Runtime errors

| error | example | explanation |
|-------|---------|-------------|
| `access` | | attempt to read files above directory, run system commands or failed usr/pwd |
| `accp` | | tried to accept an incoming tcp/ip connection but failed to do so |
| `adict` |        `d[::]:x` | blocked assignment (`'nyi`) |
| `arch` | | attempt to load file of wrong endian format |
| `assign` |       `cos:12` | attempt to reuse a reserved word |
| `badtail` | | incomplete transaction at end of logfile, get good (count;length) with `-11!(-2;`:file)` |
| `cast` |         `` `sym$`xxx`` | attempt to enumerate invalid value (`` `xxx`` not in sym in example) |
| `conn`  | | too many incoming connections (1022 max) |
| `d8`  | | the log had a partial transaction at the end but q couldn't truncate the file. |
| `domain` |       `!-1` | out of domain |
| `elim` | |                    more than 57 distinct enumerations |
| `from` |         `select a b` | badly formed select statement |
| `glim` |   |                   limit on number of vectors with a `` `g#`` attribute, unlimited since 3.2 |
| `hwr` |      |                 handle write error, can't write inside a `peach` |
| `insert` |     |               attempt to insert a record with a key that already exists |
| `length` |       `()+!1` | incompatible lengths |
| `limit` |        `0W#2` | tried to generate a list longer than 2,000,000,000 |
| `loop` |         `a::a` | dependency or transitive closure loop |
| `mismatch` |     |             columns that can't be aligned for R,R or K,K |
| `mlim` |           |           limit on number of concurrently mapped nested vectors, currently 65530 |
| `nyi` |              |         not yet implemented |
| `noamend` |            |       can't change global state inside an amend |
| `noupdate` |             |     update not allowed when using negative port number |
| `nosocket` |             |    can only open/use sockets in main thread |
| `os` |                     |   operating system error |
| `parse` |   |                  invalid syntax |
| `part` |      |                something wrong with the partitions in the HDB |
| `pl` |          |              `peach` can't handle parallel lambdas (2.3 only) |
| `Q7` |            |            nyi op on file nested array |
| `rank` |         `+[2;3;4]` | invalid rank or valence |
| `rb` |              |          encountered a problem whilst doing a blocking read |
| `s-fail` |      `` `s#2 1`` | cannot apply `` `s#`` to data (not ascending values) |
| `splay` |             |        nyi op on splayed table |
| `stack` |        `{.z.s[]}[]` | ran out of stack space |
| `step` |                |      attempt to upsert into stepped (`` `s#``) dictionary |
| `stop` |                  |      user interrupt (Ctrl-c) or time limit (`-T`) |
| `stype` |        `'42` | invalid type used to signal |
| `threadview` |              |  views can only be calculated from the main thread |
| `trunc` | |                    the log had a partial transaction at the end but q couldn't truncate the file |
| `type` |         `til 2.2` | wrong type |
| `u-fail` |      `` `u#1 1`` | cannot apply `` `u#`` to data (not unique values) |
| `unmappable` | |               when saving partitioned data, each column must be mappable |
| `value` |        |             no value |
| `vd1` |           |            attempted multithread update |
| `view` |            |          trying to re-assign a view to something else |
| `wsfull` |            |        malloc failed. ran out of swap (or addressability on 32 bit). or hit `-w` limit |
| `XXX` |                 |      value error (`XXX` undefined) |

</div>

### System errors (file and IPC) 

<div class="kx-compact" markdown="1">

| error | example | explanation |
|-------|---------|-------------|
| `XXX:YYY` | ``read0`:invalidname.txt`` | `XXX` is from kdb+, `YYY` from the OS |

`XXX` from addr, close, conn, p (from `-p`), snd, rcv or (invalid) filename
</div>


### Parse errors (execute or load)

<div class="kx-compact" markdown="1">

| error | example | explanation |
|-------|---------|-------------|
| `[({])}"` | `count abc"` | open paren, bracket, brace or double-quote
| `branch` | | a branch (`if`; `do`; `while`; `$[.;.;.]`) more than 255 byte codes away |
| `char` |     |                invalid character |
| `constants` | |               too many constants (max 96) |
| `globals` |    |              too many global variables (32 max) |
| `locals` |      |             too many local variables (24 max) |
| `params` |       |            too many parameters (8 max) |

</div>

### License errors

<div class="kx-compact" markdown="1">

| error    | explanation                                                 |
|----------|-------------------------------------------------------------|
| `cores`  | too many cores                                              |
| `exp`    | expiry date passed                                          |
| `host`   | unlicensed host                                             |
| `k4.lic` | k4.lic file not found, check `QHOME`/`QLIC`                 |
| `os`     | unlicensed OS                                               |
| `srv`    | attempt to use client-only license in server mode           |
| `upd`    | attempt to use version of kdb+ more recent than update date |
| `user`   | unlicensed user                                             |
| `wha`    | invalid system date                                         |

</div>
