# ![Python](/interfaces/img/python.png) embedPy


<div class="fusion" markdown="1">
<i class="fa fa-superpowers"></i> [Fusion for kdb+](/interfaces/fusion)
</div>

Allows the kdb+ interpreter to manipulate Python objects and call Python functions.


## Requirements

- kdb+ >=3.5 64-bit
- Anaconda Python 3.x
- macOS or Linux 


## Build and install

<i class="fa fa-download"></i> Download the code from <i class="fa fa-github"></i> [KxSystems/embedPy](https://github.com/ksystems/embedpy).

Build the interface and run sanity checks with 

```bash
./configure && make test
```
If running in an environment without Internet access, you will need to download the kdb+ [C API header file](https://raw.githubusercontent.com/KxSystems/kdb/master/c/c/k.h) manually and place in the build directory.

### Install

place `p.q` and `p.k` in `$QHOME` and `p.so` in `$QHOME/{l64|m64}`.  

!!! warning "`p.so`"
    If you are currently using PyQ, it also has a file `p.so` in `$QHOME/{l64|m64}`. In this case, you may want to run initially from the local build directory without installing. 

    Skip the install step and run q in the build directory to do this.


## Back-incompatible changes

### V0.2-beta -> V1.0

- Attribute access from embedPy object 
<pre><code class="language-q">
/ old
q)obj\`ATTRNAME
/ new
q)obj\`:ATTRNAME
</code></pre>

- embedPy objects can be called directly without explicitly specifying the call return type, the default return type is an embedPy object

### V0.1-beta -> V0.2beta in V0.2-beta

V0.2-beta features a number of changes back-incompatible with the previous release, V0.1-beta. 

Most notably, the default _type_ used in many operations is now the embedPy type, rather than the foreign type. Differences between these types (and the associated APIs) are set out below. 



