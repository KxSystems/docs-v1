Syntax
------

    q)r:rand X

The behavior of the `rand` function depends on its argument:

If `X` is an atom 0, it returns a random value of the same type in the range of that type:

    q)rand each 3#0b                            / random boolean
    110b
    q)rand each 3#0h                            / random short
    -16351 -10827 24386h
    q)rand each 3#0                             / random integer
    -2027951159 -803176254 -1870880499
    q)rand each 3#0j
    -4429244352705533236 1499428773930149533..  / random long

If `X` is a positive number, it returns a random number of the same type in the range `[0,X)`

    q)rand 100
    54
    q)rand 100.0
    63.35033

If `X` is a list, it returns a random element from the list:

    q)rand 1 30 45 32
    32

If `X` is a symbol in a range \`1 to \`8, it returns a random symbol of length X using the first 16 lower case letters of alphabet:

    q)rand each `$string 1+til 8
    `m`ig`kao`bafc`kfhog`jecpae`kfmohpi`lkklcoii

See also
--------

-   [?](Reference/QuestionSymbol "wikilink") (find/rand)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
