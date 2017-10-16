# Linear programming


!!! warning "This article is a draft"

!!! note "Editor’s note"
    [![Ken Iverson](/img/kei01.jpg)](https://en.wikipedia.org/wiki/Kenneth_E._Iverson "Wikipedia: Kenneth E. Iverson")
    Q is a descendant of the notation devised by mathematician [Ken Iverson](https://en.wikipedia.org/wiki/Kenneth_E._Iverson) when he worked at Harvard with [Howard Aiken](https://en.wikipedia.org/wiki/Howard_H._Aiken) and Nobel Prize winner [Wassily Leontief](https://en.wikipedia.org/wiki/Wassily_Leontief) on the computation of economic input-output tables. Like other descendants of Iverson Notation (e.g. [A+](http://www.aplusdev.org/index.html), [APL](https://en.wikipedia.org/wiki/APL_(programming_language)), [J](https://en.wikipedia.org/wiki/J_(programming_language))), q inherits compact and powerful expression of linear algebra. 

    Linear Programming is a large topic, of which this article reviews just a few applications. More articles on it would be very welcome: please contact librarian@kx.com.


## Problem

Given a series of nodes and distances, find the minimum path from each node to get to each other node.


## Solution

Edsger W. Dijkstra published an optimised solution in 1959 that calculated cumulative minimums.
A simple Linear Algebra approach entails producing a ‘path connection matrix’ (square matrix with nodes down rows and across columns) showing the distances, which is typically symmetric.
Inner product is used in repeated iterations to enhance the initial matrix to include paths possible through 1 hop (through 1 intermediate node), 2 hops and so forth by repeated calls.
The optimal solution (all paths) is found by iterating until no further changes are noted in the matrix (called _transitive closure_).

## Example

Here is a simple case for just 6 nodes and the distances between connected nodes.
```q
q)node6:`a`b`c`d`e`f
q)bgn:`a`a`a`b`b`b`b`d`d`e`e`f`f`f
q)end:`b`d`c`a`d`e`f`a`e`d`f`b`c`e
q)far:30 40 80 21 25 16 23 12 30 23 25 17 18 22
q)show dist6:flip `src`dst`dist!(bgn;end;`float$far)
src dst dist
------------
a   b   30
a   d   40
a   c   80
b   a   21
b   d   25
b   e   16
b   f   23
d   a   12
d   e   30
e   d   23
e   f   25
f   b   17
f   c   18
f   e   22
```
First, transform the above table into a connectivity matrix of path lengths. 

!!! note "Symmetry"
    In this example a->b can differ from b->a, which is more general than the problem requires, but you could make the matrix symmetric for real distances.

For no connection we use infinity, so the inner product of cumulative minimums works properly over the iterations.
```q
q)cm[node6;dist6]
0w 30 80 40 0w 0w
21 0w 0w 25 16 23
0w 0w 0w 0w 0w 0w
12 0w 0w 0w 30 0w
0w 0w 0w 23 0w 25
0w 17 18 0w 22 0w
```
`cm` is a simple function to produce the connectivity matrix. 

-   `cm` creates a connectivity matrix from nodes and a distance table.
-    Result is a square matrix where a cell contains distance to travel between nodes.
-    An unreachable node is marked with the infinity value for minimum path distance. (Or 0 for credit matrix – see below).
```q
cm:{[nodes;d]
  if[9<>type d`dist;'`type];     / floats only
  n:count nodes;
  res:(n;n)#0w;
  ip:flip nodes?/:d`src`dst;     / index pairs
  res:./[res;ip;:;d`dist];       / set reachable index pairs
  ./[res;til[n],'til[n];:;n#0f]  / diagonal to zero: exclude node to itself
  }
```

!!! tip "Assignment with a scattered index"
    The last two lines of `cm` both use `./` for assignment with a _scattered index_. The second argument is a list of index pairs – co-ordinates in `res`. The fourth argument is a corresponding list of values. The third argument is the assignment function. 

    <i class="fa fa-hand-o-right"></i> [Fold](/ref/adverbs/#fold) for how the adverb `/` specifies the iteration here.


`tview` adds row and column labels.
```q
tview:{[mat]
  $[(`$nodes:"node",string[count mat])in key `.;
    nodes:value nodes;
    nodes:`$string til count mat];
  ((1,1+count nodes)#`,nodes),((count[nodes],1)#nodes),'mat
  }
```
To improve the display of the connection matrix:
```q
q)tview cm[node6;dist6]
   a   b   c   d   e   f
`a 0f  30f 80f 40f 0w  0w
`b 21f 0f  0w  25f 16f 23f
`c 0w  0w  0f  0w  0w  0w
`d 12f 0w  0w  0f  30f 0w
`e 0w  0w  0w  23f 0f  25f
`f 0w  17f 18f 0w  22f 0f
```
In the above result note that `[a;e]` is not directly accessible.
So we use a bridge function to jump through one intermediate node and see new paths.
```q
q)tview bridge cm[node6;dist6]
   a   b   c   d   e   f
`a 0f  30f 80f 40f 46f 53f
`b 21f 0f  41f 25f 16f 23f
`c 0w  0w  0f  0w  0w  0w
`d 12f 42f 92f 0f  30f 55f
`e 35f 42f 43f 23f 0f  25f
`f 38f 17f 18f 42f 22f 0f
```
We now see a path `[a;e]` of 46, \[a->b(30), then b->e(16)\].
After 1 hop we also see path `[d;c]` of 92, \[d->a(12), then a->c(80)\].

`bridge` applies connectivity over each hop by using a Minimum.Sum inner product cumulatively:
```q
q)bridge
{x & (&/) each' x+/:\: flip x}
```
So for 2 hops:
```q
q)tview bridge bridge cm[node6;dist6]
   a   b   c   d   e   f
`a 0f  30f 71f 40f 46f 53f
`b 21f 0f  41f 25f 16f 23f
`c 0w  0w  0f  0w  0w  0w
`d 12f 42f 73f 0f  30f 55f
`e 35f 42f 43f 23f 0f  25f
`f 38f 17f 18f 42f 22f 0f
```
Note with 2 hops we improve `[d;c]` to 73 [d->e(30), then e->f(25), then f->c(18)]:

For ‘transitive closure’ iterate until no further improvement (i.e. optimal path lengths reached)
```
q)tview (bridge/) cm[node6;dist6]
   a   b   c   d   e   f
`a 0f  30f 71f 40f 46f 53f
`b 21f 0f  41f 25f 16f 23f
`c 0w  0w  0f  0w  0w  0w
`d 12f 42f 73f 0f  30f 55f
`e 35f 42f 43f 23f 0f  25f
`f 38f 17f 18f 42f 22f 0f
```
A larger example was presented in k4 listbox publicly available here:
```q
q)\curl -s https://us-east.manta.joyent.com/edgemesh/public/net_dist -o dist
q)\l dist
`dist
q)dist
src dst dist
------------
2   17  139
2   34  131
3   174 150
4   226 171
4   567 13
7   786 130
9   174 112
..
q)node:0N!distinct raze dist`src`dst
2 3 4 7 9 12 13 14 16 17 18 20 21 22 24 26 27 29 31 34 35 37 41 42 43 44 45 4..
```
Repeating the above process with this `node` and `dist` for the optimal solution, also showing calculation time and space (using `\ts`):
```q
q)\ts opt:(bridge/) cm[node;dist]
128 89464576
```
Check node length from node 2 to node 174.
```q
q)node?2 174        / Find row, col of node in optimal matrix
0 72
q)opt[0;72]         / Cell [0;74] is path length to go from node 2 to node 174
398f
q)opt . node?2 174  / Or in one simple step using . index notation
398f
```
This does not get the hops, although the hops could be calculated by ‘capturing’ the intermediate results in the optimal case.
To do this use `bridge\` instead of `bridge/`, then count changes between iterations, or just index in to see the path length converge …
```q
q)count iters:(bridge\) cm[node;dist]  / Calculate all iterations
5                                      / It took 5 iterations to find the optimal paths
```
Now we can see how the path length changes during the iterations: here we see it “first converges” to 398 after 1 hop for node [2;174].
```q
q)iters .\: node?2 174  / Index into each iteration to see iterative path improvement
0w 398 398 398 398
```
Another random path choice for node[2;210] does not converge until after 3 hops, also showing iterative improvement:
```q
q)iters .\: node?2 210       / Path improvement for node [2;210]
0w 0w 638 555 555
```


## Related applications of this approach

The principle used can be generalised to different inner-product solutions for related problems.

The solution above is an instance of generalised inner-product of 2 functions `f.g` and was an example Ken Iverson often used to demonstrate how Linear Algebra can be applied to real-world problems.
The solution may be considered ‘expensive’ on memory and CPU, as it calculates all possible paths, but that is becoming less of an issue.

The `bridge` function above uses the inner product of `Minimum.Sum` (`&` and `+` in q), but variants can be used in similar, related problem domains.

Here is a summary of three related use cases, starting with the above minimum-path solution. 


### Minimum distances 

For minimum distances in a path table (example above), using an inner product of `Minimum.Sum`, where `no path` is represented by `0w` (float infinity) to determine minimums properly.

This calculates the minimum (`&/`) of the sums (`+/`) of distances between nodes at each pivot. The `bridge` function looks like this:
```
bridge:{x & (&/) each' x+/:\: flip x}
```


### Counterparty credit 

For a counterparty credit-matrix solution, using an inner product of `Maximum.Minimum`, where no credit is represented by 0 to determine maximums properly.

This calculates the maximum (`|/`) of the minimum (`&/`) credit between nodes at each pivot, the `bridge` function looks like this;
```q
bridge:{x | (|/) each’ x&/:\: flip x}
```
This returns the optimal possible credit by allowing credit through intermediate counterparties.
For example if A only has credit with B, but B has credit with C, then after 1 hop, A actually has credit with C through B, but capped by the credit path in the same way.

A special note here is the simple case where the credit matrix is boolean. The ‘connectivity matrix’ is now a simple `yes/no` to determine connections e.g. for electrical circuits.
Each iteration improves the connections by adding additional 1s into the matrix that are now reachable in successive hops and uses the same `bridge` algorithm.
    

### Matrix multiplication

For generalised matrix multiplication, using an inner product of `Sum.Times`.

This calculates the sum (`+/`) of the product (`*`) between nodes at each pivot, the bridge function looks like this;
```q
bridge:{x + (+/) each’ x*/:\: flip x}
```
   
The inner product for the above 3 `bridge` use cases could be further generalised as projections of a generalised cumulative inner product function (thanks to Stephen Taylor for this contribution):
```q
q)cip:{[f;g;z] f[x;] (f/) each' x g/:\: flip z}
q)bridgeMS:cip[&;+]   / Minimum.Sum (minimum path)
q)bridgeMM:cip[|;&;]  / Maximum.Minimum (credit matrix)
q)bridgeMS:cip[+;*]   / Sum.Times (matrix multiplication)
```


## Further optimisation of the bridge function.

The `bridge` function was further optimised for performance (2 models), shown here for the first case (minimum-path problem) as `bridge1` and `bridge2`, with thanks to Jonny Press.
However I used the above version for `bridge` as I find the Linear Algebra is clearer.
```q
/ Parallel version (multithreaded run q -s 6)
bridge1: {x & {min each x +\: y}[flip x;] peach x}

/ .Q.fc version (fastest) with input from Jonny Press
bridge2:{x & .Q.fc[{{{min x+y}[x] each y}[;y] each x}[;flip x];x]}
```

A colleague, Ryan Sparks, is presently experimenting with further (significant) performance improvements by using [CUDA](/interfaces/gpus) on a graphics coprocessor for the inner product function `bridge`.
This work is evolving and looks very promising.  I look forward to Ryan presenting a paper and/or presentation on his results when complete as perhaps a sequel to this article.


Rob Hodgkinson  
rob@marketgridsystems.com