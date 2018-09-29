---
hero: <i class="fa fa-share-alt"></i> Machine learning
author: Conor McCarthy
date: October 2018
keywords: machine learning, ml, utilities, interpolation, filling, statistics
---

# Utilities 



Within machine learning applications a number of procedures and analyses are ubiquitous. The utility functions presently contained in the ML-Toolkit are divided into two namespaces;

`.ml`

: Functions for statistical analysis and array production.

`.ml.util`

: Functions for the manipulation and transformation of data.


!!! note
	These namespaces will be expanded over time to include wider ranging functionality. The functions within these namespaces can be used in conjunction with those in the [FRESH section](fresh.md) of the toolkit to apply machine-learning techniques to time-series data.

<i class="fa fa-github"></i>
[KxSystems/ml-toolkit](https://github.com/kxsystems/ml-toolkit)

| | |
|:--------------------------------|:-------------------------------------------------|
|`.ml` namespace functions| |
|[`.ml.accuracy`](utils.md#mlaccuracy)|Accuracy of classification results |
|[`.ml.arange`](utils.md#mlarange)|Evenly-spaced values within a range |
|[`.ml.confdict`](utils.md#mlconfdict)|True/false positives and true/false negatives as dictionary|
|[`.ml.confmat`](utils.md#mlconfmat)|Confusion matrix |
|[`.ml.corrmat`](utils.md#mlcorrmat)|Table-like correlation matrix for a simple table |
|[`.ml.crossentropy`](utils.md#mlcrossentropy)|Categorical cross entropy |
|[`.ml.describe`](utils.md#mldescribe)|Descriptive information about a table|
|[`.ml.eye`](utils.md#mleye)|Identity matrix|
|[`.ml.linspace`](utils.md#mllinspace)|Array of evenly-spaced values |
|[`.ml.logloss`](utils.md#mllogloss)|Logarithmic loss |
|[`.ml.mse`](utils.md#mlmse)|Mean square error |
|[`.ml.precision`](utils.md#mlprecision)|Precision of a binary classifier |
|[`.ml.range`](utils.md#mlrange)|Range of values |
|[`.ml.roc`](utils.md#mlroc)|X- and Y-axis values for an ROC curve |
|[`.ml.rocaucscore`](utils.md#mlrocaucscore)|Area under an ROC curve |
|[`.ml.sensitivity`](utils.md#mlsensitivity)|Sensitivity of a binary classifier |
|[`.ml.shape`](utils.md#mlshape)|Shape of a matrix |
|[`.ml.specificity`](utils.md#mlspecificity)|Specificity of a binary classifier |
|[`.ml.sse`](utils.md#mlsse)|Sum squared error |
|[`.ml.tscore`](utils.md#mltscore)|One-sample t-test score |
|[`.ml.tscoreeq`](utils.md#mltscoreeq)|T-test for independent samples with unequal variances |
|`.ml.util` namespace functions| |
|[`.ml.util.df2tab`](utils.md#mlutildf2tab)|Convert from a Pandas dataframe |
|[`.ml.util.dropconstant`](utils.md#mlutildropconstant)|Remove columns with zero variance |
|[`.ml.util.fillfn`](utils.md#mlutilfillfn)|Tailored filling of null values for a simple matrix |
|[`.ml.util.minmaxscaler`](utils.md#mlutilminmaxscaler)|Scale data between 0-1 |
|[`.ml.util.onehot`](utils.md#mlutilonehot)|One-hot encoding |
|[`.ml.util.polytab`](utils.md#mlutilpolytab)|Produce polynomial features of degree n from a table |
|[`.ml.util.stdscaler`](utils.md#mlutilstdscaler)|Standard scaler transform-based representation of a table |
|[`.ml.util.tab2df`](utils.md#mlutiltab2df)|Convert a q table to Pandas dataframe |
|[`.ml.util.times2long`](utils.md#mlutiltimes2long)|Cast times to longs |
|[`.ml.util.traintestsplit`](utils.md#mlutiltraintestsplit)|Split into training and test sets |
|[`.ml.util.traintestsplitseed`](utils.md#mlutiltraintestsplitseed)|Split into training and test sets with a seed |

## `.ml.accuracy`

_Accuracy of classification results_

Syntax: `.ml.accuracy[x;y]`

Where 

-   `x` is a vector of predicted values
-   `y` are the true values of the quantity being predicted

returns the accuracy of predictions made by a machine-learning algorithm.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.accuracy[xb;yb] /example of running on boolean data
0.53

q)xr:10000?5
q)yr:10000?5
q).ml.accuracy[xr;yr] /example of running on non-binary categorical data
0.2014
```


## `.ml.arange`

_Evenly-spaced values_

Syntax: `.ml.arange[x;y;z]`

Where `x`, `y`, and `z` are numeric atoms, returns an evenly-spaced vector of values between `x` and `y` in steps of length `z`.

```q
q).ml.arange[1;10;1]
1 2 3 4 5 6 7 8 9
q).ml.arange[6.25;10.5;0.05]
6.25 6.3 6.35 6.4 6.45 6.5 6.55 6.6 6.65 6.7 6.75 6.8 6.85 6.9 6.95 7 7.05 7...
```



## `.ml.confdict`

_True/false positives and true/false negatives_

Syntax: `.ml.confdict[x;y]`

Where

-   `x` is a vector binary vector of predicted labels
-   `y` is a binary vector of the true labels in a classification problem

returns the true positives, true negatives, false positives and false negatives from a confusion matrix in the form of a dictionary.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.confdict[xb;yb]
tp| 34
fn| 19
fp| 28
tn| 19
```


## `.ml.confmat`

_Confusion matrix_

Syntax: `.ml.confmat[x;y]`

Where

-   `x` is a vector of predicted labels
-   `y` is a vector of the true labels in a classification problem

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.confmat[xb;yb]
0| 34 19
1| 28 19

q)xr:100?5
q)yr:100?5
q).ml.confmat[x;y]
0| 6 2 4 4 6
1| 2 3 5 1 5
2| 2 2 4 7 6
3| 1 6 4 4 3
4| 3 6 5 3 6
```


## `.ml.corrmat`

_Table-like correlation matrix for a simple table_

Syntax: `.ml.corrmat[x]`

Where `x` is a table of numeric values, returns its correlation matrix.

```q
q)n:10000
q)tab:([]asc n?100f;reverse asc n?1000f;n?100)
q).ml.corrmat[tab]
  | x            x1          x2          
- | -------------------------------------
x | 1            -0.9999644  -0.004584063
x1| -0.9999644   1           0.004535739 
x2| -0.004584063 0.004535739 1           
```



## `.ml.crossentropy`

_Categorical cross entropy_

Syntax: `.ml.crossentropy[x;y]`

Where

-   `x` is a set of unique class labels
-   `y` is the probability of belonging to one specific class

returns the categorical cross entropy.

```q
q)x:1000?10
q)y:1000?1f
q).ml.crossentropy[x;y]
1.000794
```


## `.ml.describe`

_Descriptive information_

Syntax: `.ml.describe[x]`

Where `x` is a table, returns a table describing features such as mean, standard deviation and quartiles.

```q
q)n:1000
q)tab:([]sym:n?`4;x:n?10000f;x1:1+til n;x2:reverse til n;x3:n?100f)
q).ml.describe[tab]
     | x        x1       x2       x3       
-----| ------------------------------------
count| 1000     1000     1000     1000     
mean | 4953.491 500.5    499.5    49.77201 
std  | 2890.066 288.8194 288.8194 28.91279 
min  | 7.908894 1        0        0.1122762
q1   | 2491.828 250.75   249.75   24.38531 
q2   | 5000.222 500.5    499.5    49.96016 
q3   | 7453.287 750.25   749.25   74.98685 
max  | 9994.308 1000     999      99.98165 
```


## `.ml.eye`

_Identity matrix_

Syntax: `.ml.eye[x]`

Where

-  `x` is an integer atom

returns an identity matrix of width `x`  

```q
q).ml.eye[5]
1 0 0 0 0
0 1 0 0 0
0 0 1 0 0
0 0 0 1 0
0 0 0 0 1
```

## `.ml.linspace`

_Array of evenly-spaced values_

Syntax: `.ml.linspace[x;y;z]`

Where 

-   `x` and `y` are numeric atoms
-   `z` is an int atom

returns a vector of `z` evenly-spaced values between `x` and `y`.

```q
q).ml.linspace[10;20;9]
10 11.25 12.5 13.75 15 16.25 17.5 18.75 20
q).ml.linspace[0.5;15.25;12]
0.5 1.840909 3.181818 4.522727 5.863636 7.204545 8.545455 9.886364 11.22727 1..
```


## `.ml.logloss`

_Logarithmic loss_

Syntax: `.ml.logloss[x;y]`

Where

-   `x` is a set of the classes 0/1
-   `y` is a matrix with the first row giving the probability that each class element `x` belongs to class 0 and the second row is the probability it belongs to class 1

returns the logarithmic loss for a binary classifier.

```q
q)x:rand each 1000#0b
q)k:1000?1f
q)y:flip (k;1-k)
q).ml.logloss[x;y]
1.024205
```



## `.ml.mse`

_Mean square error_

Syntax: `.ml.mse[x;y]`

Where 

-   `x` is a vector of predicted values
-   `y` are the true values of the quantity being predicted

Returns the mean squared error between predicted values and the true values in a machine-learning application.

```q
q)x:asc 50?50f
q)y:asc 50?50f
q).ml.mse[x;y]
452.4079
```


## `.ml.precision`

_Precision of a binary classifier_

Syntax: `.ml.precision[x;y;z]`

Where

-   `x` are the predicted binary labels
-   `y` are the true binary classification labels
-   `z` is the binary value defined to be true

returns a measure of the precision associated with a classification problem.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.precision[xb;yb;1b]
0.5090909
q).ml.precision[xb;yb;0b]
0.5483871
```


## `.ml.range`

_Range of values_

Syntax: `.ml.range[x]`

Where `x` is a list of sortable values, returns the range of its values.

```q
q)x:1000?100000f
q).ml.range[x]
99742.37
```


## `.ml.roc`

_X- and Y-axis values for an ROC curve_

Syntax: `.ml.roc[x;y]`

Where

-   `x` is the label associated with a prediction
-   `y` is the probability that a prediction belongs to the positive class

returns the coordinates of the true-positive and false-positive values associated with the ROC curve.

```q
q)x:rand each 1000#0b
q)y:asc 1000?1f
q).ml.roc[x;y]
0           0.002012072 0.004024145 0.004024145 0.004024145 0.00603..
0.001988072 0.001988072 0.001988072 0.003976143 0.005964215 0.00596..
```


## `.ml.rocaucscore`

_Area under an ROC curve_

Syntax: `.ml.rocaucscore[x;y]`

Where

-   `x` is the label associated with a prediction
-   `y` is the probability that a prediction belongs to the positive class

returns the area under the ROC curve.

```q
q)x:rand each 1000#0b
q)y:asc 1000?1f
.ml.rocaucscore[x;y]
0.5532959
```


## `.ml.sensitivity`

_Sensitivity of a binary classifier_

Syntax: `.ml.sensitivity[x;y;z]`

Where

-   `x` is the predicted binary label
-   `y` is the true binary classification label
-   `z` is the binary value defined to be true

returns a measure of the sensitivity associated with a classification problem.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.utils.sensitivity[x;y;0b]
0.6415094
q).ml.utils.sensitivity[x;y;1b]
0.4042553
```


## `.ml.shape`

_Shape of a matrix_

Syntax: `.ml.shape[x]`

Where `x` is a matrix, returns its shape as a 2-list.

```q
q)x:(30 20)#1000?10f
q).ml.shape[x]
30 20
```


## `.ml.specificity`

_Specificity of a binary classifier_

Syntax: `.ml.specificity[x;y;z]`

Where

-   `x` is the predicted binary label
-   `y` is the true binary classification label
-   `z` is the binary value defined to be true

returns a measure of the specificity associated with a classification problem.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.utils.specificity[x;y;0b]
0.5957447
q).ml.utils.specificity[x;y;1b]
0.490566
```


## `.ml.sse`

_Sum squared error_

Syntax: `.ml.mse[x;y]`

Where 

-   `x` is a vector of predicted values
-   `y` are the true values of the quantity being predicted

returns the sum squared error between predicted values and the true values in a machine-learning application.

```q
q)x:asc 50?50f
q)y:asc 50?50f
q).ml.sse[x;y]
22620.4
```


## `.ml.tscore`

_One-sample t-test score_

Syntax: `.ml.tscore[x;y]`

Where

-   `x` is a distribution of values
-   `y` is the population mean

returns the one sample t-score for a distribution with less than 30 samples.

```q
q)x:25?100f
q)y:15
q).ml.tscore[x;y]
7.634824
```
!!! note
	Above 30 samples a one sample t-score is not statistically significant

## `.ml.tscoreeq`

_T-test for independent samples with unequal variances_

Syntax: `.ml.tscoreeq[x;y]`

Where `x` and `y` are independent sample distributions with non-equal variance, returns their t-test score.

```q
q)n:1000
q)x:{x,(sum 20?1f) - 10}/[{not n~count x};()]  /Gaussian distribution
q)y:{x,(sum 20?1f) - 10}/[{not n~count x};()]
q).ml.tscoreeq[x;y]
1.106935
```

## `.ml.util.df2tab`

_Convert from a Pandas dataframe_

Syntax: `.ml.util.df2tab[x]`

Where `x` is a Pandas table, returns it as a q table.

```q
q)n:3
q)table:([]x:n?10000f;x1:1+til n;x2:reverse til n;x3:n?100f) / q table for input
q)print pdf:.ml.util.tab2df[table] / convert to pandas dataframe
             x  x1  x2         x3
0  2631.439704   1   4  78.719172
1  1118.109056   2   3  80.093563
2  3250.627243   3   2  16.710134

q).ml.util.df2tab[pdf] /convert dataframe back to q table
x        x1 x2 x3
-----------------------
2631.44  1  4  78.71917
1118.109 2  3  80.09356
3250.627 3  2  16.71013
```


## `.ml.util.dropconstant`

_Remove columns with zero variance_

Syntax: `.ml.util.dropconstant[x]`

Where `x` is a numerical table `x` returns it without columns that have zero variance.

```q
q)n:1000
q)3#tab:([]n?100f;n#0n;n?1000;n#10;n#0N)
x        x1 x2  x3 x4
---------------------
27.05226    482 10
90.72252    845 10
84.72851    971 10

q)3#.ml.util.dropconstant[tab]
x        x2
------------
27.05226 482
90.72252 845
84.72851 971
```

## `.ml.util.fillfn`

_Tunable filling of null data for a simple table_

Syntax: `.ml.util.fillfn[t;tm;dict]`

Where

-   `t` is a simple table
-   `tm` is a time column in the data
-   `dict` is a modifyable dictionary in the .ml.util namespace

returns a table with columns filled according to assignment of keys in the dictionary `.ml.util.preprocdict`. The function defaults to forward folowed by back filling nulls however changes to the default dictionary allow for zero, median, mean or linear interpolation to be applied on individual columns.

```q
q)n:1000000
q)show tab:([]time:asc n?10:00:00.000;@[n?1000f;2+til 3;:;0n];@[n?1000f;(100?10000),til 3;:;0n];@[n?1000f;(100?10000);:;0n])
time         x        x1       x2
---------------------------------------
00:00:00.041 538.7384          692.6751
00:00:00.091 613.7786          800.4231
00:00:00.103                   934.321
00:00:00.154          895.7309 991.6671
00:00:00.216          288.4304 963.1538
00:00:00.293 618.6048 164.5617 252.6422
00:00:00.374 145.8393 440.5396
00:00:00.380 473.4236 286.6571 107.0687

q)show dict:.ml.util.preprocdict
      | ::
zero  | 0n
median| 0n
mean  | 0n
fill  | 0n
linear| 0n

q)8#.ml.util.fillfn[tab;`time;dict]
time         x        x1       x2
---------------------------------------
00:00:00.041 538.7384 895.7309 692.6751
00:00:00.091 613.7786 895.7309 800.4231
00:00:00.103 613.7786 895.7309 934.321
00:00:00.154 613.7786 895.7309 991.6671
00:00:00.216 613.7786 288.4304 963.1538
00:00:00.293 618.6048 164.5617 252.6422
00:00:00.374 145.8393 440.5396 252.6422
00:00:00.380 473.4236 286.6571 107.0687

q)dict[`linear]:`x
q)dict[`median]:`x1
q)8#.ml.util.fillfn[tab;`time;dict]
time         x        x1       x2
---------------------------------------
00:00:00.041 538.7384 500.079  692.6751
00:00:00.091 613.7786 500.079  800.4231
00:00:00.103 614.0653 500.079  934.321
00:00:00.154 615.2838 895.7309 991.6671
00:00:00.216 616.7651 288.4304 963.1538
00:00:00.293 618.6048 164.5617 252.6422
00:00:00.374 145.8393 440.5396 252.6422
00:00:00.380 473.4236 286.6571 107.0687
```


## `.ml.util.minmaxscaler`

_Scale data between 0-1_

Syntax: `.ml.util.minmaxscaler[x]`

Where `x` is a numerical table, returns a min-max scaled representation with values scaled between 0 and 1.

```q
q)n:5
q)tab:([]n?100f;n?1000;n?100f;n?50f)
x        x1  x2       x3
------------------------------
5.131717 681 43.96318 23.40407
50.60375 752 71.45967 40.97883
34.9319  312 71.68448 37.79269
71.23945 858 35.90727 13.17263
43.51838 399 85.67067 32.51957

q).ml.util.minmaxscaler[tab]
x         x1        x2        x3
---------------------------------------
0         0.6758242 0.1618843 0.3679552
0.6878474 0.8058608 0.7144287 1
0.450782  0         0.7189462 0.885416
1         1         0         0
0.5806683 0.1593407 1         0.6957777
```


## `.ml.util.onehot`

_One-hot encoding_

Syntax: `.ml.util.onehot[x]`

Where `x` is a list of symbols, returns its one-hot encoded representation.

```q
q)x:`a`a`b`b`c`a
q).ml.util.onehot[x]
1 0 0
1 0 0
0 1 0
0 1 0
0 0 1
1 0 0
```


## `.ml.util.polytab`

_Tunable polynomial features from an input table_

Syntax: `.ml.util.polytab[t;n]`

Where

- `t` is a table of numerical values
- `n` is the order of the polynomial feature being created

returns the polynomial derived features of degree `n` in the form of a table.
```q
q)n:100
q)5#tab:(val:sin 0.001*til n;til n;n?100f;n?1000f;n?10)
val          x  x1       x2       x3
--------------------------------------
0            0  52.26479 990.7741 1
0.0009999998 1  2.740491 52.11973 1
0.001999999  2  42.23458 967.8194 8
0.002999996  3  23.54108 337.9137 0

q)5#.ml.util.polytab[tab;2]
val_x        val_x1      val_x2     val_x3       x_x1     x_x2     x_x3 x1_x2..
-----------------------------------------------------------------------------..
0            0           0          0            0        0        0    51782..
0.0009999998 0.002740491 0.05211972 0.0009999998 2.740491 52.11973 1    142.8..
0.003999997  0.08446911  1.935637   0.01599999   84.46917 1935.639 16   40875..
0.008999987  0.07062314  1.01374    0            70.62325 1013.741 0    7954...
0.01599996   0.2569871   2.354285   0.01999995   256.9878 2354.291 20   37814..

q)5#.ml.util.polytab[tab;3]
val_x_x1    val_x_x2   val_x_x3     val_x1_x2 val_x1_x3   val_x2_x3  x_x1_x2 ..
-----------------------------------------------------------------------------..
0           0          0            0         0           0          0       ..
0.002740491 0.05211972 0.0009999998 0.1428336 0.002740491 0.05211972 142.8337..
0.1689382   3.871275   0.03199998   81.75084  0.6757529   15.4851    81750.9 ..
0.2118694   3.041219   0            23.86453  0           0          23864.57..
1.027948    9.41714    0.07999979   151.2556  1.284935    11.77143   151256  ..

/this can be integrated with the original data via the syntax
q)5#newtab:tab^.ml.util.polytab[tab;2]^.ml.util.polytab[tab;3]

val          x  x1       x2       x3 val_x        val_x1    ..
------------------------------------------------------------..
0            0  52.26479 990.7741 1  0            0         ..
0.0009999998 1  2.740491 52.11973 1  0.0009999998 0.00274049..
0.001999999  2  42.23458 967.8194 8  0.003999997  0.08446911..
0.002999996  3  23.54108 337.9137 0  0.008999987  0.07062314..
0.003999989  4  64.24694 588.5728 5  0.01599996   0.2569871 ..
```


## `.ml.util.stdscaler`

_Standard scaler transform-based representation_

Syntax: `.ml.util.stdscaler[x]`

Where `x` is a numerical table, returns a table where each column has undergone a standard scaling given as `[x-avg x]%dev x`.

```q
q)n:5
q)tab:([]n?100f;n?1000;n?100f;n?50f)
x        x1  x2       x3
------------------------------
5.131717 681 43.96318 23.40407
50.60375 752 71.45967 40.97883
34.9319  312 71.68448 37.79269
71.23945 858 35.90727 13.17263
43.51838 399 85.67067 32.51957

q).ml.util.stdscaler[tab]
x          x1         x2         x3
---------------------------------------
-1.663252  0.3846187  -0.9502199 -0.6088642
0.4403491  0.7234267  0.5197869  1.125582
-0.2846532 -1.376229  0.5318052  0.8111424
1.394986   1.229253   -1.380902  -1.618601
0.11257    -0.9610695 1.27953    0.2907405

```


## `.ml.util.tab2df`

_Convert to a Pandas dataframe_

Syntax: `.ml.util.tab2df[x]`

Where `x` is a table, returns it as a Pandas dataframe.

```q
q)n:5
q)table:([]x:n?10000f;x1:1+til n;x2:reverse til n;x3:n?100f) / q table for input
x        x1 x2 x3
-----------------------
2631.44  1  4  78.71917
1118.109 2  3  80.09356
3250.627 3  2  16.71013
q)show pdf:.ml.util.tab2df[table] / convert to pandas dataframe and show it is an embedPy object
{[f;x]embedPy[f;x]}[foreign]enlist
q)print pdf / display the python form of the dataframe
             x  x1  x2         x3
0  2631.439704   1   4  78.719172
1  1118.109056   2   3  80.093563
2  3250.627243   3   2  16.710134
```


## `.ml.util.times2long`

_Cast times to longs_

Syntax: `.ml.util.times2long[x]`

Where `x` is a table, returns `x` with all time columns converted to a long representation.

```q
q)n:1000
q)3#tab:([]sym:n?`1;time:asc n?00:00:05.000;n?1000f;n?100)
sym time         x        x1
----------------------------
p   00:00:00.002 37.74609 92
a   00:00:00.007 135.1677 73
b   00:00:00.015 838.3428 96


q)3#.ml.util.times2long[tab]
sym time x        x1
----------------
p   2    37.74609 92
a   7    135.1677 73
b   15   838.3428 96
```


## `.ml.util.traintestsplit`

_Split into training and test sets_

Syntax: `.ml.util.traintestsplit[x;y;sz]`

Where

-   `x` is a matrix
-   `y` is a boolean vector of the same count as `x`
-   `sz` is a numeric atom in the range 0-100

returns a dictionary containing the data matrix `x` and target `y`, split into a training and testing set according to the percentage `sz` of the data to be contained in the test set.

```q
q)x:(30 20)#1000?10f
q)y:rand each 30#0b
q).ml.util.traintestsplit[x;y;0.2] / split the data such that 20% is contained in the test set
xtrain| (2.02852 2.374546 1.083376 2.59378 6.698505 6.675959 4.120228 2.63468..
ytrain| 110010100101111001110000b
xtest | (8.379916 8.986609 7.06074 2.067817 5.468488 4.103195 0.1590803 0.259..
ytest | 000001b
```

## `.ml.util.traintestsplitseed`

_Split into training and test sets with a seed_

Syntax: `.ml.util.traintestsplitseed[x;y;sz;seed]`

Where

-   `x` is a matrix
-   `y` is a boolean vector of the same count as `x`
-   `sz` is a numeric atom in the range 0-1
-   `seed` is a numeric atom

as with `.ml.util.traintestsplit`, returns a dictionary containing the data matrix `x` and target `y` split into a training and testing set based on the percentage `sz` of the data to be contained in the test set. This version can be given a random seed (`seed`), thus allowing for the same splitting of the data to be repeatedly achieved.

```q
q)x:(30 20)#1000?10f
q)y:rand each 30#0b
q).ml.util.traintestsplitseed[x;y;0.2;42]
xtrain| (8.752061 6.82448 3.992896 2.465234 8.599461 2.452222 6.070236 6.8686..
ytrain| 000011101000001110111101b
xtest | (4.204472 7.137387 1.163132 9.893949 4.504886 5.465625 8.298632 0.049..
ytest | 000001b
```

