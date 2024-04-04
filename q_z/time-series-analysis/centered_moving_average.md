# Centered Moving Average

## references

<https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc422.htm>

## 6.4.2.2. Centered Moving Average

In the previous example we computed the average of the first 3 time periods and placed it next to period 3. We could have placed the average in the middle of the time interval of three periods, that is, next to period 2. This works well with odd time periods, but not so good for even time periods. So where would we place the first moving average when M = 4?

Technically, the Moving Average would fall at t = 2.5, 3.5, ...

To avoid this problem we smooth the MA's using M = 2. Thus we smooth the smoothed values!

The following table shows the results using M = 4.

| Period        | Value | MA   | Centered |
|---------------|-------|------|----------|
| 1             | 9     |      |          |
| 1.5           |       |      |          |
| 2             | 8     |      |          |
| 2.5           |       | 9.5  |          |
| 3             | 9     |      | 9.5      |
| 3.5           |       | 9.5  |          |
| 4             | 12    |      | 10       |
| 4.5           |       | 10.5 |          |
| 5             | 9     |      | 10.750   |
| 5.5           |       | 11.0 |          |
| 6             | 12    |      |          |
| 6.5           |       |      |          |
| 7             | 11    |      |          |
