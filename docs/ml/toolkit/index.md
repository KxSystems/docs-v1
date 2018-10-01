---
hero: <i class="fa fa-share-alt"></i> Machine learning toolkit
author: Conor McCarthy
date: October 2018
keywords: machine learning, ml, feature extraction, feature selection, time series forecasting, utilities, interpolation, filling, statistics, kdb+, q
---

# Machine-learning toolkit



The machine-learning toolkit contains a number of libraries and scripts. These have been produced with the aim of providing kdb+ users with general-use functions and procedures to perform machine-learning tasks on a wide variety of datasets.

This toolkit contains:

-   [Utility functions](utils.md) relating to important aspects of machine learning including data preprocessing and statistical testing, and also includes functions useful in many machine learning applications. 

-   An [implementation of the FRESH](fresh.md) (FeatuRe Extraction and Scalable Hypothesis testing) algorithm in q. This provides the q/kdb+ user with the ability to perform feature extraction and feature significance tests on structured time-series data in order to allow users to perform forecasting, regression and classification on time-series data.

Over time the machine-learning functionality in this library will be extended to include

-   q-specific implementations of machine-learning algorithms
-   more functionality

The toolkit is at
<i class="fa fa-github"></i>
[KxSystems/ml-toolkit](FIXME)


## Requirements

The following requirements cover all those needed to run the libraries and examples within the current build of this toolkit.

-   kdb+ ≥ V3.5 64-bit
-   [Anaconda Python](https://anaconda.org/anaconda/python) 3.x
-   [embedPy](../embedpy/)
-   [JupyterQ](../jupyterq/)
  
A number of Python dependencies also exist for the running of embedPy functions within both the the ML utils and FRESH libraries, these are as follows.

-   [NumPy](http://www.numpy.org/)
-   [SciPy](https://www.scipy.org/)
-   [scikit-learn](http://scikit-learn.org/stable/)
-   [StatsModels](https://www.statsmodels.org/stable/index.html)
-   [Matplotlib](https://matplotlib.org/)
-   [pandas](https://pandas.pydata.org/)

These can be installed using `pip` via;

```bash
pip install -r requirements.txt
```

or via `conda`;

```bash
conda install --file requirements.txt
```
