_Babel for kdb+_ is a SQL gateway process that allows q to query other vendors’ databases via JDBC.

![Babel](/img/babel.png)


## Install

1. Download <i class="fa fa-github"></i> [CharlesSkelton/babel](https://github.com/CharlesSkelton/babel) 
2. Unzip babel.zip, retaining the directory structure.


## Launch

```bash
$ java -Xmx512m -jar babel.jar 6868 com.mysql.jdbc.Driver
```
which is of the pattern
```
$ java -jar babel.jar listeningport jdbcdriver1 jdbcdriver2 ... jdbcdriverN
```
If you don’t specify the port 6868 it will default to listening on port 9999. It will accept connections from localhost only, and logs to stdout.

Alternatively, you can ignore that babel.jar is an executable JAR and run with full command-line options. For Oracle, this could be:
```bash
$ java -Xmx1024m -Doracle.jdbc.defaultRowPrefetch=10000 -cp "babel.jar:lib/ojdbc6.jar" de.skelton.babel.Babel 6868 oracle.jdbc.OracleDriver
```


## Building a connection and issuing a query

From q you connect as
```q
q)h:hopen 6868
```
and send queries as a sync request using the following format
```q
q)handle("query|update|string";"jdbc url";"query text")
```
e.g.
```q
q)r:h("query";"jdbc:mysql://ensembldb.ensembl.org:3306?user=anonymous&amp;zeroDateTimeBehavior=convertToNull";"show databases")
```
Replacing `"query"` with `"string"` will force all columns to be interpreted as varchar type; this is intended for debug of type mappings only, and not recommended for regular queries.


## Async requests

In addition to sync requests, Babel can process async requests in the form
```q
q)neg[handle]([`callbackFn`callbackTag!`myfn`mytag;]"query|update";"jdbc url";"query text")
```
e.g. Babel will callback ``myfn[`mytag;(0|1;errorText|resultSet)]``
```q
q)myfn:{0N!(x;y);}
q)neg[h](`callbackFn`callbackTag!`myfn`mytag;"query";"jdbc:mysql://ensembldb.ensembl.org:3306?user=anonymous&amp;zeroDateTimeBehavior=convertToNull";"show databases")
```
or collect the result via `h[]`
```q
q)neg[h]("query";"jdbc:mysql://ensembldb.ensembl.org:3306?user=anonymous&amp;zeroDateTimeBehavior=convertToNull";"show databases")
q)r:h[] / (0|1;errorText|resultSet)
```
<i class="fa fa-hand-o-right"></i> [https://github.com/CharlesSkelton/babel/readme.txt](https://github.com/CharlesSkelton/babel/blob/master/readme.txt)

Drivers for the following databases are loaded by default (JARs found in `lib` subdir relative to babel.jar):

<http://csvjdbc.sourceforge.net>

<http://hsqldb.org>

<http://www.mysql.com>

<http://www.microsoft.com/en-us/sqlserver/default.aspx>


## Specifying your JDBC driver and repacking the JAR

If you want to continue to launch the executable JAR directly, and you need to add your driver to the path, do the following:

1. Download and unzip the latest babel.zip
2. Extract the JAR to its raw components
    ```
    $ jar -xvf babel.jar
    ```
3. Edit META-INF/MANIFEST.MF, adding your database JAR path to the classpath in that manifest file
4. Update the JAR with the modified file
    ```bash
    $ jar umf META-INF/MANIFEST.MF babel.jar
    ```

(If you know of a better way to achieve this please tell librarian@kx.com.)


## Default row prefetch

When extracting data from some Oracle databases, users have discovered that the default fetch size for the Oracle JDBC driver is too small and impacts performance very badly. This can be influenced by setting the default fetch size as a command-line option to Java, using `-Doracle.jdbc.defaultRowPrefetch=10000` e.g.
```bash
$java -Doracle.jdbc.defaultRowPrefetch=10000 -Xmx512m -jar babel.jar 6868 ....
```


## Datatype conversion for `NUMERIC` and `DECIMAL` types

The default type for `NUMERIC` and `DECIMAL` is a String. However, the data will be converted into an actual number if the following criteria are met:

| precision | scale         | data type |
|-----------|---------------|-----------|
| &le; 9    | 0 or -127     | Integer   |
| &le; 18   | 0 or -127     | Long      |
| &le; 7    | not 0 or -127 | Float     |
| &le; 15   | not 0 or -127 | Double    |


