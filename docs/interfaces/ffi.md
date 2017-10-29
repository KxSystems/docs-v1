# Using foreign functions with kdb+

!!! info "FUSE"
    This is a [FUSE interface](/interfaces/fuse) to kdb+

<i class="fa fa-github"></i> [KxSystems/ffi](https://github.com/kxsystems/ffi)
is an extension to kdb+ for loading and calling dynamic libraries using pure `q`. 

The main purpose of the library is to build stable interfaces on top of external libraries, or to interact with the operating system from `q`. No compiler toolchain or writing C/C++ code is required to use this library.

**Watch out** You don’t need to write C code, but you do need to know what you are doing. You can easily crash the kdb+ process or corrupt in-memory data structures with no hope of finding out what happened. No support is offered for crashes caused by use of this library.

We are grateful to Alexander Belopolsky for allowing us to adapt and expand on the original codebase 
<i class="fa fa-github"></i> [enlnt/ffiq](https://github.com/enlnt/ffiq). 


## Requirements

### Operating system
<i class="fa fa-linux"></i> Linux, 
<i class="fa fa-apple"></i> macOS 10.10+, 
<i class="fa fa-windows"></i> Windows 7+

### libffi 3.1+
environment                          | installation
-------------------------------------|----------------------------------------------------------
Ubuntu Linux 64-bit with 64-bit kdb+ | `sudo apt-get install libffi-dev`
Ubuntu Linux 64-bit with 32-bit kdb+ | `sudo apt-get install libffi-dev:i386`
macOS                                | `brew install libffi`(at time of writing is libffi 3.2.1)
Windows                              | (no action required)


### kdb+ V3.4+

-    <i class="fa fa-download"></i> [Download](http://kx.com/download/)
-    <i class="fa fa-hand-o-right"></i> [Install](http://code.kx.com/q/tutorials/install/)


## Installation

<i class="fa fa-download"></i>
Download the appropriate release archive from ==FIXME==[releases](../../releases/latest) page. 

Unpack and install content of the archive: 

environment     | action
----------------|---------------------------------------------------------------------------------------
Linux and macOS | `tar xzvf ffi_osx-v0.9.2.tar.gz -C $QHOME --strip 1`
Windows         | Open the archive and copy content of the `ffi` folder (`ffi\*`) to `%QHOME%` or `c:\q`


## API

`ffi.q` exposes two main functions in the `.ffi` namespace. See `test_ffi.q` for detailed examples of usage.


### Passing data and getting back results

Throughout the library, characters are used to encode the types of data provided and expected as a result. These are based on the `c` column of [primitive data types](http://code.kx.com/q/ref/datatypes/#primitive-datatypes) and the corresponding upper case for vectors of the same type. The `sz` column is useful to work out what type can hold enough data passing to/from C.

The argument types are derived from data passed to the function (in case of `cf`) or explicitly specified (in case of `bind`). The number of character types provided must match the number of arguments expected by the C function.
The return type is specified as a single character and can be `' '` (space), which means to discard the result (i.e. `void`). If not provided, defaults to `int`.

char             | C type       
-----------------| -------------------------
b, c, x          | unsigned int8
h                | signed int16
i                | signed int32
j                | signed int64
e                | float
f                | double
g, s             | uint8*
`' '` (space)    | void (only as return type)
r                | raw pointer
k                | K object
uppercase letter | pointer to the same type

It is possible to pass a q function to C code as a callback (see `qsort` example below). The function must be presented as a mixed list `(func;argument_types;return_type)`, where `func` is a q function (type `100h`), `argument_types` is a char array with the types the function expects, and `return_type` is a char corresponding to the return type of the function. Note that, as callbacks potentially have unbounded life in C code, they are not deleted after the function completes.


### `cf` – call function

Simple function call, intended for one-off calls, and taking two arguments:

1. Function name (symbol) or list of the return type char and the function name.
2. Mixed list of arguments. The types of arguments passed to the function are inferred from the q types and should match the width of the arguments the C function expects. (If an argument is not a mixed list, append `(::)` to it.)


### `bind` – create projection with function resolved to call with arguments

Prepares a q function and binds it to the provided C function for future calls. Useful for multiple calls to C lib. Takes three arguments:

1. function name: simple symbol or list of two symbols specifying library name 
2. char array of argument types
3. char with return type


Some utility functions are provided as well:

function | purpose
---------|-------------------------------------------------------------------------------------
`cif`    | prepare the return and argument types to be used in `call`
`call`   | call the function with the argument/s and the types prepared by `cif`
`errno`  | return current `errno` global on \*nix OS
`kfn`    | bind the function which returns and accepts K objects in current process. Similar to `2:`

Function arguments should be passed as a generic list to `cf`, `call`, and the function created by `bind`.

`cf` and `call` perform native function loading and resolution at the time of the call, which creates significant overhead. Use `bind` to perform this step in advance and reduce runtime overhead.


## Examples
```q
q)\l ffi.q / populates .ffi namespace
q).ffi.cf[`strlen](`abc;::) / arguments should be passed as generic lists
3i
q).ffi.cf[`strlen]("abc\000";::) / null-terminate q-strings
3i
q)n:.ffi.cf[`printf]("%s %c %hd %d %ld %g\n\000";`test;"x";1h;2;3j;4f)
test x 1 2 3 4
q)b:n#"\000" / buffer
q)n:.ffi.cf[`sprintf](b;"%s %c %hd %d %ld %g\n\000";`test;"x";1h;2;3j;4f)
q)b
"test x 1 2 3 4\n"

q).ffi.cf[("h";`getppid)]() / specify return type, no args
13615h
// only Linux
q).ffi.cf[("e";`libm.so`powf)]2 2e,(::) / explicit library
4e
```


### BLAS 
All arguments should be vectors (i.e. pointers to appropriate type).
```q
q)x:10#2f;
q).ffi.cf[("f";`libblas.so`ddot_)](1#count x; x;1#1;x;1#1)
40f
q).ffi.cf[(" ";`libblas.so`daxpy_)](1#count x;1#2f; x;1#1;x;1#1)
q)x / <- a*x+y, a=x=y=2
6 6 6 6 6 6 6 6 6 6f
```


### Callbacks
```q
q)cmp:{0N!x,y;(x>y)-x<y} 
q)x:3 1 2i;
// warning: this modifies data in-place regardless of other references.
q).ffi.cf[(" ";`qsort)](x;3i;4i;(cmp;"II";"i")) 
1 2
3 1
3 2
q)x
1 2 3i
q)x:`c`a`b;
// warning: this modifies data in-place regardless of other references.
q).ffi.cf[(" ";`qsort)](x;3i;8i;(cmp;"SS";"i")) 
`a`b
`c`a
`c`b
q)x
`a`b`c
```
Register a callback on a handle
```q
// h is handle to some other process
r:{b:20#"\000";n:.ffi.cf[`read](x;b;20);0N!n#b;0}
.ffi.cf[`sd1](h;(r;(),"i"))   / start handler
.ffi.cf[`sd0](h;::)           / stop handler
```
