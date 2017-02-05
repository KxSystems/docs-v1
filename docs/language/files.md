Files
=====

Besides the functions in this section, see also the [IO primitives](FIXME). 


dsave
-----

Syntax: `x dsave y`

Saves global tables to disk as splayed, enumerated, indexed kdb+ tables. (Since V3.2 2014.05.07.)

Where 

- `x` is the save path as a symbol or symbol list
- `y` is a list of table names

returns the list of table names, having saved the table/s as a side effect.

The first column of each table saved has the `` `p `` attribute applied to it. If the path is a list, the first item is the HDB root (where the sym file, if any, will be stored), while the remaining elements are a path within the HDB (e.g. a partition).

`dsave` provides roughly the same functionality as the combination of [`.Q.en`](/cookbook/SplayedTables#Enumerating_varchar_columns_in_a_table) and [`set`](values/#set) or [`.Q.dpft`](DotQ/DotQDotdpft "wikilink"), but in a simpler form.
```q
q)t:flip`sym`price`size!100?'(-10?`3;1.0;10)
q)q:flip`sym`bid`ask`bsize`asize!900?'(distinct t`sym;1.0;1.0;10;10)
q)meta t
c    | t f a
-----| -----
sym  | s    
price| f    
size | j    
q)meta q    
c    | t f a
-----| -----
sym  | s    
bid  | f    
ask  | f    
bsize| j    
asize| j    
q)type each flip t
sym  | 11
price| 9
size | 7
q)type each flip q
sym  | 11
bid  | 9
ask  | 9
bsize| 7
asize| 7
q)`:/tmp/db1 dsave`sym xasc'`t`q
`t`q
q)\l /tmp/db1
q)meta t
c    | t f a
-----| -----
sym  | s   p
price| f    
size | j    
q)meta q
c    | t f a
-----| -----
sym  | s   p
bid  | f    
ask  | f    
bsize| j    
asize| j    
q)type each flip t
sym  | 20
price| 9
size | 7
q)type each flip q
sym  | 20
bid  | 9
ask  | 9
bsize| 7
asize| 7
q)
```
In the following, the left argument is a list, of which the second item is a partition name.
```q
q)t:flip`sym`price`size!100?'(-10?`3;1.0;10)
q)q:flip`sym`bid`ask`bsize`asize!900?'(distinct t`sym;1.0;1.0;10;10)
q)meta t
c    | t f a
-----| -----
sym  | s    
price| f    
size | j    
q)meta q
c    | t f a
-----| -----
sym  | s    
bid  | f    
ask  | f    
bsize| j    
asize| j    
q)type each flip t
sym  | 11
price| 9
size | 7
q)type each flip q
sym  | 11
bid  | 9
ask  | 9
bsize| 7
asize| 7
q)`:/tmp/db2`2015.01.01 dsave`sym xasc'`t`q
`t`q
q)\l /tmp/db2
q)meta t
c    | t f a
-----| -----
date | d    
sym  | s   p
price| f    
size | j    
q)meta q
c    | t f a
-----| -----
date | d    
sym  | s   p
bid  | f    
ask  | f    
bsize| j    
asize| j    
```

See also: 

- [set](values/#set)
- [.Q.en](Cookbook/SplayedTables#Enumerating_varchar_columns_in_a_table "wikilink")
- [.Q.dpft](DotQ/DotQDotdpft "wikilink")
- [.Q.hdpf](DotQ/DotQDotdpft "wikilink")



get
---

Syntax: `get x`

Reads or memory maps kdb+ data file `x`. A type error is thrown if the file is not a kdb+ data file.

Used to map columns of databases in and out of memory when querying splayed databases, and can be used to read q log files etc.
```q
q)\l trade.q
q)`:NewTrade set trade                  / save trade data to file
`:NewTrade
q)t:get`:NewTrade                       / t is a copy of the table
q)`:SNewTrade/ set .Q.en[`:.;trade]     / save splayed table
`:SNewTrade/
q)s:get`:SNewTrade/                     / s has columns mapped on demand
```

!!! Note
    `get` has several other uses. However, the function `value` is the same as `get` and by convention is used in other circumstances. The two are interchangeable, for example, evaluate a character string:
    ```q
    q)value "2+3"
    5
    q)get "2+3"
    5
    ```

FIXME: describe other uses.


hclose
------

Syntax: `hclose x`

Closes file or process handle `x`.
```q
q)h:hopen `::5001
q)h"til 5"
0 1 2 3 4
q)hclose h
q)h"til 5"
': Bad file descriptor
```


hcount
------

Syntax: `hcount x`

Returns as a long integer the size in bytes of file `x`.
```q
q)hcount`:c:/q/test.txt
42j
```
On a compressed file returns the size of the original uncompressed file.



hdel
----

Syntax: `hdel x`

Deletes file `x`.
```q
q)hdel`:test.txt   / delete a file called test.txt in the current working directory
`:test.txt
q)hdel`:test.txt   / should generate an error
'test.txt: No such file or directory
```


hopen
-----

Syntax: `hopen x`

Opens a file or a process handle, where `x` is one of 

- a process handle
- a 2-item list of a process handle and a timeout
- a filename

and returns a positive integer handle.

### TCP

The process argument is a symbol in the form `` `:host:port[:user:password]``. `host` can be a hostname or IP address. Left empty, it denotes the localhost.

### Unix domain sockets

V3.4 also supports Unix domain sockets, where the `hopen` argument has the form `` `:unix://port[:user:password] ``. 

Unix domain sockets can have significantly lower latency and higher throughput than a localhost TCP connection.

### SSL/TLS

V3.4 also supports SSL/TLS connections, where the `hopen` argument has the form`` `:tcps://host:port[:user:password] ``. 

See [Secure connections with SSL/TLS](Cookbook/SSL "wikilink")

### usernames and passwords

User and password are required if the server session has been started with the `-u` or `-U` command line options, and are passed to `.z.pw` for (optional) additional processing.

### timeouts

The optional timeout is in milliseconds and applies to the initial connection, not subsequent use of the connection.

### examples

```q
q)h:hopen `:10.43.23.198:5010                    / IP address
q)h:hopen `:mydb.us.com:5010                     / hostname
q)h:hopen `::5010                                / localhost
q)h:hopen 5010                                   / localhost
q)h:hopen `:unix://5010                          / localhost, Unix domain socket
q)h:hopen `:tcps://mydb.us.com:5010              / SSL/TLS with hostname
q)h:hopen (`:mydb.us.com:5010:elmo:sesame;10000) / full arg list, 10s timeout
```
To send messages to the remote process:
```q
q)h"2+2"          / synchronous (GET)   
4
q)(neg h)"a:2"    / asynchronous (SET)
```
If only one synchronous query/request is to be run, then the single-shot synchronous request can be used to open a connection, send the query, get the results, then close the connection. It is more efficient to keep a connection open if there is an opportunity to re-use it for other queries.
```q
q)`:mydb.us.com:5010:elmo:sesame "1+1"
2
```
See the [Client-Server Cookbook](Cookbook/ClientServer "wikilink").

### file

A file handle is used for writing to a file. The `hopen` argument is a symbol filename:
```q
q)hdat:hopen `:f.dat             / data file (bytes)
q)htxt:hopen `:c:/q/test.txt     / text file
```
To append to these files, the syntax is the same as for IPC:
```q
q)r:hdat 0x2324
q)r:htxt "some text\n"
q)r:htxt ` sv("asdf";"qwer")
```

### Fifo/named pipes

V3.4 Unix builds have support for reading from a Fifo/named pipe, where the `hopen` argument has the form `` `:fifo://filename``.

See also:

- [Fifo/Named Pipes](Cookbook/NamedPipes "wikilink").
- [Client-Server Cookbook](Cookbook/ClientServer "wikilink")
- [Secure connections with SSL/TLS](Cookbook/SSL "wikilink")


hsym
----

Syntax: `hsym x`

Converts symbol `x` into a file name, or valid hostname, or IP address. Since V3.1, `x` can be a symbol list.
```q
q)hsym`c:/q/test.txt
`:c:/q/test.txt
q)hsym`10.43.23.197
`:10.43.23.197
```


load
----

Syntax: `load x`

Loads binary data from the filesystem and returns the name of the table loaded.
```q
q)t:([]x: 1 2 3; y: 10 20 30)
q)save`t             / save to a binary file (same as `:t set t)
`:t
q)delete t from `.   / delete t
`.
q)t                  / not found
't

q)load`t             / load from a binary file (same as t:get `:t)
`t
q)t
x y
----
1 10
2 20
3 30
```
If `x` is a directory, a dictionary of that name is created and all data files are loaded into that dictionary, keyed by file name.
```q
q)\l sp.q
q)\mkdir -p cb
q)`:cb/p set p
`:cb/p
q)`:cb/s set s
`:cb/s
q)`:cb/sp set sp
`:cb/sp
q)load `cb
`cb
q)key cb
`p`s`sp
q)cb `s
s | name  status city
--| -------------------
s1| smith 20     london
s2| jones 10     paris
s3| blake 30     paris
s4| clark 20     london
s5| adams 30     athens
```


read0
-----

Syntax: `read0 x`

Returns data from text file or handle. 

### lines from a text file

Where `x` is a filename, returns the lines of the file as a list of strings. Lines are assumed delimited by either LF or CRLF, and the delimiters are removed.
```q
q)`:test.txt 0:("hello";"goodbye")  / write some text to a file
q)read0`:test.txt
("hello";"goodbye")

q)/ read 500000 lines, chunks of (up to) 100000 at a time
q)d:raze{read0(`:/tmp/data;x;100000)}each 100000*til 5
```

### line from a handle

Where `x` is a [handle](Reference/Number "wikilink") or the [console](Reference/Zero "wikilink"), returns a line of text from it.
```q
q)rl:{1">> ";read0 0}
q)rl`
>> xiskso
"xiskso"
```

### bytes from a text file

Where `x` is a list of the form `(file; offset; length)`, returns bytes from `file`.
```q
q)`:foo 0: enlist "hello world"
q)read0 (`:foo;6;5)
"world"
```
Starting with V3.4 2016.05.31 `read0` allows user to specify how many bytes to read from a Fifo.
```q
q)h:hopen`$":fifo:///etc/redhat-release"
q)read0(h;8)
"Red Hat "
q)read0(h;8)
"Enterpri"
```


read1
-----

Syntax: `read1 x`

Returns bytes from a file or named pipe. 

Where `x` has the form `(file; offset; length)`, returns corresponding bytes from `file`. Where only `file` is supplied, the content of the entire file is returned.
```q
q)`:test.txt 0:("hello";"goodbye")      / write some text to a file
q)read1`:test.txt                       / read in as bytes
0x68656c6c6f0a676f6f646279650a
q)"c"$read1`:test.txt                   / convert from bytes to char
"hello\ngoodbye\n"

q)/ read 500000 lines, chunks of (up to) 100000 at a time
q)d:raze{read1(`:/tmp/data;x;100000)}each 100000*til 5 
```
In V3.4 you can specify how many bytes to read from fifo.
```q
q)h:hopen`$":fifo:///etc/redhat-release"
q)"c"$read1(h;8)
"Red Hat "
q)"c"$read1(h;8)
"Enterpri"
```


rload
-----

Syntax: `rload x`

Load a splayed table: where `x` is the table name as a symbol, the table is read from a directory of the same name. `rload` is the converse of `rsave`. 

The usual, and more general, way of doing this is to use `get`, which allows a table to be defined with a different name than the source directory.
```q
q)\l sp.q
q)rsave `sp           / save splayed table
`:sp/
q)delete sp from `.
`.
q)sp
'sp
q)rload `sp           / load splayed table
`sp
q)3#sp
s  p  qty
---------
s1 p1 300
s1 p2 200
s1 p3 400
q)sp:get `:sp/        / equivalent to rload `sp
```


rsave
-----

Syntax: `rsave x`

Save a table, splayed to a directory of the same name: where `x` is the table name as a symbol. The table must be fully enumerated and not keyed.

The usual and more general way of doing this is to use `set` , which allows the target directory to be given.
```q
q)\l sp.q
q)rsave `sp           / save splayed table
`:sp/
q)\ls sp
,"p"
"qty"
,"s"
q)`:sp/ set sp        / equivalent to rsave `sp
`:sp/
```


save
----

Syntax: `save x`

Save global data to file: where `x` is the filename as a symbol, returns the filename itself. The file shortname (ignoring path and extension) must match the name of a global table. The format used depends on the file extension:

-   no extension – saved as binary
-   .csv – comma-separated values
-   .txt – plain text
-   .xls – Excel spreadsheet
-   .xml – Extensible Markup Language (XML)

```q
q)t:([]x:2 3 5;y:`ibm`amd`intel;z:"npn")
```
### binary
```q
q)save `t
`:t
q)read0 `:t
"\377\001b\000c\013\000\003\000\000\000x\000y\000z\000\000\..
"\000\003\000\000\000npn"
```
### CSV
```q
q)save `t.csv
`:t.csv
q)read0 `:t.csv
"x,y,z"
"2,ibm,n"
"3,amd,p"
"5,intel,n"
```
### text
```q
q)save `t.txt
`:t.txt
q)read0 `:t.txt      / columns are tab separated
"x\ty\tz"
"2\tibm\tn"
"3\tamd\tp"
"5\tintel\tn"
```
### Excel
```q
q)save `t.xls
`:t.xls
q)read0 `:t.xls
"<?xml version=\"1.0\"?><?mso-application progid=\"Excel.Sheet\"?>"
"<Workbook xmlns=\"urn:schemas-microsoft-com:office:spreadsheet\" x...
```
### XML
```q
q)save `t.xml
`:t.xml
q)read0 `:t.xml   / tab separated
"<R>"
"<r><x>2</x><y>ibm</y><z>n</z></r>"
"<r><x>3</x><y>amd</y><z>p</z></r>"
"<r><x>5</x><y>intel</y><z>n</z></r>"
"</R>"
```
You can specify a path for the file:
```q
q)save `$"/tmp/t"
`:/tmp/t
```

!!! tip "Saving local data"
    To save local data you can do explicitly what `save` is doing under the covers.
    ```q
    q)`:t set t /save in binary format as a single file
    q)/ save in binary format as a splayed table 
    q)/ (1 file/column, symbols enumerated against the sym file in current dir)
    q)`:t/ set .Q.en[`:.;t] 
    q)`:t.csv 0:.h.tx[`csv;t] / save in csv format
    q)`:t.txt 0:.h.tx[`txt;t] / save in txt format
    q)`:t.xml 0:.h.tx[`xml;t] / save in xml format
    q)`:t.xls 0:.h.tx[`xls;t] / save in xls format
    ```

set
---

Syntax: `x set y`

Assigns the value of `y` to variable name or filename `x`
```q
q)`a set 1 2 3            / set name a
`a
q)a
1 2 3

q)a:`t
q)a set 1 2 3             / set name t (indirect assignment)
`t
q)t
1 2 3

q)a:"t"
q)a set 1 2 3             / fails, as name must be a symbol
:["type"]
```
If `x` is a filename, the values are written to file:
```q
q)`:work.dat set 1 2 3    / write values to file
`:work.dat
q)get `:work.dat
1 2 3
```
Write a table to a single file:
```q
q)\l sp.q
q)`:mytable.dat set sp
`:mytable.dat
q)get `:mytable.dat
s  p  qty
---------
s1 p1 300
s1 p2 200
s1 p3 400
..
```
To save a table splayed across a directory, `x` must be a path (i.e. ends with a `/`), and the table must be fully enumerated, with no primary keys:
```q
q)`:mydata/ set sp
`:mydata/
q)\ls mydata
,"p"
"qty"
,"s"
q)get `:mydata
s  p  qty
---------
s1 p1 300
s1 p2 200
s1 p3 400
..
```

!!! warning "Watch out"
    Avoid setting variables in the `.q` namespace, as undesired and confusing behaviour can result.

