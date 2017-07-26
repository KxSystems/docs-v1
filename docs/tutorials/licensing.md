## Who needs a license for kdb+?

Everyone. All use of kdb+ is governed by a license. 

Commercial versions of kdb+ also need a **license key file** `k4lic` to run.


## Free, non-commercial, 32-bit kdb+

Use of the free, non-commercial, 32-bit kdb+ distribution, is licenced by the terms and conditions on the [download page](https://kx.com/download/). 

When you start kdb+ you will see on the banner that your license has no expiry date.
```q
KDB+ 3.5 2017.06.15 Copyright (C) 1993-2017 Kx Systems
m32/ 4()core 8192MB sjt mint.local 192.168.0.39 NONEXPIRE

Welcome to kdb+ 32bit edition
```
Enjoy.


## Commercial kdb+

If you have a commercial distribution of kdb+, it will abort without a suitable license key file `k4.lic`. For example, with no license key file:
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
Kdb+ signals the [error](/ref/error-list/#license-errors) `'k4.lic` and aborts. 


## Obtaining a license key file

!!! info "Designated Contact"
    Each Kx customer designates to licadmin@kx.com **one** technical person as the Designated Contact for issues with kdb+, managing licenses and downloading software. 

The banner at the top of the aborted q session above contains machine-configuration information but no license information. 

The Designated Contact sends a copy of the banner to licadmin@kx.com to receive a `k4.lic` license file in return. 

Save a copy of `k4.lic` in the `QHOME` folder. Restart kdb+ and note the change in the banner. 
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


## Core restrictions

If the license is for fewer cores than the total number on the machine, the number of cores available to kdb+ must be [restricted with OS programs](/cookbook/cpu-affinity/), or kdb+ will signal `'cores` and abort.

<i class="fa fa-hand-o-right"></i> [License errors](/ref/error-list/#license-errors)

<!-- ## License errors

Kdb+ reports license problems at startup by signalling one of the following errors, then aborting. 

error | cause
------| -----
`'cores` | The license is for [fewer cores than available](/cookbook/cpu-affinity).
`'exp` | The license’s expiry date is in the past.
`'host` | The hostname reported by the OS does not match the hostname or hostname-pattern in the license. If you see 255.255.255.255 in the kdb+ banner, the machine almost certainly cannot resolve its hostname to an IP address, which will cause a `'host` error. 
`'k4.lic` | No license file found. 
`'os` | The license is for a different operating system. (No distinction is made between 32-bit and 64-bit versions.) 
`'upd` | The license’s Maintenance Update Date (the date until which maintenance has been paid) precedes this version of kdb+. For example, a license with an Maintenance Update Date of 2015.01.01 covers any version of kdb+ dated before 2015.

 -->
## License questions

Designated Contacts should send license questions to licadmin@kx.com. 

!!! tip "Emergency failover licenses"
    In case of an emergency, such as a hardware or infrastructure failure that renders your license key file unusable, the Designated Contact can email failover@kx.com to request a temporary failover license to allow use of a different machine or IP address. 