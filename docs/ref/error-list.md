<i class="fa fa-hand-o-right"></i> Simon’s list <i class="fa fa-github"></i> [simongarland/help/texts/errors.txt](https://github.com/simongarland/help/blob/master/texts/errors.txt)

<table class="kx-ruled kx-shrunk kx-tight" markdown="1">
<thead>
<tr class="odd"><th>error</th><th>example</th><th>explanation</th></tr>
</thead>
<tbody>
<tr class="even">
<td>Mlim</td>
<td></td>
<td>Too many nested columns in splayed tables. Prior to V3.0, limited to 999. V3.0 onwards, limited to 251. From V3.1 2014.06.03, limited to 32767</td>
</tr>
<tr class="odd">
<td>Q7</td>
<td/>
<td>Nyi op on file nested array</td>
</tr>
<tr class="even">
<td>XXX</td>
<td class="nowrap">`delete x from system "d";x`</td>
<td>Value error (`XXX` undefined)</td>
</tr>
<tr class="odd">
<td class="nowrap">`[({])}"`</td>
<td class="nowrap">`"hello`</td>
<td>Open `([{` or `"`</td>
</tr>
<tr class="even">
<td>arch</td>
<td class="nowrap">`:test set til 100`<br/>``-17!`:test``</td>
<td>Attempt to load file of wrong endian format</td>
</tr>
<tr class="odd">
<td>access</td>
<td></td>
<td>Attempt to read files above directory, run system commands or failed usr/pwd</td>
</tr>
<tr class="even">
<td>accp</td>
<td></td>
<td>Tried to accept an incoming TCP/IP connection but failed to do so</td>
</tr>
<tr class="odd">
<td>adict</td>
<td class="nowrap">``d:`a`b!1 2;d[::]:d``</td>
<td>Interpret as `'nyi`</td>
</tr>
<tr class="even">
<td>assign</td>
<td class="nowrap">`cos:12`</td>
<td>Attempt to reuse a reserved word</td>
</tr>
<tr class="odd">
<td>badtail</td>
<td></td>
<td>Incomplete transaction at end of file, get good (count;length) with ``-11!(-2;`:file)``</td>
</tr>
<tr class="even">
<td>branch</td>
<td class="nowrap">`a:"1;",254#"0;"`<br/>`value "{if[",a,"]}"`</td>
<td>A branch (if;do;while;$[.;.;.]) more than 255 byte codes away</td>
</tr>
<tr class="odd">
<td>can't _</td>
<td></td>
<td>Only commercially licensed kdb+ instances can encrypt code in a script</td>
</tr>
<tr class="even">
<td>cast</td>
<td class="nowrap">``s:`a`b; c:`s$`a`e``</td>
<td>Value not in enumeration</td>
</tr>
<tr class="odd">
<td>char</td>
<td class="nowrap">`value "\000"`</td>
<td>Invalid character</td>
</tr>
<tr class="even">
<td>conn</td>
<td></td>
<td>Too many connections (1022 max)</td>
</tr>
<tr class="odd">
<td>constants</td>
<td class="nowrap">`a:";"sv string 2+til 97;`<br/>`value"{",a,"}"`</td>
<td>Too many constants (max 96)</td>
</tr>
<tr class="even">
<td>cores</td>
<td></td>
<td>Too many cores for license</td>
</tr>
<tr class="odd">
<td>cpu</td>
<td></td>
<td>Too many CPUs for license</td>
</tr>
<tr class="even">
<td>domain</td>
<td class="nowrap">``1?`10``</td>
<td>Out of domain</td>
</tr>
<tr class="odd">
<td>elim</td>
<td class="nowrap">``((-58?`3) set\:(),`a)$`a``</td>
<td>Too many enumerations (max: 57)</td>
</tr>
<tr class="even">
<td>exp</td>
<td></td>
<td>Expiry date passed</td>
</tr>
<tr class="odd">
<td>from</td>
<td class="nowrap">`select price trade`</td>
<td>Badly formed select statement</td>
</tr>
<tr class="even">
<td>glim</td>
<td></td>
<td>`` `g#`` limit, kdb+ currently limited to 99 concurrent `` `g#``</td>
</tr>
<tr class="odd">
<td>globals</td>
<td class="nowrap">`a:"::a"sv string til 32;`<br/>`value"{a",a,"::0}"`</td>
<td>Too many global variables (31 max)</td>
</tr>
<tr class="even">
<td>host</td>
<td></td>
<td>Unlicensed host</td>
</tr>
<tr class="odd">
<td>insert</td>
<td class="nowrap">``t:([k:0 1]a:2 3);`t insert(0;3)``</td>
<td>Attempt to insert a record with an existing key into a keyed table</td>
</tr>
<tr class="even">
<td>k4.lic</td>
<td></td>
<td>K4.lic file not found, check QHOME/QLIC</td>
</tr>
<tr class="odd">
<td>length</td>
<td class="nowrap">`()+til 1`</td>
<td>Incompatible lengths</td>
</tr>
<tr class="even">
<td>limit</td>
<td class="nowrap">`0W#2`</td>
<td>Tried to generate a list longer than 2,000,000,000, or serialized object is &gt; 2GB, or `'type` if trying to serialize a nested object which has &gt; 2 billion elements.</td>
</tr>
<tr class="odd">
<td>locals</td>
<td class="nowrap">`a:":a"sv string til 24;`<br/>`value"{a",a,":0}"`</td>
<td>Too many local variables (23 max)</td>
</tr>
<tr class="even">
<td>loop</td>
<td class="nowrap">`a::a`</td>
<td>Dependency loop</td>
</tr>
<tr class="odd">
<td>mismatch</td>
<td class="nowrap">`([]a:til 4),([]b:til 3)`</td>
<td>Columns that can't be aligned for R,R or K,K</td>
</tr>
<tr class="even">
<td>mq</td>
<td></td>
<td>Multi-threading not allowed.</td>
</tr>
<tr class="odd">
<td>noamend</td>
<td class="nowrap">`t:([]a:1 2 3)`<br />``n:`a`b`c``<br />``update b:{`n?`d;:`n?`d}[]``<br/>`` from `t``</td>
<td>Cannot perform global amend from within an amend.</td>
</tr>
<tr class="even">
<td>no append to zipped enums</td>
<td class="nowrap">V2:<br/>`.z.zd:17 2 6`<br/>`` `:sym?`a`b``<br/>V3:<br/>`` `:sym?`c``</td>
<td>Cannot append to zipped enum (from V3).</td>
</tr>
<tr class="odd">
<td>no `` `g#``</td>
<td class="nowrap">``{`g#x}peach 2#enlist 0 1``</td>
<td>A thread other than the main q thread has attempted to add a group attribute to a vector. Seen with peach+slave threads or multithreaded input queue</td>
</tr>
<tr class="even">
<td>noupdate</td>
<td class="nowrap">`{a::x}peach 0 1`</td>
<td>Updates blocked by the -b cmd line arg, or reval code or a thread other than the main q thread has attempted to update a global variable when in peach+slave threads or multithreaded input queue.</td>
</tr>
<tr class="odd">
<td>nyi</td>
<td class="nowrap">`"a"like"**"`</td>
<td>Not yet implemented. Interpret as “it probably makes sense, but it’s not defined nor implemented, and needs more thinking about as the language evolves”.</td>
</tr>
<tr class="even">
<td>os</td>
<td></td>
<td>Operating System error or wrong OS (if licence error)</td>
</tr>
<tr class="odd">
<td>par</td>
<td></td>
<td>Trying to update a partitioned table</td>
</tr>
<tr class="even">
<td>params</td>
<td class="nowrap">`f:{[a;b;c;d;e;f;g;h;e]}`</td>
<td>Too many parameters (8 max)</td>
</tr>
<tr class="odd">
<td>parse</td>
<td></td>
<td>Invalid syntax</td>
</tr>
<tr class="even">
<td>part</td>
<td></td>
<td>Something wrong with the partitions in the HDB</td>
</tr>
<tr class="odd">
<td>pl</td>
<td></td>
<td>`peach` can't handle parallel lambdas (V2.3 only)</td>
</tr>
<tr class="even">
<td>pwuid</td>
<td></td>
<td>OS is missing libraries for `getpwuid`. Most likely 32-bit app on 64-bit OS. Try to install ia32-libs.</td>
</tr>
<tr class="odd">
<td>rank</td>
<td class="nowrap">`+[2;3;4]`</td>
<td>Invalid rank or valence</td>
</tr>
<tr class="even">
<td>s-fail</td>
<td class="nowrap">`` `s#3 2``</td>
<td>Invalid attempt to set “sorted” attribute. Also encountered with `` `s#enums`` when loading a database (`\l db`) and enum target is not already loaded.</td>
</tr>
<tr class="odd">
<td>splay</td>
<td></td>
<td>Nyi op on splayed table</td>
</tr>
<tr class="even">
<td>srv</td>
<td></td>
<td>Attempt to use client-only license in server mode</td>
</tr>
<tr class="odd">
<td>stack</td>
<td class="nowrap">`{.z.s[]}[]`</td>
<td>Ran out of stack space. Consider using iterate `\` or converge `/` instead of recursion.</td>
</tr>
<tr class="even">
<td>step</td>
<td class="nowrap">``d:`s#`a`b!1 2;`d upsert `c`d!3 4``</td>
<td>Attempt to upsert a step dictionary in place</td>
</tr>
<tr class="odd">
<td>stop</td>
<td></td>
<td>User interrupt (Ctrl-c) or time limit (`-T`)</td>
</tr>
<tr class="even">
<td>stype</td>
<td class="nowrap">`'42`</td>
<td>Invalid type used to signal</td>
</tr>
<tr class="odd">
<td>sys</td>
<td>`{system "ls"}peach 0 1`</td>
<td>Using system call from thread other than main thread</td>
</tr>
<tr class="even">
<td>threadview</td>
<td></td>
<td>Trying to calc a view in a thread other than main thread. A view can be calculated in the main thread only. The cached result can be used from other threads.</td>
</tr>
<tr class="odd">
<td>type</td>
<td class="nowrap">`key 2.2`</td>
<td>Wrong type. Also see `'limit`.</td>
</tr>
<tr class="even">
<td>u-fail</td>
<td class="nowrap">`` `u#2 2``</td>
<td>Anvalid attempt to set “unique” attribute</td>
</tr>
<tr class="odd">
<td>upd</td>
<td></td>
<td>Attempt to use version of kdb+ more recent than update date, or the function upd is undefined (sometimes encountered during ``-11!`:logfile``).</td>
</tr>
<tr class="even">
<td>user</td>
<td></td>
<td>Unlicensed user</td>
</tr>
<tr class="odd">
<td>unmappable</td>
<td>``t:([]sym:`a`b;a:(();()))``<br/>``.Q.dpft[`:thdb;.z.d;`sym;`t]``</td>
<td>When saving partitioned data
each column must be mappable. `()` and `("";"";"")` are OK</td>
</tr>
<tr class="even">
<td>utf8</td>
<td></td>
<td>The websocket requires that text is UTF8 encoded</td>
</tr>
<tr class="odd">
<td>value</td>
<td></td>
<td>No value</td>
</tr>
<tr class="even">
<td>vd1</td>
<td></td>
<td>Attempted multithread update</td>
</tr>
<tr class="odd">
<td>view</td>
<td></td>
<td>Trying to re-assign a view to something else</td>
</tr>
<tr class="even">
<td>wha</td>
<td></td>
<td>Invalid system date (release date is after system date)</td>
</tr>
<tr class="odd">
<td>wsfull</td>
<td class="nowrap">`999999999#0j`</td>
<td>Malloc failed. ran out of swap (or addressability on 32-bit). or hit `-w` limit.</td>
</tr>
<tr class="even">
<td>wsm</td>
<td class="nowrap">`010b wsum 010b`</td>
<td>Alias for nyi for `wsum` prior to V3.2</td>
</tr>
</tbody>
</table>


