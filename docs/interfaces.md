# Interfaces and editor integrations

<i class="fa fa-hand-o-right"></i> [General index](/github) of other kdb+ repositories

Repositories at :fa-github: [KxSystems](https://github.com/KxSystems) are maintained and supported by Kx Systems. 
Other repositories are maintained by their owners. 

!!! warning "Salvaged repositories"

    <i class="fa fa-github"></i> [kxcontrib](https://github.com/kxcontrib) contains repositories salvaged from the former Subversion server for which we have been unable to identify current versions on GitHub. These repositories are not maintained. 

<div style="background-color: #efefef; border: 1px solid #005499; border-radius: 10px; display: inline-block; padding: 0 1em;" markdown="1">Please tell [librarian@kx.com](mailto:librarian@kx.com)
about new repositories.</div>


## <i class="fa fa-superpowers"></i> Fusion interfaces

The [Fusion interfaces](interfaces/fusion) to kdb+ are

-   written for non-kdb+ programmers to use
-   well documented, with understandable and useful examples
-   maintained and supported by Kx on a best-efforts basis, at no cost to customers
-   released under the [Apache 2 license](https://www.apache.org/licenses/LICENSE-2.0)
-   free for all use cases, including 64-bit and commercial use
<!-- -   written from the perspective of the ‘remote’ technology: e.g. a Java interface that is intelligible to a Java programmer -->

<table class="kx-compact" markdown="1">
<tr><td>FFI</td><td>[Using foreign functions with kdb+](/interfaces/ffi)</td></tr>
<tr><td>Java</td><td>[Java client for kdb+](/interfaces/java-client-for-q)</td>
<tr><td>Jupyter</td><td>[Jupyter kernel for kdb+](/ml/jupyterq) ==new==</td>
<tr><td>Kafka</td><td>[Q client for Kafka](/interfaces/kafka)</td></tr>
<tr><td>Python</td>
    <td>
[Using Python with kdb+ (PyQ)](/interfaces/pyq)<br/>
[Using Python with kdb+ (embedPy)](/ml/embedpy)
    </td></tr>
<tr><td>R</td><td>[Using R with kdb+](/interfaces/with-r/#calling-q-from-r)</td>
</tr>
</table>


## :fa-server: Kdb+ as server

<table class="kx-compact" markdown="1">
<tr><td>Adobe Flex</td><td>:fa-github: [quantbin/kdb](https://github.com/quantbin/kdb)</td></tr>
<tr>
    <td>ADO.Net</td>
    <td>
:fa-github: [ScottWeinstein/Linq2KdbQ](https://github.com/ScottWeinstein/Linq2KdbQ)<br/>
:fa-github: [sv/kp.net](https://github.com/sv/kp.net)
    </td>
</tr>
<tr><td>amCharts</td><td>:fa-github: [kxcontrib/cburke/amcharts](https://github.com/kxcontrib/cburke/tree/master/amcharts/)</td></tr>
<tr><td>AQuery</td><td>:fa-github: [josepablocam/aquery](https://github.com/josepablocam/aquery) ==new==</td></tr>
<tr><td>C</td><td>[C client for kdb+](/interfaces/c-client-for-q)</td></tr>
<tr><td>CZMQ</td><td>:fa-github: [jaeheum/qzmq](https://github.com/jaeheum/qzmq)</i></td></tr>
<tr><td>C#</td><td>[C# client for kdb+](/interfaces/csharp-client-for-q/)<br/>
:fa-github: [exxeleron/qSharp](https://github.com/exxeleron/qSharp)</td></tr>
<tr>
    <td>Erlang</td>
    <td>
:fa-github: [exxeleron/qErlang](https://github.com/exxeleron/qErlang/)<br/>
:fa-github: [republicwireless-open/gen_q](https://github.com/republicwireless-open/gen_q)<br/>
:fa-github: [michaelwittig/erlang-q](https://github.com/michaelwittig/erlang-q)
    </td>
</tr>
<tr>
    <td>Excel</td>
    <td>
[Excel client for kdb+](interfaces/excel-client-for-q/)<br/>
:fa-github: [exxeleron/qXL](https://github.com/exxeleron/qXL)<br/>
:fa-github: [CharlesSkelton/excelrtd](https://github.com/exxeleron/qXL)
    </td>
</tr>
<tr><td>F#</td><td>:fa-github: [kimtang/c.fs](https://github.com/kimtang/c.fs)</td></tr>
<tr><td>Go</td><td>:fa-github: [sv/kdbgo](https://github.com/sv/kdbgo)</td></tr>
<tr>
    <td>Haskell</td>
    <td>
:fa-github: [carrutstick/hasq](https://github.com/carrutstick/hasq)<br/>
:fa-github: [jkozlowski/kdb-haskell](https://github.com/jkozlowski/kdb-haskell)
    </td>
</tr>
<tr><td>J</td><td>[J client for kdb+](/interfaces/j-client-for-q/)</td></tr>
<tr>
    <td>Java</td>
    <td>
:fa-github: [CharlesSkelton/jshow](https://github.com/CharlesSkelton/jshow)<br/>
:fa-github: [exxeleron/qJava](https://github.com/exxeleron/qJava)<br/>
:fa-github: [michaelwittig/java-q](https://github.com/michaelwittig/java-q)
    </td>
</tr>
<tr>
    <td>JDBC</td>
    <td>[JDBC client for kdb+](/interfaces/jdbc-client-for-kdb/)</td>
</tr>
<tr>
    <td>JavaScript</td>
    <td>
[WebSockets](/cookbook/websockets)<br/>
:fa-github: [KxSystems/kdb/c/c.js](https://github.com/KxSystems/kdb/blob/master/c/c.js)<br/>
:fa-github: [kxcontrib/cbutler/ChartsForKdb](https://github.com/kxcontrib/cbutler/tree/master/ChartsForKdb)<br/>
:fa-github: [MdSalih/Kdb-Stuff/IPCWebParse](https://github.com/MdSalih/Kdb-Stuff/tree/master/IPCWebParse)<br/>
:fa-github: [michaelwittig/java-q](https://github.com/michaelwittig/java-q)
    </td>
</tr>
<tr><td>Lua</td><td>:fa-github: [geocar/qlua](https://github.com/geocar/qlua)</td></tr>
<tr>
    <td>Mathematica</td>
    <td>
        :fa-github: [KxSystems/kdb/c/other/qmathematica.txt](https://github.com/KxSystems/kdb/blob/master/c/other/qmathematica.txt)
    </td>
</tr>
<tr><td>Matlab</td>
<td>
[Matlab client for kdb+](/interfaces/matlab-client-for-q/)<br/>
:fa-github: [dmarienko/kdbml](https://github.com/dmarienko/kdbml)</td></tr>
<tr><td>NaCL</td><td>:fa-github: [geocar/qsalt](https://github.com/geocar/qsalt)</td></tr>
<tr>
    <td>NodeJS</td>
    <td>
:fa-github: [geocar/qnode](https://github.com/geocar/qnode)<br/>
:fa-github: [michaelwittig/node-q](https://github.com/michaelwittig/node-q)
    </td>
</tr>
<tr><td>ODBC</td><td>[Kdb+ server for ODBC](/interfaces/q-server-for-odbc/)<br/>
[Kdb+ server for ODBC3](/interfaces/q-server-for-odbc3/)</td></tr>
<tr>
    <td>Perl</td>
    <td>
[Perl client for kdb+](/interfaces/perl-client-for-q/)<br/>
:fa-github: [wjackson/anyevent-k](https://github.com/wjackson/anyevent-k)<br/>
:fa-github: [wjackson/k-perl](https://github.com/wjackson/k-perl)
    </td>
</tr>
<tr>
    <td>PHP</td>
    <td>
:fa-github: [geocar/qphp](https://github.com/geocar/qphp)<br/>
:fa-github: [johnanthonyludlow/kdb/docs/phptoq.pdf](https://github.com/johnanthonyludlow/kdb/blob/master/docs/phptoq.pdf)
    </td>
</tr>
<tr><td>PLplot</td><td>:fa-github: [jaeheum/qplplot](https://github.com/jaeheum/qplplot)</td></tr>
<tr><td>Python</td>
    <td>
<!-- [Using Python with kdb+](/interfaces/with-python/)<br/> -->
:fa-github: [brogar/pykdb](https://github.com/brogar/pykdb)<br/>
:fa-github: [enlnt/pyk](https://github.com/enlnt/pyk)<br/>
<!-- :fa-github: [enlnt/pyq](https://github.com/enlnt/pyq)<br/> -->
:fa-github: [eschnapp/q](https://github.com/eschnapp/q)<br/>
:fa-github: [nugend/q](https://github.com/nugend/q)<br/>
:fa-github: [nugend/qPython](https://github.com/nugend/qPython)<br/>
:fa-github: [exxeleron/qPython](https://github.com/exxeleron/qPython)<br/>
:fa-github: [kingan/mongodb_kdb_python_connection](https://github.com/kingan/mongodb_kdb_python_connection)
    </td></tr>
<tr><td>R</td><td>:fa-github: [yang-guo/qserver](https://github.com/yang-guo/qserver)</td></tr> 
<tr>
    <td>Rust</td>
    <td>
:fa-github: [adwhit/krust](https://github.com/adwhit/krust)<br/>
:fa-github: [jnordwick/rik](https://github.com/jnordwick/rik)
    </td>
</tr>
<tr><td>Scala</td><td>[Scala client for kdb+](/interfaces/scala-client-for-q/)</td></tr>
</table>


## <i class="fa fa-handshake-o"></i> Q as client

<table class="kx-compact" markdown="1">
<tr><td>Betfair</td><td>:fa-github: [picoDoc/betfair-data-capture](https://github.com/picoDoc/betfair-data-capture)</td></tr>
<tr><td><i class="fa fa-bitcoin"></i> Bitcoin</td><td>:fa-github: [bitmx/btceQ](https://github.com/bitmx/btceQ)</td></tr>
<tr><td>Bloomberg</td><td>[Q client for Bloomberg](/interfaces/q-client-for-bloomberg)</td></tr>
<tr><td>[BosonNLP](http://bosonnlp.com/)</td><td>:fa-github: [FlyingOE/q_BosonNLP](https://github.com/FlyingOE/q_BosonNLP)</td></tr>
<tr><td>CUDA</td><td>[GPUs](/interfaces/gpus/)</td></tr>
<tr><td>Expat XML parser</td><td>:fa-github: [felixlungu/qexpat](https://github.com/felixlungu/qexpat)</td></tr>
<tr><td>[Factom](https://www.factom.com/) blockchain</td><td>:fa-github: [jlucid/qfactom](https://github.com/jlucid/qfactom)</td></tr>
<tr><td>ForexConnect</td><td>:fa-github: [mortensorensen/qfxcm](https://github.com/mortensorensen/qfxcm)</td></tr>
<tr><td>Interactive Brokers</td><td>:fa-github: [mortensorensen/QInteractiveBrokers](https://github.com/mortensorensen/QInteractiveBrokers)</td></tr>
<tr><td>[IEX](https://iextrading.com)</td><td>:fa-github: [himoacs/iex_q](https://github.com/himoacs/iex_q)</td></tr>
<tr><td>J</td><td>[Q client for J](/interfaces/q-client-for-j/)</td></tr>
<tr><td>JDBC</td><td>:fa-github: [CharlesSkelton/babel](https://github.com/CharlesSkelton/babel)</td></tr>
<tr><td>MQTT</td><td>:fa-github: [himoacs/mqtt-q](https://github.com/himoacs/mqtt-q) ==new==</td></tr>
<tr><td>ODBC</td><td>[Q client for ODBC](/interfaces/q-client-for-odbc)<br/>
:fa-github: [johnanthonyludlow/kdb/docs/odbc.pdf](https://github.com/johnanthonyludlow/kdb/blob/master/docs/odbc.pdf)</td></tr>
<tr><td>Philips Hue</td><td>:fa-github: [jparmstrong/qphue](https://github.com/jparmstrong/qphue)</td></tr>
<tr><td>R</td><td>[Using R with kdb+](/interfaces/with-r/#calling-r-from-q)</td></tr>
<tr><td>Reuters</td><td>:fa-github: [KxSystems/kdb/c/feed/rfa.zip](https://github.com/KxSystems/kdb/blob/master/c/feed/rfa.zip)</td></tr>
<tr><td>TSE FLEX</td><td>:fa-github: [Naoki-Yatsu/TSE-FLEX-Converter](https://github.com/Naoki-Yatsu/TSE-FLEX-Converter)</td></tr>
<tr><td><i class="fa fa-twitter"></i> Twitter</td><td>:fa-github: [gartinian/kdbTwitter](https://github.com/gartinian/kdbTwitter)</td></tr>
<tr><td>[Wind资讯](http://www.wind.com.cn/en/)</td><td>:fa-github: [FlyingOE/q_Wind](https://github.com/FlyingOE/q_Wind)</td></tr>
<tr><td><i class="fa fa-yahoo"></i> Yahoo!</td><td>:fa-github: [fdeleze/tickYahoo](https://github.com/fdeleze/tickYahoo)</td></tr>
</table>



## :fa-map-signs: Foreign functions 

<table class="kx-compact" markdown="1">
<tr><td>[Boost](http://www.boost.org/) math library</td><td>:fa-github: [kimtang/bml](https://github.com/kimtang/bml)</td></tr>
<tr>
    <td>C/C++</td>
    <td>
[Using C/C++ functions](interfaces/using-c-functions)<br/>
:fa-github: [enlnt/ffiq](https://github.com/enlnt/ffiq)<br/>
:fa-github: [felixlungu/c](https://github.com/felixlungu/c)
    </td>
</tr>
<tr><td>Fortran</td><td>:fa-github: [johnanthonyludlow/kdb/docs/fortran.pdf](https://github.com/kxcontrib/jludlow/blob/master/docs/fortran.pdf)</td></tr>
<tr><td>gnuplot</td><td>:fa-github: [kxcontrib/zuoqianxu/qgnuplot](https://github.com/kxcontrib/zuoqianxu/tree/master/qgnuplot)</td></tr>
<tr><td>Google Charts</td><td>:fa-github: [kxcontrib/zuoqianxu/qgooglechart](https://github.com/kxcontrib/zuoqianxu/tree/master/qgooglechart)</td></tr>
<tr><td>LAPACK, Cephes and FDLIBM</td><td>[althenia.net/qml](http://althenia.net/qml)</td></tr>
<tr><td>Mathematica</td><td>:fa-github: [kxcontrib/zuoqianxu/qmathematica](https://github.com/kxcontrib/zuoqianxu/tree/master/qmathematica)</td></tr>
<tr><td>Matlab</td><td>:fa-github: [kxcontrib/zuoqianxu/qmatlab](https://github.com/kxcontrib/zuoqianxu/tree/master/qmatlab)</td></tr>
<tr><td>Perl</td><td>:fa-github: [kxcontrib/zuoqianxu/qperl](https://github.com/kxcontrib/zuoqianxu/tree/master/qperl)</td></tr>
<tr><td>Python</td><td>
:fa-github: [kxcontrib/serpent.speak](https://github.com/kxcontrib/serpent.speak)<br/>
:fa-github: [kxcontrib/zuoqianxu/qpython](https://github.com/kxcontrib/zuoqianxu/tree/master/qpython)
</td></tr>
<tr><td>Non-linear least squares</td><td>:fa-github: [brogar/nls](https://github.com/brogar/nls)</td></tr>
<tr><td>Regular Expressions</td><td>[Regex libraries](/cookbook/regex/#regex-libraries)</td></tr>
<tr><td>R</td><td>:fa-github: [kimtang/rinit](https://github.com/kimtang/rinit)<br/>
:fa-github: [rwinston/kdb-rmathlib](https://github.com/rwinston/kdb-rmathlib)</td></tr>
<tr>
    <td>Rust</td>
    <td>
        :fa-github: [adwhit/krust](https://github.com/adwhit/krust)<br>
        :fa-github: [redsift/rkdb](https://github.com/redsift/rkdb) ==new==<br>
        :fa-github: [redsift/kdb-rs-hash](https://github.com/redsift/kdb-rs-hash) ==new==
    </td>
</tr>
<tr><td>TA-Lib</td><td>:fa-github: [kxcontrib/zuoqianxu/qtalib](https://github.com/kxcontrib/zuoqianxu/tree/master/qtalib)</td></tr>
<tr><td>ZeroMQ</td><td>:fa-github: [wjackson/qzmq](https://github.com/wjackson/qzmq)</td></tr>
</table>


## :fa-plug: Editor integrations

<table class="kx-compact" markdown="1">
<tr>
    <td>Atom</td>
    <td>
:fa-github: [derekwisong/atom-q](https://github.com/derekwisong/atom-q)<br/>
:fa-github: [quintanar401/atom-charts](https://github.com/quintanar401/atom-charts)<br/>
:fa-github: [quintanar401/connect-kdb-q](https://github.com/quintanar401/connect-kdb-q)
    </td>
</tr>
<tr><td>Eclipse</td><td>[qkdt.org](http://www.qkdt.org/features.html)</td></tr>
<tr><td>Emacs</td>
    <td>
:fa-github: [eepgwde/kdbp-mode](https://github.com/eepgwde/kdbp-mode)<br/>
:fa-github: [geocar/kq-mode](https://github.com/geocar/kq-mode)<br/>
:fa-github: [indiscible/emacs](https://github.com/indiscible/emacs)<br/>
:fa-github: [psaris/q-mode](https://github.com/psaris/q-mode)
    </td>
</tr>
<tr><td>Evolved</td><td>:fa-github: [simongarland/Syntaxhighlighter-for-q](https://github.com/simongarland/Syntaxhighlighter-for-q)</td></tr>
<tr><td>Heroku</td><td>:fa-github: [gargraman/heroku-buildpack-kdb](https://github.com/gargraman/heroku-buildpack-kdb)</td></tr>
<tr><td>IntelliJ IDEA</td>
    <td>
:fa-github: [a2ndrade/k-intellij-plugin](https://github.com/a2ndrade/k-intellij-plugin)<br/>
:fa-gitlab: [shupakabras/kdb-intellij-plugin](https://gitlab.com/shupakabras/kdb-intellij-plugin) ==new==
    </td>
</tr>
<tr><td>Jupyter</td>
    <td>
:fa-github: [jvictorchen/IKdbQ](https://github.com/jvictorchen/IKdbQ)<br/>
:fa-github: [newtux/KdbQ_kernel](https://github.com/newtux/KdbQ_kernel)
    </td></tr>
<tr><td>Linux, macOS, Unix</td><td>:fa-github: [enlnt/kdb-magic](https://github.com/enlnt/kdb-magic)</td></tr>
<tr><td>Pygments</td><td>:fa-github: [jasraj/q-pygments](https://github.com/jasraj/q-pygments)</td></tr>
<tr>
    <td>Sublime Text</td>
    <td>
:fa-github: [smbody-mipt/kdb](https://github.com/smbody-mipt/kdb) ==new==<br/>
:fa-github: [kimtang/QStudio](https://github.com/kimtang/QStudio)<br/>
:fa-github: [kimtang/sublime-q](https://github.com/kimtang/sublime-q)<br/>
:fa-github: [kimtang/Q](https://github.com/kimtang/Q)<br/>
:fa-github: [komsit37/sublime-q](https://github.com/komsit37/sublime-q)
    </td>
</tr>
<tr>
    <td>TextMate</td><td>:fa-github: [psaris/KX.tmbundle](https://github.com/psaris/KX.tmbundle) ==new==</td>
</tr>
<tr>
    <td>vim</td>
    <td>
:fa-github: [katusk/vim-qkdb-syntax](https://github.com/katusk/vim-qkdb-syntax)<br/>
:fa-github: [patmok/qvim](https://github.com/patmok/qvim)<br/>
:fa-github: [simongarland/vim](https://github.com/simongarland/vim)
    </td>
</tr>
<tr>
    <td>Visual Studio Code</td><td>:fa-github: [lwshang/vscode-q](https://github.com/lwshang/vscode-q)</td>
</tr>
<tr>
    <td>WordPress</td><td>:fa-github: [simongarland/Syntaxhighlighter-for-q](https://github.com/simongarland/Syntaxhighlighter-for-q) ==new==</td>
</tr>
</table>

