## Who needs a license for kdb+?

Everyone. All use of kdb+ is governed by a license. 

64-bit versions of kdb+ also need a **license key file** (`k4lic`, or `kc.lic` for kdb+ on demand) to run.


### Free, non-commercial, 64-bit kdb+ on demand

kdb+ on demand 64-bit personal edition is for personal, non-commercial use. It may be used freely on up to 2 computers, and up to a maximum of 16 cores per computer, but is not licensed for use on any cloud – only personal computers. It may not be used for any commercial purposes.

[kdb+ on demand](https://ondemand.kx.com/) requires an always-on internet connection to operate.


### Free, non-commercial, 32-bit kdb+

Use of the free, non-commercial, 32-bit kdb+ distribution, is licensed by the terms and conditions on the [download page](https://kx.com/download/). 

When you start kdb+ you will see on the banner that your license has no expiry date.
```q
KDB+ 3.5 2017.06.15 Copyright (C) 1993-2017 Kx Systems
m32/ 4()core 8192MB sjt mint.local 192.168.0.39 NONEXPIRE

Welcome to kdb+ 32bit edition
```
Enjoy.


### Commercial 64-bit kdb+

Use of commercial 64-bit kdb+ is licensed by your agreement with Kx.


## License key files


### 32-bit kdb+

The 32-bit kdb+ distribution does not require a license key file.


### 64-bit kdb+

64-bit distributions of kdb+ (commercial and personal) require a valid license key file. 
Without one, kdb+ signals an [error](/ref/error-list/#license-errors) `'k4.lic` and aborts.
```bash
tom@mb13:~/q$ q
```
```q
KDB+ 3.5 2017.06.15 Copyright (C) 1993-2017 Kx Systems
m64/ 2()core 8192MB tom mb13.local 192.168.1.44
'k4.lic
```
```bash
tom@mb13:~/q$ 
```
The license key file is `k4.lic`, or `kc.lic` for kdb+ on demand.
If both are found, the `k4.lic` file is used.


## Obtaining a license key file

!!! info "Designated Contact"
    Each Kx customer designates to licadmin@kx.com **one** technical person as the Designated Contact for issues with kdb+, managing licenses and downloading software. 

The banner at the top of the aborted q session above contains machine-configuration information but no license information. 

The Designated Contact sends a copy of the banner to licadmin@kx.com to receive a license file in return. 

Save a copy of the license file in the `QHOME` folder. Restart kdb+ and note the change in the banner. 
```bash
tom@mb13:~/q$ q
```
```q
KDB+ 3.5 2017.06.15 Copyright (C) 1993-2017 Kx Systems
m64/ 2()core 8192MB tom mb13.local 192.168.1.44 EXPIRE 2018.05.15 tom@kx.com #400
q)til 6
0 1 2 3 4 5
q)
```
Note the license number (`#400` in the example) and quote it in any correspondence about the license. 


## Keeping the license key file elsewhere

The default location for the license key file is the `QHOME` folder. You do not have to keep the license there. You can use the environment variable `QLIC` to specify a different filepath.

!!! tip "Folder not file"
    Like `QHOME`, `QLIC` points to a folder, not a file. For example,<pre><code class="language-bash">$ QLIC='/Users/simon/q'</code></pre>


## Licensing server for kdb+ on demand

As well as a license key file, kdb+ on demand also requires frequent contact with the licensing server. 
For this you need an always-on Net connection.

If kdb+ cannot contact the server it will abort with a timestamped message.
```q
'2018.03.28T11:20:03.831 couldn't connect to license daemon -- exiting
```


## Core restrictions

If the license is for fewer cores than the total number on the machine, the number of cores available to kdb+ must be [restricted with OS programs](/cookbook/cpu-affinity/), or kdb+ will signal `'cores` and abort.

As long as you task or numa correctly, the binary will not abort itself.

You can see the number of cores entitled to a q process:

-   by looking at the banner, e.g. `…w64/ 2(16)core…` – the 2 here is what the process is allowed to use, and the 16 is the licensed amount
-   with [`.z.c`](/ref/dotz/#zc-cores) – not the physical cores of the system, but rather the number the process is allowed to use
-   the first element of [`.z.l`](ref/dotz/#zl-license) 

The number of licensed cores is always 16 for the on-demand license. 

<i class="fa fa-hand-o-right"></i> [License errors](/ref/error-list/#license-errors)


## License questions

Designated Contacts should send license questions to licadmin@kx.com. 

!!! tip "Emergency failover licenses"
    In case of an emergency, such as a hardware or infrastructure failure that renders your license key file unusable, the Designated Contact can email failover@kx.com to request a temporary failover license to allow use of a different machine or IP address. 

