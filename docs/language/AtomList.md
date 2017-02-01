An *atom* is a single data item, such as a single number, date or symbol. A *list* is an ordered collection of atoms or lists. An atom is not the same as a 1-element list.

The function `enlist` converts its argument into a list:

    q)a:10                 / a is the atom 10
    q)b:enlist 10          / b is the 1-element list 10
    q)a~b                  / a and b do not match
    0b
    q)b                    / b is displayed with a comma prefix
    ,10

A list can have all items of the same type (a simple list), or have mixed types. In a list of lists, the individual sub lists can be all the same length, or of varying lengths. Q will handle any type of list, but is most efficient on lists with all items of the same type. A column in a database is stored as a list, and typically this will be a list with all items of the same type.

The general form of a list of length n is `(p,,1,,;p,,1,,;...;p,,n,,)` where the `p,,i,,` are atoms or lists. However, where the data items are all atoms of the same type, there are simpler forms of entry and display. For example:

    q)m:(2;3;5;7;11)
    q)n:2 3 5 7 11
    q)m~n                   / m is the same as n
    1b
    q)m                     / m displays in simple form
    2 3 5 7 11

Note that a list is a single thing, whose contents may be several things. For example, in the expression below, the function `sum` is applied to a single argument which is a list of 5 numbers. It is incorrect to think of `sum` as being applied to 5 arguments:

    q)sum 2 3 5 7 11
    28
