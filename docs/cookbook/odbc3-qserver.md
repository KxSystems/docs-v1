The latest release of ODBC3 server for q is available here: [qodbc3.zip <i class="fa fa-download"></i>](https://kx.com/q/c/qodbc3.zip). The ODBC3 server allows applications to query q via the ODBC interface. Currently the applications may run on the following platforms: w64, w32, l64, l32. Primary compatibility target has been <a target="_blank" href="https://www.tableau.com/">Tableau <i class="fa fa-external-link"></i></a>, although other uses are welcome.

Requirements: V3.2 or later.

!!! tip "Reporting problems"
    When reporting a problem (e.g. SQL error, wrong results, slowness, segfault etc.) make sure to include steps to reproduce along with your ODBC trace.

## Installation

### Windows

1. Close Tableau or anything that uses ODBC
2. Extract qodbc3.zip to temporary location. Go to the directory corresponding to your OS architecture (w64 or w32)
3.  Run d0.exe as Administrator. This will copy qodbc3.dll to the correct location – you don't need to do that yourself.
4.  You will now be able to add new q DSNs (data sources) in the `ODBC Data Source Administrator (64-bit)` (or `32-bit` if on 32-bit OS). Make sure to select `kdb+(odbc3)` in the list of drivers. You will be prompted for DSN name, hostname, port, username and password.
5.  In the ODBC data source administrator, click _Start Tracing_ on the _Tracing_ tab.
6.  Copy q.tdc to My Documents\My Tableau Repository\Datasources
7.  Copy ps.k to `$QHOME`


### Linux

Requirements: <a target="_blank" href="http://www.unixodbc.org/">unixODBC <i class="fa fa-external-link"></i></a> 2.3.4, <a target="_blank" href="https://www.gnu.org/software/binutils/">Binutils <i class="fa fa-external-link"></i></a> (ld)
```bash
$ cd qodbc3/l64
$ wget https://kx.com/q/l64/c.o
$ ld -o qodbc3.so -shared qodbc3.o c.o -lodbc -lodbcinst -lm
```
Add a DSN entry to your ~/.odbc.ini file:
```
[your_dsn_name]
Description=kdb+
Driver=/path/to/qodbc3.so
HOST=your.host:port
UID=username
PWD=password
```
You should now be able to connect to your DSN with `isql`:
```bash
$ isql -3 -v -k 'DSN=your_dsn_name;'
```


## Running

Ensure you have ps.k loaded into the q process specified in your DSN:
```q
q)\l ps.k
```


## Notes

To use q from Tableau’s Custom SQL use the `q()` function, e.g.:

`q('select p,name,color,city from f[]')` or  
`q('functionname',<parameter1>,<parameter2>)` or  
`   q('{f[x;y]}',<parameter1>,<parameter2>)`

Parameters can be supplied by Tableau. Note that Tableau’s _string_ type corresponds to q’s symbol and _datetime_ corresponds to timestamp.

test.q provides additional examples of SQL usage, including the create/insert/update/delete statement syntax.


## Compatibility

The driver translates SQL expressions into q and inherits q’s data model. This gives rise to the following SQL compatibility issues:

1.  SQL string literals are trimmed like q symbols
2.  `MIN()` and `MAX()` don't work on strings
3.  q strings and bools lack nulls, therefore SQL operations on null data resulting in these types ‘erase’ nulls
4.  `COUNT` and `COUNT DISTINCT` don’t ignore nulls

Also, SQL selects from partitioned tables are not supported – one should pre-select from a partitioned table using the `q()` function instead.
