## Overview

### K object

The C API provides access to the fundamental data `K` object of kdb+ and methods of manipulating it. The `K` object is a pointer to a `k0` struct, a [tagged union](https://en.wikipedia.org/wiki/Tagged_union), and most of the API manipulates this pointer.

It is defined as
```c
typedef struct k0 *K;
```

More detailed information can be found in C API header file [k.h](https://github.com/KxSystems/kdb/blob/master/c/c/k.h).
The C API defines some types to improve uniformity of the API.

| type          | type letter|
|---------------|---------|
| unsigned char | `G`     |
| 16-bit int    | `H`     |
| 32-bit int    | `I`     |
| 64-bit int    | `J`     |
| 32-bit float  | `E`     |
| 64-bit double | `F`     |
| char          | `C`     |
| char\*        | `S`     |
| void          | `V`     |
| 16-byte array | `U`     |


### Accessing members of the K object

#### K object properties for object x

The members which are common to all variant types are `t`, `u`, and `r`. The field `n` is common to all variant types which have a length. These may be dereferenced as usual in the C language: 

| accessor | description                  |
|----------|-----------------------------------|
| `x->t`   | type of K object. (`signed char`).|
| `x->u`   | attribute. `0` means no attributes. (`C`).|
| `x->r`   | reference count. Modify only via `r1(x),r0(x)`. (`I`) |
| `x->n`   | number of elements in a list. (`J`)|

#### Atom accessors for object x

The fields of the variant types which represent an atom (sometimes called a scalar) are:

| kdb+ type| accessor | derived types                     |
|--------|----------|-----------------------------------|
| byte   | `x->g` (`G`)  | boolean, char                     |
| short  | `x->h` (`H`)  |                                   |
| int    | `x->i` (`I`)  | month, date, minute, second, time |
| long   | `x->j` (`J`)  | timestamp, timespan               |
| real   | `x->e` (`E`)  |                                   |
| float  | `x->f` (`F`)  | datetime                          |
| symbol | `x->s` (`S`)  | error                             |
| table  | `x->k` (`K`)  |                                   |


#### List accessors

To simplify accessing the members for list variant, the following multiple helper macros are provided, to be used as, `kG(x)`, for example.

q type name  | interface list accessor function 
-------------|-----------------------------------------------
mixed list   | `K* kK(x)`
boolean      | `G* kG(x)`
guid         | `U* kU(x)`
byte         | `G* kG(x)`
short        | `H* kH(x)`
int          | `I* kI(x)`
long         | `J* kJ(x)`
real         | `E* kE(x)`
float        | `F* kF(x)`
char         | `C* kC(x)`
symbol       | `S* kS(x)`
timestamp    | `J* kJ(x)`
month        | `I* kI(x)`
date         | `I* kI(x)` (days from 2000.01.01)
datetime     | `F* kF(x)` (days from 2000.01.01)
timespan     | `J* kJ(x)` (nanoseconds) 
minute       | `I* kI(x)`
second       | `I* kI(x)`
time         | `I* kI(x)` (milliseconds)
dictionary   | `kK(x)[0]` for keys and `kK(x)[1]` for values 


## Constants

`q` has a rich type system. The type is indicated by a type number and many of these numbers have a constant defined around 0. Positive numbers are used for types which have a length, and the negative of these represent the scalar type. 
For example, `KB` is the type for a vector of booleans, and the negative, `-KB` is for an atom of type boolean.
Some types do not have a constant. For example, `mixed list` has type `0`, and `error` has a type `-128`.

constant | associated type | value
---------|-----------------|------
KB       | boolean         | 1
UU       | guid            | 2
KG       | byte            | 4  
KH       | short           | 5  
KI       | int             | 6  
KJ       | long            | 7  
KE       | real            | 8  
KF       | float           | 9  
KC       | char            | 10 
KS       | symbol          | 11 
KP       | timestamp       | 12 
KM       | month           | 13 
KD       | date            | 14 
KZ       | datetime        | 15 
KN       | timespan        | 16 
KU       | minute          | 17 
KV       | second          | 18 
KT       | time            | 19 
XT       | table           | 98 
XD       | dictionary      | 99 


Some numeric constants are defined and have special meaning – indicating null or positive infinity for that type.

constant  | value                                    |   description 
----------|------------------------------------------|---------------
nh        | 0xFFFF8000                               | short null
wh        | 0x7FFF                                   | short infinity
ni        | 0x80000000                               | int null 
wi        | 0x7FFFFFFF                               | int infinity
nj        | 0x8000000000000000                       | long null 
wj        | 0x7FFFFFFFFFFFFFFF                       | long infinity
nf        | log(-1.0) on Windows or (0/0.0) on Linux | floating point null
wf        | -log(0.0) in Windows or (1/0.0) on Linux | floating point infinity


## Variables

`es`
: Global `char*`, a pointer to an error string if the last operation returned `NULL`.


## Functions 
Unless otherwise specified, no function accepting `K` objects should be passed `NULL`.


`b9`
: `K b9(I mode,K x)`
: Serialise `x` using q IPC, using `mode` capabilities level, where `mode` is:

    value | effect
    ------|------
    -1    | use within shared libraries from V3.0 onwards
    0     | unenumerate, block serialization of timespan and timestamp (for working with versions prior to V2.6)
    1     | retain enumerations, allow serialization of timespan and timestamp: Useful for passing data between threads
    2     | unenumerate, allow serialization of timespan and timestamp
    3     | unenumerate, compress, allow serialization of timespan and timestamp

: On success, returns byte array K object with serialised representation. On error, `NULL` is returned, and `es` will contain error string.

`d9`
: `K d9(K x)`
: Deserialize the byte array in `x`. 
: The byte array `x` passed to `d9` is not altered in any way. 

: On success, returns deserialized K object. On error, `NULL` is returned, and `es` will contain error string.


`dj`
: `I dj(I date)`
: Convert q date to `yyyymmdd` integer.

`dl`
: `K dl(V* f, I n)`
: The dynamic link. Function takes a C function that would take _n_ K objects as arguments and returns a K object. Shared library only.
: Returns a q function. 

`dot`
: `K dot(K x, K y)`
: The same as the q function `.[x;y]`. Shared library only.

: On success, returns K object with result of `.` application. On error, `NULL` is returned, and `es` will contain error string. See `ee` for result-handling example.


`ee`
: `K ee(K)`
: Helper function to capture (and reset) error string into usual error object, e.g.
: `K x=ee(dot(a,b));if(xt==-128)printf("error %s\n",x->s);`
: Since V3.5 2017.02.16, V3.4 2017.03.13


### Appending to a list

When appending to a list, if the capacity of the list is 
insufficient to accommodate the new data, the list is reallocated with the contents of `x` updated. The new data is always appended.

`ja`
: `K ja(K* x,V*)` 
: Appends a raw value to a list. 
: Returns the value of the contents of `x`.


`jk`
: `K jk(K* x,K y)` 
: Append another K object to a mixed list. Takes ownership of `y`. 
: Returns the value of the contents of `x`.

`js`
: `K js(K* x,S s)` 
: Append an interned string `s` to a symbol list. 
: Returns the value of the contents of `x`.

`jv`
: `K jv(K* x,K y)`
: Append K list `y` to the first of the same type. Takes ownership of `y`.
: Returns the value of the contents of `x`.

`k`
: `K k(I handle,const S s,...)__attribute__((sentinel))`
: Evaluate `s` with optional parameters either locally (shared library only) or remotely. The last argument must be `NULL`.

: Behavior depends on value of `handle`.

    -    `handle>0`, sends sync message to handle, to evaluate a string or function with parameters, and then blocks until a message of any type is received on handle. It can return `NULL` (indicating a network error) or a pointer to a k object. `k(handle,(S)NULL)` does not send a message, and blocks until a message of any type is received on handle.
    If that object has type -128, it indicates an error, accessible as a null-terminated string in `r->s`. When you have finished using this object, it should be freed by calling `r0(r)`.

    -    `handle<0`, this is for async messaging, and the return value can be either 0 (network error) or non-zero (success). This result should _not_ be passed to `r0`.

    -   `handle=0`, this function is equivalent of `dot`.

: See more on [message types](java-client-for-q.md#message-types). Note that `k` call will block until messages is sent/received (`handle!=0`) or evaluated (`handle=0`).

`ka`
: `K ka(I t)` 
: Create an atom of type `t`

`kb`
: `K kb(I)` 
: Create a boolean

`kc`
: `K kc(I)`
: Create a char
: Null: `kc(" ")`

`kd`
: `K kd(I)` 
: Create a date
: Null: `kd(ni)`

`ke`
: `K ke(F)`
: Create a real
: Null: `ke(nf)`

`kf`
: `K kf(F)` 
: Create a float
: Null: `kf(nf)`

`kg`
: `K kg(I)` 
: Create a byte

`kh`
: `K kh(I)`
: Create a short
: Null: `kh(nh)`

`ki`
: `K ki(I)` 
: Create an int
: Null: `ki(ni)`

`kj`
: `K kj(J)`
: Create a long.
: Null: `kj(nj)`

`knk`
: `K knk(I n,...)` 
: Create a mixed list. 
: Takes ownership of arguments.

`knt`
: `K knt(J n,K x)`
: Makes table `x` keyed by `n` first columns.
: Takes ownership of arguments. `x` is untouched unless the number of columns exceeds `n`.

`kp`
: `K kp(S x)` 
: Create a char array from string

`kpn`
: `K kpn(S x, J n)`
: Create a char array from string of length `n`

`krr`
: `K krr(const S)`
: To signal an error from your C code use the function `krr(S);`. ) 
: It is the user’s responsibility to ensure the string is valid for the expected lifetime of the error.

`ks`
: `K ks(S)`
:Create a symbol
: Null: `ks("")`

`kt`
: `K kt(I)`
: Create a time
: Null: `ki(ni)`

`ktd`
: `K ktd(K)` 
: A simple table from a keyed table

`ktj`
: `K ktj(I t,J j)`
: Create a timestamp or a timespan object, where `t` is either `-KP` or `-KN`.

    type      | object          | null
    ----------|-----------------|--------------
    timestamp | `K ktj(-KP,J);` | `ktj(-KP,nj)`
    timespan  | `K ktj(-KN,J);` | `ktj(-KN,nj)`

`ktn`
: `K ktn(I type,J length)` 
: Create a simple list where `length` is a non-negative, non-null integer.

`ku`
: `K ku(U)`
: Create a guid
: Null: `U g={0};ku(g);`

`kz`
: `K kz(F)`
: Create a datetime
: Null: `kz(nf)`

`m9`
: `V m9(V)`
: Free up memory allocated for the thread’s pool. Call `m9()` when the thread is about to complete, freeing up memory allocated for that thread’s pool.

`okx`
: `I okx(K x)` 
: Verify that byte vector `x` is a valid q IPC byte stream. Decompressed data only. `x` is untouched.
: Returns `0` if not valid.

`orr`
: `K orr(const S)`
: A utility function  can be used to signal system errors. 
: It is similar to `krr`, but appends a system error message to the user-provided string before passing it to `krr`. 

`r0`
: `V r0(K)`
: Decrement the object‘s reference count.

`r1`
: `K r1(K)`
: Increment the object‘s reference count.

`sd0`
: `V sd0(I d)`
: Removes the callback on `d` and calls `kclose`. Shared library only.

`sd0x`
: `V sd0x(I d,I f)`
: Removes the callback on `d` and calls `kclose` on `d` if `f` is 1. Shared library only.
: Since V3.0 2013.04.04. 

`sd1`
: `K sd1(I d,f);`
: Puts the function `K f(I d){…}` on the q main event loop given a socket `d`. : If `d` is negative, the socket is switched to non-blocking. 
: The function `f` should return `NULL` or a pointer to a K object, and its reference count will be decremented.
: Shared library only.
: On success, returns int K object containing `d`. On error, `NULL` is returned, `d` is closed and `es` will contain error string.

`setm`
: `I setm(I m)`
: Set whether interning symbols uses a lock. `m` is either 0 or 1.
: Returns previously set value.

`sn`
: `S sn(S,J n)`
: Intern n chars from a string. 
: Returns an interned string and should be used to store string in symbol vector.

`ss`
: `S ss(S)`
: Intern a null terminated string. 
: Returns an interned string and should be used to store string in symbol vector.

`xD`
: `K xD(K,K)`
: Create a dictionary  
: Takes ownership of arguments. Destroys arguments on failure.

`xT`
: `K xT(K)` 
: Create a table from a dictionary
: Takes ownership of arguments. Destroys arguments on failure.

`ymd`
: `I ymd(year,month,day)`
: Encode a year/month/day as q date, e.g. `0==ymd(2000,1,1)`


### Standalone app only

`khpun`
: `I khpun(const S h,I p,const S u,I n)`
: Establish a connection to host `h` on port `p` providing credentials ("username:password" format) `u` with timeout `n`.
: On success, returns positive file descriptor for established connection. On error, 0 or a negative value is returned.

    code | error
    -----|-------
      0  | Authentication error
     -1  | Connection error
     -2  | Time out error 

`khpu`
: `I khpu(const S h,I p,const S u)`
: <i class="fa fa-hand-o-right"></i> `khpun(h,p,u,0)`.

`khp`
: `I khp(const S h,I p)`
: <i class="fa fa-hand-o-right"></i> `khpu(h,p,"")`.

`kclose`
: `V kclose(I)`
: Note that with the release of `c.o` with V2.6, `c.o` now tracks the connection type (pre V2.6, or V2.6+). Hence, to close the connection, you must call `kclose` (instead of `close` or `closeSocket`) – this will clean up the connection tracking and close the socket.

