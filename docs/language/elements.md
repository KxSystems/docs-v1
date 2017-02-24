> Ontology asks, _What exists?_,  
> to which the answer is _Everything_.  
> — W.V.O. Quine, _Word and Object_


## Comments

: Line comment
```q
q)/Oh what a lovely day
```

### Trailing comment
```q
q)2+2  /I know this one
4
```

### Multiline comment
```q
/
    Oh what a beautiful morning
    Oh what a wonderful day
\
a:42
\
ignore this and what follows
the restroom at the end of the universe
```


## Nouns

<div class="kx-compact" markdown="1">

| noun                 | examples                                                             |
|----------------------|----------------------------------------------------------------------|
| atom                 | `42`; `"a"`; `1b`; `2012.08.04`; `` `ibm``                           |
| vector               | `(43;44;45)`; `"abc"`; `0101b`; `` `ibm`goo``; `2012.09.15 2012.07.05` |
| list                 | `(43;"44";45)`; `("abc";0101b;)`;``(("abc";1 2 3); `ibm`abc)``       |
| dictionary           | `` `a`b`c!42 43 44``; `` `name`age!(`john`carol`ted;42 43)``      |
| table                | ``([]name:`john`carol`ted; age:42 43 44)``                           | 
| keyed table          | ``([name:`john`carol`ted] age:42 43 44)``                            | 

</div>

Lists are zero or more items, separated by semicolons, and enclosed in parentheses. An item can be any noun. 

A _vector_ is a list in which all items are of the same datatype. It can be represented without parentheses. Numeric, boolean, char and symbol vectors have their own forms.
<div class="kx-compact" markdown="1">

| type    | example                 |
|---------|-------------------------|
| numeric | `42 43 44`              |
| date    | `2012.09.15 2012.07.05` |
| char    | `"abc"`                 |
| boolean | `0101b`                 |
| symbol  | `` `ibm`att`ora``       |

</div>

The syntactic class of nouns includes all data structures. Operators, functions and adverbs can be given noun syntax by listing or parenthesising them. 
```q
q)count(+)
1
q)count(+;within;\)
3
```


## Names and namespaces

Names consist of upper- and lower-case alphabetics. They may contain, but not begin with, underscores and numbers. For example: `a`, `foo`, `foo2_bar`. 

> What in the world is a namespace?  
> — Kenneth E. Iverson

A [namespace](https://en.wikipedia.org/wiki/Namespace) is a container or context within which a name resolves to a unique value. Namespaces are children of the _root namespace_ (usually just _root_) and are designated by a dot prefix. Names in the root have no prefix. The root namespace of a q session is parent to multiple namespaces, e.g. `h`, `Q` and `z`. (Namespaces with 1-character names – of either case – are reserved for use by Kx.) 
```q
q).z.p                         / GMT timestamp
2017.02.01D14:58:38.579614000
```

<a class="fa fa-hand-o-right"></a> [Names in context](FIXME)


## Functions

Functions are:

1. primitive [operators](operators) and [functions](functions), eg `+`, `count`
2. as defined in the [lambda notation](functions/#lambda-notation), eg `{x+2*y}`
3. as derived from (1) and (2) by adverbs, eg `+/`, `count'`
4. q-SQL functions, e.g. `select`


## Adverbs 

[Adverbs](adverbs) are primitive higher-order functions: they return [derivatives](FIXME) (derived functions). They are denoted by six glyphs: `'`, `/`, `\`, `':`, `/:` and `\:`. 
```q
q)+/[2 3 4]  / reduce 2 3 4 with +
9
q)*/[2 3 4]  / reduce 2 3 4 with *
24
```


## Control words

[Control words](control-words) govern execution. They are `do`, `exit`, `if` and `while`; also `:` (_return_) and `'` (_signal_).


## Etc…

### System commands

Expressions beginning with `\` are [system commands](system-commands) or multiline comments (see above). 
```q
q)/ load the script in file my_app.q
q)\l my_app.q
```


### Scripts

A script is a text file; its lines a list of expressions and/or system commands, to be executed in sequence. By convention, script files have the extension `q`.

Within a script 

- function definitions may extend over multiple lines
- an empty comment begins a _multiline comment_. 

