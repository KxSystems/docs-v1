= returns 1b if two variables are equal, and 0b if they are not. Unlike [match](Reference/Tilde "wikilink"), it operates on atoms:

    q)"hello" = "world"
    00010b

Also unlike match, = is not strict with regard to type:

    q)1~1h
    0b
    q)1=1h
    1b

= uses comparison tolerance when matching floats:

    q)(1 + 1e-13) = 1
    1b

For more information, see [Q for Mortals](JB:QforMortals2/primitive_operations#Equality_.28.3D.29_and_Inequality_.28.3C.3E.29 "wikilink").
