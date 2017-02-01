The only function of curly braces ({}) is to describe an inline q function, which can contain multiple statements. At the very start of the function, the function's parameters can be placed inside brackets (\[\]); if this is not done, q will use x, y, and z for parameters. For more details about functions, see [Q for Mortals](JB:QforMortals2/functions "wikilink").

    q){[t] t*t}
    {t*t}
    q){[t] t*t} 5
    25
    q){x*x} 5
    25
