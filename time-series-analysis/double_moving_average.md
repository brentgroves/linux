# Double moving average

Unfortunately, neither the mean of all data nor the moving average of the most recent M values, when used as forecasts for the next period, are able to cope with a significant trend.

There exists a variation on the MA procedure that often does a better job of handling trend. It is called Double Moving Averages for a  Linear Trend Process. It calculates a second moving average from the original moving average, using the same value for M. As soon as both single and double moving averages are available, a computer routine uses these averages to compute a slope and intercept, and then forecasts one or more periods ahead.

**[MA Calculator](https://mathcracker.com/moving-average-forecast-calculator)**

**[Double MA Tutorial](https://medium.com/@polanitzer/time-series-methodologies-part-3-double-moving-average-6aba4a5fbb7e)**

## Preamble

The double moving average method will smooth out past data by performing a moving average on a subset of data that represents a moving average of an original set of data. That is, a second moving average is performed on the first moving average.

The second moving average application captures the trending effect of the data. The results are then weighted and forecasts are created.

## Double Moving Average

The first approach to use for a time-series data that exhibit a trend but no seasonality is the double moving average method. The double moving average method smooths out past data by performing a moving average on a subset of data that represents a moving average of an original set of data.

That is, a second moving average is performed on the first moving average. The second moving-average application captures the trending effect of the data, where the forecast value is twice the amount of the first moving average (MA1) at time t, less the second moving average estimate (MA2) plus the difference between the two moving averages multiplied by a correction factor (2 divided into the number of months in the moving average, m, less 1).

![forecast](https://miro.medium.com/v2/resize:fit:640/format:webp/1*VdN_8EZZwvKY9ZLOTlWOSA.png)

The example I will show is a 3-month double moving average and the forecast value obtained in period 40.

Let’s load a time-series data with no trend and no seasonality from the file “MA.csv”

```python
import numpy as np
import pandas as pd
df = pd.read_csv('MA.csv')
df.head()
```

![](https://miro.medium.com/v2/resize:fit:408/format:webp/0*Nil6uC9XnrHh_peJ.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:400/format:webp/0*-MUvrRIKDyvb42Nv.png)

Computing the First Moving Average (MA1) at Time t

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*3FY5B8APDOsIYfAluM2Xaw.png)

```python
df[‘3_month_MA_1’] = 0.00
for i in range(0,38):
 df[‘3_month_MA_1’][i+3] = np.mean( [ df[‘Y_true’][i], df[‘Y_true’][i+1], df[‘Y_true’][i+2] ])
df.head(6)
```

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*Xc6UkBFMJEge_LNkUWrIpw.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*q2HvQxyGDpjPCBD0qP4P6A.png)

## Computing the Second Moving Average (MA2) at Time t

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*F3oedJPiYpegQ5AEFHCqOA.png)

```python
df['3_month_MA_2'] = 0.00
for i in range(3,38):
    df['3_month_MA_2'][i+2] = np.mean( [ df['3_month_MA_1'][i], df['3_month_MA_1'][i+1], df['3_month_MA_1'][i+2] ])
df.head(8)
```

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*ZRWsADjgF6wm9q_D0oAKLw.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*c-98vaaU_FpDHe1NtoIr7A.png)

## Predicting with a Double Moving Average

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*bhBn4CNhhB5Z-AtLc9vJ0g.png)

```python
df['Y_pred'] = 0.00
for i in range(3,38):
    df['Y_pred'][i+2] = 2 * df['3_month_MA_1'][i+2] - df['3_month_MA_2'][i+2] + (2/(3-1))*(df['3_month_MA_1'][i+2] - df['3_month_MA_2'][i+2])
df.head(8)
```

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*aobaMpRCbtOU1AAyxHcWcw.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*uwRmW9E1iYuuvPUlOGy47Q.png)

## Error Estimation

First, let’s compute the absolute value of the difference between the true historical data and the predicted data by the model and called it “Absolute Error”

```python
df['Absolute Error'] = 0.00
for i in range(5,39):
    df['Absolute Error'][i] = abs( df['Y_pred'][i] - df['Y_true'][i])
df.head(8)

```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*M3-j_W-PqlWIWJnbi4JrYw.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*OCB1wxQin9pX8vVaOhVH-w.png)

Second, let’s compute the squared difference between the true historical data and the predicted data by the model and call it “Squared Error”

```python
df[‘Squared Error’] = 0.00
for i in range(5,39):
 df[‘Squared Error’][i] = (df[‘Y_pred’][i] — df[‘Y_true’][i])**2
df.head(8)
```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*IyPzQVlVz1iOSLlb4uwvyg.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*uCKryhsHa3IyxCASNnduCA.png)

Third, let’s compute prediction error number 1 as follows:

![](https://miro.medium.com/v2/resize:fit:628/format:webp/0*-o98xwATcf_FyE1Q.png)

Where: $Y_t$ is the true value (Y_true); and $Y2_t$ is the predicted value (Y_pred).

```python
df['Precent Error1'] = 0.00
for i in range(5,39):
    df['Precent Error1'][i] = abs(( df['Y_true'][i] - df['Y_pred'][i] ) / df['Y_true'][i])
df.head(8)
```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*syl_aLgkJzZN2zQELe_8yw.png)

```python
df.tail()
```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*O8ttu3M8Hyouq2ClAaH4Qw.png)

Fourth, let’s compute prediction error number 2 as follows:

![](https://miro.medium.com/v2/resize:fit:640/format:webp/0*X3ers5u7MEQg7XVY.png)

```python
df['Precent Error2'] = 0.00
for i in range(5,39):
    df['Precent Error2'][i] = ((df['Y_pred'][i] - df['Y_true'][i])/ df['Y_true'][i-1])**2
df.head(8)

```

![](https://miro.medium.com/v2/resize:fit:720/format:webp/1*MvZx82VyvHlkX64IJT3uWg.png)

**[STOPPED HERE on MA tutorial](https://medium.com/@polanitzer/time-series-methodologies-part-3-double-moving-average-6aba4a5fbb7e)**
