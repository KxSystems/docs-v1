These functions engage with the operating system.

<i class="fa fa-hand-o-right"></i> [system commands](FIXME)


## `getenv`

Syntax: `getenv x`

where `x` is a symbol atom naming an environment variable, returns its value.
```q
q)getenv `SHELL
"/bin/bash"
q)getenv `UNKNOWN      / returns empty if variable not defined
""
```


## `gtime`

Syntax: `gtime ts`

where `ts` is a datetime/timestamp, returns the UTC datetime/timestamp. Recall that the UTC and local datetime/timestamps are available as `.z.z`/`.z.p` and `.z.Z`/`.z.P` respectively.
```q
q).z.p
2009.10.20D10:52:17.782138000
q)gtime .z.P                      / same timezone as .z.p
2009.10.20D10:52:17.783660000
```


## `ltime`

Syntax: `ltime ts`

where `ts` is a datetime/timestamp, returns the local datetime/timestamp. Recall that the UTC and local datetime/timestamps are available as `.z.z`/`.z.p` and `.z.Z`/`.z.P` respectively.
```q
q).z.P
2009.11.05D15:21:10.040666000
q)ltime .z.p                  / same timezone as .z.P
2009.11.05D15:21:10.043235000
```


## `setenv`

Syntax: `x setenv y`

where `x` is a symbol atom and `y` is a string, sets the environment variable `x` names.
```q
q)`RTMP setenv "/home/user/temp"
q)getenv `RTMP
"/home/user/temp"
q)\echo $RTMP
"/home/user/temp"
```


## `system`

Syntax: `system x`

where `x` is a [system command](systemcommands), executes it and returns its result.

The following shows that the result of `\w` (workspace information) cannot be assigned, but the result can be obtained using `system`.
```q
```q)\w
107728 67108864 67108864 0 0j
q)a:\w
'w
q)a:system "w"
q)a
107872 67108864 67108864 0 0j
```
As with `\`, if the argument is not a q command, it is executed in the shell:
```q
q)system "pwd"
"/home/guest/q"
```

!!! tip "Directing output to a file"
    When redirecting output to a file, for efficiency purposes, avoiding using /tmp needlessly, append a semi-colon to the command.
    ```q
    q)system"cat x"
    is essentially the same as the shell command
    $cat x > tmpout
    as q tries to capture the output.
    So if you do
    q)system"cat x > y"
    under the covers that looks like
    $cat x > y > tmpout
    not good. So if you add the semi colon
    q)system"cat x > y;"
    the shell interpreter considers it as 2 statements
    $cat x > y; > tmpout
    ```

!!! tip "Capture stderr output"
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

In the event of an unexpected change to the working directory, Windows users please note this <a href="http://blogs.msdn.com/b/oldnewthing/archive/2007/11/21/6447771.aspx" target="_blank">MSDN post</a>.
