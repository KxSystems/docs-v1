The `save` function saves **global** data to file. The argument is the filename as a symbol, and the result is the filename itself. The file shortname (ignoring path and extension) names the data. The format used depends on the file extension:

-   no extension - saved as binary
-   .csv - comma-separated values
-   .txt - plain text
-   .xls - excel spreadsheet
-   .xml - extensible markup language

Syntax
------

    q)r:save X /X must be a global var

Example
-------

    q)t:([]x:2 3 5;y:`ibm`amd`intel;z:"npn")

binary (internal representation of data):

    q)save `t
    `:t
    q)read0 `:t
    "\377\001b\000c\013\000\003\000\000\000x\000y\000z\000\000\..
    "\000\003\000\000\000npn"

csv:

    q)save `t.csv
    `:t.csv
    q)read0 `:t.csv
    "x,y,z"
    "2,ibm,n"
    "3,amd,p"
    "5,intel,n"

text:

    q)save `t.txt
    `:t.txt
    q)read0 `:t.txt      / columns are tab separated
    "x\ty\tz"
    "2\tibm\tn"
    "3\tamd\tp"
    "5\tintel\tn"

excel:

    q)save `t.xls
    `:t.xls
    q)read0 `:t.xls
    "<?xml version=\"1.0\"?><?mso-application progid=\"Excel.Sheet\"?>"
    "<Workbook xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\" x...

xml:

    q)save `t.xml
    `:t.xml
    q)read0 `:t.xml   / tab separated
    "<R>"
    "<r><x>2</x><y>ibm</y><z>n</z></r>"
    "<r><x>3</x><y>amd</y><z>p</z></r>"
    "<r><x>5</x><y>intel</y><z>n</z></r>"
    "</R>"

You can specify a path for the file:

    q)save `$"/tmp/t"
    `:/tmp/t

Saving Local Data
-----------------

To save **local** data you can explicitly do what save is doing under the covers, i.e.

    q)`:t set t /save in binary format as a single file
    q)`:t/ set .Q.en[`:.;t] /save in binary format as a splayed table (1 file/column, symbols enumerated against the sym file in current dir)
    q)`:t.csv 0:.h.tx[`csv;t] / save in csv format
    q)`:t.txt 0:.h.tx[`txt;t] / save in txt format
    q)`:t.xml 0:.h.tx[`xml;t] / save in xml format
    q)`:t.xls 0:.h.tx[`xls;t] / save in xls format

See also
--------

-   [load](Reference/load "wikilink")
-   [set](Reference/set "wikilink")
-   [get](Reference/get "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
