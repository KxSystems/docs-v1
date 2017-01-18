There are four comparative operators in q: &gt; (greater than), &gt;= (greater than or equal to), &lt; (less than), &lt;= (less than or equal to). They work as imagined on numerical values (converting when necessary), and since these are primitive operators they will automatically extend over lists, dicts, and tables:

    q)5h>4h
    1b
    q)0x05<4j
    0b
    q)0>(1i;-2j;0h;1b;0N;-0W)
    010011b
    q)5>=(`a`b!4 6)
    a| 1
    b| 0

The comparative operators will also work on non-numerical values (characters, temporal values, symbols), although it may not always work as expected:

    q)"0" < ("4"; "f"; "F"; 4)  / characters are treated as their numeric value
    1110b
    q)"alpha" > "omega"         / strings are always treated as character arrays...
    00110b
    q)`alpha > `omega           / ...but symbols can be atomically compared to each other
    0b
