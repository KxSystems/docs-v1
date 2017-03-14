<div class="kx-zero">
<img src="../img/hieroglyphics.png" style="width: 100%"/>
</div>

Q is bigger than it looks: tokens play different roles, according to context. Here is a complete guide. 


## Reserved words

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`abs`](reference/arithmetic-integer/#abs "absolute value"), [`acos`](reference/trigonometry/#acos "arc cosine"), [`aj`](reference/joins/#aj "as-of join"), [`aj0`](reference/joins/#aj "as-of join"), [`all`](reference/logic/#all "all nonzero"), [`and`](reference/logic/#and "minimum"), [`any`](reference/logic/#any "any element is non-zero"), [`asc`](reference/sortfunctions/#asc "ascending sort"), [`asin`](reference/joins/#asin "arc sine"), [`asof`](reference/joins/#asof "as-of verb"), [`atan`](reference/trigonometry/#atan "arc tangent"), [`attr`](reference/metadata/#attr "attributes"), [`avg`](reference/stats-aggregates/#avg "arithmetic mean"), [`avgs`](reference/stats-aggregates/#avgs "running averages")</td></tr>
<tr><td>B</td><td>[`bin`](reference/searchfunctions/#bin-binr "binary search"), [`binr`](reference/searchfunctions/#bin-binr "binary search right")</td></tr>
<tr><td>C</td><td>[`ceiling`](reference/arithmetic-integer/#ceiling "lowest integer above"), [`cols`](reference/metadata/#cols "column names of a table"), [`cor`](reference/stats-aggregates/#cor "correlation"), [`cos`](reference/trigonometry/#cos "cosine"), [`count`](reference/listfunctions/#count "number of elements"), [`cov`](reference/trigonometry/#cov "statistical covariance"), [`cross`](reference/listfunctions/#cross "cross product"), [`csv`](reference/filewords/#csv "comma delimiter"), [`cut`](reference/listfunctions/#cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`delete`](reference/qsqlfunctions/#delete "delete rows or columns from a table"), [`deltas`](reference/arithmetic-integer/#deltas "differences between consecutive pairs"), [`desc`](reference/sortfunctions/#desc "descending sort"), [`dev`](reference/stats-aggregates/#dev "standard deviation"), [`differ`](reference/comparisonfunctions/#differ "flag differences in consecutive pairs"), [`distinct`](reference/listfunctions/#distinct "unique elements"), [`div`](reference/arithmetic-integer/#div "integer division"), [`do`](reference/evaluationcontrol/#do "control word"), [`dsave`](reference/filewords/#dsave "save global tables to disk")</td></tr>
<tr><td>E</td><td>[`each`](reference/evaluationcontrol/#each "apply to each element"), [`ej`](reference/joins/#ej "equijoin"), [`ema`](reference/stats-moving/#ema "exponentially-weighted moving average"), [`enlist`](reference/listfunctions/#enlist "arguments as a list"), [`eval`](reference/parsetrees/#eval "evaluate a parse tree"), [`except`](reference/selectionfunctions/#except "left argument without elements in right argument"), [`exec`](reference/qsqlfunctions/#exec), [`exit`](reference/errors/#exit "terminate q"), [`exp`](reference/arithmetic-float/#exp "power of e")</td></tr>
<tr><td>F</td><td>[`fby`](reference/qsqlfunctions/#fby "filter-by"), [`fills`](reference/listfunctions/#fills "forward-fill nulls"), [`first`](reference/selectionfunctions/#first "first element"), [`fkeys`](reference/metadata/#fkeys "foreign-key columns mapped to their tables"), [`flip`](reference/metadata/#fkeys "transpose"), [`floor`](reference/arithmetic-integer/#floor "greatest integer less than argument")</td></tr>
<tr><td>G</td><td>[`get`](reference/filewords/#get "get a q data file"), [`getenv`](reference/os/#getenv "value of an environment variable"), [`group`](eference/dictionariesandtables/#group "dictionary of distinct elements"), [`gtime`](reference/os/#gtime "UTC timestamp")</td></tr>
<tr><td>H</td><td>[`hclose`](reference/filewords/#hclose "close a file or process"), [`hcount`](reference/filewords/#hcount "size of a file"), [`hdel`](reference/filewords/#hdel "delete a file"), [`hopen`](reference/filewords/#hopen "open a file"), [`hsym`](reference/filewords/#hsym "convert symbol to filename or IP address")</td></tr>
<tr><td>I</td><td>[`iasc`](reference/sortfunctions/#iasc "indices of ascending sort"), [`idesc`](reference/sortfunctions/#idesc "indices of descending sort"), [`if`](reference/evaluationcontrol/#if "control word: conditional"), [`ij`](reference/joins/#ij "inner join"), [`in`](reference/searchfunctions/#in "membership"), [`insert`](reference/qsqlfunctions/#insert "append records to a table"), [`inter`](reference/selectionfunctions/#inter "elements cmmon to both arguments"), [`inv`](reference/matrixes/#inv "matrix inverse")</td></tr>
<tr><td>K</td><td>[`key`](reference/metadata/#key "keys of a dictionary etc."), [`keys`](reference/metadata/#keys "names of a table's columns")</td></tr>
<tr><td>L</td><td>[`last`](reference/listfunctions/#last "last element"), [`like`](reference/textfunctions/#like "pattern matching"), [`lj`](reference/joins/#lj "left join"), [`ljf`](reference/joins/#lj "left join"), [`load`](reference/filewords/#load "load binary data"), [`log`](reference/arithmetic-float/#log "natural logarithm"), [`lower`](reference/textfunctions/#lower "lower case"), [`lsq`](reference/matrixes/#lsq "least squares – matrix divide"), [`ltime`](reference/os/#ltime "local timestamp"), [`ltrim`](reference/textfunctions/#ltrim "function remove leading spaces")</td></tr>
<tr><td>M</td><td>[`mavg`](reference/stats-moving/#mavg "moving average"), [`max`](reference/stats-aggregates/#max "maximum"), [`maxs`](reference/stats-aggregates/#maxs "maxima of preceding elements"), [`mcount`](reference/stats-moving/#mcount "moving count"), [`md5`](reference/textfunctions/#md5 "MD5 hash"), [`mdev`](reference/stats-moving/#mdev "moving deviation"), [`med`](reference/stats-aggregates/#med "median"), [`meta`](reference/metadata/#meta "metadata of a table"), [`min`](reference/stats-aggregates/#min "minimum"), [`mins`](reference/stats-aggregates/#mins "minimum of preceding elements"), [`mmax`](reference/stats-moving/#mmax "moving maxima"), [`mmin`](reference/stats-moving/#mmin "moving minima"), [`mmu`](reference/matrixes/#mmu "matrix multiplication"), [`mod`](reference/arithmetic-integer/#mod "remainder"), [`msum`](reference/stats-moving/#msum "moving sum")</td></tr>
<tr><td>N</td><td>[`neg`](reference/arithmetic-integer/#neg "negate"), [`next`](reference/selectionfunctions/#next "next elements"), [`not`](reference/logic/#not "logical not"), [`null`](reference/logic/#null "is argument a null")</td></tr>
<tr><td>O</td><td>[`or`](reference/logic/#or "maximum"), [`over`](reference/evaluationcontrol/#over "reduce an array with a function")</td></tr>
<tr><td>P</td><td>[`parse`](reference/parsetrees/#parse "parse a string"), [`peach`](reference/evaluationcontrol/#peach "parallel each"), [`pj`](reference/joins/#pj "plus join"), [`prd`](reference/arithmetic-float/#prd "– product"), [`prds`](reference/arithmetic-float/#prds "cumulative products"), [`prev`](httpreference/selectionfunctions/#prev "previous elements"), [`prior`](reference/selectionfunctions/#prior "apply function between each element and its predecessor")</td></tr>
<tr><td>R</td><td>[`rand`](reference/randomness/#rand "random number"), [`rank`](reference/sortfunctions/# "grade up"), [`ratios`](reference/arithmetic-float/#ratios "ratios of consecutive pairs"), [`raze`](reference/listfunctions/#raze "join elements"), [`read0`](reference/filewords/#read0 "read file as lines"), [`read1`](reference/filewords/#read1 "read file as bytes"), [`reciprocal`](reference/arithmetic-float/#reciprocal "reciprocal of a number"), [`reval`](reference/parsetrees/#reval "– variatiant of eval"), [`reverse`](reference/listfunctions/#reverse "reverse the order of elements"), [`rload`](reference/filewords/#rload "load a splayed table"), [`rotate`](reference/listfunctions/#rotate "rotate elements"), [`rsave`](reference/filewords/#rsave), [`rtrim`](reference/textfunctions/#rtrim "remove trailing spaces")</td></tr>
<tr><td>S</td><td>[`save`](reference/filewords/#save "save global data to file"), [`scan`](reference/evaluationcontrol/#scan "apply function to successive elements"), [`scov`](reference/stats-aggregates/#scov "statistical covariance"), [`sdev`](reference/stats-aggregates/#sdev "statistical standard deviation"), [`select`](reference/qsqlfunctions/#select "select columns from a table"), [`set`](reference/filewords/#set "asign a value to a name"), [`setenv`](reference/os/#setenv "set an environment variable"), [`show`](reference/developertools/#show "format to the console"), [`signum`](reference/arithmetic-integer/#signum "sign of its argument/s"), [`sin`](reference/trigonometry/#sin "sine"), [`sqrt`](reference/arithmetic-float/#sqrt "square root"), [`ss`](reference/textfunctions/#ss "string search"), [`ssr`](reference/textfunctions/#ssr "string search and replace"), [`string`](reference/casting/#string "cast to string"), [`sublist`](reference/selectionfunctions/#sublist "sublist of a list"), [`sum`](reference/arithmetic-integer/#sum "sum of a list"), [`sums`](reference/arithmetic-integer/#sums "cumulative sums of a list"), [`sv` decode](reference/casting/#sv "decode"), [`sv` consolidate](reference/listfunctions/#sv "consolidate"), [`svar`](reference/stats-aggregates/#svar "statistical variance"), [`system`](reference/systemcommands/#system "execute system command")</td></tr>
<tr><td>T</td><td>[`tables`](reference/metadata/#tables "sorted list of tables"), [`tan`](reference/trigonometry/#tan "tangent"), [`til`](reference/arithmetic-integer/#til "integers up to x"), [`trim`](reference/textfunctions/#trim "remove leading and trailing spaces"), [`type`](reference/metadata/#type "– data type")</td></tr>
<tr><td>U</td><td>[`uj`](reference/joins/#uj "union join"), [`ungroup`](reference/textfunctions/#ungroup "flattened table"), [`union`](reference/listfunctions/#union "distinct elements of combination of two lists"), [`update`](reference/qsqlfunctions/#update "insert or replace table records"), [`upper`](reference/textfunctions/#upper "upper-case"), [`upsert`](reference/qsqlfunctions/#upsert "add table records")</td></tr>
<tr><td>V</td><td>[`value`](reference/metadata/#value "value of a variable or dictionary key; value of an executed sting"), [`var`](reference/stats-aggregates/#var "statistical variance"), [`view`](reference/metadata/#view "definition of a dependency"), [`views`](reference/metadata/#views "list of defined views"), [`vs` encode](reference/casting/#vs "encode"), [`vs` split](reference/listfunctions/#vs "split")</td></tr>
<tr><td>W</td><td>[`wavg`](reference/stats-aggregates/#wavg "weighted average"), [`where`](reference/selectionfunctions/#where "replicated elements"), [`while`](reference/evaluationcontrol/#while "control word"), [`within`](reference/searchfunctions/#within "flag elements within range"), [`wj`](reference/joins/#wj  "window join"), [`wj1`](reference/joins/#wj "window join"), [`wsum`](reference/stats-aggregates/#wsum "weighted sum"), [`ww`](reference/joins/#wj "substrate of wj and wj1")</td></tr>
<tr><td>X</td><td>[`xasc`](reference/sortfunctions/#xasc "table sorted ascending by columns"), [`xbar`](reference/arithmetic-integer/#xbar "interval bar"), [`xcol`](reference/dictionariesandtables/#xcol "rename table columns"), [`xcols`](reference/dictionariesandtables/#xcols "re-order table columns"), [`xdesc`](reference/sortfunctions/#xdesc "table sorted decending by columns"), [`xexp`](reference/arithmetic-float/#xexp "raised to a power"), [`xgroup`](reference/dictionariesandtables/#xgroup "table grouped by keys"), [`xkey`](reference/dictionariesandtables/#xkey "set primary keys of a table"), [`xlog`](reference/arithmetic-float/#xlog "base-x logarithm"), [`xprev`](reference/selectionfunctions/#xprev "previous elements"), [`xrank`](reference/sortfunctions/#xrank "items assigned to buckets")</td></tr>
</table>

Glyphs
------

### Punctuation

<div class="kx-compact" markdown="1">

| glyphs  | use                                           |
|---------|-----------------------------------------------|
| `()`    | precedence; [list definition](reference/syntax/#lists); [table definition](reference/syntax/#tables) |
| `[]`    | expression block; [arguments](reference/syntax/#application); [table definition](reference/syntax/#tables) |
| `{}`    | [function definition](reference/syntax/#definition) (lambda)                  |
| `;`     | [separator](reference/syntax/#separation)                                     |
| `` ` `` | [symbol](reference/datatypes/#symbols)                                        |
| `` `:`` | [filepath](reference/datatypes/#filepaths)                               |

</div>

### Operators

<div class="kx-compact" markdown="1">

| glyph | operator  | glyph | operator           | glyph | operator       | glyph | operator              |
|-------|-----------|-------|--------------------|-------|----------------|-------|-----------------------|
| [`=`](reference/comparisonfunctions/#six-comparison-operators)   | [equal](reference/comparisonfunctions/#six-comparison-operators)     | [`<>`](reference/comparisonfunctions/#six-comparison-operators)  | [not equal](reference/comparisonfunctions/#six-comparison-operators)          | [`~`](reference/comparisonfunctions/#match)   | [match](reference/comparisonfunctions/#match)          |
| [`<`](reference/comparisonfunctions/#six-comparison-operators)   | [less than](reference/comparisonfunctions/#six-comparison-operators) | [`<=`](reference/comparisonfunctions/#six-comparison-operators)  | [less than or equal](reference/comparisonfunctions/#six-comparison-operators) | [`>`](reference/comparisonfunctions/#six-comparison-operators)   | [greater than](reference/comparisonfunctions/#six-comparison-operators)   | [`>=`](reference/comparisonfunctions/#six-comparison-operators)  | [greater than or equal](reference/comparisonfunctions/#six-comparison-operators) |
| [`+`](reference/arithmetic-integer/#add)   | [plus](reference/arithmetic-integer/#add)      | [`-`](reference/arithmetic-integer/#-minus)   | [minus](reference/arithmetic-integer/#-minus)              | [`*`](reference/arithmetic-integer/#multiply)   | [times](reference/arithmetic-integer/#multiply)          | [`%`](reference/arithmetic-float/#divide)   | [divided by](reference/arithmetic-float/#divide)            |
| [`#`](reference/listfunctions/#take)   | [take](reference/listfunctions/#take)      | [`,`](reference/listfunctions/#join)   | [join](reference/listfunctions/#join)               | `^`   | [fill](reference/listfunctions/#fill), [coalesce](reference/joins/#coalesce) | `_`   | [drop](reference/listfunctions/#_-drop); [cut](reference/listfunctions/#_-cut)             |
| `|`   | [maximum](reference/arithmetic-integer/#or-maximum), [`or`](reference/logic/#or) | `&` | [minimum](reference/arithmetic-integer/#and-minimum), [`and`](reference/logic/#and) |

</div>



### Overloaded glyphs

The following glyphs represent operators, functions or adverbs – according to context.

<div class="kx-compact" markdown="1">

| glyph | infix                                         | prefix                                          | postfix                                                                          |
|-------|-----------------------------------------------|-------------------------------------------------|----------------------------------------------------------------------------------|
| `'`   | [case](reference/adverbs/#case)               | [signal](reference/errors/#signal)              | [compose](reference/adverbs/#compose), [each-both](reference/adverbs/#each-both) |
| `@`   | [index/apply](reference/syntax/#application)  | [amend](reference/listfunctions/#amend)         | [trap](reference/errors/#trap)                                                   | 
| `.`   | [index/apply](reference/syntax/#application)  |                                                 |                                                                                  |
| `?`   | [find](reference/searchfunctions/#find), [roll](reference/randomness/#roll), [deal](reference/randomness/#deal), [enum-extend](/reference/enumeration/#enum-extend) | [vector conditional](reference/listfunctions/#vector-conditional), [exec](reference/functionalsql/#exec), [select](reference/functionalsql/#select) | |
| `!`   | [dict](/reference/dictionariesandtables/#dict), [key](/reference/dictionariesandtables/#key), [enumerate](reference/enumeration/#enumerate) , [ints to enum](reference/casting/#ints-to-enum) | [update](reference/functionalsql/#update), [delete](reference/functionalsql/#delete) | |
| `$`   | [cast](reference/casting/#cast), [tok](reference/casting/#tok), [enum](/reference/enumeration/#enum), [pad](reference/textfunctions/#pad), [product](reference/matrixes/#product), [`mmu`](reference/matrixes/#mmu)                  | [cond](reference/evaluationcontrol/#cond) | |
| `\:`  | [int to byte](reference/casting/#int-to-byte) |                                                 | [each-left](reference/adverbs/#each-left) | 
| `/:`  |                                               |                                                 | [each-right](reference/adverbs/#each-right) | 
| `':`  |                                               |                                                 | [each-parallel](reference/adverbs/#each-parallel), [each-prior](reference/adverbs/#each-prior) | 
| `/`   |                                               | (see note below)                                | [converge-repeat](reference/adverbs/#converge-repeat), [over](reference/adverbs/#over), [fold](reference/adverbs/#fold) | 
| `\`   |                                               | (see note below)                                | [converge-iterate](reference/adverbs/#converge-iterate), [scan](reference/adverbs/#scan) |

</div>

!!! Note "Other uses of /"

    - in a session or script, followed by a space, begins a trailing [comment](reference/syntax/#comments) 
    - in a script, followed by a newline, begins a multiline [comment](reference/syntax/#comments) 


!!! Note "Other roles of `\`"
    
    - as a _command_ in the debugger, aborts evaluation and returns to the q session
    - as a _command_ in the session, `\` toggles between the q and k parsers
    - as _punctuation_ in a script, ends a multi-line comment
    - as _punctuation_ in a script, (on a line by itself) marks the end of executable program 


### Mavericks

<div class="kx-compact" markdown="1">

| glyph  | role                                                      |
|--------|-----------------------------------------------------------|
| `:`    | [assign/amend](syntax/#naming-and-assignment), [return](reference/syntax/#definition) |
| `::`   | [null](reference/unclassified/#null), [identity](reference/unclassified/#null) |
| `csv`  | [comma as record delimiter](reference/filewords/#csv) |

</div>

## Numbers

<table markdown="1" class="kx-compact">
<tr><td>[`0:`](reference/filenumbers/#0-text-files)</td><td>[prepare-text](/reference/filenumbers/#prepare-text), [save-text](/reference/filenumbers/#save-text), [load-csv](/reference/filenumbers/#load-csv), [load-fixed](/reference/filenumbers/#load-fixed), [parse-kv](/reference/filenumbers/#parse-kv)</td></tr>
<tr><td>[`1:`](/reference/filenumbers/#1-binary-files)</td><td>[read-binary](/reference/filenumbers/#read-binary), [save-binary](/reference/filenumbers/#save-binary)</td></tr>
<tr><td>[`2:`](/reference/filenumbers/#2-c-shared-objects)</td><td>[dynamic load](/reference/filenumbers/#dynamic-load)</td></tr>
<tr><td>[`0`](reference/filenumbers/#0-console)</td><td>[write to console](reference/filenumbers/#0-console)</td></tr>
<tr><td>[`1` `-1`](reference/filenumbers/#1-stdout)</td><td>[write to stdout](reference/filenumbers/#1-stdout)</td></tr>
<tr><td>[`2` `-2`](reference/filenumbers/#2-stderr)</td><td>[write to stderr](reference/filenumbers/#2-stderr)</td></tr>
<tr><td>[`n`, `-n`](reference/filenumbers/#writing-to-file-handles)</td><td>[write to handle](reference/filenumbers/#writing-to-file-handles)</td></tr>
</table>


Namespaces
----------

!!! warning "Watch out"
    _All_ single-letter namespaces (upper- and lower-case) are reserved for Kx use and should not be used to contain user-written code or data.

For functions in the `.h` and `.Q` namespaces see the [.h unreference](reference/doth/) and [.Q unreference](reference/dotq/)

### .z

<table class="kx-compact" markdown="0">

<tr><td><a href="/reference/dotz/#za-ip-address"><code>.z.a</code></a></td><td><a href="/reference/dotz/#za-ip-address">IP address</a></td><td><a href="/reference/dotz/#zac-http-auth-from-cookie"><code>.z.ac</code></a></td><td><a href="/reference/dotz/#zac-http-auth-from-cookie">HTTP auth from cookie</a></td></tr>
<tr><td><a href="/reference/dotz/#zb-dependencies"><code>.z.b</code></a></td><td><a href="/reference/dotz/#zb-dependencies">dependencies</a></td><td> <a href="/reference/dotz/#zbm-msg-validator"><code>.z.bm</code></a></td><td><a href="/reference/dotz/#zbm-msg-validator">msg validator</a></td></tr>
<tr><td><a href="/reference/dotz/#zc-cores"><code>.z.c</code></a></td><td><a href="/reference/dotz/#zc-cores">cores</a></td><td><a href="/reference/dotz/#ze-tls-connection-status"><code>.z.e</code></a></td><td><a href="/reference/dotz/#ze-tls-connection-status">TLS connection status</a></td></tr>
<tr><td><a href="/reference/dotz/#zexit-action-on-exit"><code>.z.exit</code></a></td><td><a href="/reference/dotz/#zexit-action-on-exit">action on exit</a></td><td><a href="/reference/dotz/#zf-file"><code>.z.f</code></a></td><td><a href="/reference/dotz/#zf-file">file</a></td></tr>
<tr><td><a href="/reference/dotz/#zh-host"><code>.z.h</code></a></td><td><a href="/reference/dotz/#zh-host">host</a></td><td><a href="/reference/dotz/#zi-pid"><code>.z.i</code></a></td><td><a href="/reference/dotz/#zi-pid">PID</a></td></tr>
<tr><td><a href="/reference/dotz/#zk-release-date"><code>.z.k</code></a></td><td><a href="/reference/dotz/#zk-release-date">release date</a></td><td><a href="/reference/dotz/#zk-version"><code>.z.K</code></a></td><td><a href="/reference/dotz/#zk-version">version</a></td></tr>
<tr><td><a href="/reference/dotz/#zl-license"><code>.z.l</code></a></td><td><a href="/reference/dotz/#zl-license">license</a></td><td><a href="/reference/dotz/#zn-utc-timespan"><code>.z.n</code></a></td><td><a href="/reference/dotz/#zn-utc-timespan">UTC timespan</a></td></tr>
<tr><td><a href="/reference/dotz/#zn-local-timespan"><code>.z.N</code></a></td><td><a href="/reference/dotz/#zn-local-timespan">local timespan</a></td><td><a href="/reference/dotz/#zo-os-version"><code>.z.o</code></a></td><td><a href="/reference/dotz/#zo-os-version">OS version</a></td></tr>
<tr><td><a href="/reference/dotz/#zp-utc-timestamp"><code>.z.p</code></a></td><td><a href="/reference/dotz/#zp-UTC-timestamp">UTC timestamp</a></td><td><a href="/reference/dotz/#zp-local-timestamp"><code>.z.P</code></a></td><td><a href="/reference/dotz/#zp-local-timestamp">local timestamp</a></td></tr>
<tr><td><a href="/reference/dotz/#zpc-close"><code>.z.pc</code></a></td><td><a href="/reference/dotz/#zpc-close">close</a></td><td><a href="/reference/dotz/#zpd-peach-handles"><code>.z.pd</code></a></td><td><a href="/reference/dotz/#zpd-peach-handles">peach handles</a></td></tr>
<tr><td><a href="/reference/dotz/#zpg-get"><code>.z.pg</code></a></td><td><a href="/reference/dotz/#zpg-get">get</a></td><td><a href="/reference/dotz/#zph-http-get"><code>.z.ph</code></a></td><td><a href="/reference/dotz/#zph-http-get">HTTP get</a></td></tr>
<tr><td><a href="/reference/dotz/#zpi-input"><code>.z.pi</code></a></td><td><a href="/reference/dotz/#zpi-input">input</a></td><td><a href="/reference/dotz/#zpm-http-options"><code>.z.pm</code></a></td><td><a href="/reference/dotz/#zpm-http-options">HTTP options</a></td></tr>
<tr><td><a href="/reference/dotz/#zpp-http-post"><code>.z.pp</code></a></td><td><a href="/reference/dotz/#zpp-http-post">HTTP post</a></td><td><a href="/reference/dotz/#zps-set"><code>.z.ps</code></a></td><td><a href="/reference/dotz/#zps-set">set</a></td></tr>
<tr><td><a href="/reference/dotz/#zpw-validate-user"><code>.z.pw</code></a></td><td><a href="/reference/dotz/#zpw-validate-user">validate user</a></td><td><a href="/reference/dotz/#zq-quiet-mode"><code>.z.q</code></a></td><td><a href="/reference/dotz/#zq-quiet-mode">quiet mode</a></td></tr>
<tr><td><a href="/reference/dotz/#zs-self"><code>.z.s</code></a></td><td><a href="/reference/dotz/#zs-self">self</a></td><td><a href="/reference/dotz/#zts-timer"><code>.z.ts</code></a></td><td><a href="/reference/dotz/#zts-timer">timer</a> </td></tr>
<tr><td><a href="/reference/dotz/#zu-user-id"><code>.z.u</code></a></td><td><a href="/reference/dotz/#zu-user-id">user ID</a></td><td><a href="/reference/dotz/#zvs-value-set"><code>.z.vs</code></a></td><td><a href="/reference/dotz/#zvs-value-set">value set</a></td></tr>
<tr><td><a href="/reference/dotz/#zw-handle"><code>.z.w</code></a></td><td><a href="/reference/dotz/#zw-handle">handle</a></td><td><a href="/reference/dotz/#zW-handles"><code>.z.W</code></a></td><td><a href="/reference/dotz/#zW-handles">handles</a></td></tr>
<tr><td><a href="/reference/dotz/#zwc-websocket-close"><code>.z.wc</code></a></td><td><a href="/reference/dotz/#zwc-websocket-close">websocket close</a></td><td><a href="/reference/dotz/#zwo-websocket-open"><code>.z.wo</code></a></td><td><a href="/reference/dotz/#zwo-websocket-open">websocket open</a></td></tr>
<tr><td><a href="/reference/dotz/#zws-websockets"><code>.z.ws</code></a></td><td><a href="/reference/dotz/#zws-websockets">websockets</a></td><td><a href="/reference/dotz/#zx-argv"><code>.z.x</code></a></td><td><a href="/reference/dotz/#zx-argv">argv</a></td></tr>
<tr><td><a href="/reference/dotz/#zx-raw-command-line"><code>.z.X</code></a></td><td><a href="/reference/dotz/#zx-raw-command-line">raw command line</a></td><td><a href="/reference/dotz/#zz-utc-datetime"><code>.z.z</code></a></td><td><a href="/reference/dotz/#zz-utc-datetime">UTC datetime</a></td></tr>
<tr><td><a href="/reference/dotz/#zz-local-datetime"><code>.z.Z</code></a></td><td><a href="/reference/dotz/#zz-local-datetime">local datetime</a></td><td><a href="/reference/dotz/#zt-zt-zd-zd-timedate-shortcuts"><code>.z.t</code>, <code>.z.T</code>, <code>.z.d</code>, <code>.z.D</code></a></td><td><a href="/reference/dotz/#zt-zt-zd-zd-timedate-shortcuts">time/date shortcuts</a></td></tr>
<tr><td><a href="/reference/dotz/#zzd-zip-defaults"><code>.z.zd</code></a></td><td><a href="/reference/dotz/#zzd-zip-defaults">zip defaults</a></td></tr>

</table>


## Command-line options and system commands

See summaries of [command-line options](http://code.kx.com/wiki/Reference/Cmdline) and [system commands](http://code.kx.com/wiki/Reference/SystemCommands).

<table markdown="0" class="kx-compact">
<tr><td><a href="/reference/systemcommands/#a-tables"><code>\a</code></a></td><td>tables</td><td><a href="/reference/commandline/#b-blocked"><code>-b</code></a></td><td>blocked</td></tr>
<tr><td><a href="/reference/systemcommands/#b-views"><code>\b</code></a> <a href="/reference/systemcommands/#b-pending-views"><code>\B</code></a></td><td>views</td><td><a href="/reference/systemcommands/#c-console-size"><code>\c</code></a>  <a href="/reference/commandline/#c-console-size"><code>-c</code></a></td><td>console size</td></tr>
<tr><td><a href="/reference/commandline/#c-http-size"><code>-C</code></a> <a href="/reference/systemcommands/#c-http-size"><code>\C</code></a></td><td>HTTP size</td><td><a href="/reference/systemcommands/#cd-change-directory"><code>\cd</code></a></td><td>change directory</td></tr>
<tr><td><a href="/reference/systemcommands/#d-directory"><code>\d</code></a></td><td>directory</td><td><a href="/reference/systemcommands/#e-error-trap clients"><code>\e</code></a> <a href="/reference/commandline/#e-error-traps"><code>-e</code></a></td><td>error traps</td></tr>
<tr><td><a href="/reference/systemcommands/#f-functions"><code>\f</code></a></td><td>functions</td><td><a href="/reference/systemcommands/#g-garbage-collection-mode"><code>\g</code></a> <a href="/reference/commandline/#g-garbage-collection"><code>-g</code></a></td><td>garbage collection</td></tr>
<tr><td><a href="/reference/systemcommands/#l-load-file-or-directory"><code>\l</code></a></td><td>load file or directory</td><td><a href="/reference/commandline/#l-log-updates"><code>-l</code></a> <a href="/reference/commandline/#l-log-sync"><code>-L</code></a></td><td>log sync</td></tr>
<tr><td><a href="/reference/systemcommands/#o-offset-from-utc"><code>\o</code></a> <a href="/reference/commandline/#o-utc-offset"><code>-o</code></a></td><td>UTC offset</td><td><a href="/reference/systemcommands/#p-port"><code>\p</code></a> <a href="/reference/commandline/#p-port"><code>-p</code></a></td><td>multithread port</td></tr>
<tr><td><a href="/reference/systemcommands/#p-precision"><code>\P</code></a> <a href="/reference/commandline/#p-display-precision"><code>-P</code></a></td><td>display precision</td><td><a href="/reference/commandline/#q-quiet-mode"><code>-q</code></a></td><td>quiet mode</td></tr>
<tr><td><a href="/reference/systemcommands/#r-replication-master"><code>\r</code></a> <a href="/reference/commandline/#r-replicate"><code>-r</code></a></td><td>replicate</td><td><a href="/reference/systemcommands/#r-rename"><code>\r</code></a></td><td>rename</td></tr>
<tr><td><a href="/reference/systemcommands/#s-number-of-slaves"><code>\s</code></a> <a href="/reference/commandline/#s-slaves"><code>-s</code></a></td><td>slaves</td><td><a href="/reference/systemcommands/#s-random-seed"><code>\S</code></a></td><td>random seed</td></tr>
<tr><td><a href="/reference/systemcommands/#t-timer"><code>\t</code></a> <a href="/reference/commandline/#t-timer-ticks"><code>-t</code></a></td><td>timer ticks</td><td><a href="/reference/systemcommands/#ts-time-and-space"><code>\ts</code></a></td><td>time and space</td></tr>
<tr><td><a href="/reference/systemcommands/#t-timeout"><code>\T</code></a> <a href="/reference/commandline/#t-timeout"><code>-T</code></a></td><td>timeout</td><td><a href="/reference/systemcommands/#u-reload-user-password-file"><code>\u</code></a>  <a href="/reference/commandline/#u-usr-pwd-local"><code>-u</code></a> <a href="/reference/commandline/#u-usr-pwd"><code>-U</code></a></td><td>usr-pwd</td></tr>
<tr><td><a href="/reference/commandline/#u-disable-syscmds"><code>-u</code></a></td><td>disable syscmds</td><td><a href="/reference/systemcommands/#v-variables"><code>\v</code></a></td><td>variables</td></tr>
<tr><td><a href="/reference/systemcommands/#w-workspace"><code>\w</code></a> <a href="/reference/commandline/#w-memory"><code>-w</code></a></td><td>memory</td><td><a href="/reference/systemcommands/#w-week-offset"><code>\W</code></a> <a href="/reference/commandline/#w-start-week"><code>-W</code></a></td><td>week offset</td></tr>
<tr><td><a href="/reference/systemcommands/#x-expunge"><code>\x</code></a></td><td>expunge</td><td><a href="/reference/systemcommands/#z-date-parsing"><code>\z</code></a> <a href="/reference/commandline/#z-date-format"><code>-z</code></a></td><td>date format</td></tr>
<tr><td><a href="/reference/systemcommands/#1-2-redirect"><code>\1</code> &amp; <code>\2</code></a></td><td>redirect</td><td><a href="/reference/systemcommands/#_-hide-q-code"><code>\_</code></a></td><td>hide q code</td></tr>
<tr><td><a href="/reference/systemcommands/#terminate"><code>\</code></a></td><td>terminate</td><td><a href="/reference/systemcommands/#toggle-qk"><code>\</code></a></td><td>toggle q/k </td></tr>
<tr><td><a href="/reference/systemcommands/#quit"><code>\\</code></a></td><td>quit </td><td><a href="/reference/systemcommands/#os-commands">OS Commands</a></td><td></td></tr>
<tr><td><a href="/reference/systemcommands/#system"><code>system</code></a></td><td></td><td><a href="/reference/commandline/#file">file</a></td><td></td></tr>
</table>


## Datatypes

<div markdown="1" class="kx-compact">
| char | size | num | literal              | null         | name      | sql       | java      | .net                 |
|------|------|-----|----------------------|--------------|-----------|-----------|-----------|----------------------|
| b    | 1    | 1   | `0b`                 |              | boolean   |           | Boolean   | boolean              |
| g    | 16   | 2   |                      | `0Ng`        | guid      |           | UUID      | GUID                 |
| x    | 1    | 4   | `0x00`               |              | byte      |           | Byte      | byte                 |
| h    | 2    | 5   | `0h`                 | `0Nh`        | short     | smallint  | Short     | int16                |
| i    | 4    | 6   | `0i`                 | `0Ni`        | int       | int       | Integer   | int32                |
| j    | 8    | 7   | `0j` / `0`           | `0Nj` / `0N` | long      | bigint    | Long      | int64                |
| e    | 4    | 8   | `0e`                 | `0Ne`        | real      | real      | Float     | single               |
| f    | 8    | 9   | `0.0` or `0f`        | `0n`         | float     | float     | Double    | double               |
| c    | 1    | 10  | `" "`                | `" "`        | char      |           | Character | char                 |
| s    | .    | 11  | `` ` ``              | `` ` ``      | symbol    | varchar   | String    | string               |
| p    | 8    | 12  | dateDtimespan        | `0Np`        | timestamp |           | Timestamp | DateTime (r/w)       |
| m    | 4    | 13  | `2000.01m`           | `0Nm`        | month     |           |           |                      |
| d    | 4    | 14  | `2000.01.01`         | `0Nd`        | date      | date      | Date      |                      |
| z    | 8    | 15  | dateTtime            | `0Nz`        | datetime  | timestamp | Timestamp | DateTime (read only) |
| n    | 8    | 16  | `00:00:00.000000000` | `0Nn`        | timespan  |           | Timespan  | TimeSpan             |
| u    | 4    | 17  | `00:00`              | `0Nu`        | minute    |           |           |                      |
| v    | 4    | 18  | `00:00:00`           | `0Nv`        | second    |           |           |                      |
| t    | 4    | 19  | `00:00:00.000`       | `0Nt`        | time      | time      | Time      | TimeSpan             |
</div>

Nested types are 77+t (e.g. 78 is boolean. 96 is time.)

**Cast** `char$data:CHAR$string`

Int, float, char, symbol, literal **nulls**: `0N` `0n` `" "`, `` `. ``  
Rest use type extensions, e.g. `0Nd`. No boolean or byte nulls. 

**Infinite** dates, times, datetimes: `0Wd` `0Wz` `0Wt` (No math.)

`date.(year month week mm dd)`  
``dict:`a`b!…``  
`table:([]x:…;y:…)` or ``+`x`y!…``  
`time.(minute second mm ss)`  
`milliseconds: time mod 1000`


