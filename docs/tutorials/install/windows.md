# <i class="fa fa-windows"></i> Installing under Microsoft Windows



Downloading put a file `windows.zip` in your `Downloads` folder. 
Extract the files to `C:\`, producing a new folder `C:\q`. 

!!! tip "Installing elsewhere"

    You can install on a different filepath. If you do, in the following instructions simply replace `C:\q` with your filepath.


## Confirm q is working

Open a command shell window: type Windows-r (or click the Start button) and type `cmd`.

Launch q by typing `C:\q\w32\q`. You should see the kdb+ banner, followed by the `q)` prompt. Type `til 6` to see the first 6 integers. Type `\\` to exit q.

```powershell
Microsoft Windows [Version 6.17601]
Copyright (c) 2009 Microsoft Corporation. All rights reserved.

C:\Users\me>C:\q\w32\q
KDB+ 3.4 2016.06.14 Copyright (C) 1993-2016 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE

Welcome to kdb+ 32bit edition
For support please see http://groups.google.com/d/forum/personal-kdbplus
Tutorials can be found at http://code.kx.com/q/tutorials/install
To exit type \\
To remove this startup msg, edit q.q
q)til 6
0 1 2 3 4 5
q)\\

C:\Users\me>
```

<!-- ![C:32](img/install_windows_01.png "C:32") -->


## Define q as a command

Defining `q` as a command allows you to invoke kdb+ without specifying the path to it.

In the MS-DOS shell:

```powershell
C:\Users\me>setx QHOME "C:\q"

SUCCESS: Specified value was saved.

C:\Users\me>setx PATH "%PATH%;C:\q\w32"

SUCCESS: Specified value was saved.

C:\Users\me>exit
```

<!-- ![Setting environment variables](img/install_windows_02.png "Setting environment variables") -->

!!! tip "Installing elsewhere"

    You can install kdb+ where you please. The environment variable `QHOME` (specified above) tells kdb+ where its home folder is. 


This will close your shell session. Open a new shell session and confirm `q` now works as a command.

```powershell
Microsoft Windows [Version 6.17601]
Copyright (c) 2009 Microsoft Corporation. All rights reserved.

C:\Users\me>q
KDB+ 3.4 2016.06.14 Copyright (C) 1993-2016 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE

Welcome to kdb+ 32bit edition
For support please see http://groups.google.com/d/forum/personal-kdbplus
Tutorials can be found at http://code.kx.com/q/tutorials/install
To exit type \\
To remove this startup msg, edit q.q
q)til 6
0 1 2 3 4 5
q)\\

C:\Users\me>
```

<!-- ![Confirm q works as a command](img/install_windows_03.png "Confirm q works as a command")
 -->


## :fa-certificate: Install a license key file

64-bit kdb+ requires a license key file.
[Obtain and install](/tutorials/licensing) one.

You’re done. You have completely installed kdb+. 


## :fa-hand-o-right: What’s next?

[Get started](/learn) with the q programming language, look through the [reference card](/ref/card), or see in the [Cookbook](/cookbook)  what you can do with kdb+.



