# Statistics terms

Statistical terms used in metrics.

## References

<https://www.statisticshowto.com/quantile-definition-find-easy-steps/>

## What is a **[sample](https://www.statisticshowto.com/sample/)**?

In statistics, you’ll be working with samples — a part of a population. For example, if you want to find out how much the average American earns, you aren’t going to want to survey everyone in the population (over 300 million people), so you would choose a small number of people in the population. For example, you might select 1,000 people.

The sample sum is the sum of a random sample from a population. The sample mean is the usual average of a random sample from a population: it is the sample sum, divided by the number of numbers in the sample (the sample size)

## What is a Quantile?

The word “quantile” comes from the word quantity. In simple terms, a quantile is where a sample is divided into equal-sized, adjacent, subgroups (that’s why it’s sometimes called a “fractile“). It can also refer to dividing a probability distribution into areas of equal probability.

## five-quantile summary

A common way of summarizing a frequency distribution is to give the five-quantile summary (also known as the five number summary), namely the minimum, the lower quartile, the median, the upper quartile, and the maximum.

## What is histogram bucket?

Histograms review (article) | Khan Academy
A histogram displays numerical data by grouping data into "bins" of equal width. Each bin is plotted as a bar whose height corresponds to how many data points are in that bin. Bins are also sometimes called "intervals", "classes", or "buckets".

## Median

The median is a quantile; the median is placed in a probability distribution so that exactly half of the data is lower than the median and half of the data is above the median. The median cuts a distribution into two equal areas and so it is sometimes called 2-quantile.

**![median](https://www.statisticshowto.com/wp-content/uploads/2013/09/median.png)**

## Quartile

**[Quartiles](https://www.statisticshowto.com/probability-and-statistics/statistics-definitions/what-are-quartiles/)** are also quantiles; they divide the distribution into four equal parts. Percentiles are quantiles that divide a distribution into 100 equal parts and deciles are quantiles that divide a distribution into 10 equal parts.

Some authors refer to the median as the 0.5 quantile, which means that the proportion 0.5 (half) will be below the median and 0.5 will be above it. This way of defining quartiles makes sense if you are trying to find a particular quantile in a data set (i.e. the median). Use the following formula to estimate the ith observation:

ith observation = q (n + 1)
where q is the quantile, the proportion below the ith value that you are looking for
n is the number of items in a data set

The above equation is a bit of a mind bender; it’s best explained with an example.

How to Find Quantiles?
Sample question: Find the number in the following set of data where 20 percent of values fall below it, and 80 percent fall above:
1 3 5 6 9 11 12 13 19 21 22 32 35 36 45 44 55 68 79 80 81 88 90 91 92 100 112 113 114 120 121 132 145 146 149 150 155 180 189 190

Step 1: Order the data from smallest to largest. The data in the question is already in ascending order.
Step 2: Count how many observations you have in your data set. this particular data set has 40 items.

Step 3: Convert any percentage to a decimal for “q”. We are looking for the number where 20 percent of the values fall below it, so convert that to .2.

Step 4: Insert your values into the formula:
ith observation = q (n + 1)
ith observation = .2 (40 + 1) = 8.2
Answer: The ith observation is at 8.2, so we round down to 8 (remembering that this formula is an estimate). The 8th number in the set is 13, which is the number where 20 percent of the values fall below it.

## WHAT IS A HISTOGRAM?

A frequency distribution shows how often each different value in a set of data occurs. A histogram is the most commonly used graph to show frequency distributions. It looks very much like a bar chart, but there are important differences between them.

**![Histogram](https://asq.org/-/media/Images/Learn-About-Quality/Histogram/histogram.png)**
