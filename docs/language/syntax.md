Syntax
======

<aside markdown="1" class="comment kx-developer">
- Define the terms in which the elements of q are discussed
- Enable the reader to parse any q expression

Although this article is not a tutorial, it everywhere tries to avoid using terms not previously introduced. 
</aside>


Comments
--------

The parser ignores anything to the right of `/ ` (slash space).
```q
q)/ Oh what a lovely day
q)2+2  / I know this one
4
```
In a script (see below) an empty comment line begins a multi-line comment, which a `\` ends.
```q
/
    Oh what a lovely morning
    Oh what a beautiful day
\
```


Datatypes
---------

Data are symbols, characters, or of the several datetime or numeric [datatypes](datatypes). 
```q
q)42          / a number
42
q)42%6        / a float
7f
q)2001.09.11  / not a lovely day
2001.09.11
q)"y"         / a character
"y"
q)`ibm        / a symbol
`ibm
```

There is no string datatype; the closest equivalents are symbols and lists of characters. The `$` operator [casts](datatypes/#casting) between datatypes. Filepaths are a special form of symbol. 
```q
q)count read0 `:path/to/myfile.txt  / count lines in myfile.txt
```


Names
-----

Values may be given names, using single or double colons. The double colon binds the value to a name in the session root; the single colon binds the name in the local context. In a session with no evaluation suspended their effects are the same.
```q
q)foo:42
q)foo
42
q)foo::103
q)foo
103
```


Data structures
---------------

### Atoms and lists

An _atom_ is a single number, character, boolean, symbol, timestamp… a single instance of any [datatype](datatypes). 

A _list_ is enclosed in parentheses, its items – if any – separated by semicolons. 
```q
q)count(42;`ibm;2012.08.17)    / list of 3 items
3
```
A list may have 0, 1 or more items. 
```q
q)count()              / empty list
0
q)count enlist 42      / 1-list
1
q)count(42;43;44;45)   / 4-list
4
```
A list with 1 item is not an atom. The `enlist` function makes a 1-list from an atom.
```q
q)42~enlist 42
```
The items of a _homogenous list_ are all of the same dataype. For a homogeneous list, the parentheses and semicolons may be elided. 
```q
q)(42;43;44;45)~42 43 44 45    / homogeneous 4-lists
1b
q)("a";"b";"c")~"abc"
1b
q)3<til 10                     / result is a list of booleans
0000111111b
```
A list item may be any data structure.
```q
q)count("abc";0000111111b;42)  / list of 2 lists and an atom
3
```


### Dictionaries and tables

A _dictionary_ is a map from a list of keys to a list of values. (The keys should be unique, though q does not enforce this.) The values of a dictionary can be any data structure. 
```q
q)/ 4 keys and 4 atomic values
q)`bob`carol`ted`alice!42 39 51 44   
bob  | 42
carol| 39
ted  | 51
alice| 44
q)/ 2 keys and 2 list values
q)show kids:`names`ages!(`bob`carol`ted`alice;42 39 51 44)
names| bob carol ted alice
ages | 42  39    51  44
```
A dictionary in which the values are all lists of the same count can be flipped into a table. Or the table specified directly using _table syntax_, e.g.
```q
q)count each kids
names| 4
ages | 4
q)flip kids  / flipped dictionary
names ages
----------
bob   42
carol 39
ted   51
alice 44
q)/ a flipped dictionary is a table
q)(flip kids)~([]names:`bob`carol`ted`alice; ages:42 39 51 44)
1b
```
Table syntax can declare one or more columns of a table as a _key_. The values of the key column/s of a table are unique. 
```q
q)([names:`bob`carol`bob`alice;city:`NYC`CHI`SFO`SFO]; ages:42 39 51 44)
names city| ages
----------| ----
bob   NYC | 42
carol CHI | 39
bob   SFO | 51
alice SFO | 44
```


Operators and functions
-----------------------

Q primitives use [infix](https://en.wikipedia.org/wiki/Infix_notation), [prefix](https://en.wikipedia.org/wiki/Polish_notation) and [postfix](https://en.wikipedia.org/wiki/Reverse_Polish_notation) notations. e.g.
```q
q)2+3               / infix
5
q)reverse 2 3       / postfix
3 2
q)total:+/          / prefix
```
Functions are applied in postfix form. _Indexing lists_ and _applying functions to arguments_ use the same syntax, e.g.
```q
q)"abcde"[1 4 0 3]  / index a list
"bead"
q){x*x}[1 4 3]      / apply a function
1 16 9
q){x+y}[2;3]        / multiple arguments
5
```
The number of arguments to a function is its _valence_. Functions with valence 1 or 2 are known respectively as _monadic_ or _dyadic_, e.g
```q
q){x*x}[2 3 4]      / monadic
4 9 16
q){x*y}[2;3 4]      / dyadic
6 8
q)"abcde"1 4 3      / brackets may be elided for a list
"bed"
q){x*x}1 4 3        / or a monadic function
1 16 9
```
Operators, and some reserved words, are applied in infix form. Operators, and the same reserved words, can also be applied as dyadic functions in postfix form, e.g.
```q
q)2|3
3
q)|[2;3]
3
q)2 rotate 2 3 4 5 6
4 5 6 2 3
q)rotate[2;2 3 4 5 6]
4 5 6 2 3
```


Functions
---------

Functions are defined within curly braces and may be assigned names. The definition begins by listing the local names of the function’s arguments (up to eight) and continues with a list of one or more expressions. For functions with 3 or fewer arguments the list of argument names may be elided, and the default argument names `x`, `y` and `z` used instead.
```q
q){[a;b](a*a)+(b*b)+2*a*b}[20;4]
576
q){(x*x)+(y*y)+2*x*y}[20;4]
576
q)binsquare:{(x*x)+(y*y)+2*x*y}
q)binsquare[20;4]
576
```


Q-SQL
-----

Expressions beginning with `insert`, `select`, `update` or `upsert` employ [q-SQL syntax](FIXME). 


System commands
---------------

Expressions beginning with `\` are system commands, e.g.
```q
q)/ load the script in file my_app.q
q)\l my_app.q
```


Scripts
-------

A script is a text file; its lines a list of expressions and/or commands to be executed in sequence by the parser. Conventionally, script files have the extension `q`.

Within a script 

- an empty comment begins a _multiline comment_. 
- function definitions may extend over multiple lines


Adverbs
-------

An _adverb_ changes the way a function is applied. Adverbs are used in prefix form, e.g. the _over_ adverb `/`:
```q
q)total:+/          / map-reduce of plus
q)total[2 3 4]      / monadic function
9
q)total 2 3 4
9
q)
```


Nomadic operators
-----------------

Some operators have both monadic and dyadic forms: they are _nomadic_. The colon adverb selects the monadic form. (Parentheses achieve a similar effect when index brackets are elided.) 
```q
q)2|3       / maximum (infix)
3
q)|[2;3]    / maximum (dyadic, postfix)
3
q)|:[2 3]   / reverse (monadic)
3 2
q)|:2 3     / brackets elided
3 2
q)(|)2 3    / reverse (monadic, elided)
3 2
q)(|)[2 3]  / watch out
|[2 3]
```


Currying
--------

Omitting one or more arguments to a non-monadic function [_curries_](https://en.wikipedia.org/wiki/Currying) the supplied arguments to the function, e.g. 
```q
q)f:{x+y}[2]     / f is monadic and adds 2 to its argument
q)f 10
12
q)foo:{x*y+z}
q)foo[2;3;4]     / foo has valence 3
14
q)bar:foo[2;;4]
q)bar 6          / bar is monadic
20
```
Similarly for operators:
```q
q)half:%[;2]     / % operator in dyadic, postfix form
q)half 6         / half is monadic
3f
q)double:2*
q)double 5       / monadic
10
```


Namespaces
----------

> What in the world is a namespace? — Kenneth E. Iverson

A [namespace](https://en.wikipedia.org/wiki/Namespace) is a container or context within which a name resolves to a unique value. Namespaces are children of the _root namespace_ (usually just _root_)and are designated by a dot prefix. The root namespace of a q session is parent to multiple namespaces, e.g. `h`, `Q` and `z`. Namespaces with 1-character names (of either case) are reserved for use by Kx. 
```q
q).z.p                         / GMT timestamp
2017.02.01D14:58:38.579614000
```

