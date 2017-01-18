.z.pi
-----

the default handler for input.

as this is called on every line of input it can be used to log all console input, or even to modify the output - if for example you prefer the more compact 2.3 way of formatting tables you can reset the output handler.

    q)aa:([]a:1 2 3;b:11 22 33)
    q)aa
    a b
    ----
    1 11
    2 22
    3 33
    q).z.pi:{0N!value x;}
    q)aa
    +`a`b!(1 2 3;11 22 33)
    q)

to return to the default display just delete your custom handler

    \x .z.pi

<https://code.kx.com/trac/wiki/Releases/ChangesIn2.4#a.z.pi>
