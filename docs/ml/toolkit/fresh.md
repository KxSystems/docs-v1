---
hero: <i class="fa fa-share-alt"></i> Machine learning
author: Conor McCarthy
date: August 2018
keywords: machine learning, ml, feature extraction, feature selection, time series forecasting, interpolation
---

# FRESH: a feature extraction and feature significance toolkit


Feature extraction and selection are vital components of many machine-learning pipelines. Here we outline an implementation of the [FRESH (FeatuRe Extraction and Scalable Hypothesis testing) algorithm](https://arxiv.org/pdf/1610.07717v3.pdf). This provides the opportunity to explore structured datasets in depth and to extract the most relevant features for predicting a target vector. 

Feature extraction at a basic level is the process by which from an initial dataset we build derived values/features which may be informative when passed to a machine learning algorithm. It allows for information which may be pertinent to the prediction of an attribute of the system under investigation to be extracted. This information is often easier to interpret than the time series in its raw form. It also offers the chance to apply less complex machine learning models to our data as the important trends in the data do not have to be extracted from the data within more complex models.

Following feature extraction, statistical significance tests between the feature and target vectors can be applied. This is required as within the features extracted from the initial data there may only be a small subsection of features of importance. Once statistical tests have been completed to find the relevance of the features as a p-value the Benjamini-Hochberg-Yekutieli procedure is applied to set a threshold for the features which are deemed to be important. 

The purpose of feature selection from the standpoint of improving the accuracy of a machine learning algorithm are as follows

- Simplify the models being used thus making them easier to interpret.
- Shortens the time needed to train a model.
- Helps to avoid the curse of dimensionality.
- Reduces variance in the dataset to reduce overfitting.

<i class="fa fa-github"></i>
[KxSystems/ml-toolkit](https://github.com/kxsystems/ml-toolkit)


## Data formatting

One of the key requirements of this library is that the data being passed to the feature extraction procedure contain a so called 'identifying' column which delimits the time series data into unique subsets from which features of this data can be extracted. This id column can be either inherent to the dataset or derived from the data for the specific use case through the application of a sliding window onto the table. Null values should also be removed from the data and filled with non null values that are relevant to the column being filled.

The data should also not contain text in the form of strings or symbols (other than in the id column) as these cannot be passed to the feature calculation functions. If a text based feature is thought to be important however, one hot encoding can be completed to convert the text to numerical values if deemed particularly relevant.

Data-types which are supported by the feature extraction procedure are boolean, int, real, long, short and float. Other datatypes should not passed to the extraction procedure as feature creation will not be supported under such conditions.

Functions to complete the formatting above including the tailored filling of nulls and the application of a 'rolling window'  are supplied within the [Utilities section](utils.md) of the toolkit.

## Calculated Features

The features extracted from the data are contained in the script `fresh.q` within the `.ml.fresh namespace` and can be displayed via the syntax:

```q
q).ml.fresh.feat
```

The following is a table of a subset of the calculated features and a short description of each.

|Function                         | Returns |
|:--------------------------------|:-------------------------------------------------|
|absenergy[x]                     | Absolute sum of the differences between successive datapoints. |
|aggautocorr[x]             | Aggregation (mean/var etc.) of an autocorrelation over all possible lags 1 - length data. |
|augfuller[x]                     | Hypothesis test to check for a unit root in time series dataset (This causes issues in statistical inference). |
|autocorr[x;lag]                  | Autocorrelation over specified lags. |
|binnedentropy[x;#bins]           | System entropy of data binned into equidistant bins. |
|c3[x;lag]                        | Measure of the non-linearity of the time series. |
|changequant[x;ql;qh;isabs] | Aggregated value of successive changes within corridor specified by ql(lower quantile) and qh(upper quantile). |
|cidce[x;isabs]                   | Measure of time series complexity based on peaks and troughs in the dataset. |
|countabovemean[x]                | Number of points in the dataset with a value less than the time series mean. |
|fftaggreg[x]                     | Spectral centroid (mean), variance, skew, and kurtosis of the absolute fourier transform spectrum. |
|fftcoeff[x;coeff]         | Fast fourier transform coefficients given real inputs and extract real, imaginary, absolute and angular components. |
|hasdup[x]                        | If the time-series contains any duplicate values.|
|hasdupmax[x]                     | Boolean value stating if a duplicate of the maximum value exists in the dataset. |
|indexmassquantile[x;q]           | Relative index i where q% of the time series x’s mass lies left of i. |
|kurtosis[x]                      | Adjusted G2 Fisher-Pearson kurtosis. |
|lintrend[x]                      | Slope, intercept, r-value, p-value and standard error associated with the time series. |
|longstrikelmean[x]               | Length of the longest subsequence in x less than the mean of x. | 
|meanchange[x]                    | Mean over the absolute difference between subsequent t-series values. |
|mean2dercentral[x]               | Mean value of the central approximation of the second derivative of the time series. |
|numcrossingm[x;m]                | Number of crossings in the dataset of over a value m. A crossing is defined as sequential value where the first is less than m and the second is greater or vice-versa. |
|numcwtpeaks[x;width]             | Searches for peaks in the time-series following data smoothing via application of a ricker wavelet. |
|numpeaks[x;support]              | Number of peaks of with a specified support in time series x. |
|partautocorrelation[x;lag]       | Partial autocorrelation of the time series at a specified lag. | 
|perrecurtoalldata[x]             | [Count of values occurring more than once]%[count different values]. |
|perrecurtoallval[x]              | [Count of values occurring more than once]%[count data]. |
|ratiobeyondrsigma[x;r]| Ratio of values more than rdev(x) from the mean of x. |
|ratiovalnumtserieslength[x]      | [Number of unique values]%[count values]. |
|spktwelch[x;coeff]               | Cross power spectral density of the time series at different tunable frequencies. |
|symmetriclooking[x]              | Boolean measure of if the data 'appears' symmetric. |
|treverseasymstat[x;lag]          | Measure of the asymmetry of the time series based on lags applied to the data. |
|vargtstdev[x]                    | Boolean defining if the variance of the dataset is larger than the standard deviation. |

!!! note
	Given that the functions contained within in this namespace are not called individually but from the extraction procedure itself a detailed explanation of their individual operation is not provided here. Further information is available on request if required.

## Feature Extraction

Feature extraction is the application of functions to subsets of initial input data, with the goal of obtaining information from the dataset that is more informative than the raw data. 

The function defined below can be be used to derive such features from the data, a set of 57 functions from which these features are derived are contained in the `.ml.fresh.feat` namespace. A subset of these functions can be used during extraction or changes can be made by the individual user to add or remove functions that are deemed important or insignificant to the specific use-case of interest.   

Syntax: `.ml.fresh.createfeatures[table;aggs;cnames;funcs]`

This returns a table keyed by an identifying column containing the features extracted from an input table based on the unique elements of the identifying column.

Where
-   `table` is the input table containing numerical values and a leading identifying column
-   `aggs` is the symbol associated with the identifying column from which aggregations will be performed
-   `cnames` these are the columns on which extracted features will be calculated, these columns should contain only numerical values
-   `funcs` this is the dictionary of functions which are applied to the table this can be the entire `.ml.fresh.feat` namespace or a subset therein contained. 

```q 
/load in FRESH library from $QHOME
q)\l ml/ml.q
q).ml.loadfile`:fresh/init.q
q)n:100
q)table:([]date:asc raze {10#x}each rand each n#2000.01.01;time:raze flip 10#'(`time$1+til n);x:til (n*10);x1:(n*10)?1f;x2:(n*10)?1f)
/Define extraction of features which do not take hyperparameters
q)singleinputfeatures:.ml.fresh.getsingleinputfeatures[]
q)show 6#cfeat:.ml.fresh.createfeatures[table;`date;2_ cols table;singleinputfeatures]
date      | absenergy_x absenergy_x1 absenergy_x2 abssumchange_x abssumchange_..
----------| -----------------------------------------------------------------..
2000.01.15| 285         3.349372    3.448766     9              3.904357     ..
2000.01.26| 2185        3.605627    2.974653     9              2.94635      ..
2000.02.06| 6085        3.837423    3.967064     9              3.821695     ..
2000.03.02| 11985       3.626113    4.459719     9              3.821917     ..
2000.04.02| 19885       1.968726    4.135093     9              2.219842     ..
2000.04.26| 29785       2.602338    2.32609      9              3.027212     ..
```

## Feature Significance

Following the extraction of features from a raw dataset, a number of statistical significance tests can be applied to the data to determine if a feature is likely to be useful in predicting the value of a target vector. The significance tests which are applied to determine this are dependent on the characteristics of the feature and target respectively, the following table outlines the test which is applied in each case.

|Feature Type       | Target Type       | Significance Test |
|:------------------|:------------------|:------------------|
|Binary             | Real              | Kolmogorov-Smirnov|
|Binary	            | Binary            | Fisher-Exact      |
|Real               | Real              | Kendall Tau-b     |
|Real               | Binary            | Kolmogorov-Smirnov|

Each of the above tests returns a p-value which can then be passed to the Benjamini-Hochberg-Yekutieli(BHY) procedure which determines if the feature meets a defined false discovery rate(FDR) level (This is set at 5% within the fresh.q script).

Both the calculation of p-values via the feature significance tests above and the completion of the BHY procedure are contained within the function,


Syntax: `.ml.fresh.significantfeatures[table;targets]`

Returns a list of the features deemed statistically significant based on if the p-value calculated via the significance tests above met the conditions defined by the BHY procedure.

Where

-   `table` is the unkeyed section of the table produced by the feature creation procedure.
-   `targets` is the target vector associated with the predictions to be made for each of the rows of the table. 

Sample Code:
```q
/ using 'cfeat' as defined in the feature creation section above
q)target:til (count cfeat) / this is chosen as a target as random generation of targets does not produce significant features
q)t:value cfeat
q)show sigfeats:.ml.fresh.significantfeatures[t;target]
`absenergy_x`max_x`mean_x`med_x`min_x`sumval_x`lintrend_x_intercept
q)show tabreduced:key[cfeat]!sigfeats#t
date      |absenergy_x max_x mean_x med_x min_x sumval_x lintrend_x_intercept
----------| ------------------------------------------------------------------
2000.01.15| 285         9     4.5    4.5   0     45       0                   
2000.01.26| 2185        19    14.5   14.5  10    145      10                  
2000.02.06| 6085        29    24.5   24.5  20    245      20                  
2000.03.02| 11985       39    34.5   34.5  30    345      30                  
2000.04.02| 19885       49    44.5   44.5  40    445      40                  
2000.04.26| 29785       59    54.5   54.5  50    545      50                  

-1 "The number of numeric columns in the initial dataset is: ",string count 2 _ cols tabtable;
The number of numeric columns in the initial dataset is: 3
q)-1 "The number of numeric columns in the unfiltered dataset is: ",string count cols value cfeat;
The number of numeric columns in the unfiltered dataset is: 108
q)-1 "The number of numeric columns in the filtered dataset is: ",string count cols value tabreduced;
The number of numeric columns in the filtered dataset is: 7
```

!!! Tip "Significant feature generation"
    It is advisable prior to attempting to create a table of significant features to check if significant features exist in your data failure to do so leads to the following error
    <pre><code class="language-q">
    q)target:(count cfeat)?1f
    q)tabreduced:key[cfeat]!.ml.fresh.significantfeattures[t;target]#t:value cfeat
    'rank
    [0]  tabreduced:key[cfeat]!(.ml.fresh.significantfeatures[t;target])#t:value cfeat 
    </code></pre>


## Fine Tuning

### Parameter Dictionary

Another of the features which can be modified to suit the needs of a specific use-case is the script `paramdict.q`. This contains hyperparameters for many of the functions which require such inputs. The default dictionary provided in this release is extensive but by no means exhaustive and can be modified by the individual user to suit their use case.

Within a future release functions or an api will be provided to allow this to be easily done via the console.
### Functions

The functions which are contained in this library are a small subset of the functions which can be applied in a feature extraction pipeline. Provided a user sticks to the template outlined within the `fresh.q` script any function written in q or leveraging embedPy which follows this template can be applied to the dataset.

As with modifications to the parameter dictionary a function to modify the functions which are called at feature creation will be provided in a later release.
