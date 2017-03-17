<div class="kx-zero">
<img src="../img/hieroglyphics.png" style="width: 100%"/>
</div>

Q is bigger than it looks: tokens play different roles, according to context. Here is a complete guide. 


## Reserved words

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`abs`](reference/arith-integer/#abs "absolute value"), [`acos`](reference/trig/#acos "arc cosine"), [`aj`](reference/joins/#aj-aj0-asof-join "as-of join"), [`aj0`](reference/joins/#aj-aj0-asof-join "as-of join"), [`all`](reference/logic/#all "all nonzero"), [`and`](reference/logic/#and-minimum "minimum"), [`any`](reference/logic/#any "any element is non-zero"), [`asc`](reference/sort/#asc "ascending sort"), [`asin`](reference/trig/#asin "arc sine"), [`asof`](reference/joins/#asof "as-of verb"), [`atan`](reference/trig/#atan "arc tangent"), [`attr`](reference/metadata/#attr "attributes"), [`avg`](reference/stats-aggregates/#avg-average "arithmetic mean"), [`avgs`](reference/stats-aggregates/#avgs-averages "running averages")</td></tr>
<tr><td>B</td><td>[`bin`](reference/search/#bin-binr "binary search"), [`binr`](reference/search/#bin-binr "binary search right")</td></tr>
<tr><td>C</td><td>[`ceiling`](reference/arith-integer/#ceiling "lowest integer above"), [`cols`](reference/metadata/#cols "column names of a table"), [`cor`](reference/stats-aggregates/#cor-correlation "correlation"), [`cos`](reference/trig/#cos "cosine"), [`count`](reference/lists/#count "number of elements"), [`cov`](reference/stats-aggregates/#cov-covariance "statistical covariance"), [`cross`](reference/lists/#cross "cross product"), [`csv`](reference/filewords/#csv "comma delimiter"), [`cut`](reference/lists/#cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`delete`](reference/qsql/#delete "delete rows or columns from a table"), [`deltas`](reference/arith-integer/#deltas "differences between consecutive pairs"), [`desc`](reference/sort/#desc "descending sort"), [`dev`](reference/stats-aggregates/#dev-standard-deviation "standard deviation"), [`differ`](reference/comparison/#differ "flag differences in consecutive pairs"), [`distinct`](reference/search/#distinct "unique elements"), [`div`](reference/arith-integer/#div "integer division"), [`do`](reference/control/#do "control word"), [`dsave`](reference/filewords/#dsave "save global tables to disk")</td></tr>
<tr><td>E</td><td>[`each`](reference/control/#each "apply to each element"), [`ej`](reference/joins/#ej-equi-join "equi-join"), [`ema`](reference/stats-moving/#ema "exponentially-weighted moving average"), [`enlist`](reference/lists/#enlist "arguments as a list"), [`eval`](reference/parsetrees/#eval "evaluate a parse tree"), [`except`](reference/select/#except "left argument without elements in right argument"), [`exec`](reference/qsql/#exec), [`exit`](reference/errors/#exit "terminate q"), [`exp`](reference/arith-float/#exp "power of e")</td></tr>
<tr><td>F</td><td>[`fby`](reference/qsql/#fby "filter-by"), [`fills`](reference/lists/#fills "forward-fill nulls"), [`first`](reference/select/#first "first element"), [`fkeys`](reference/metadata/#fkeys "foreign-key columns mapped to their tables"), [`flip`](reference/lists/#flip "transpose"), [`floor`](reference/arith-integer/#floor "greatest integer less than argument")</td></tr>
<tr><td>G</td><td>[`get`](reference/filewords/#get "get a q data file"), [`getenv`](reference/os/#getenv "value of an environment variable"), [`group`](reference/dictsandtables/#group "dictionary of distinct elements"), [`gtime`](reference/os/#gtime "UTC timestamp")</td></tr>
<tr><td>H</td><td>[`hclose`](reference/filewords/#hclose "close a file or process"), [`hcount`](reference/filewords/#hcount "size of a file"), [`hdel`](reference/filewords/#hdel "delete a file"), [`hopen`](reference/filewords/#hopen "open a file"), [`hsym`](reference/filewords/#hsym "convert symbol to filename or IP address")</td></tr>
<tr><td>I</td><td>[`iasc`](reference/sort/#iasc "indices of ascending sort"), [`idesc`](reference/sort/#idesc "indices of descending sort"), [`if`](reference/control/#if "control word: conditional"), [`ij`](reference/joins/#ij-inner-join "inner join"), [`in`](reference/search/#in "membership"), [`insert`](reference/qsql/#insert "append records to a table"), [`inter`](reference/select/#inter "elements common to both arguments"), [`inv`](reference/matrixes/#inv "matrix inverse")</td></tr>
<tr><td>K</td><td>[`key`](reference/metadata/#key "keys of a dictionary etc."), [`keys`](reference/metadata/#keys "names of a table's columns")</td></tr>
<tr><td>L</td><td>[`last`](reference/select/#last "last element"), [`like`](reference/strings/#like "pattern matching"), [`lj`](reference/joins/#lj-ljf-left-join "left join"), [`ljf`](reference/joins/#lj-ljf-left-join "left join"), [`load`](reference/filewords/#load "load binary data"), [`log`](reference/arith-float/#log "natural logarithm"), [`lower`](reference/strings/#lower "lower case"), [`lsq`](reference/matrixes/#lsq "least squares – matrix divide"), [`ltime`](reference/os/#ltime "local timestamp"), [`ltrim`](reference/strings/#ltrim "function remove leading spaces")</td></tr>
<tr><td>M</td><td>[`mavg`](reference/stats-moving/#mavg "moving average"), [`max`](reference/stats-aggregates/#max-maximum "maximum"), [`maxs`](reference/stats-aggregates/#maxs-maximums "maxima of preceding elements"), [`mcount`](reference/stats-moving/#mcount "moving count"), [`md5`](reference/strings/#md5 "MD5 hash"), [`mdev`](reference/stats-moving/#mdev "moving deviation"), [`med`](reference/stats-aggregates/#med-median "median"), [`meta`](reference/metadata/#meta "metadata of a table"), [`min`](reference/stats-aggregates/#min-minimum "minimum"), [`mins`](reference/stats-aggregates/#mins-minimums "minimum of preceding elements"), [`mmax`](reference/stats-moving/#mmax "moving maxima"), [`mmin`](reference/stats-moving/#mmin "moving minima"), [`mmu`](reference/matrixes/#mmu "matrix multiplication"), [`mod`](reference/arith-integer/#mod "remainder"), [`msum`](reference/stats-moving/#msum "moving sum")</td></tr>
<tr><td>N</td><td>[`neg`](reference/arith-integer/#neg "negate"), [`next`](reference/select/#next "next elements"), [`not`](reference/logic/#not "logical not"), [`null`](reference/logic/#null "is argument a null")</td></tr>
<tr><td>O</td><td>[`or`](reference/logic/#or-maximum "maximum"), [`over`](reference/control/#over "reduce an array with a function")</td></tr>
<tr><td>P</td><td>[`parse`](reference/parsetrees/#parse "parse a string"), [`peach`](reference/control/#peach "parallel each"), [`pj`](reference/joins/#pj-plus-join "plus join"), [`prd`](reference/arith-float/#prd "– product"), [`prds`](reference/arith-float/#prds "cumulative products"), [`prev`](reference/select/#prev "previous elements"), [`prior`](reference/control/#prior "apply function between each element and its predecessor")</td></tr>
<tr><td>R</td><td>[`rand`](reference/random/#rand "random number"), [`rank`](reference/sort/#rank "grade up"), [`ratios`](reference/arith-float/#ratios "ratios of consecutive pairs"), [`raze`](reference/lists/#raze "join elements"), [`read0`](reference/filewords/#read0 "read file as lines"), [`read1`](reference/filewords/#read1 "read file as bytes"), [`reciprocal`](reference/arith-float/#reciprocal "reciprocal of a number"), [`reval`](reference/parsetrees/#reval "– variatiant of eval"), [`reverse`](reference/lists/#reverse "reverse the order of elements"), [`rload`](reference/filewords/#rload "load a splayed table"), [`rotate`](reference/lists/#rotate "rotate elements"), [`rsave`](reference/filewords/#rsave), [`rtrim`](reference/strings/#rtrim "remove trailing spaces")</td></tr>
<tr><td>S</td><td>[`save`](reference/filewords/#save "save global data to file"), [`scan`](reference/control/#scan "apply function to successive elements"), [`scov`](reference/stats-aggregates/#scov-statistical-covariance "statistical covariance"), [`sdev`](reference/stats-aggregates/#sdev-statistical-standard-deviation "statistical standard deviation"), [`select`](reference/qsql/#select "select columns from a table"), [`set`](reference/filewords/#set "asign a value to a name"), [`setenv`](reference/os/#setenv "set an environment variable"), [`show`](reference/devtools/#show "format to the console"), [`signum`](reference/arith-integer/#signum "sign of its argument/s"), [`sin`](reference/trig/#sin "sine"), [`sqrt`](reference/arith-float/#sqrt "square root"), [`ss`](reference/strings/#ss "string search"), [`ssr`](reference/strings/#ssr "string search and replace"), [`string`](reference/casting/#string "cast to string"), [`sublist`](reference/select/#sublist "sublist of a list"), [`sum`](reference/arith-integer/#sum "sum of a list"), [`sums`](reference/arith-integer/#sums "cumulative sums of a list"), [`sv` decode](reference/casting/#sv "decode"), [`sv` consolidate](reference/lists/#sv "consolidate"), [`svar`](reference/stats-aggregates/#svar-statistical-variance "statistical variance"), [`system`](reference/syscmds/#system "execute system command")</td></tr>
<tr><td>T</td><td>[`tables`](reference/metadata/#tables "sorted list of tables"), [`tan`](reference/trig/#tan "tangent"), [`til`](reference/arith-integer/#til "integers up to x"), [`trim`](reference/strings/#trim "remove leading and trailing spaces"), [`type`](reference/metadata/#type "– data type")</td></tr>
<tr><td>U</td><td>[`uj`](reference/joins/#uj-union-join "union join"), [`ungroup`](reference/dictsandtables/#ungroup "flattened table"), [`union`](reference/select/#union "distinct elements of combination of two lists"), [`update`](reference/qsql/#update "insert or replace table records"), [`upper`](reference/strings/#upper "upper-case"), [`upsert`](reference/qsql/#upsert "add table records")</td></tr>
<tr><td>V</td><td>[`value`](reference/metadata/#value "value of a variable or dictionary key; value of an executed sting"), [`var`](reference/stats-aggregates/#var-variance "variance"), [`view`](reference/metadata/#view "definition of a dependency"), [`views`](reference/metadata/#views "list of defined views"), [`vs` encode](reference/casting/#vs "encode"), [`vs` split](reference/lists/#vs "split")</td></tr>
<tr><td>W</td><td>[`wavg`](reference/stats-aggregates/#wavg-weighted-average "weighted average"), [`where`](reference/select/#where "replicated elements"), [`while`](reference/control/#while "control word"), [`within`](reference/search/#within "flag elements within range"), [`wj`](reference/joins/#wj-wj1-window-join "window join"), [`wj1`](reference/joins/#wj-wj1-window-join "window join"), [`wsum`](reference/stats-aggregates/#wsum-weighted-sum "weighted sum")</td></tr>
<tr><td>X</td><td>[`xasc`](reference/dictsandtables/#xasc "table sorted ascending by columns"), [`xbar`](reference/arith-integer/#xbar "interval bar"), [`xcol`](reference/dictsandtables/#xcol "rename table columns"), [`xcols`](reference/dictsandtables/#xcols "re-order table columns"), [`xdesc`](reference/dictsandtables/#xdesc "table sorted decending by columns"), [`xexp`](reference/arith-float/#xexp "raised to a power"), [`xgroup`](reference/dictsandtables/#xgroup "table grouped by keys"), [`xkey`](reference/dictsandtables/#xkey "set primary keys of a table"), [`xlog`](reference/arith-float/#xlog "base-x logarithm"), [`xprev`](reference/select/#xprev "previous elements"), [`xrank`](reference/sort/#xrank "items assigned to buckets")</td></tr>
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
| [`=`](reference/comparison/#six-comparison-operators)   | [equal](reference/comparison/#six-comparison-operators)     | [`<>`](reference/comparison/#six-comparison-operators)  | [not equal](reference/comparison/#six-comparison-operators)          | [`~`](reference/comparison/#match)   | [match](reference/comparison/#match)          |
| [`<`](reference/comparison/#six-comparison-operators)   | [less than](reference/comparison/#six-comparison-operators) | [`<=`](reference/comparison/#six-comparison-operators)  | [less than or equal](reference/comparison/#six-comparison-operators) | [`>`](reference/comparison/#six-comparison-operators)   | [greater than](reference/comparison/#six-comparison-operators)   | [`>=`](reference/comparison/#six-comparison-operators)  | [greater than or equal](reference/comparison/#six-comparison-operators) |
| [`+`](reference/arith-integer/#add)   | [plus](reference/arith-integer/#add)      | [`-`](reference/arith-integer/#-minus)   | [minus](reference/arith-integer/#-minus)              | [`*`](reference/arith-integer/#multiply)   | [times](reference/arith-integer/#multiply)          | [`%`](reference/arith-float/#divide)   | [divided by](reference/arith-float/#divide)            |
| [`#`](reference/lists/#take)   | [take](reference/lists/#take)      | [`,`](reference/lists/#join)   | [join](reference/lists/#join)               | `^`   | [fill](reference/lists/#fill), [coalesce](reference/joins/#coalesce) | `_`   | [drop](reference/lists/#_-drop); [cut](reference/lists/#_-cut)             |
| `|`   | [maximum](reference/arith-integer/#or-maximum), [`or`](reference/logic/#or-maximum) | `&` | [minimum](reference/arith-integer/#and-minimum), [`and`](reference/logic/#and-minimum) |

</div>



### Overloaded glyphs

The following glyphs represent operators, functions or adverbs – according to context.

<div class="kx-compact" markdown="1">

| glyph | infix                                         | prefix                                          | postfix                                                                          |
|-------|-----------------------------------------------|-------------------------------------------------|----------------------------------------------------------------------------------|
| `'`   | [case](reference/adverbs/#case)               | [signal](reference/errors/#signal)              | [compose](reference/adverbs/#compose), [each-both](reference/adverbs/#each-both) |
| `@`   | [index/apply](reference/unclassified/#apply)  | [amend](reference/lists/#amend)         | [trap](reference/errors/#trap)                                                   | 
| `.`   | [index/apply](reference/unclassified/#apply)  |                                                 |                                                                                  |
| `?`   | [find](reference/search/#find), [roll](reference/random/#roll), [deal](reference/random/#deal), [enum-extend](reference/enums/#enum-extend) | [vector conditional](reference/lists/#vector-conditional), [exec](reference/funsql/#exec), [select](reference/funsql/#select) | |
| `!`   | [dict](reference/dictsandtables/#dict), [key](reference/dictsandtables/#key), [enumerate](reference/enums/#enumerate) , [ints to enum](reference/casting/#ints-to-enum) | [update](reference/funsql/#update), [delete](reference/funsql/#delete) | |
| `$`   | [cast](reference/casting/#cast), [tok](reference/casting/#tok), [enum](reference/enums/#enum), [pad](reference/strings/#pad), [product](reference/matrixes/#product), [`mmu`](reference/matrixes/#mmu)                  | [cond](reference/control/#cond) | |
| `\:`  | [int to byte](reference/casting/#int-to-byte) |                                                 | [each-left](reference/adverbs/#each-left) | 
| `/:`  |                                               |                                                 | [each-right](reference/adverbs/#each-right) | 
| `':`  |                                               |                                                 | [each-parallel](reference/adverbs/#each-parallel), [each-prior](reference/adverbs/#each-prior) | 
| `/`   |                                               | (see note below)                                | [converge-repeat](reference/adverbs/#converge-repeat), [over](reference/adverbs/#over), [fold](reference/adverbs/#fold) | 
| `\`   |                                               | (see note below)                                | [converge-iterate](reference/adverbs/#converge-iterate), [scan](reference/adverbs/#scan) |

</div>

!!! Note "Other uses of /"

    - in a session or script, preceded by a space, begins a trailing [comment](reference/syntax/#comments) 
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
| `:`    | [assign/amend](reference/syntax/#naming-and-assignment), [return](reference/syntax/#definition) |
| `::`   | [null](reference/unclassified/#null), [identity](reference/unclassified/#identity) |
| `csv`  | [comma as record delimiter](reference/filewords/#csv) |

</div>

## Numbers

<table markdown="1" class="kx-compact">
<tr><td>[`0:`](reference/filenumbers/#0-text-files)</td><td>[prepare-text](reference/filenumbers/#prepare-text), [save-text](reference/filenumbers/#save-text), [load-csv](reference/filenumbers/#load-csv), [load-fixed](reference/filenumbers/#load-fixed), [parse-kv](reference/filenumbers/#parse-kv)</td></tr>
<tr><td>[`1:`](reference/filenumbers/#1-binary-files)</td><td>[read-binary](reference/filenumbers/#read-binary), [save-binary](reference/filenumbers/#save-binary)</td></tr>
<tr><td>[`2:`](reference/filenumbers/#2-c-shared-objects)</td><td>[dynamic load](reference/filenumbers/#dynamic-load)</td></tr>
<tr><td>[`0`](reference/filenumbers/#0-console)</td><td>[write to console](reference/filenumbers/#0-console)</td></tr>
<tr><td>[`1` `-1`](reference/filenumbers/#1-stdout)</td><td>[write to stdout](reference/filenumbers/#1-stdout)</td></tr>
<tr><td>[`2` `-2`](reference/filenumbers/#2-stderr)</td><td>[write to stderr](reference/filenumbers/#2-stderr)</td></tr>
<tr><td>[`n`, `-n`](reference/filenumbers/#writing-to-file-handles)</td><td>[write to handle](reference/filenumbers/#writing-to-file-handles)</td></tr>
</table>


Namespaces
----------

!!! warning "Watch out"
    _All_ single-letter namespaces (upper- and lower-case) are reserved for Kx use and should not be used to contain user-written code or data.

<i class="fa fa-hand-o-right"></i> [`.h` namespace](reference/doth/), [`.Q` namespace](reference/dotq/)

### .z

<div class="kx-compact" markdown="1">

| obj | meaning | obj | meaning |
|-----|---------|-----|---------|
| [`.z.a`](reference/dotz/#za-ip-address) | [IP address](reference/dotz/#za-ip-address) | [`.z.ac`](reference/dotz/#zac-http-auth-from-cookie) | [HTTP auth from cookie](reference/dotz/#zac-http-auth-from-cookie) |
| [`.z.b`](reference/dotz/#zb-dependencies) | [dependencies](reference/dotz/#zb-dependencies) |  [`.z.bm`](reference/dotz/#zbm-msg-validator) | [msg validator](reference/dotz/#zbm-msg-validator) |
| [`.z.c`](reference/dotz/#zc-cores) | [cores](reference/dotz/#zc-cores) | [`.z.e`](reference/dotz/#ze-tls-connection-status) | [TLS connection status](reference/dotz/#ze-tls-connection-status) |
| [`.z.exit`](reference/dotz/#zexit-action-on-exit) | [action on exit](reference/dotz/#zexit-action-on-exit) | [`.z.f`](reference/dotz/#zf-file) | [file](reference/dotz/#zf-file) |
| [`.z.h`](reference/dotz/#zh-host) | [host](reference/dotz/#zh-host) | [`.z.i`](reference/dotz/#zi-pid) | [PID](reference/dotz/#zi-pid) |
| [`.z.k`](reference/dotz/#zk-release-date) | [release date](reference/dotz/#zk-release-date) | [`.z.K`](reference/dotz/#zk-version) | [version](reference/dotz/#zk-version) |
| [`.z.l`](reference/dotz/#zl-license) | [license](reference/dotz/#zl-license) | [`.z.n`](reference/dotz/#zn-utc-timespan) | [UTC timespan](reference/dotz/#zn-utc-timespan) |
| [`.z.N`](reference/dotz/#zn-local-timespan) | [local timespan](reference/dotz/#zn-local-timespan) | [`.z.o`](reference/dotz/#zo-os-version) | [OS version](reference/dotz/#zo-os-version) |
| [`.z.p`](reference/dotz/#zp-utc-timestamp) | [UTC timestamp](reference/dotz/#zp-utc-timestamp) | [`.z.P`](reference/dotz/#zp-local-timestamp) | [local timestamp](reference/dotz/#zp-local-timestamp) |
| [`.z.pc`](reference/dotz/#zpc-close) | [close](reference/dotz/#zpc-close) | [`.z.pd`](reference/dotz/#zpd-peach-handles) | [peach handles](reference/dotz/#zpd-peach-handles) |
| [`.z.pg`](reference/dotz/#zpg-get) | [get](reference/dotz/#zpg-get) | [`.z.ph`](reference/dotz/#zph-http-get) | [HTTP get](reference/dotz/#zph-http-get) |
| [`.z.pi`](reference/dotz/#zpi-input) | [input](reference/dotz/#zpi-input) | [`.z.pm`](reference/dotz/#zpm-http-options) | [HTTP options](reference/dotz/#zpm-http-options) |
| [`.z.pp`](reference/dotz/#zpp-http-post) | [HTTP post](reference/dotz/#zpp-http-post) | [`.z.ps`](reference/dotz/#zps-set) | [set](reference/dotz/#zps-set) |
| [`.z.pw`](reference/dotz/#zpw-validate-user) | [validate user](reference/dotz/#zpw-validate-user) | [`.z.q`](reference/dotz/#zq-quiet-mode) | [quiet mode](reference/dotz/#zq-quiet-mode) |
| [`.z.s`](reference/dotz/#zs-self) | [self](reference/dotz/#zs-self) | [`.z.ts`](reference/dotz/#zts-timer) | [timer](reference/dotz/#zts-timer)  |
| [`.z.u`](reference/dotz/#zu-user-id) | [user ID](reference/dotz/#zu-user-id) | [`.z.vs`](reference/dotz/#zvs-value-set) | [value set](reference/dotz/#zvs-value-set) |
| [`.z.w`](reference/dotz/#zw-handle) | [handle](reference/dotz/#zw-handle) | [`.z.W`](reference/dotz/#zw-handles) | [handles](reference/dotz/#zw-handles) |
| [`.z.wc`](reference/dotz/#zwc-websocket-close) | [websocket close](reference/dotz/#zwc-websocket-close) | [`.z.wo`](reference/dotz/#zwo-websocket-open) | [websocket open](reference/dotz/#zwo-websocket-open) |
| [`.z.ws`](reference/dotz/#zws-websockets) | [websockets](reference/dotz/#zws-websockets) | [`.z.x`](reference/dotz/#zx-argv) | [argv](reference/dotz/#zx-argv) |
| [`.z.X`](reference/dotz/#zx-raw-command-line) | [raw command line](reference/dotz/#zx-raw-command-line) | [`.z.z`](reference/dotz/#zz-utc-datetime) | [UTC datetime](reference/dotz/#zz-utc-datetime) |
| [`.z.Z`](reference/dotz/#zz-local-datetime) | [local datetime](reference/dotz/#zz-local-datetime) | [`.z.t`, `.z.T`, `.z.d`, `.z.D`](reference/dotz/#zt-zt-zd-zd-timedate-shortcuts) | [time/date shortcuts](reference/dotz/#zt-zt-zd-zd-timedate-shortcuts) |
| [`.z.zd`](reference/dotz/#zzd-zip-defaults) | [zip defaults](reference/dotz/#zzd-zip-defaults) |

</div>


## Command-line options and system commands

See summaries of [command-line options](reference/cmdline) and [system commands](reference/syscmds).

<div markdown="1" class="kx-compact">

| cmd/opt |   | cmd/opt |   |
|---------|---|---------|---|
| [`\a`](reference/syscmds/#a-tables) | tables | [`-b`](reference/cmdline/#-b-blocked) | blocked |
| [`\b`](reference/syscmds/#b-views) [`\B`](reference/syscmds/#b-pending-views) | views | [`\c`](reference/syscmds/#c-console-size)  [`-c`](reference/cmdline/#-c-console-size) | console size |
| [`-C`](reference/cmdline/#-c-http-size) [`\C`](reference/syscmds/#c-http-size) | HTTP size | [`\cd`](reference/syscmds/#cd-change-directory) | change directory |
| [`\d`](reference/syscmds/#d-directory) | directory | [`\e`](reference/syscmds/#e-error-trap-clients) [`-e`](reference/cmdline/#-e-error-traps) | error traps |
| [`\f`](reference/syscmds/#f-functions) | functions | [`\g`](reference/syscmds/#g-garbage-collection-mode) [`-g`](reference/cmdline/#-g-garbage-collection) | garbage collection |
| [`\l`](reference/syscmds/#l-load-file-or-directory) | load file or directory | [`-l`](reference/cmdline/#-l-log-updates) [`-L`](reference/cmdline/#-l-log-sync) | log sync |
| [`\o`](reference/syscmds/#o-offset-from-utc) [`-o`](reference/cmdline/#-o-utc-offset) | UTC offset | [`\p`](reference/syscmds/#p-port) [`-p`](reference/cmdline/#-p-port) | multithread port |
| [`\P`](reference/syscmds/#p-precision) [`-P`](reference/cmdline/#-p-display-precision) | display precision | [`-q`](reference/cmdline/#-q-quiet-mode) | quiet mode |
| [`\r`](reference/syscmds/#r-replication-master) [`-r`](reference/cmdline/#-r-replicate) | replicate | [`\r`](reference/syscmds/#r-rename) | rename |
| [`\s`](reference/syscmds/#s-number-of-slaves) [`-s`](reference/cmdline/#-s-slaves) | slaves | [`\S`](reference/syscmds/#s-random-seed) | random seed |
| [`\t`](reference/syscmds/#t-timer) [`-t`](reference/cmdline/#-t-timer-ticks) | timer ticks | [`\ts`](reference/syscmds/#ts-time-and-space) | time and space |
| [`\T`](reference/syscmds/#t-timeout) [`-T`](reference/cmdline/#-t-timeout) | timeout | [`\u`](reference/syscmds/#u-reload-user-password-file)  [`-u`](reference/cmdline/#-u-usr-pwd-local) [`-U`](reference/cmdline/#-u-usr-pwd) | usr-pwd |
| [`-u`](reference/cmdline/#-u-disable-syscmds) | disable syscmds | [`\v`](reference/syscmds/#v-variables) | variables |
| [`\w`](reference/syscmds/#w-workspace) [`-w`](reference/cmdline/#-w-memory) | memory | [`\W`](reference/syscmds/#w-week-offset) [`-W`](reference/cmdline/#-w-start-week) | week offset |
| [`\x`](reference/syscmds/#x-expunge) | expunge | [`\z`](reference/syscmds/#z-date-parsing) [`-z`](reference/cmdline/#-z-date-format) | date format |
| [`\1` &amp; `\2`](reference/syscmds/#1-2-redirect) | redirect | [`\_`](reference/syscmds/#_-hide-q-code) | hide q code |
| [`\`](reference/syscmds/#terminate) | terminate | [`\`](reference/syscmds/#toggle-qk) | toggle q/k  |
| [`\\`](reference/syscmds/#quit) | quit  | [OS Commands](reference/syscmds/#os-commands) |  |
| [`system`](reference/syscmds/#system) |  | [file](reference/cmdline/#file) |  |

</div>


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


