Q has limited support for ODBC. In general, ODBC is not recommended for large databases – for performance reasons – but may be acceptable for small databases, or for one-off data import and export.

- in Windows and Linux, `q` can use ODBC to access a non-q database  
<i class="fa fa-hand-o-right"></i> [q as ODBC client](odbc-qclient)
- in Windows only, a non-q client can use ODBC to access a q database  
<i class="fa fa-hand-o-right"></i> [q as ODBC server](odbc-qserver) or the successor [ODBC3 q server](odbc3-qserver)

<i class="fa fa-hand-o-right"></i> John Ludlow’s <a target="_blank" href="https://github.com/kxcontrib/jludlow/blob/master/docs/odbc.pdf">How to get kdb+ to talk to other databases <i class="fa fa-file-pdf-o"></i></a>

<i class="fa fa-hand-o-right"></i> Charles Skelton’s <i class="fa fa-github"></i> <a target="_blank" href="https://github.com/CharlesSkelton/babel">Babel for kdb+</a> if you don’t like to configure or use ODBC

