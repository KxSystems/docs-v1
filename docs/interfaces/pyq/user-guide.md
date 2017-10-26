PyQ lets you enjoy the power of kdb+ in a comfortable environment provided by a mainstream programming language. In this guide we will assume that the reader has a working knowledge of Python, but we will explain the q language concepts as we encounter them.

## The q namespace

Meet `q` – your portal to kdb+. Once you import `q` from `pyq`, you get access to over 170 functions:
```python
>>> from pyq import q 
>>> dir(q) 
['abs', 'acos', 'aj', 'aj0', 'all', '[and]()', 'any', 'asc', 'asin', ...]
```
These functions should be familiar to anyone who knows the q language and this is exactly what these functions are: q functions repackaged so that they can be called from Python. Some of the q functions are similar to Python builtins or math functions which is not surprising because q like Python is a complete general-purpose language. In the following sections we will systematically draw an analogy between q and Python functions and explain the differences between them.


### The `til` function

Since Python does not have language constructs to loop over integers, many Python tutorials introduce the `range()` function early on. In the q language, the situation is similar and the function that produces a sequence of integers is called `til`. Mnemonically, `q.til(n)` means _Count from zero ’til n_:
```python
>>> q.til(10) 
k('0 1 2 3 4 5 6 7 8 9')
```
The return value of a q function is always an instance of the class `K` which will be described in the next chapter. In the case of `q.til(n)`, the result is a `K` vector, which is similar to a Python list. In fact, you can get the Python list by simply calling the `list()` constructor on the q vector:
```python
>>> list(_)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
```
While useful for illustrative purposes, you should avoid converting `K` vectors to Python lists in real programs. It is often more efficient to manipulate `K` objects directly. For example, unlike `range()`, `til()` does not have optional start or step arguments. This is not necessary because you can do arithmetic on the `K` vectors to achieve a similar result:
```python
>>> range(10, 20, 2) == 10 + 2 * q.til(5)
True
```
Many q functions are designed to ‘map’ themselves automatically over sequences passed as arguments. Those functions are called _atomic_ and will be covered in the next section. The `til()` function is not atomic, but it can be mapped explicitly:
```python
>>> q.til.each(range(5)).show() long$()
,0
0 1
0 1 2
0 1 2 3
```
The last example requires some explanation.  First we have used the `show()` method to provide a nice multi-line display of a list of vectors. This method is available for all `K` objects. Second, the first line in the display shows an empty list of type _long_. Note that unlike Python lists `K` vectors come in different types and `til()` returns vectors of type _long_. Finally, the second line in the display starts with `,` to emphasize that this is a vector of size 1 rather than an atom.

The `each()` adverb is similar to Python’s `map()`, but is often much faster.
```python
>>> q.til.each(range(5)) == map(q.til, range(5)) True
```


### Atomic functions

As we mentioned in the previous section, atomic functions operate on numbers or lists of numbers. When given a number, an atomic function acts similarly to its Python analogue.

Compare
```python
>>> q.exp(1) k('2.718282')
```
and
```python
>>> math.exp(1) 2.718281828459045
```

Want to see more digits? Set `q` display precision using the `system()` function:
```python
>>> q.system(b"P 16")
k('::')
>>> q.exp(1)
k('2.718281828459045')
```

Unlike their native Python analogues, atomic `q` functions can operate on sequences:
```python
>>> q.exp(range(5)) k('1 2.718282 7.389056 20.08554 54.59815')
```
The result in this case is a `K` vector whose elements are obtained by applying the function to each element of the given sequence.

#### Mathematical functions

As you can see in the table below, most of the mathematical functions provided by q are similar to the Python standard library functions in the `math` module.

q              | Python           | Return
---------------|------------------|-------
`neg()`        | `operator.neg()` | the negative of the argument
`abs() `       | `abs()`          | the absolute value
`signum()`     |                  | ±1 or 0 depending on the sign of the argument
`sqrt()`       | `math.sqrt()`    | the square root of the argument
`exp()`        | `math.exp()`     | _e_ raised to the power of the argument
`log()`        | `math.log()`     | the natural logarithm (base e) of the argument
`cos()`        | `math.cos()`     | the cosine of the argument
`sin()`        | `math.sin()`     | the sine of the argument
`tan()`        | `math.tan()`     | the tangent of the argument
`acos()`       | `math.acos()`    | the arc cosine of the argument
`asin()`       | `math.asin()`    | the arc sine of the argument
`atan()`       | `math.atan()`    | the arc tangent of the argument
`ceiling()`    | `math.ceil()`    | the smallest integer &ge; the argument
`floor()`      | `math.floor()`   | the largest integer &le; the argument
`reciprocal()` |                  | 1 divided by the argument

Other than being able to operate on lists of of numbers, q functions differ from Python functions in the way they treat out-of-domain errors.

Where Python functions raise an exception,
```python
>>> math.log(0) 
Traceback (most recent call last): 
... 
ValueError: math domain error
```
q functions return special values:
```python
>>> q.log([-1, 0, 1]) 
k('0n -0w 0')
```


#### The null function

Unlike Python, q allows division by zero. The reciprocal of zero is infinity, which shows up as `0w` or `0W` in displays.
```python
>>> q.reciprocal(0) 
k('0w')
```
Multiplying infinity by zero produces a null value that generally indicates missing data
```python
>>> q.reciprocal(0) * 0 
k('0n')
```
Null values and infinities can also appear as a result of applying a mathematical function to numbers outside of its domain:
```python
>>> q.log([-1, 0, 1])
k('0n -0w 0')
```
The `null()` function returns `1b` (boolean true) when given a null value and `0b` otherwise. For example, when applied to the output of the `log()` function from the previous example, it returns
```python
>>> q.null(_)
k('100b')
```


### Aggregation functions

Aggregation functions (also known as _reduction_ functions) are functions that given a sequence of atoms produce an atom. For example,
```python
>>> sum(range(10))
45 
>>>  q.sum(range(10))
k('45')
```

q        | Python                   | Return
---------|--------------------------|-------------------------------------------------------
`sum()`  | `sum()`                  | the sum of the elements
`prd()`  |                          | the product of the elements
`all()`  | `all()`                  | `1b` if all elements are nonzero, 0b otherwise
`any()`  | `any()`                  | `1b `if any of the elements is nonzero, 0b otherwise
`min()`  | `min()`                  | the smallest element
`max()`  | `max()`                  | the largest element
`avg()`  | `statistics.mean()`      | the arithmetic mean
`var()`  | `statistics.pvariance()` | the population variance
`dev()`  | `statistics.pstdev()`    | the square root of the population variance
`svar()` | `statistics.variance()`  | the sample variance
`sdev()` | `statistics.stdev()`     | the square root of the sample variance



### Accumulation functions

Given a sequence of numbers, one may want to compute not just total sum, but all the intermediate sums as well. In q, this can be achieved by applying the `sums` function to the sequence:
```python
>>> q.sums(range(10)) 
k('0 1 3 6 10 15 21 28 36 45')
```

q        | Return
---------|---------------------------------------------
`sums()` | the cumulative sums of the elements
`prds()` | the cumulative products of the elements
`maxs()` | the maximums of the prefixes of the argument
`mins()` | the minimums of the prefixes of the argument

There are no direct analogues of these functions in the Python standard library, but the `itertools.accumulate()` function provides similar functionality:
```python
>>> list(itertools.accumulate(range(10)))
[0, 1, 3, 6, 10, 15, 21, 28, 36, 45]
```
Passing `operator.mul`, `max` or `min` as the second optional argument to `itertools.accumulate()`, one can get analogues of `q.prds()`, `q.maxs()` and `q.mins()`.

### Sliding window statistics

-    `mavg()`
-    `mcount()`
-    `mdev()`
-    `mmax()`
-    `mmin()`
-    `msum()`

### Uniform functions

Uniform functions are functions that take a list and return another list of the same size.

-   `reverse()`
-   `ratios()`
-   `deltas()`
-   `differ()`
-   `next()`
-   `prev()`
-   `fills()`


### Set operations

-   `except_()`
-   `inter()`
-   `union()`


### Sorting and searching

Functions `asc()` and `desc()` sort lists in ascending and descending order respectively:
```python
>>> a = [9, 5, 7, 3, 1]
>>> q.asc(a)
k('s\#1 3 5 7 9')
>>> q.desc(a)
k('9 7 5 3 1')
```

!!! note "Sorted attribute"
    The `s#` prefix that appears in the display of the output for the `asc()` function indicates that the resulting vector has a _sorted_ attribute set. An attribute can be queried by calling the `attr()` function or accessing the `attr` property of the result:
    <pre><code class="language-python"> 
    &gt;&gt;&gt; s = q.asc(a) &gt;&gt;&gt; q.attr(s) k('s')
    &gt;&gt;&gt; s.attr
    k('s')
    </code></pre>
    When the`asc()` function gets a vector with the `s` attribute set, it skips sorting and immediately returns the same vector.

Functions `iasc()` and `idesc()` return the indices indicating the order in which the elements of the incoming list should be taken to make them sorted:
```python
>>> q.iasc(a)
k('4 3 1 2 0')
```
Sorted lists can be efficiently searched using `bin()` and `binr()` functions. As the names suggest, both use binary search to locate the position of the element that is equal to the search key, but in the case when there is more than one such element, `binr()` returns the index of the first match while `bin()` returns the index of the last.
```python
>>> q.binr([10, 20, 20, 20, 30], 20)
k('1') 
>>> q.bin([10, 20, 20, 20, 30], 20)
k('3')
```
When no matching element can be found,`binr()` (`q.bin()`) returns the index of the position before (after) which the key can be inserted so that the list remains sorted.
```python
>>> q.binr([10, 20, 20, 20, 30], [5, 15, 20, 25, 35])
k('0 1 1 4 5')
>>> q.bin([10, 20, 20, 20, 30], [5, 15, 20, 25, 35])
k('-1 0 3 3 4')
```
In the Python standard library similar functionality is provided by the `bisect` module.
```python
>>> [bisect.bisect_left([10, 20, 20, 20, 30], key) for key in [5, 15, 20, 25, 35]]
[0, 1, 1, 4, 5]
>>> [-1 + bisect.bisect_right([10, 20, 20, 20, 30], key) for key in [5, 15, 20, 25, 35]]
[-1, 0, 3, 3, 4]
```
Note that while `binr()` and `bisect.bisect_left()` return the same values, `bin()` and `bisect.bisect_right()` are off by 1.

Q does not have a named function for searching in an unsorted list because it uses the `?` operator for that. We can easily expose this functionality in PyQ as follows:
```python
>>> index = q('?')
>>> index([10, 30, 20, 40], [20, 25])
k('2 4')
```
Note that our home-brewed `index` function is similar to the `list.index()` method, but it returns the one after last index when the key is not found while `list.index()` raises an exception.
```python
>>> list.index([10, 30, 20, 40], 20)
2
>>> list.index([10, 30, 20, 40], 25)
Traceback (most recent call last):
...
ValueError: 25 is not in list
```
If you are not interested in the index, but only want to know whether the keys can be found in a list, you can use the `in_()` function:
```python
>>> [q.in]()([20, 25], [10, 30, 20, 40])
k('10b')
```

!!! note "Trailing underscore"
    The `q.in_`  function has a trailing underscore because otherwise it would conflict with the Python `in`.

### From Python to kdb+

You can pass data from Python to kdb+ by assigning to `q` attributes. For example,
```python
>>> q.i = 42
>>> q.a = [1, 2, 3]
>>> q.t = ('Python', 3.5)
>>> q.d = {'date': date(2012, 12, 12)}
>>> q.value.each(['i', 'a', 't', 'd']).show()
42
1 2 3
(`Python;3.5)
(,`date)!,2012.12.12
```
Note that Python objects are automatically converted to kdb+ form when they are assigned in the `q` namespace, but when they are retrieved, Python gets a ‘handle’ to kdb+ data.

For example, passing an `int` to `q` results in
```python
>>> q.i
k('42')
```
If you want a Python integer instead, you have to convert explicitly
```python
>>> int(q.i)
42
```
This will be covered in more detail in the next section.

You can also create kdb+ objects by calling `q` functions that are also accessible as `q` attributes. For example,
```python
>>> q.til(5)
k('0 1 2 3 4')
```
Some q functions don’t have names because q uses special characters. For example, to generate random data in q you should use the `?` operator. While PyQ does not supply a Python name for `?`, you can easily add it to your own toolkit:
```python
>>> rand = q('?')
```
And use it as you would any other Python function
```python
>>> x = rand(10, 2) # generates 10 random 0's or 1's (coin toss)
```


### From kdb+ to Python

In many cases your data is already stored in kdb+, and PyQ philosophy is that it should stay there. Rather than converting kdb+ objects to Python, manipulating Python objects and converting them back to kdb+, PyQ lets you work directly with kdb+ data as if it was already in Python.

For example, let us retrieve the release date from kdb+:
```python
>>> d1 = q('.z.k')
```
add 30 days to get another date
```python
>>> d2 = d1 + 30
```
and find the difference in whole weeks
```python
>>> (d2 - d1) % 7
k('2')
```
Note that the result of operations are (handles to) kdb+ objects. The only exceptions to this rule are indexing and iteration over simple kdb+ vectors. These operations produce Python scalars
```python
>>> list(q.a)
[1, 2, 3]
>>> q.a\[-1\]
3
```
In addition to Python operators, one invoke q functions on kdb+ objects directly from Python using convenient attribute access / method call syntax.

For example
```python
>>> q.i.neg.exp.log.mod(5)
k('3f')
```
Note that the above is equivalent to
```python
>>> q.mod(q.log(q.exp(q.neg(q.i))), 5)
k('3f')
```
but shorter and closer to `q` syntax
```python
>>> q('(log exp neg i)mod 5')
k('3f')
```
The difference being that in q, functions are applied right to left, by in PyQ left to right.

Finally, if q does not provide the function that you need, you can unleash the full power of numpy or scipy on your kdb+ data.
```python
>>> numpy.log2(q.a) 
array([ 0.       , 1.        ,  1.5849625])
```
Note that the result is a numpy array, but you can redirect the output back to kdb+. To illustrate this, create a vector of 0s in kdb+
```python
>>> b = q.a * 0.0 
```
and call a numpy function on one kdb+ object redirecting the output to another:
```python
>>> numpy.log2(q.a, out=numpy.asarray(b))
```
The result of a numpy function is now in the kdb+ object
```python
>>> b 
k('0 1 1.584963')
```


### Working with files

Kdb+ uses the unmodified host file system to store data and therefore q has excellent support for working with files. Recall that we can send Python objects to kdb+ by simply assigning them to a `q` attribute:
```python
>>> q.data = range(10)
```
This code saves 10 integers in kdb+ memory and makes a global variable `data` available to kdb+ clients, but it does not save the data in any persistent storage. To save `data` as a file "data", we can simply call the `pyq.q.save` function as follows:
```python
>>> q.save('data')
k(':data')
```
Note that the return value of the `pyq.q.save` function is a `K` symbol that is formed by prepending `:` to the file name. Such symbols are known as _file handles_ in q. Given a file handle, the kdb+ object stored in the file can be obtained by accessing the `value` property of the file handle:
```python
>>> _.value
k('0 1 2 3 4 5 6 7 8 9')
```
Now we can delete the data from memory
```python
>>> del q.data
```
and load it back from the file using the `pyq.q.load` function:
```python
>>> q.load('data')
k('data')
>>> q.data
k('0 1 2 3 4 5 6 7 8 9')
```
`pyq.q.save` and `pyq.q.load` functions can also take a `pathlib.Path` object
```python
>>> data_path = pathlib.Path('data')
>>> q.save(data_path)
k(':data')
>>> q.load(data_path)
k('data')
>>> data_path.unlink()
```
It is not necessary to assign data to a global variable before saving it to a file. We can save our 10 integers directly to a file using the `pyq.q.set` function
```python
>>> q.set(':0-9', range(10))
k(':0-9')
```
and read it back using the `pyq.q.set` function
```python
>>> q.get(_)
k('0 1 2 3 4 5 6 7 8 9')
```
```python
>>> pathlib.Path('0-9').unlink()
```


## K objects

The q language has has atoms (scalars), lists, dictionaries, tables and functions. In PyQ, kdb+ objects of any type appear as instances of class `K`. To tell the underlying kdb+ type, one can access the `type` property to obtain a type code. For example,
```python
>>> vector = q.til(5); scalar = vector.first
>>> vector.type
k('7h')
>>> scalar.type
k('-7h')
```
Basic vector types have type codes in the range 1 through 19 and their elements have the type code equal to the negative of the vector type code. For the basic vector types, one can also get a human readable type name by accessing the `key` property:
```python
>>> vector.key k('long')
```
To get the same from a scalar – convert it to a vector first:
```python
>>> scalar.enlist.key
k('long')
```

Code | Kdb+ type | Python type
-----|-----------|-------------------
1    | boolean   | bool
2    | guid      | uuid.UUID
4    | byte     
5    | short    
6    | int  
7    | long      | int
8    | real     
9    | float     | float
10   | char      | bytes (*)
11   | symbol    | str
12   | timestamp    
13   | month    
14   | date      | datetime.date
16   | timespan  | datetime.timedelta
17   | minute   
18   | second   
19   | time      | datetime.time


(\*) Unlike other Python types mentioned in the table above, bytes instances get converted to a vector type:
```python
>>> K(b'x')
k(',"x"')
>>> q.type(_)
k('10h')
```
There is no scalar character type in Python, so in order to create a `K` character scalar, one will need to use a typed constructor:
```python
>>> K.char(b'x')
k('"x"')
```
Typed constructors are discussed in the next section.

### Constructors and casts

As we have seen in the previous chapter, it is often not necessary to construct `K` objects explicitly because they are created automatically whenever a Python object is passed to a q function. This is done by passing the Python object to the default `K` constructor.

For example, if you need to pass a type long atom to a q function, you can use a Python int instead, but if a different integer type is required, you will need to create it explicitly:
```python
>>> K.short(1)
k('1h')
```
Since an empty list does not know its type, passing `[]` to the default `K` constructor produces a generic (type `0h`) list:
```python
>>> K([])
k('()')
>>> q.type(_)
k('0h')
```
To create an empty list of a specific type -- pass `[]` to one of the named constructors:
```python
>>> K.time([])
k('time$()')
```

constructor | accepts                      | description
------------|------------------------------|-----------------------------------------------
`K.boolean()` | `int`, `bool`                    | logical type `0b` is false and `1b` is true
`byte()`      | `int`, `bytes`                   | 8-bit bytes
`short()`     | `int`                            | 16-bit integers
`int()`       | `int`                            | 32-bit integers
`long()`      | `int`                            | 64-bit integers
`real()`      | `int`, `float`                   | 32-bit floating point numbers
`float()`     | `int`, `float`                   | 32-bit floating point numbers
`char()`      | `str`, `bytes`                   | 8-bit characters
`symbol()`    | `str`, `bytes`                   | interned strings
`timestamp()` | `int` (nanoseconds), `datetime`  | date and time
`month()`     | `int` (months), `date`           | year and month
`date()`      | `int` (days), `date`             | year, month and day
`datetime()`  |                                  | (deprecated)
`timespan()`  | `int` (nanoseconds), `timedelta` | duration in nanoseconds
`minute()`    | `int` (minutes), `time`          | duration or time of day in minutes
`second()`    | `int` (seconds), `time`          | duration or time of day in seconds
`time()`      | `int` (milliseconds), `time`     | duration or time of day in milliseconds

The typed constructors can also be used to access infinities and missing values of the given type:
```python
>>> K.real.na, K.real.inf
(k('0Ne'), k('0we'))
```
If you already have a `K` object and want to convert it to a different type, you can access the property named after the type name. For example,
```python
>>> x = q.til(5) 
>>> x.date
k('2000.01.01 2000.01.02 2000.01.03 2000.01.04 2000.01.05')
```


### Operators

Both Python and q provide a rich system of operators. In PyQ, `K` objects can appear in many Python expressions where they often behave as native Python objects.

Most operators act on `K` instances as namesake q functions. For example:
```python
>>> K(1) + K(2)
k('3')
```


#### The if statement and boolean operators

Python has three boolean operators `or`, `and` and `not` and `K` objects can appear in boolean expressions. The result of boolean expressions depends on how the objects are tested in Python if statements.

All `K` objects can be tested for ‘truth’. Similarly to the Python numeric types and sequences, `K` atoms of numeric types are true is they are not zero and vectors are true if they are non-empty.

Atoms of non-numeric types follow different rules. Symbols test true except for the empty symbol; characters and bytes tested true except for the null character/byte; guid, timestamp, and (deprecated) datetime types always test as true.

Functions test as true except for the monadic pass-through function:
```python
>>> q('::') or q('+') or 1
k('+')
```
Dictionaries and tables are treated as sequences: they are true if non-empty.

Note that in most cases how the object test does not change when Python native types are converted to ~pyq.K:
```python
>>> objects = [None, 1, 0, True, False, 'x', '', {1:2}, {}, date(2000, 1, 1)] &
>>> [bool(o) for o in objects]
[False, True, False, True, False, True, False, True, False, True] 
>>>[bool(K(o)) for o in objects]
[False, True, False, True, False, True, False, True, False, True]
```
One exception is the Python `time` type. Starting with version 3.5 all `time` instances test as true, but `time(0)` converts to `k('00:00:00.000')` which tests false:
```python
>>> [bool(o) for o in (time(0), K(time(0)))] 
[True, False]
```

!!! info
    Python changed the rule for `time(0)` because `time` instances can be timezone-aware and because they do not support addition making 0 less than special. Neither of those arguments apply to `q` time, second or minute data types which behave more like `timedelta`.


BOOKMARK 


#### Arithmetic operations

Python has the four familiar arithmetic operators `+`, `-`, `*` and `/` as well as less common `**` (exponentiation), `%` (modulo) and `//` (floor division). PyQ maps those operators to q "verbs" as follows

| Operation      | Python | q      |
|----------------|--------|--------|
| addition       | `+`    | `+`    |
| subtraction    | `-`    | `-`    |
| multiplication | `*`    | `*`    |
| true division  | `/`    | `%`    |
| exponentiation | `**`   | `xexp` |
| floor division | `//`   | `div`  |
| modulo         | `%`    | `mod`  |

~pyq.K objects can be freely mixed with Python native types in arithmetic expressions and the result is a `K` object in most cases:
```python
>>> q.til(10) % 3 k('0 1 2 0 1 2 0 1 2 0')
```
A notable exception occurs when the modulo operator is used for string formatting
```python
>>> "%.5f" % K(3.1415) '3.14150'
```
Unlike python sequences, `K` lists behave very similar to atoms: arithmetic operations act element-wise on them.

Compare
```python
>>> \[1, 2\] \* 5 \[1, 2, 1, 2, 1, 2, 1, 2, 1, 2\]
```
and
```python
>>> K(\[1, 2\]) \* 5 k('5 10')
```
or
```python
>>> \[1, 2\] + \[3, 4\] \[1, 2, 3, 4\]
```
and
```python
>>> K(\[1, 2\]) + \[3, 4\] k('4 6')
```
#### The flip (`+`) operator

The unary `+` operator acts as`flip()` function on `K` objects. Applied to atoms, it has no effect:
```python
>>> +K(0) k('0')
```
but it can be used to transpose a matrix:
```python
>>> m = K(\[\[1, 2\], \[3, 4\]\]) &gt;&gt;&gt; m.show() 1 2 3 4 &gt;&gt;&gt; (+m).show() 1 3 2 4
```
or turn a dictionary into a table:
```python
>>> d = q('!', \['a', 'b'\], m) &gt;&gt;&gt; d.show() a| 1 2 b| 3 4 &gt;&gt;&gt; (+d).show() a b ---1 3 2 4
```
#### Bitwise operators

Python has six bitwise operators: `|`, `^`, `&`, `<<`, `>>`, and `~`. Since there are no bitwise operations in q, PyQ redefines them as follows:

<table style="width:79%;">
<colgroup>
<col width="18%" />
<col width="45%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th>Operation</th>
<th>Result</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>x | y</code></td>
<td>element-wise maximum of <em>x</em> and <em>y</em></td>
<td>(1)</td>
</tr>
<tr class="even">
<td><code>x ^ y</code></td>
<td><em>y</em> with null elements filled with <em>x</em></td>
<td>(2)</td>
</tr>
<tr class="odd">
<td><code>x &amp; y</code></td>
<td>element-wise minimum of <em>x</em> and <em>y</em></td>
<td>(1)</td>
</tr>
<tr class="even">
<td><code>x &lt;&lt; n</code></td>
<td><em>x</em> shifted left by <em>n</em> elements</td>
<td>(3)</td>
</tr>
<tr class="odd">
<td><code>x &gt;&gt; n</code></td>
<td><em>x</em> shifted right by <em>n</em> elements</td>
<td>(3)</td>
</tr>
<tr class="even">
<td><code>~x</code></td>
<td>a boolean vector with 1's for zero elements of <em>x</em></td>
<td></td>
</tr>
</tbody>
</table>

Notes:

(1)  
For boolean vectors, `|` and `&` are also element-wise *or* and *and* operations.

(2) For Python integers, the result of `x ^ y` is the bitwise exclusive  
or. There is no similar operation in `q`, but for boolean vectors exclusive or is equivalent to q `<>` (not equal).

(3)  
Negative shift counts result in a shift in the opposite direction to that indicated by the operator: `x >> -n` is the same as `x << n`.

##### Minimum and maximum

Minimum and maximum operators are `&` and `|` in q. PyQ maps similar looking Python bitwise operators to the corresponding q ones:
```python
>>> q.til(10) | 5 k('5 5 5 5 5 5 6 7 8 9') &gt;&gt;&gt; q.til(10) & 5 k('0 1 2 3 4 5 5 5 5 5')
```
##### The `^` operator

Unlike Python where caret (`^`) is the binary xor operator, q defines it to denote the [fill](http://code.kx.com/wiki/Reference/Caret) operation that replaces null values in the right argument with the left argument. PyQ follows the q definition:
```python
>>> x = q('1 0N 2') &gt;&gt;&gt; 0 ^ x k('1 0 2')
```
#### The `@` operator

Python 3.5 introduced the `@` operator that can be used by user types. Unlike numpy that defines `@` as the matrix multiplication operator, PyQ uses `@` for function application and composition:
```python
>>> q.log @ q.exp @ 1 k('1f')
```
### Adverbs

Adverbs in q are somewhat similar to Python decorators. They act on functions and produce new functions. The six adverbs are summarized in the table below.

The functionality provided by the first three adverbs is similar to functional programming features scattered throughout Python standard library. Thus `each` is similar to map. For example, given a list of lists of numbers
```python
>>> data = \[\[1, 2\], \[1, 2, 3\]\]
```
One can do
```python
>>> q.sum.each(data) k('3 6')
```
or
```python
>>> list(map(sum, \[\[1, 2\], \[1, 2, 3\]\])) \[3, 6\]
```
and get similar results.

The `over` adverb is similar to the functools.reduce function. Compare
```python
>>> q(',').over(data) k('1 2 1 2 3')
```
and
```python
>>> functools.reduce(operator.concat, data) \[1, 2, 1, 2, 3\]
```
Finally, the `scan` adverb is similar to the itertools.accumulate function.
```python
>>> q(',').scan(data).show() 1 2 1 2 1 2 3
```
&gt;&gt;&gt; for x in itertools.accumulate(data, operator.concat): ... print(x) ... \[1, 2\] \[1, 2, 1, 2, 3\]

#### Each

The `each` adverb serves double duty in q. When it is applied to a function, it returns a new function that expects lists as arguments and maps the original function over those lists. For example, we can write a "daily return" function in q that takes yesterday's price as the first argument (x), today's price as the second (y) and dividend as the third (z) as follow:
```python
>>> r = q('{(y+z-x)%x}') \# Recall that % is the division operator in q.
```
and use it to compute returns from a series of prices and dividends using `r.each`:
```python
>>> p = \[50.5, 50.75, 49.8, 49.25\] &gt;&gt;&gt; d = \[.0, .0, 1.0, .0\] &gt;&gt;&gt; r.each(q.prev(p), p, d) k('0n 0.004950495 0.0009852217 -0.01104418')
```
When the `each` adverb is applied to an integer vector, it turns the vector v into an n-ary function that for each i-th argument selects its v\[i\]-th element. For example,
```python
>>> v = q.til(3) &gt;&gt;&gt; v.each(\[1, 2, 3\], 100, \[10, 20, 30\]) k('1 100 30')
```
Note that scalars passed to `v.each` are treated as infinitely repeated values. Vector arguments must all be of the same length.

#### Over and scan

Given a function `f`, `f.over` and `f.scan` adverbs are similar as both apply `f` repeatedly, but `f.over` only returns the final result, while `f.scan` returns all intermediate values as well.

For example, recall that the Golden Ratio can be written as a continued fraction as follows

$$\\phi = 1+\\frac{1}{1+\\frac{1}{1+\\cdots}}$$

or equivalently as the limit of the sequence that can be obtained by starting with 1 and repeatedly applying the function

$$f(x) = 1+\\frac{1}{1+x}$$

The numerical value of the Golden Ratio can be found as

$$\\phi = \\frac{1+\\sqrt{5}}{2} \\approx 1.618033988749895$$
```python
>>> phi = (1+math.sqrt(5)) / 2 &gt;&gt;&gt; phi 1.618033988749895
```
Function *f* can be written in q as follows:
```python
>>> f = q('{1+reciprocal x}')
```
and
```python
>>> f.over(1.) k('1.618034')
```
indeed yields a number recognizable as the Golden Ratio. If instead of `f.over`, we compute `f.scan`, we will get the list of all convergents.
```python
>>> x = f.scan(1.) &gt;&gt;&gt; len(x) 32
```
Note that `f.scan` (and `f.over`) stop calculations when the next iteration yields the same value and indeed `f` applied to the last value returns the same value:
```python
>>> f(x.last) == x.last True
```
which is close to the value computed using the exact formula
```python
>>> math.isclose(x.last, phi) True
```
The number of iterations can be given explicitly by passing two arguments to `f.scan` or `f.over`:
```python
>>> f.scan(10, 1.) k('1 2 1.5 1.666667 1.6 1.625 1.615385 1.619048 1.617647 1.618182 1.617978') &gt;&gt;&gt; f.over(10, 1.) k('1.617978')
```
This is useful when you need to iterate a function that does not converge.

Continuing with the Golden Ratio theme, let's define a function
```python
>>> f = q('{(last x;sum x)}')
```
that given a pair of numbers returns another pair made out of the last and the sum of the numbers in the original pair. Iterating this function yields the Fibonacci sequence
```python
>>> x = f.scan(10,\[0, 1\]) &gt;&gt;&gt; q.first.each(x) k('0 1 1 2 3 5 8 13 21 34 55')
```
and the ratios of consecutive Fibonacci numbers form the sequence of Golden Ratio convergents that we have seen before:
```python
>>> q.ratios(\_) k('0 0w 1 2 1.5 1.666667 1.6 1.625 1.615385 1.619048 1.617647')
```
#### Each previous

In the previous section we have seen a function ~pyq.K.ratios that takes a vector and produces the ratios of the adjacent elements. A similar function called ~pyq.K.deltas produces the differences between the adjacent elements:
```python
>>> q.deltas(\[1, 3, 2, 5\]) k('1 2 -1 3')
```
These functions are in fact implemented in q by applying the `prior` adverb to the division (`%`) and subtraction functions respectively:
```python
>>> q.ratios == q('%').prior and q.deltas == q('-').prior True
```
In general, for any binary function *f* and a vector *v*

f.prior(*v*)=(*f*(*v*<sub>1</sub>, *v*<sub>0</sub>), *f*(*v*<sub>2</sub>, *v*<sub>1</sub>), ⋯)

#### Adverbs vs and sv

Of all adverbs, these two have the most cryptic names and offer some non-obvious features.

To illustrate how vs and sv modify binary functions, lets give a Python name to the q `,` operator:
```python
>>> join = q(',')
```
Suppose you have a list of file names
```python
>>> name = K.string(\['one', 'two', 'three'\])
```
and an extension
```python
>>> ext = K.string(".py")
```
You want to append the extension to each name on your list. If you naively call `join` on `name` and `ext`, the result will not be what you might expect:
```python
>>> join(name, ext) k('("one";"two";"three";".";"p";"y")')
```
This happened because `join` treated `ext` as a list of characters rather than an atomic string and created a mixed list of three strings followed by three characters. What we need is to tell `join` to treat its first argument as a vector and the second as a scalar and this is exactly what the `vs` adverb will achieve:
```python
>>> join.vs(name, ext) k('("one.py";"two.py";"three.py")')
```
The mnemonic rule is "vs" = "vector, scalar". Now, if you want to prepend a directory name to each resulting file, you can use the `sv` attribute:
```python
>>> d = K.string("/tmp/") &gt;&gt;&gt; join.sv(d, \_) k('("/tmp/one.py";"/tmp/two.py";"/tmp/three.py")')
```
### Input/Output
```python
>>> import os &gt;&gt;&gt; r, w = os.pipe() &gt;&gt;&gt; h = K(w)(kp("xyz")) &gt;&gt;&gt; os.read(r, 100) b'xyz' &gt;&gt;&gt; os.close(r); os.close(w)
```
Q variables can be accessed as attributes of the 'q' object:

&gt;&gt;&gt; q.t = q('(\[\]a:1 2i;b:xy)') &gt;&gt;&gt; sum(q.t.a) 3 &gt;&gt;&gt; del q.t
