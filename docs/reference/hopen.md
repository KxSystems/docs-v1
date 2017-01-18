Opens a file or process handle.

Syntax
------

    q)h:hopen process
    q)h:hopen (process;timeout)
    q)h:hopen filename

The result is a positive integer handle.

IPC
---

### tcp

The process argument is a symbol:

  
  
`` `:host:port[:user:password] ``

Host can be a hostname or ipaddress. If empty, this means the localhost.

### unix domain sockets

V3.4 also supports unix domain sockets, where the hopen process argument has the format

  
  
`` `:unix://port[:user:password] ``

unix domain sockets can have significantly lower latency and higher throughput than a localhost tcp connection.

### SSL/TLS

V3.4 also supports SSL/TLS connections, where the hopen process argument has the format

  
  
`` `:tcps://host:port[:user:password] ``

For more information about SSL/TLS, see [ Secure connections with SSL/TLS](Cookbook/SSL "wikilink")

### usernames and passwords

User and password are required if the server session has been started with the -u or -U command line flags, and are passed to `.z.pw` for (optional) additional processing.

### timeouts

The optional timeout is in milliseconds and applies to the initial connection, not subsequent use of the connection.

### examples

For example:

    q)h:hopen `:10.43.23.198:5010                    / using ipaddress
    q)h:hopen `:mydb.us.com:5010                     / using hostname
    q)h:hopen `::5010                                / localhost
    q)h:hopen 5010                                   / localhost
    q)h:hopen `:unix://5010                             / localhost via unix domain socket
    q)h:hopen `:tcps://mydb.us.com:5010 /using ssl/tls with hostname
    q)h:hopen (`:mydb.us.com:5010:elmo:sesame;10000) / full argument list, 10 second timeout

To send messages to the remote process:

    q)h"2+2"          / synchronous (GET)   
    4
    q)(neg h)"a:2"    / asynchronous (SET)

If only one synchronous query/request is to be run, then the single shot synchronous request can be used to open a connection, send the query, get the results, then close the connection. It's more efficient to keep a connection open if there's the opportunity to re-use for other queries.

    q)`:mydb.us.com:5010:elmo:sesame "1+1"
    2

For more information about communicating between processes, see the [Client-Server Cookbook](Cookbook/ClientServer "wikilink").

File
----

A file handle is used for writing to a file. The hopen argument is a symbol filename:

    q)hdat:hopen `:f.dat             / data file (bytes)
    q)htxt:hopen `:c:/q/test.txt     / text file

To append to these files, the syntax is the same as for ipc:

    hdat 0x2324
    htxt "some text\n"
    htxt ` sv("asdf";"qwer")

Fifo/Named Pipes
----------------

V3.4 unix builds have support for reading from a fifo/named pipe, where the hopen filename argument has the format

  
  
`` h:hopen`:fifo://filename ``

For more information about communicating between processes, see [Fifo/Named Pipes](Cookbook/NamedPipes "wikilink").

See also
--------

-   [hsym](Reference/hsym "wikilink")
-   [hclose](Reference/hclose "wikilink")
-   [Client-Server Cookbook](Cookbook/ClientServer "wikilink")
-   [ Secure connections with SSL/TLS](Cookbook/SSL "wikilink")

