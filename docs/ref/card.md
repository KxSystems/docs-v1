<div class="kx-zero">
<img src="../../img/hieroglyphics.png" style="width: 100%"/>
</div>

Q is bigger than it looks: tokens play different roles, according to context. Here is a complete guide. 


## Reserved words

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`abs`](arith-integer/#abs "absolute value"), [`acos`](trig/#acos "arc cosine"), [`aj`](joins/#aj-aj0-asof-join "as-of join"), [`aj0`](joins/#aj-aj0-asof-join "as-of join"), [`all`](logic/#all "all nonzero"), [`and`](logic/#and-minimum "minimum"), [`any`](logic/#any "any element is non-zero"), [`asc`](sort/#asc "ascending sort"), [`asin`](trig/#asin "arc sine"), [`asof`](joins/#asof "as-of verb"), [`atan`](trig/#atan "arc tangent"), [`attr`](metadata/#attr "attributes"), [`avg`](stats-aggregates/#avg-average "arithmetic mean"), [`avgs`](stats-aggregates/#avgs-averages "running averages")</td></tr>
<tr><td>B</td><td>[`bin`](search/#bin-binr "binary search"), [`binr`](search/#bin-binr "binary search right")</td></tr>
<tr><td>C</td><td>[`ceiling`](arith-integer/#ceiling "lowest integer above"), [`cols`](metadata/#cols "column names of a table"), [`cor`](stats-aggregates/#cor-correlation "correlation"), [`cos`](trig/#cos "cosine"), [`count`](lists/#count "number of elements"), [`cov`](stats-aggregates/#cov-covariance "statistical covariance"), [`cross`](lists/#cross "cross product"), [`csv`](filewords/#csv "comma delimiter"), [`cut`](lists/#cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`delete`](qsql/#delete "delete rows or columns from a table"), [`deltas`](arith-integer/#deltas "differences between consecutive pairs"), [`desc`](sort/#desc "descending sort"), [`dev`](stats-aggregates/#dev-standard-deviation "standard deviation"), [`differ`](comparison/#differ "flag differences in consecutive pairs"), [`distinct`](search/#distinct "unique elements"), [`div`](arith-integer/#div "integer division"), [`do`](control/#do "control word"), [`dsave`](filewords/#dsave "save global tables to disk")</td></tr>
<tr><td>E</td><td>[`each`](control/#each "apply to each element"), [`ej`](joins/#ej-equi-join "equi-join"), [`ema`](stats-moving/#ema "exponentially-weighted moving average"), [`enlist`](lists/#enlist "arguments as a list"), [`eval`](parsetrees/#eval "evaluate a parse tree"), [`except`](select/#except "left argument without elements in right argument"), [`exec`](qsql/#exec), [`exit`](errors/#exit "terminate q"), [`exp`](arith-float/#exp "power of e")</td></tr>
<tr><td>F</td><td>[`fby`](qsql/#fby "filter-by"), [`fills`](lists/#fills "forward-fill nulls"), [`first`](select/#first "first element"), [`fkeys`](metadata/#fkeys "foreign-key columns mapped to their tables"), [`flip`](lists/#flip "transpose"), [`floor`](arith-integer/#floor "greatest integer less than argument")</td></tr>
<tr><td>G</td><td>[`get`](filewords/#get "get a q data file"), [`getenv`](os/#getenv "value of an environment variable"), [`group`](dictsandtables/#group "dictionary of distinct elements"), [`gtime`](os/#gtime "UTC timestamp")</td></tr>
<tr><td>H</td><td>[`hclose`](filewords/#hclose "close a file or process"), [`hcount`](filewords/#hcount "size of a file"), [`hdel`](filewords/#hdel "delete a file"), [`hopen`](filewords/#hopen "open a file"), [`hsym`](filewords/#hsym "convert symbol to filename or IP address")</td></tr>
<tr><td>I</td><td>[`iasc`](sort/#iasc "indices of ascending sort"), [`idesc`](sort/#idesc "indices of descending sort"), [`if`](control/#if "control word: conditional"), [`ij`](joins/#ij-inner-join "inner join"), [`in`](search/#in "membership"), [`insert`](qsql/#insert "append records to a table"), [`inter`](select/#inter "elements common to both arguments"), [`inv`](matrixes/#inv "matrix inverse")</td></tr>
<tr><td>K</td><td>[`key`](metadata/#key "keys of a dictionary etc."), [`keys`](metadata/#keys "names of a table's columns")</td></tr>
<tr><td>L</td><td>[`last`](select/#last "last element"), [`like`](strings/#like "pattern matching"), [`lj`](joins/#lj-ljf-left-join "left join"), [`ljf`](joins/#lj-ljf-left-join "left join"), [`load`](filewords/#load "load binary data"), [`log`](arith-float/#log "natural logarithm"), [`lower`](strings/#lower "lower case"), [`lsq`](matrixes/#lsq "least squares – matrix divide"), [`ltime`](os/#ltime "local timestamp"), [`ltrim`](strings/#ltrim "function remove leading spaces")</td></tr>
<tr><td>M</td><td>[`mavg`](stats-moving/#mavg "moving average"), [`max`](stats-aggregates/#max-maximum "maximum"), [`maxs`](stats-aggregates/#maxs-maximums "maxima of preceding elements"), [`mcount`](stats-moving/#mcount "moving count"), [`md5`](strings/#md5 "MD5 hash"), [`mdev`](stats-moving/#mdev "moving deviation"), [`med`](stats-aggregates/#med-median "median"), [`meta`](metadata/#meta "metadata of a table"), [`min`](stats-aggregates/#min-minimum "minimum"), [`mins`](stats-aggregates/#mins-minimums "minimum of preceding elements"), [`mmax`](stats-moving/#mmax "moving maxima"), [`mmin`](stats-moving/#mmin "moving minima"), [`mmu`](matrixes/#mmu "matrix multiplication"), [`mod`](arith-integer/#mod "remainder"), [`msum`](stats-moving/#msum "moving sum")</td></tr>
<tr><td>N</td><td>[`neg`](arith-integer/#neg "negate"), [`next`](select/#next "next elements"), [`not`](logic/#not "logical not"), [`null`](logic/#null "is argument a null")</td></tr>
<tr><td>O</td><td>[`or`](logic/#or-maximum "maximum"), [`over`](control/#over "reduce an array with a function")</td></tr>
<tr><td>P</td><td>[`parse`](parsetrees/#parse "parse a string"), [`peach`](control/#peach "parallel each"), [`pj`](joins/#pj-plus-join "plus join"), [`prd`](arith-float/#prd "– product"), [`prds`](arith-float/#prds "cumulative products"), [`prev`](select/#prev "previous elements"), [`prior`](control/#prior "apply function between each element and its predecessor")</td></tr>
<tr><td>R</td><td>[`rand`](random/#rand "random number"), [`rank`](sort/#rank "grade up"), [`ratios`](arith-float/#ratios "ratios of consecutive pairs"), [`raze`](lists/#raze "join elements"), [`read0`](filewords/#read0 "read file as lines"), [`read1`](filewords/#read1 "read file as bytes"), [`reciprocal`](arith-float/#reciprocal "reciprocal of a number"), [`reval`](parsetrees/#reval "– variatiant of eval"), [`reverse`](lists/#reverse "reverse the order of elements"), [`rload`](filewords/#rload "load a splayed table"), [`rotate`](lists/#rotate "rotate elements"), [`rsave`](filewords/#rsave), [`rtrim`](strings/#rtrim "remove trailing spaces")</td></tr>
<tr><td>S</td><td>[`save`](filewords/#save "save global data to file"), [`scan`](control/#scan "apply function to successive elements"), [`scov`](stats-aggregates/#scov-statistical-covariance "statistical covariance"), [`sdev`](stats-aggregates/#sdev-statistical-standard-deviation "statistical standard deviation"), [`select`](qsql/#select "select columns from a table"), [`set`](filewords/#set "asign a value to a name"), [`setenv`](os/#setenv "set an environment variable"), [`show`](devtools/#show "format to the console"), [`signum`](arith-integer/#signum "sign of its argument/s"), [`sin`](trig/#sin "sine"), [`sqrt`](arith-float/#sqrt "square root"), [`ss`](strings/#ss "string search"), [`ssr`](strings/#ssr "string search and replace"), [`string`](casting/#string "cast to string"), [`sublist`](select/#sublist "sublist of a list"), [`sum`](arith-integer/#sum "sum of a list"), [`sums`](arith-integer/#sums "cumulative sums of a list"), [`sv` decode](casting/#sv "decode"), [`sv` consolidate](lists/#sv "consolidate"), [`svar`](stats-aggregates/#svar-statistical-variance "statistical variance"), [`system`](syscmds/#system "execute system command")</td></tr>
<tr><td>T</td><td>[`tables`](metadata/#tables "sorted list of tables"), [`tan`](trig/#tan "tangent"), [`til`](arith-integer/#til "integers up to x"), [`trim`](strings/#trim "remove leading and trailing spaces"), [`type`](metadata/#type "– data type")</td></tr>
<tr><td>U</td><td>[`uj`](joins/#uj-union-join "union join"), [`ungroup`](dictsandtables/#ungroup "flattened table"), [`union`](select/#union "distinct elements of combination of two lists"), [`update`](qsql/#update "insert or replace table records"), [`upper`](strings/#upper "upper-case"), [`upsert`](qsql/#upsert "add table records")</td></tr>
<tr><td>V</td><td>[`value`](metadata/#value "value of a variable or dictionary key; value of an executed sting"), [`var`](stats-aggregates/#var-variance "variance"), [`view`](metadata/#view "definition of a dependency"), [`views`](metadata/#views "list of defined views"), [`vs` encode](casting/#vs "encode"), [`vs` split](lists/#vs "split")</td></tr>
<tr><td>W</td><td>[`wavg`](stats-aggregates/#wavg-weighted-average "weighted average"), [`where`](select/#where "replicated elements"), [`while`](control/#while "control word"), [`within`](search/#within "flag elements within range"), [`wj`](joins/#wj-wj1-window-join "window join"), [`wj1`](joins/#wj-wj1-window-join "window join"), [`wsum`](stats-aggregates/#wsum-weighted-sum "weighted sum")</td></tr>
<tr><td>X</td><td>[`xasc`](dictsandtables/#xasc "table sorted ascending by columns"), [`xbar`](arith-integer/#xbar "interval bar"), [`xcol`](dictsandtables/#xcol "rename table columns"), [`xcols`](dictsandtables/#xcols "re-order table columns"), [`xdesc`](dictsandtables/#xdesc "table sorted decending by columns"), [`xexp`](arith-float/#xexp "raised to a power"), [`xgroup`](dictsandtables/#xgroup "table grouped by keys"), [`xkey`](dictsandtables/#xkey "set primary keys of a table"), [`xlog`](arith-float/#xlog "base-x logarithm"), [`xprev`](select/#xprev "previous elements"), [`xrank`](sort/#xrank "items assigned to buckets")</td></tr>
</table>

Glyphs
------

### Punctuation

<div class="kx-compact" markdown="1">

| glyphs  | use                                           |
|---------|-----------------------------------------------|
| `()`    | precedence; [list definition](syntax/#lists); [table definition](syntax/#tables) |
| `[]`    | expression block; [arguments](syntax/#application); [table definition](syntax/#tables) |
| `{}`    | [function definition](syntax/#definition) (lambda)                  |
| `;`     | [separator](syntax/#separation)                                     |
| `` ` `` | [symbol](datatypes/#symbols)                                        |
| `` `:`` | [filepath](datatypes/#filepaths)                               |

</div>

### Operators

<div class="kx-compact" markdown="1">

| glyph | operator  | glyph | operator           | glyph | operator       | glyph | operator              |
|-------|-----------|-------|--------------------|-------|----------------|-------|-----------------------|
| [`=`](comparison/#six-comparison-operators)   | [equal](comparison/#six-comparison-operators)     | [`<>`](comparison/#six-comparison-operators)  | [not equal](comparison/#six-comparison-operators)          | [`~`](comparison/#match)   | [match](comparison/#match)          |
| [`<`](comparison/#six-comparison-operators)   | [less than](comparison/#six-comparison-operators) | [`<=`](comparison/#six-comparison-operators)  | [less than or equal](comparison/#six-comparison-operators) | [`>`](comparison/#six-comparison-operators)   | [greater than](comparison/#six-comparison-operators)   | [`>=`](comparison/#six-comparison-operators)  | [greater than or equal](comparison/#six-comparison-operators) |
| [`+`](arith-integer/#add)   | [plus](arith-integer/#add)      | [`-`](arith-integer/#-minus)   | [minus](arith-integer/#-minus)              | [`*`](arith-integer/#multiply)   | [times](arith-integer/#multiply)          | [`%`](arith-float/#divide)   | [divided by](arith-float/#divide)            |
| [`#`](lists/#take)   | [take](lists/#take)      | [`,`](lists/#join)   | [join](lists/#join)               | `^`   | [fill](lists/#fill), [coalesce](joins/#coalesce) | `_`   | [drop](lists/#_-drop); [cut](lists/#_-cut)             |
| `|`   | [maximum](arith-integer/#or-maximum), [`or`](logic/#or-maximum) | `&` | [minimum](arith-integer/#and-minimum), [`and`](logic/#and-minimum) |

</div>



### Overloaded glyphs

The following glyphs represent operators, functions or adverbs – according to context.

<div class="kx-compact" markdown="1">

| glyph | infix                                         | prefix                                          | postfix                                                                          |
|-------|-----------------------------------------------|-------------------------------------------------|----------------------------------------------------------------------------------|
| `'`   | [case](adverbs/#case)               | [signal](errors/#signal)              | [compose](adverbs/#compose), [each-both](adverbs/#each-both) |
| `@`   | [index/apply](unclassified/#apply)  | [amend](lists/#amend)         | [trap](errors/#trap)                                                   | 
| `.`   | [index/apply](unclassified/#apply)  |                                                 |                                                                                  |
| `?`   | [find](search/#find), [roll](random/#roll), [deal](random/#deal), [enum-extend](enums/#enum-extend) | [vector conditional](lists/#vector-conditional), [exec](funsql/#exec), [select](funsql/#select) | |
| `!`   | [dict](dictsandtables/#dict), [key](dictsandtables/#key), [enumerate](enums/#enumerate) , [ints to enum](casting/#ints-to-enum) | [update](funsql/#update), [delete](funsql/#delete) | |
| `$`   | [cast](casting/#cast), [tok](casting/#tok), [enum](enums/#enum), [pad](strings/#pad), [product](matrixes/#product), [`mmu`](matrixes/#mmu)                  | [cond](control/#cond) | |
| `\:`  | [int to byte](casting/#int-to-byte) |                                                 | [each-left](adverbs/#each-left) | 
| `/:`  |                                               |                                                 | [each-right](adverbs/#each-right) | 
| `':`  |                                               |                                                 | [each-parallel](adverbs/#each-parallel), [each-prior](adverbs/#each-prior) | 
| `/`   |                                               | (see note below)                                | [converge-repeat](adverbs/#converge-repeat), [over](adverbs/#over), [fold](adverbs/#fold) | 
| `\`   |                                               | (see note below)                                | [converge-iterate](adverbs/#converge-iterate), [scan](adverbs/#scan) |

</div>

!!! Note "Other uses of /"

    - in a session or script, preceded by a space, begins a trailing [comment](syntax/#comments) 
    - in a script, followed by a newline, begins a multiline [comment](syntax/#comments) 


!!! Note "Other roles of `\`"
    
    - as a _command_ in the debugger, aborts evaluation and returns to the q session
    - as a _command_ in the session, `\` toggles between the q and k parsers
    - as _punctuation_ in a script, ends a multi-line comment
    - as _punctuation_ in a script, (on a line by itself) marks the end of executable program 


### Mavericks

<div class="kx-compact" markdown="1">

| glyph  | role                                                      |
|--------|-----------------------------------------------------------|
| `:`    | [assign/amend](syntax/#naming-and-assignment), [return](syntax/#definition) |
| `::`   | [null](unclassified/#null), [identity](unclassified/#identity) |
| `csv`  | [comma as record delimiter](filewords/#csv) |

</div>

## Numbers

<table markdown="1" class="kx-compact">
<tr><td>[`0:`](filenumbers/#0-text-files)</td><td>[prepare-text](filenumbers/#prepare-text), [save-text](filenumbers/#save-text), [load-csv](filenumbers/#load-csv), [load-fixed](filenumbers/#load-fixed), [parse-kv](filenumbers/#parse-kv)</td></tr>
<tr><td>[`1:`](filenumbers/#1-binary-files)</td><td>[read-binary](filenumbers/#read-binary), [save-binary](filenumbers/#save-binary)</td></tr>
<tr><td>[`2:`](filenumbers/#2-c-shared-objects)</td><td>[dynamic load](filenumbers/#dynamic-load)</td></tr>
<tr><td>[`0`](filenumbers/#0-console)</td><td>[write to console](filenumbers/#0-console)</td></tr>
<tr><td>[`1` `-1`](filenumbers/#1-stdout)</td><td>[write to stdout](filenumbers/#1-stdout)</td></tr>
<tr><td>[`2` `-2`](filenumbers/#2-stderr)</td><td>[write to stderr](filenumbers/#2-stderr)</td></tr>
<tr><td>[`n`, `-n`](filenumbers/#writing-to-file-handles)</td><td>[write to handle](filenumbers/#writing-to-file-handles)</td></tr>
</table>


Namespaces
----------

!!! warning "Watch out"
    _All_ single-letter namespaces (upper- and lower-case) are reserved for Kx use and should not be used to contain user-written code or data.

<i class="fa fa-hand-o-right"></i> [`.h` namespace](doth/), [`.Q` namespace](dotq/)

### .z

<div class="kx-compact" markdown="1">

| obj | meaning | obj | meaning |
|-----|---------|-----|---------|
| [`.z.a`](dotz/#za-ip-address) | [IP address](dotz/#za-ip-address) | [`.z.ac`](dotz/#zac-http-auth-from-cookie) | [HTTP auth from cookie](dotz/#zac-http-auth-from-cookie) |
| [`.z.b`](dotz/#zb-dependencies) | [dependencies](dotz/#zb-dependencies) |  [`.z.bm`](dotz/#zbm-msg-validator) | [msg validator](dotz/#zbm-msg-validator) |
| [`.z.c`](dotz/#zc-cores) | [cores](dotz/#zc-cores) | [`.z.e`](dotz/#ze-tls-connection-status) | [TLS connection status](dotz/#ze-tls-connection-status) |
| [`.z.exit`](dotz/#zexit-action-on-exit) | [action on exit](dotz/#zexit-action-on-exit) | [`.z.f`](dotz/#zf-file) | [file](dotz/#zf-file) |
| [`.z.h`](dotz/#zh-host) | [host](dotz/#zh-host) | [`.z.i`](dotz/#zi-pid) | [PID](dotz/#zi-pid) |
| [`.z.k`](dotz/#zk-release-date) | [release date](dotz/#zk-release-date) | [`.z.K`](dotz/#zk-version) | [version](dotz/#zk-version) |
| [`.z.l`](dotz/#zl-license) | [license](dotz/#zl-license) | [`.z.n`](dotz/#zn-utc-timespan) | [UTC timespan](dotz/#zn-utc-timespan) |
| [`.z.N`](dotz/#zn-local-timespan) | [local timespan](dotz/#zn-local-timespan) | [`.z.o`](dotz/#zo-os-version) | [OS version](dotz/#zo-os-version) |
| [`.z.p`](dotz/#zp-utc-timestamp) | [UTC timestamp](dotz/#zp-utc-timestamp) | [`.z.P`](dotz/#zp-local-timestamp) | [local timestamp](dotz/#zp-local-timestamp) |
| [`.z.pc`](dotz/#zpc-close) | [close](dotz/#zpc-close) | [`.z.pd`](dotz/#zpd-peach-handles) | [peach handles](dotz/#zpd-peach-handles) |
| [`.z.pg`](dotz/#zpg-get) | [get](dotz/#zpg-get) | [`.z.ph`](dotz/#zph-http-get) | [HTTP get](dotz/#zph-http-get) |
| [`.z.pi`](dotz/#zpi-input) | [input](dotz/#zpi-input) | [`.z.pm`](dotz/#zpm-http-options) | [HTTP options](dotz/#zpm-http-options) |
| [`.z.pp`](dotz/#zpp-http-post) | [HTTP post](dotz/#zpp-http-post) | [`.z.ps`](dotz/#zps-set) | [set](dotz/#zps-set) |
| [`.z.pw`](dotz/#zpw-validate-user) | [validate user](dotz/#zpw-validate-user) | [`.z.q`](dotz/#zq-quiet-mode) | [quiet mode](dotz/#zq-quiet-mode) |
| [`.z.s`](dotz/#zs-self) | [self](dotz/#zs-self) | [`.z.ts`](dotz/#zts-timer) | [timer](dotz/#zts-timer)  |
| [`.z.u`](dotz/#zu-user-id) | [user ID](dotz/#zu-user-id) | [`.z.vs`](dotz/#zvs-value-set) | [value set](dotz/#zvs-value-set) |
| [`.z.w`](dotz/#zw-handle) | [handle](dotz/#zw-handle) | [`.z.W`](dotz/#zw-handles) | [handles](dotz/#zw-handles) |
| [`.z.wc`](dotz/#zwc-websocket-close) | [websocket close](dotz/#zwc-websocket-close) | [`.z.wo`](dotz/#zwo-websocket-open) | [websocket open](dotz/#zwo-websocket-open) |
| [`.z.ws`](dotz/#zws-websockets) | [websockets](dotz/#zws-websockets) | [`.z.x`](dotz/#zx-argv) | [argv](dotz/#zx-argv) |
| [`.z.X`](dotz/#zx-raw-command-line) | [raw command line](dotz/#zx-raw-command-line) | [`.z.z`](dotz/#zz-utc-datetime) | [UTC datetime](dotz/#zz-utc-datetime) |
| [`.z.Z`](dotz/#zz-local-datetime) | [local datetime](dotz/#zz-local-datetime) | [`.z.t`, `.z.T`, `.z.d`, `.z.D`](dotz/#zt-zt-zd-zd-timedate-shortcuts) | [time/date shortcuts](dotz/#zt-zt-zd-zd-timedate-shortcuts) |
| [`.z.zd`](dotz/#zzd-zip-defaults) | [zip defaults](dotz/#zzd-zip-defaults) |

</div>


## Command-line options and system commands

See summaries of [command-line options](cmdline) and [system commands](syscmds).

<div markdown="1" class="kx-compact">

| cmd/opt |   | cmd/opt |   |
|---------|---|---------|---|
| [`\a`](syscmds/#a-tables) | tables | [`-b`](cmdline/#-b-blocked) | blocked |
| [`\b`](syscmds/#b-views) [`\B`](syscmds/#b-pending-views) | views | [`\c`](syscmds/#c-console-size)  [`-c`](cmdline/#-c-console-size) | console size |
| [`-C`](cmdline/#-c-http-size) [`\C`](syscmds/#c-http-size) | HTTP size | [`\cd`](syscmds/#cd-change-directory) | change directory |
| [`\d`](syscmds/#d-directory) | directory | [`\e`](syscmds/#e-error-trap-clients) [`-e`](cmdline/#-e-error-traps) | error traps |
| [`\f`](syscmds/#f-functions) | functions | [`\g`](syscmds/#g-garbage-collection-mode) [`-g`](cmdline/#-g-garbage-collection) | garbage collection |
| [`\l`](syscmds/#l-load-file-or-directory) | load file or directory | [`-l`](cmdline/#-l-log-updates) [`-L`](cmdline/#-l-log-sync) | log sync |
| [`\o`](syscmds/#o-offset-from-utc) [`-o`](cmdline/#-o-utc-offset) | UTC offset | [`\p`](syscmds/#p-port) [`-p`](cmdline/#-p-port) | multithread port |
| [`\P`](syscmds/#p-precision) [`-P`](cmdline/#-p-display-precision) | display precision | [`-q`](cmdline/#-q-quiet-mode) | quiet mode |
| [`\r`](syscmds/#r-replication-master) [`-r`](cmdline/#-r-replicate) | replicate | [`\r`](syscmds/#r-rename) | rename |
| [`\s`](syscmds/#s-number-of-slaves) [`-s`](cmdline/#-s-slaves) | slaves | [`\S`](syscmds/#s-random-seed) | random seed |
| [`\t`](syscmds/#t-timer) [`-t`](cmdline/#-t-timer-ticks) | timer ticks | [`\ts`](syscmds/#ts-time-and-space) | time and space |
| [`\T`](syscmds/#t-timeout) [`-T`](cmdline/#-t-timeout) | timeout | [`\u`](syscmds/#u-reload-user-password-file)  [`-u`](cmdline/#-u-usr-pwd-local) [`-U`](cmdline/#-u-usr-pwd) | usr-pwd |
| [`-u`](cmdline/#-u-disable-syscmds) | disable syscmds | [`\v`](syscmds/#v-variables) | variables |
| [`\w`](syscmds/#w-workspace) [`-w`](cmdline/#-w-memory) | memory | [`\W`](syscmds/#w-week-offset) [`-W`](cmdline/#-w-start-week) | week offset |
| [`\x`](syscmds/#x-expunge) | expunge | [`\z`](syscmds/#z-date-parsing) [`-z`](cmdline/#-z-date-format) | date format |
| [`\1` &amp; `\2`](syscmds/#1-2-redirect) | redirect | [`\_`](syscmds/#_-hide-q-code) | hide q code |
| [`\`](syscmds/#terminate) | terminate | [`\`](syscmds/#toggle-qk) | toggle q/k  |
| [`\\`](syscmds/#quit) | quit  | [OS Commands](syscmds/#os-commands) |  |
| [`system`](syscmds/#system) |  | [file](cmdline/#file) |  |

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


