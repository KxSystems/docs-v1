The function `system` executes [system commands](Reference/SystemCommands "wikilink"), and is a cover for the `\` system command.

Syntax
------

    q)r:system X

`system` is defined as:

    q)system
    .,["\\"]

The benefit of using `system` rather than `\` is that it can be used as an ordinary function, and returns a result. For example, the following shows that the result of `\w` (workspace information) cannot be assigned, but the result can be obtained using `system`:

    q)\w
    107728 67108864 67108864 0 0j
    q)a:\w
    'w
    q)a:system "w"
    q)a
    107872 67108864 67108864 0 0j

As with `\`, if the argument is not a q command, it is executed in the shell:

    q)system "pwd"
    "/home/guest/q"

When redirecting output to a file, for efficiency purposes, avoiding using /tmp needlessly, append a semi-colon to the command:

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

Can I capture the stderr output from the system call? Not directly, but a workaround is

    / force capture to a file, and cat the file
    q)system"ls egg > file 2>&amp;1;cat file"                                                                                                         
    "ls: egg: No such file or directory"

    / try and fails to capture the text
    q)@[system;"ls egg";{0N!"error - ",x;}]                                                                                                       
    ls: egg: No such file or directory
    "error - os"

In the event of an unexpected change to the working directory, Windows users please note <http://blogs.msdn.com/b/oldnewthing/archive/2007/11/21/6447771.aspx>

See also
--------

-   [\\](Reference/BackSlash "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
