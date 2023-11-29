# Time Series Analysis

## references

<https://www.itl.nist.gov/div898/handbook/>
<https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc4.htm>

## Introduction to Time Series Analysis

Time series data often arise when monitoring industrial processes or tracking corporate business metrics. The essential difference between modeling data via time series methods or using the process monitoring methods discussed earlier in this chapter is the following:

  Time series analysis accounts for the fact that data points taken over time may have an internal structure (such as autocorrelation, trend or seasonal variation) that should be accounted for.

This section will give a brief overview of some of the more widely used techniques in the rich and rapidly growing field of time series modeling and analysis.

Definition of Time Series: An ordered sequence of values of a variable at equally spaced time intervals.

Applications: The usage of time series models is twofold:

- Obtain an understanding of the underlying forces and structure that produced the observed data
- Fit a model and proceed to forecasting, monitoring or even feedback and feedforward control.

## Time Series Analysis is used for many applications such as

- !!!Tooling Studies
- Economic Forecasting
- Sales Forecasting
- Budgetary Analysis
- Stock Market Analysis
- Yield Projections
- Process and Quality Control
- Inventory Studies
- Workload Projections
- Utility Studies
- Census Analysis

## Techniques

The fitting of time series models can be an ambitious undertaking. There are many methods of model fitting including the following:

- **[Box-Jenkins ARIMA models](arima.md)**
- Box-Jenkins Multivariate Models
- Holt-Winters Exponential Smoothing (single, double, triple)

The user's application and preference will decide the selection of the appropriate technique. It is beyond the realm and intention of the authors of this handbook to cover all these methods. The overview presented here will start by looking at some basic smoothing techniques:

- Averaging Methods
- Exponential Smoothing Techniques

Later in this section we will discuss the Box-Jenkins modeling methods and Multivariate Time Series.

1) What are Moving Average or Smoothing Techniques?

Inherent in the collection of data taken over time is some form of random variation. There exist methods for reducing of canceling the effect due to random variation. An often-used technique in industry is "smoothing". This technique, when properly applied, reveals more clearly the underlying trend, seasonal and cyclic components.

There are two distinct groups of smoothing methods

- Averaging Methods
- Exponential Smoothing Methods

We will first investigate some averaging methods, such as the "simple" average of all past data.

- **[smoothing techniques](smoothing-techniques.md)**
