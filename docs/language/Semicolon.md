The semicolon (;) in q is simply an all-purpose separator. It separates statements, function arguments, list elements, and so on:

    q)a:5;b:3
    q)a
    5
    q)(1;2;3)
    1 2 3
    q)+[2;3]
    5

If multiple statements are separated in this way, only the last one will return a value. However, they may all have side effects, such as setting a variable:

    q)1+1;b:2+2;3+3
    6
    q)b
    4
