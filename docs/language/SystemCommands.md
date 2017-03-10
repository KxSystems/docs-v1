System commands control the q environment. They have the form:
```
\cmd [p]
```
for some command `cmd`, and optional parameter list `p`. 

Commands with optional parameters that *set* values, will *show* the current values if the parameters are elided.

Some system commands have equivalent command-line parameters.

!!! tip "Call a system command in a q expression"
    To call a system command in a q expression, use `system`.
    ```q
    q)\l sp.q
    ...
    q)\a                     / tables in namespace
    `p`s`sp
    q)count \a               / \ must be the first character
    '\
    q)system "a"             / same command called with system
    `p`s`sp
    q)count system "a"       / this returns a result
    3
    ```


## `\a [namespace]` – tables

Lists tables in the given namespace, default current namespace.
```q
q)\l sp.q
...
q)\a                  / tables in default namespace
`p`s`sp
q)\a .o               / tables in .o
,`TI
```


## `\b` – views/dependencies

Lists all dependencies (views). See also [.z.b](Reference/dotzdotb "wikilink").
```q
q)a::x+y
q)b::x+1
q)\b
`s#`a`b
```


## `\B` – pending views/dependencies

Lists all pending dependencies (views), i.e. dependencies not yet referenced, or not referenced after their referents have changed.
```q
q)a::x+1          / a depends on x
q)\B              / the dependency is pending
,`a
q)x:10
q)\B              / still pending after x is defined
,`a
q)a               / use a
11
q)\B              / no longer pending
`symbol$()
```


## `\c [h,w]` – console height,width

Sets console height and width. This is the same as the `-c` command line parameter, see [Console Size](Reference/ConsoleSize "wikilink")


## `\C [h,w]` – http height,width

Sets the HTTP height and width. This is the same as the `-C` command line parameter, see [Console Size](Reference/ConsoleSize "wikilink")


## `\cd [name]` – change directory

Changes the current directory.
```q
~/q$ q
KDB+ 2.6 2010.05.10 Copyright (C) 1993-2010 Kx Systems
..
q)\cd
"/home/guest/q"
q)\cd /home/guest/dev
q)\cd
"/home/guest/dev"
```


## `\d [namespace]` – directory

Sets the current namespace (also known as directory or context). The namespace can be empty, and a new namespace is created when an object is defined in it. The prompt indicates the current namespace. 
```q
q)\d                  / default namespace
`.
q)\d .o               / change to .o
q.o)\f
`Cols`Columns`FG`Fkey`Gkey`Key`Special..
q.o)\d .              / return to default
q)key`                / lists namespaces other than .z
`q`Q`o`h
q)\d .s               / change to non-existent namespace
q.s)key`              / not yet created
`q`Q`o`h
q.s)a:1               / create object, also creates namespace
q.s)key`
`q`Q`o`h`s
```


## `\e [0|1]` – error trap clients

This enables error trapping for client requests. The default is 0 (off).

When a client request has an error, by default the server clears the stack. This is appropriate for production use as it enables the server to continue processing other client requests.

For development, you can set `\e 1` to enable debugging on the server. In this case, the server suspends on an error, and does not process other requests until the stack is cleared.


## `\f [namespace]` – functions

Lists functions in the given namespace, default current namespace.
```q
q)f:g:h:{x+2*y}
q)\f
`f`g`h
q)\f .q
`aj`aj0`all`and`any`asc`asof`attr`avgs`ceiling`cols..
```


## `\g [mode]` – garbage collection mode

Since V2.7 2011.02.04. Switch garbage collection between immediate (1) and deferred (0) modes. See also [-g](Reference/Cmdline "wikilink").


## `\l name` – load file or directory

The parameter can be a script filename or a directory. A script is loaded, and a directory database is opened. When q opens a directory, it changes its current directory to it. This allows reloading the current database using `\l .`. If the directory is specified as `.`, any scripts in that directory will be ignored; this is to allow (re)loading of data only.
```q
q)\l sp.q            / load sp.q script
...
q)\a                 / tables defined in sp.q
`p`s`sp
q)\l db/tickdata     / load the data found in db/tickdata
q)\a                 / with tables quote and trade
`p`quote`s`sp`trade
```


## `\o [n]` – offset from GMT

Sets the local time offset, as hours from GMT, or as minutes if abs[n]&gt;23. Initially, the value is 0N, meaning that the machine's offset is used.
```q
q)\o
0N
q).z.p                        / GMT
2010.05.31D23:45:52.086467000
q).z.P                        / local time is GMT + 8
2010.06.01D07:45:53.830469000
q)\o -5                       / set local time as GMT - 5
q).z.P
2010.05.31D18:45:58.470468000
q)\o 390                      / set local time as GMT + 6:30
q).z.P
2010.06.01D06:16:06.603981000
```
This corresponds to the `-o` command line parameter.


## `\p [i]` – port

Sets the listening port number. The default is 0 (no listening port). The port must be available and the process must have permission for the port.

A negative parameter sets a [multi-threaded](Releases/ChangesIn2.4#multi-threadedinput "wikilink") port and if used it must be the initial and only mode of operation, i.e. do not dynamically switch between positive port and negative port.

A parameter of `0W` means pick a random available port within the range 32768 - 60999
```q
q)\p 5010     / set port 5010
q)\p
5010
q)\p 0W       / pick a random available port within the range 32768 - 60999
q)\p
45512
```q
q)\p 0        / turn off listening port
```
This corresponds to the `-p` command line parameter.


## `\P [n]` – precision

Sets display precision for floating point numbers, i.e. the number of digits shown, see [Display Precision](Reference/DisplayPrecision "wikilink").


## `\r` – replication master

This should not be executed manually otherwise it can disrupt replication. It is executed automatically by the replicating process on the master process, and returns the log file name and log file count (see [Command Line Reference](Cmdline "wikilink")).


## `\r src dst` – rename

This renames file `src` to `dst`. It is equivalent to the Unix `mv` command, or the windows `move` command (except that it will not rename to a different disk drive).


## `\s` – number of slaves

This queries the number of slaves, set with the `-s` command line parameter (query only).


## `\S [n]` – random seed

Sets the random number seed. The parameter must be a non-zero integer. Note that `\S` is not updated as the random-number generator is used.
```q
q)\S              / default
-314159
q)5?10
8 1 9 5 4
q)5?10
6 6 1 8 5
q)\S -314159      / restore default seed
q)5?10            / same random numbers generated
8 1 9 5 4
q)\S              / seed is not updated
-314159
```

!!! note
    Since V3.1 2013.08.19 the behaviour is as follows.

    Rng is thread-local.
    `\S 1234` sets the seed for the rng for the main thread only.
    The rng in a slave thread is assigned a seed based on the slave thread number.
    In multithreaded input mode, the seed is based on socket descriptor.
    Instances started on ports 20000 thru 20099 (slave procs, used with e.g. `q -s -4` have the main thread’s default seed based on the port number.


## `\t [p]` – timer

This command has two different uses depending on the parameter given.

An integer parameter is the number of milliseconds between timer ticks. If 0, the timer is turned off, otherwise the timer is turned on and the first tick given. On each tick, the function assigned to `.z.ts` is executed.
```q
q)\t                           / default off
0
q).z.ts:{show`second$.z.N}
q)\t 1000                      / tick each second
q)13:12:52
13:12:53
13:12:54
\t 0                           / turn off
```
A parameter of a q expression other than a single integer is executed and the execution time shown in milliseconds.
```q
q)\t log til 100000            / milliseconds for log of first 100000 numbers
3
q)\t do[100;log til 100000]    / timing for 100 repetitions
196
q)\t:100 log til 100000    / timing for 100 repetitions, new syntax of "\t:n expr" since 3.0 2011.11.22
186
```
The tick timer usage corresponds to the `-t` command line parameter.


## `\ts exp` – time and space

Executes the expression and shows the execution time in milliseconds and the space used in bytes.
```q
q)\ts log til 100000
7 2621568j
```
Since 3.1 2014.02.07
```q
q)\ts:10000 log til 1000           /same as \ts do[10000; log til 1000]
329 24672
```


## `\T [n]` – timeout

This sets the client execution timeout, as the integer number of seconds a client call will execute before timing out, default 0 (no timeout). Note this is in seconds, not milliseconds like `\t`.

This corresponds to the `-T` command line parameter.


## `\u` – reload user password file

When q is invoked with the `-u` parameter specifying a user password file, then `\u` will reload the password file. This allows updates to the password file while the server is running.


## `\v [namespace]` – variables

Lists the variables in the given namespace, default current namespace.
```q
q)a:1+b:2
q)\v
`a`b
q)\v .o
`B0`C0`PS`T`T0`TI`t
```


## `\w [0]` – workspace

If there is no parameter, lists current memory usage, as a list of 6 long integers:
  
- `[0]` number of bytes allocated
- `[1]` bytes available in heap
- `[2]` maximum heap size so far
- `[3]` maximum bytes available, given in `-w` command line parameter
- `[4]` mapped bytes
- `[5]` physical memory

If there is a parameter, returns a pair:
  
- `[0]` number of internalized symbols
- `[1]` corresponding memory usage

```q
q)\w
168144 67108864 67108864 0 0 8589934592j
q)\w 0
577 25436j
```
The function `.Q.w` formats all this information:
```q
q).Q.w[]
used| 168304
heap| 67108864
peak| 67108864
wmax| 0
mmap| 0
mphy| 8589934592
syms| 577
symw| 25436
```


## `\W [n]` – week offset

Specifies the start of week offset, where 0 is Saturday. The default is 2 = Monday.

This corresponds to the `-W` command line parameter.


## `\x .z.p\*` – expunge

By default, callbacks like `.z.po` are not defined in the session. After they have been assigned, you can restore the default using `\x` to delete the definition that was made.
```q
q).z.pi                       / default has no user defined function
'.z.pi
q).z.pi:{">",.Q.s value x}    / assign function
q)2+3
>5
q)\x .z.pi                    / restore default
```
N.B. This works only for `.z.p*` variables defined in k before q.k is loaded. e.g. as `.z.ph` is defined in `q.k`, there is no default for it to be reset to.


## `\z [0|1]` – date parsing

Specifies the format for date parsing. 0 is "mm/dd/yyyy" and 1 is "dd/mm/yyyy".
```q
q)\z
0
q)"D"$"06/01/2010"
2010.06.01
q)\z 1
q)"D"$"06/01/2010"
2010.01.06
```


## `\1 & \2 filename` – redirect

`\1` and `\2` allow redirecting stdout and stderr to files from within the q session. The files and intermediate directories are created if necessary.
```
~/q$ rm -f t1.txt t2.txt
~/q$ l64/q
```
```
KDB+ 2.6 2010.05.10 Copyright (C) 1993-2010 Kx Systems
...
q)\1 t1.txt              / stdout
q)\2 t2.txt              / stderr
til 10
2 + "hello"
\\
~/q$ cat t1.txt          / entry in stdout
0 1 2 3 4 5 6 7 8 9
~/q$ cat t2.txt          / entry in stderr
q)q)'type
```


## `\_ [scriptname]` – hide q code

This command has two different uses depending on whether a parameter is given.

If no parameter, then `\_` checks if client write access is blocked, see [-b](Reference/Cmdlineb "wikilink").

If a parameter is given, it should be a scriptname and `\_` `f.q` makes a runtime script `f.q_`. The q code cannot be viewed or serialized.
```
~/q$ echo "a:123;f:{x+2*y}" > t1.q
~/q$ l64/q
```
```q
KDB+ 2.6 2010.05.10 Copyright (C) 1993-2010 Kx Systems
..
q)\_ t1.q               / create locked script
`t1.q_
q)\l t1.q_              / can be loaded as usual
q)a                     / definitions are correct
123
q)f[10;1 2 3]
12 14 16
q)f                     / q code cannot be displayed
locked
q)-8!f                  / or serialized
'type
q)read1`:t1.q_          / file contents are scrambled
0x27fc45d98727b2ed0a530c25881733a5
```


## `system`

Syntax: `system x`

Where `x` is a system command as a string, without its `\` prefix.

The benefit of using `system` rather than `\` is that it can be used as an ordinary function, and returns a result. For example, the following shows that the result of `\w` (workspace information) cannot be assigned, but the result can be obtained using `system`
```q
q)\w
107728 67108864 67108864 0 0j
q)a:\w
'w
q)a:system "w"
q)a
107872 67108864 67108864 0 0j
```
As with `\`, if the argument is not a q command, it is executed in the shell.
```
q)system "pwd"
"/home/guest/q"
```
When redirecting output to a file, for efficiency purposes, avoiding using /tmp needlessly, append a semi-colon to the command:
```q
q)system"cat x"
```
is essentially the same as the shell command
```q
$cat x > tmpout
```
as q tries to capture the output. So if you do
```q
q)system"cat x > y"
```
under the covers that looks like
```q
$cat x > y > tmpout
```
not good. So if you add the semi colon
```q
q)system"cat x > y;"
```
the shell interpreter considers it as 2 statements
```q
$cat x > y; > tmpout
```
Can I capture the stderr output from the system call? Not directly, but a workaround is
```q
/ force capture to a file, and cat the file
q)system"ls egg > file 2>&amp;1;cat file"
"ls: egg: No such file or directory"
/ try and fails to capture the text
q)@[system;"ls egg";{0N!"error - ",x;}]
ls: egg: No such file or directory
"error - os"
```

!!! warning "Changing working directory in Windows"
    In the event of an unexpected change to the working directory, Windows users please note <http://blogs.msdn.com/b/oldnewthing/archive/2007/11/21/6447771.aspx>


## `\` – terminate

If there is a suspension, this exits one level of the suspension. Otherwise, it toggles between q and k mode. (To switch languages from inside a suspension, type "`\`".)
```q
q){1+x}"hello"
{1+x}
'type
+
1
"hello"
q))\                         / clear suspension (only one level)
q)\                          / toggle to k mode
  !5
0 1 2 3 4
  \                          / toggle to q mode
q)
```


## `\` – toggle q/k 

In the interactive session `\` toggles between the q and k interpreters.
```q
q)\
  \
q)
```

## `\\` – quit 

In the interactive session type `\\` at the prompt to quit the session. Inside a function, use `value"\\\\"` or `exit 0` for the same result.

Note that the text following `\\` and white space is ignored by q. This is often useful in scripts where `\\` can be followed by comments or usage examples.

<i class="fa fa-hand-o-right"></i> [`exit`](errors/#exit) 


## OS Commands

If an expression begins with `\` but is not recognized as a system command, then it is executed as an OS command.
```q
q)\ls                 / usual ls command
"help.q"
"k4.lic"
"l64"
"odbc.k"
"profile.q"
"q.k"
..
```

!!! warning
    This means that typos can get passed to the OS.

> When you are run `rm -r /` you are have of many problem, but Big Data is not one of them. — @DEVOPS_BORAT
