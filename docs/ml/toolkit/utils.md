---
hero: <i class="fa fa-share-alt"></i> Machine learning toolkit
author: Conor McCarthy
date: October 2018
keywords: machine learning, ml, utilities, interpolation, filling, statistics
---

# Utilities 



Within machine-learning applications a number of procedures and analyses are ubiquitous, for example the production of confusion matrices in classification problems, creation of ROC curves, the need to fill null data in a tunable manner and the use of interpolation to fix an equal spacing between data points.

The utility functions presently contained in the toolkit are divided between three scripts.

`funcs.q`

: Functions used commonly in ML applications (train test split, array production etc.)

`stats.q`

: Statistical functions for measuring the success of a machine-learning model (correlation matrices, mean square error, ROC curves etc.)

`preprocess.q`

: Functions useful in the preprocessing of data, such as polynomial feature creation, linear interpolation, tailored filling of nulls and min-max scaling

The functions within folder are contained within the `.ml` namespace and can be used in conjunction with the those in the [FRESH section](fresh.md) of the toolkit to apply machine-learning techniques to time-series data.

<i class="fa fa-github"></i>
[KxSystems/ml-toolkit](https://github.com/kxsystems/ml-toolkit)


```txt
General functions: funcs.q             
.ml.arange                  Evenly-spaced values
.ml.df2tab                  Convert from a Pandas dataframe
.ml.enum                    Enumerate any sym files
.ml.linspace                Array of evenly-spaced values
.ml.mattab                  Matrix representation of a simple table
.ml.range                   Range of values
.ml.shape                   Shape of a matrix
.ml.tab2df                  Convert to a Pandas dataframe
.ml.times2long              Cast times to longs
.ml.traintestsplit          Split into training and test sets
.ml.traintestsplitseed      Split into training and test sets with a seed

Statistical analysis: stats.q
.ml.accuracy                Accuracy of classification results
.ml.confdict                True/false positives and true/false negatives
.ml.confmat                 Confusion matrix
.ml.corrmat                 Table-like correlation matrix for a simple table
.ml.crm                     Correlation matrix
.ml.crossentropy            Categorical cross entropy
.ml.cvm                     Covariance matrix
.ml.describe                Descriptive information
.ml.logloss                 Logarithmic loss
.ml.mse                     Mean square error
.ml.precision               Precision of a binary classifier
.ml.roc                     X- and Y-axis values for an ROC curve
.ml.rocaucscore             Area under an ROC curve
.ml.sensitivity             Sensitivity of a binary classifier
.ml.specificity             Specificity of a binary classifier
.ml.sse                     Sum squared error
.ml.tscore                  One-sample t-test score
.ml.tscoreeq                T-test for independent samples with unequal variances

Data preprocessing: preprocess.q            
.ml.checknulls              Columns with null values
.ml.dropconstant            Remove columns with zero variance
.ml.minmaxscaler            Scale data between 0-1
.ml.onehot                  One-hot encoding
.ml.stdscaler               Standard scaler transform-based representation
```




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


## `.ml.checknulls`

_Columns with null values_

Syntax: `.ml.checknulls[x]`

Where `x` is a table, returns a list of the columns that contain null values.

```q
q)tab:([]1 2 3 4 0N 6;6?10f;1.2 2.4 3.6 4.8 0n 7.2)
q).ml.checknulls[tab]
`x`x2
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
q).ml.confdit[xb;yb]
tp| 34
fn| 19
fp| 28
tn| 19
```


## `.ml.confmat`

_Confusion matrix_

Syntax: `.ml.confmat[x;y]`

Where

-   `x` is a vector binary vector of predicted labels
-   `y` is a binary vector of the true labels in a classification problem

returns a 2×2 confusion matrix.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.confmat[xb;yb]
0| 34 19
1| 28 19
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


## `.ml.crm`

_Correlation matrix_

Syntax: `.ml.crm[x]`

Where `x` is a matrix, returns its correlation matrix.

```q
q)matrix:(3 4)#100?10f
q).ml.crm[matrix]
1           -0.02943866 0.01948093
-0.02943866 1           -0.9185437
0.01948093  -0.9185437  1         
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


## `.ml.cvm`

_Covariance matrix_

Syntax: `.ml.cvm[x]`

Where `x` is a matrix, returns its covariance matrix.

```q
q)matrix:(3 4)#100?10f
q).ml.cvm[matrix]
9.6875  -0.1875 0.125 
-0.1875 4.1875  -3.875
0.125   -3.875  4.25  
```


## `.ml.describe`

_Descriptive information_

Syntax: `.ml.describe[x]`

Where `x` is a table, returns a table describing features such as mean, standard deviation and quartiles.

```q
q)tab:([]x:n?10000f;x1:1+til n;x2:reverse til n;x3:n?100f)
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


## .ml.df2tab

_Convert from a Pandas dataframe_

Syntax: `.ml.df2tab[x]`

Where `x` is a Pandas table, returns it as a q table.

```q
q)n:3
q)table:([]x:n?10000f;x1:1+til n;x2:reverse til n;x3:n?100f) / q table for input
q)print pdf:.ml.tab2df[table] / convert to pandas dataframe
             x  x1  x2         x3
0  2631.439704   1   4  78.719172
1  1118.109056   2   3  80.093563
2  3250.627243   3   2  16.710134

q).ml.df2tab[pdf] /convert dataframe back to q table
x        x1 x2 x3      
-----------------------
2631.44  1  4  78.71917
1118.109 2  3  80.09356
3250.627 3  2  16.71013
```


## `.ml.dropconstant`

_Remove columns with zero variance_

Syntax: `.ml.dropconstant[x]`

Where `x` is a numerical table `x` returns it without columns that have zero variance.

```q
q)n:1000
q)3#tab:([]n?100f;n#0n;n?1000;n#10;n#0N)
x        x1 x2  x3 x4
---------------------
27.05226    482 10   
90.72252    845 10   
84.72851    971 10   

q)3#.ml.dropconstant[tab]
x        x2 
------------
27.05226 482
90.72252 845
84.72851 971
```


## `.ml.enum`

_Enumerate any sym files_

Syntax: `.ml.enum[x]`

Where `x` is a table, returns it with the symbol columns enumerated.

```q
q)n:1000
q)5#tab:([]sym:n?`a`b;time:asc n?00:00:05.000;n?1000f;n?100)
sym time         x        x1
----------------------------
b   00:00:00.006 698.6595 12
a   00:00:00.013 671.1112 10
b   00:00:00.013 171.778  1 
b   00:00:00.018 476.7409 90
a   00:00:00.023 341.0811 73

q)5#.ml.enum[tab]
sym time         x        x1
----------------------------
0   00:00:00.006 698.6595 12
1   00:00:00.013 671.1112 10
0   00:00:00.013 171.778  1 
0   00:00:00.018 476.7409 90
1   00:00:00.023 341.0811 73
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


## `.ml.mattab`

_Matrix representation of a simple table_

Syntax: `.ml.mattab[x]`

Where `x` is a table, returns it as a matrix.
This is often used before injecting data into a machine-learning algorithm.

```q
q)n:1000

q)5#tab:([]sym:n?`a`b;time:asc n?00:00:05.000;n?1000f;n?100)
sym time         x        x1
----------------------------
b   00:00:00.006 698.6595 12
a   00:00:00.013 671.1112 10
b   00:00:00.013 171.778  1 

q)3#.ml.mattab[tab]
`b 00:00:00.006 698.6595 12
`a 00:00:00.013 671.1112 10
`b 00:00:00.013 171.778  1 
```


## `.ml.minmaxscaler`

_Scale data between 0-1_

Syntax: `.ml.minmaxscaler[x]`

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

q).ml.minmaxscaler[tab]
x         x1        x2        x3       
---------------------------------------
0         0.6758242 0.1618843 0.3679552
0.6878474 0.8058608 0.7144287 1        
0.450782  0         0.7189462 0.885416 
1         1         0         0        
0.5806683 0.1593407 1         0.6957777
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


## `.ml.onehot`

_One-hot encoding_

Syntax: `.ml.onehot[x]`

Where `x` is a list of symbols, returns its one-hot encoded representation.

```q
q)x:`a`a`b`b`c`a
q).ml.onehot[x]
1 0 0
1 0 0
0 1 0
0 1 0
0 0 1
1 0 0
```


## `.ml.precision`

_Precision of a binary classifier_

Syntax: `.ml.precision[x;y;z]`

Where

-   `x` is the predicted binary label
-   `y` is the true binary classification label
-   `z` is the binary value defined to be true

returns a measure of the precision associated with a classification problem.

```q
q)xb:rand each 100#0b
q)yb:rand each 100#0b
q).ml.precision[xb;yb;1b]
0.5090909
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
q).ml.sensitivity[xb;yb;1b]
0.5957447
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
q).ml.specificity[xb;yb;1b]
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


## `.ml.stdscaler`

_Standard scaler transform-based representation_

Syntax: `.ml.stdscaler[x]`

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

q).ml.stdscaler[tab]
x          x1         x2         x3       
---------------------------------------
-1.663252  0.3846187  -0.9502199 -0.6088642
0.4403491  0.7234267  0.5197869  1.125582  
-0.2846532 -1.376229  0.5318052  0.8111424 
1.394986   1.229253   -1.380902  -1.618601 
0.11257    -0.9610695 1.27953    0.2907405 

```


## `.ml.tab2df`

_Convert to a Pandas dataframe_

Syntax: `.ml.tab2df[x]`

Where `x` is a table, returns it as a Pandas dataframe.

```q
q)n:5
q)table:([]x:n?10000f;x1:1+til n;x2:reverse til n;x3:n?100f) / q table for input
x        x1 x2 x3      
-----------------------
2631.44  1  4  78.71917
1118.109 2  3  80.09356
3250.627 3  2  16.71013
q)show pdf:.ml.tab2df[table] / convert to pandas dataframe and show it is an embedPy object
{[f;x]embedPy[f;x]}[foreign]enlist 
q)print pdf / display the python form of the dataframe
             x  x1  x2         x3
0  2631.439704   1   4  78.719172
1  1118.109056   2   3  80.093563
2  3250.627243   3   2  16.710134
```


## `.ml.times2long`

_Cast times to longs_

Syntax: `.ml.times2long[x]`

Where `x` is a table, returns `x` wityh all time columns converted to a long representation.

```q
q)n:1000
q)3#tab:([]sym:n?`1;time:asc n?00:00:05.000;n?1000f;n?100)
sym time         x        x1
----------------------------
p   00:00:00.002 37.74609 92
a   00:00:00.007 135.1677 73
b   00:00:00.015 838.3428 96


q)3#.ml.times2long[tab]
sym time x        x1
----------------
p   2    37.74609 92
a   7    135.1677 73
b   15   838.3428 96
```


## `.ml.traintestsplit`

_Split into training and test sets_

Syntax: `.ml.traintestsplit[x;y;sz]`

Where

-   `x` is a matrix 
-   `y` is a boolean vector of the same count as `x`
-   `sz` is a numeric atom in the range 0-100

returns a dictionary containing the data matrix `x` and target `y`, split into a training and testing set according to the percentage `sz` of the data to be contained in the test set.  

```q
q)x:(30 20)#1000?10f
q)y:rand each 30#0b
q).ml.traintestsplit[x;y;0.2] / split the data such that 20% is contained in the test set
xtrain| (2.02852 2.374546 1.083376 2.59378 6.698505 6.675959 4.120228 2.63468..
ytrain| 110010100101111001110000b
xtest | (8.379916 8.986609 7.06074 2.067817 5.468488 4.103195 0.1590803 0.259..
ytest | 000001b
```


## `.ml.traintestsplitseed`

_Split into training and test sets with a seed_

Syntax: `.ml.traintestsplitseed[x;y;sz;seed]`

Where

-   `x` is a matrix 
-   `y` is a boolean vector of the same count as `x`
-   `sz` is a numeric atom in the range 0-100
-   `seed` is a numeric atom

as with `.ml.traintestsplit`, returns a dictionary containing the data matrix `x` and target `y` split into a training and testing set based on the percentage `sz` of the data to be contained in the test set. This version can be given a random seed (`seed`), thus allowing for the same splitting of the data to be repeatedly achieved.

```q
q)x:(30 20)#1000?10f
q)y:rand each 30#0b
q).ml.traintestsplitseed[x;y;0.2;42]
xtrain| (8.752061 6.82448 3.992896 2.465234 8.599461 2.452222 6.070236 6.8686..
ytrain| 000011101000001110111101b
xtest | (4.204472 7.137387 1.163132 9.893949 4.504886 5.465625 8.298632 0.049..
ytest | 000001b
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


## `.ml.tscoreeq`

_T-test for independent samples with unequal variances_

Syntax: `.ml.tscoreeq[x;y]`

Where `x` and `y` are independent sample distributions with non-equal variance, returns their t-test score.

```q
q)n:1000
q)x:{x,(sum 20?1f) - 10}/[{not n~count x};()]  /Gaussian distribution
q)y:{x,(sum 20?1f) - 10}/[{not n~count x};()]
q).ml.tscore[x;y]
1.106935
```
























