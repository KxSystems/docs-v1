# <i class="fa fa-apple"></i> Installing under macOS




After downloading, if necessary, unzip the archive. A new folder `q` will appear in your `Downloads` folder.

Next perform the _Minimum install and launch_. We then strongly recommend continuing to [Complete install and launch](#complete-install-and-launch).


## :fa-rocket: Minimum install and launch

Open the Terminal application and enter the following commands:

```bash
$ cd ~/Downloads
~/Downloads$ cp -r q ~/.
~/Downloads$ cd ~
$ q/m32/q
```
```txt
KDB+ 3.6 2018.07.30 Copyright (C) 1993-2018 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE

Welcome to kdb+ 32bit edition
For support please see http://groups.google.com/d/forum/personal-kdbplus
Tutorials can be found at http://code.kx.com/q/tutorials/install
To exit type \\
To remove this startup msg, edit q.q
```
```q
q)til 6 / first 6 integers
0 1 2 3 4 5
q)\\
$
```

<!-- ![Answer the prompts like this.](img/install_mac_01.png "Answer the prompts like this") -->

You have installed and launched kdb+.

To exit from kdb+, type `\\`


## Complete install and launch

The minimum installation can be improved in two important ways. We strongly recommend them.

-   Call kdb+ within the `rlwrap` command, which will allow you to call back and edit previous lines
-   Define `q` as a command alias, allowing you to invoke kdb+ without specifying the path to it


### :fa-plug: Install Rlwrap

Exit kdb+ to return to the command prompt and your home folder. Ask for Rlwrap’s version number. If you see one, Rlwrap is already installed.

```bash
q)\\
$ rlwrap -v
rlwrap 0.42
$
```

<!-- ![rlwrap -v](img/install_mac_03.png "rlwrap -v") -->

If Rlwrap is already installed you can go on to the next step.

Otherwise, you will be told `rlwrap: command not found`. Install Rlwrap using your package manager. (Probably either [MacPorts](https://www.macports.org/install.php) or [Homebrew](http://brew.sh/))


### :fa-code: Edit your profile

In Terminal (Bash), open your profile `~/.bashrc` with TextEdit (or your favourite text editor),

```bash
$ open -a "Sublime Text" .bashrc
```

<!-- ![open -a Textedit .bash\_profile](img/install_mac_04.png "open -a Textedit .bash_profile") -->

append the following line
```bash
alias q='QHOME=~/q rlwrap -r ~/q/m32/q'
```
and save it. Start a new Terminal session, or tell Bash to use the revised profile:

```bash
$ source .bashrc
```

<!-- ![source .bash\_profile](img/install_mac_05.png "source .bash_profile") -->

!!! tip "Installing elsewhere"

    You can install kdb+ where you please. The environment variables `QHOME` (specified above) and `QLIC` tell kdb+ [where to find its files](/tutorials/licensing). 


## :fa-check: Confirm successful installation

From your home folder, launch kdb+, type an expression and recall it using the up-arrow key:

```txt
$ q
KDB+ 3.6 2018.07.30 Copyright (C) 1993-2018 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE

Welcome to kdb+ 32bit edition
For support please see http://groups.google.com/d/forum/personal-kdbplus
Tutorials can be found at http://code.kx.com/q/tutorials/install
To exit type \\
To remove this startup msg, edit q.q
```
```q
q)til 6 / first 6 integers
0 1 2 3 4 5
q)til 6 / first 6 integers
0 1 2 3 4 5
q)\\
$
```

<!-- ![In q, type an expression and recall it with the up-arrow key](img/install_mac_06.png "In q, type an expression and recall it with the up-arrow key") -->


## :fa-certificate: Install a license key file

64-bit kdb+ requires a license key file.
[Obtain and install](/tutorials/licensing) one.

You’re done. You have completely installed kdb+. 


## :fa-hand-o-right: What’s next?

[Get started](/learn) with the q programming language, look through the [reference card](/ref/card), or see in the [Cookbook](/cookbook)  what you can do with kdb+.



