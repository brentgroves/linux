# Exponential Smoothing

The Exponentially Weighted Moving Average (EWMA) is a statistic for monitoring the process that averages the data in a way that gives less and less weight to data as they are further removed in time.

## references

<https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc43.htm>

## 6.4.3. What is Exponential Smoothing

This is a very popular scheme to produce a smoothed Time Series. Whereas in Single Moving Averages the past observations are weighted equally, Exponential Smoothing assigns exponentially decreasing weights as the observation get older.

In other words, recent observations are given relatively more weight in forecasting than the older observations.

In the case of moving averages, the weights assigned to the observations are the same and are equal to 1/N. In exponential smoothing, however, there are one or more smoothing parameters to be determined (or estimated) and these choices determine the weights assigned to the observations.

Single, double and triple Exponential Smoothing will be described in this section.

## 6.4.3.1. Single Exponential Smoothing

This smoothing scheme begins by setting S2 to y1, where Si stands for smoothed observation or Exponentially Weighted Moving Average (EWMA), and y stands for the original observation. The subscripts refer to the time periods, 1,2,…,n. For the third period, S3=αy2+(1−α)S2; and so on. There is no S1; the smoothed series starts with the smoothed version of the second observation.

For any time period t, the smoothed value St is found by computing

$$
S_t = \alpha y_{t-1} + (1-\alpha)S_{t-1} \,\,\,\,\,\,\, 0 < \alpha \le 1 \,\,\,\,\,\,\, t \ge 3 \, .
$$

This is the basic equation of exponential smoothing and the constant or parameter α is called the smoothing constant.

Note: There is an alternative approach to exponential smoothing that replaces yt−1 in the basic equation with yt, the current observation. That formulation, due to Roberts (1959), is described in the section on EWMA control charts. The formulation here follows Hunter (1986).

The Exponentially Weighted Moving Average (EWMA) is a statistic for monitoring the process that averages the data in a way that gives less and less weight to data as they are further removed in time.

## Setting the first EWMA

| The first forecast is very important | The initial EWMA plays an important role in computing all the subsequent EWMAs. Setting $S_2$ to $y_1$ is one method of initialization.<br /><br />Still another possibility would be to average the first four or five observations.<br /><br />It can also be shown that the smaller the value of α, the more important is the selection of the initial EWMA. The user would be wise to try a few methods, (assuming that the software has them available) before finalizing the settings.|
|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## Why is it called "Exponential"?

| Expand basic equation | Let us expand the basic equation by first substituting for $S_{t-1}$ in the basic equation to obtain </br></br>|
|-----------------------|--------------------------------------------------------------------------------------------------|

<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <mtable columnalign="right center left" rowspacing="3pt" columnspacing="0 thickmathspace" displaystyle="true">
    <mtr>
      <mtd>
        <msub>
          <mi>S</mi>
          <mi>t</mi>
        </msub>
      </mtd>
      <mtd>
        <mi></mi>
        <mo>=</mo>
      </mtd>
      <mtd>
        <mi>&#x03B1;<!-- α --></mi>
        <msub>
          <mi>y</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
            <mo>&#x2212;<!-- − --></mo>
            <mn>1</mn>
          </mrow>
        </msub>
        <mo>+</mo>
        <mo stretchy="false">(</mo>
        <mn>1</mn>
        <mo>&#x2212;<!-- − --></mo>
        <mi>&#x03B1;<!-- α --></mi>
        <mo stretchy="false">)</mo>
        <mrow>
          <mo>[</mo>
          <mrow>
            <mi>&#x03B1;<!-- α --></mi>
            <msub>
              <mi>y</mi>
              <mrow class="MJX-TeXAtom-ORD">
                <mi>t</mi>
                <mo>&#x2212;<!-- − --></mo>
                <mn>2</mn>
              </mrow>
            </msub>
            <mo>+</mo>
            <mo stretchy="false">(</mo>
            <mn>1</mn>
            <mo>&#x2212;<!-- − --></mo>
            <mi>&#x03B1;<!-- α --></mi>
            <mo stretchy="false">)</mo>
            <msub>
              <mi>S</mi>
              <mrow class="MJX-TeXAtom-ORD">
                <mi>t</mi>
                <mo>&#x2212;<!-- − --></mo>
                <mn>2</mn>
              </mrow>
            </msub>
          </mrow>
          <mo>]</mo>
        </mrow>
      </mtd>
    </mtr>
    <mtr>
      <mtd />
      <mtd>
        <mi></mi>
        <mo>=</mo>
      </mtd>
      <mtd>
        <mi>&#x03B1;<!-- α --></mi>
        <msub>
          <mi>y</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
            <mo>&#x2212;<!-- − --></mo>
            <mn>1</mn>
          </mrow>
        </msub>
        <mo>+</mo>
        <mi>&#x03B1;<!-- α --></mi>
        <mo stretchy="false">(</mo>
        <mn>1</mn>
        <mo>&#x2212;<!-- − --></mo>
        <mi>&#x03B1;<!-- α --></mi>
        <mo stretchy="false">)</mo>
        <msub>
          <mi>y</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
            <mo>&#x2212;<!-- − --></mo>
            <mn>2</mn>
          </mrow>
        </msub>
        <mo>+</mo>
        <mo stretchy="false">(</mo>
        <mn>1</mn>
        <mo>&#x2212;<!-- − --></mo>
        <mi>&#x03B1;<!-- α --></mi>
        <msup>
          <mo stretchy="false">)</mo>
          <mn>2</mn>
        </msup>
        <msub>
          <mi>S</mi>
          <mrow class="MJX-TeXAtom-ORD">
            <mi>t</mi>
            <mo>&#x2212;<!-- − --></mo>
            <mn>2</mn>
          </mrow>
        </msub>
        <mspace width="thinmathspace" />
        <mo>.</mo>
      </mtd>
    </mtr>
  </mtable>
</math>
