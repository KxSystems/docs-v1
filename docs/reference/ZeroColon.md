CSV/DSV prepare
===============

`delimiter 0: table`

The dyadic *prepare text* function takes a separator character as its first argument and a table or a list of columns as its second. The result is a list of character strings containing text representations of the rows of the second argument separated by the first.

Any cells that contain the delimiter will be wrapped in double-quote marks, and any embedded double-quote mark will be doubled.

Examples:
---------

`` q)show csv 0: ([]a:1 2 3;b:`x`y`z) ``
`"a,b"`
`"1,x"`
`"2,y"`
`"3,z"`

`` q)show "|" 0: (`a`b`c;1 2 3;"xyz") ``
`"a|1|x"`
`"b|2|y"`
`"c|3|z"`

Save Text
=========

`filehandle 0: text`

The dyadic *save text* function takes a file handle as its first argument and a list of character strings as its second. The strings are saved as lines in the file. The result of the *prepare text* function can be used as the second argument.

Examples:
---------

`` q)`:test.txt 0: enlist "text to save" ``
`` `:test.txt ``
`` q)`:status.txt 0: string system "w" ``
`` `:status.txt ``

Load Fixed-size Records
=======================

`(types; widths) 0: filehandle`
`(types; widths) 0: strings`

The dyadic *load text* function takes file format description as its first argument and a file handle or a list of character strings as its second.

The format description takes the form of a list of types and a list of widths. Note that 0: with fixed width format expects either a \\n after every record, or no \\n at all in the data.

See [here](Reference/type "wikilink") for a list of types and the identifier, note that when loading text you should specify the identifier as an uppercase letter, to load a field as a nested character column or list rather than symbol use "\*" as the identifier and to skip a field from the load use " ".

`(types; widths) 0: (filehandle; offset; length)`

Optionally, 0: can take a three-item list as its second argument, containing the file handle, an offset at which to begin reading, and a length to read.

Examples:
---------

`q)sum("DT";8 9)0:enlist"20130315185540686"`
`,2013.03.15D18:55:40.686000000`
`q)sum(" Z T";5 20 1 5)0:("Tue, 04 Jun 2013 07:00:13 +0900";"Tue, 04 Jun 2013 07:00:13 -0500")`
`2013.06.04T16:00:13.000 2013.06.04T02:00:13.000`

Load Delimited Records (Read CSV)
=================================

`(types; delimiter[;allowEmbeddedLineReturns]) 0: filehandle`
`(types; delimiter[;allowEmbeddedLineReturns]) 0: string`

The optional arg allowEmbeddedLineReturns defaults to 0, and is recognized since v3.4 to allow line returns within strings in csv/dsv files.

The dyadic *load text* function takes file format description as its first argument and a file handle or a list of character strings as its second.

The format description takes the form of a list of types and the delimiter. If the delimiter is enlisted the first row of the input data will be used as column names and the data is loaded as a table, otherwise the data is loaded as an list of values for each column.

See [here](Reference/type "wikilink") for a list of types and the identifier, note that when loading text you should specify the identifier as an uppercase letter, to load a field as a nested character column or list rather than symbol use "\*" as the identifier and to skip a field from the load use " ".

KDB allows a cell to contain the delimiter if it is surrounded by double-quotation marks, and an embedded double-quotation-mark should be doubled.

`(types; widths) 0: (filehandle; offset; length)`

Optionally, 0: can take a three-item list as its second argument, containing the file handle, an offset at which to begin reading, and a length to read.

An additional form takes a list of types and a delimiter as the format and a single string as the data and returns a single list of the data split and parsed accordingly. Note that this form does not work with either enlisted delimiters or fixed widths.

Examples:
---------

`` q)t:("SS";enlist" ")0:`:/tmp/txt /load 2 columns from space delimited file with header ``
`` q)t:("IFC D";4 8 10 6 4) 0: `:/q/Fixed.txt /reads a text file containing fixed length records ``

`q)t:([]x:("foo";"bar,baz";"qu\"ux";"fred\",barney"))`
`q)t`
`x`
`---------------`
`"foo"`
`"bar,baz"`
`"qu\"ux"`
`"fred\",barney" `
`q)-1@","0:t;`
`x`
`foo`
`"bar,baz" `
`qu"ux`
`"fred"",barney"`

`use optional 3rd arg to the lhs list to 0: to allow embedded line returns within strings. e.g.`
`q)("I*";",";1)0:("0,\"ab\nc\"";"1,\"def\"")`

Parse Key-Value Pairs
=====================

`(key-type field-separator record-separator) 0: string`

This is very convenient for handling data that comes in as delimited key/value strings. The first argument is a three-character string describing the key-type and the field and record separators. The key-type can be S or I for symbol or long.

Examples:
---------

`q)"S=;"0:"one=1;two=2;three=3"`
`` (`one`two`three;(,"1";,"2";,"3")) ``
`q)show "S=;"0:"one=1;two=2;three=3"`
`one two three`
`1 2 3`

`q)show "S:/"0:"one:1/two:2/three:3"`
`one two three`
`1 2 3`

`q)"I=;"0:"1=first;2=second;3=third"`
`(1 2 3;("first";"second";"third")) `
`q)show "I=;"0:"1=first;2=second;3=third"`
`1 2 3`
`first second third`

`q)s:"8=FIX.4.2\0019=339\00135=D\00134=100322\00149=JM_TEST1\00152=20130425-06:46:46.387"`
`q)(!/)"I=\001"0:s`
`8 | "FIX.4.2"`
`9 | "339"`
`35| ,"D"`
`34| "100322"`
`49| "JM_TEST1"`
`52| "20130425-06:46:46.387"`

`q)(!/) "S=&" 0: "k=foo&b=baz&z=whatever"`
`k| "foo"`
`b| "baz"`
`z| "whatever"`

See Also:
=========

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

-   [$ (cast)](Reference/DollarSign "wikilink")
-   [type](Reference/type "wikilink")
-   [Importing csv data](Cookbook/UsingKdb#HowdoIimportaCSVfileintoatable "wikilink")

