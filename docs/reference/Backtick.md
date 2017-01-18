A back tick (\`) followed by a series of characters represents a symbol, which is not the same as a string. See [|Q for Mortals](JB:QforMortals2/atoms#Character_Data "wikilink") for more information about this.

    q)s:`symbol
    q)s ~ "symbol"
    0b

A back tick without characters after it represents the empty symbol. This empty symbol can be used with [$ (cast)](Reference/DollarSign "wikilink") to cast a string into a symbol, creating symbols whose names could not normally be written down, such as symbols containing spaces. \`$x is shorthand for "S"$x

    q)s:`hello world
    'world
    q)s:`$"hello world"
    q)s
    `hello world

When running [update](Reference/update "wikilink") and [delete](Reference/delete "wikilink") statements on a table, putting a \` before the table's name will modify the table:

    q)t1:t2:([]a:1 2;b:3 4)
    q)update a:neg a from t1
    a  b
    ----
    -1 3
    -2 4
    q)t1~t2
    1b
    q)update a:neg a from `t1
    `t1
    q)t1~t2
    0b
