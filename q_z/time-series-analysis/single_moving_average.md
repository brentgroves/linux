# Single Moving Average

## references

<https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc421.htm>

## 6.4.2.1 Single Moving Average

An alternative way to summarize the past data is to compute the mean of successive smaller sets of numbers of past data as follows.

* Recall the set of numbers 9, 8, 9, 12, 9, 12, 11, 7, 13, 9, 11, 10 which were the dollar amount of 12 suppliers selected at random. Let us set M, the size of the "smaller set" equal to 3. Then the average of the first 3 numbers is:   (9 + 8 + 9) / 3 = 8.667.

This is called "smoothing" (i.e., some form of averaging). This smoothing process is continued by advancing one period and calculating the next average of three numbers, dropping the first number.

The next table summarizes the process, which is referred to as Moving Averaging. The general expression for the moving average is

$$
M_t = \frac{X_t + X_{t-1} + \cdots + X_{t-N+1}}{N} \, .
$$

| Supplier | $  | MA     | Error  | Error squared |
|----------|----|--------|--------|---------------|
| 1        | 9  |        |        |               |
| 2        | 8  |        |        |               |
| 3        | 9  | 8.667  | 0.333  | 0.111         |
| 4        | 12 | 9.667  | 2.333  | 5.444         |
| 5        | 9  | 10.000 | -1.000 | 1.000         |
| 6        | 12 | 11.000 | 1.000  | 1.000         |
| 7        | 11 | 10.667 | 0.333  | 0.111         |
| 8        | 7  | 10.000 | -3.000 | 9.000         |
| 9        | 13 | 10.333 | 2.667  | 7.111         |
| 10       | 9  | 9.667  | -0.667 | 0.444         |
| 11       | 11 | 11.000 | 0      | 0             |
| 12       | 10 | 10.000 | 0      | 0             |

The MSE = 2.42 as compared to 3 in the previous case.
