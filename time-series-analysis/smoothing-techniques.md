# Smoothing Techniques

## references

<https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc42.htm>

## What are Moving Average or Smoothing Techniques

Inherent in the collection of data taken over time is some form of random variation. There exist methods for reducing of canceling the effect due to random variation. An often-used technique in industry is "smoothing". This technique, when properly applied, reveals more clearly the underlying trend, seasonal and cyclic components.

There are two distinct groups of smoothing methods

- Averaging Methods
- Exponential Smoothing Methods

We will first investigate some averaging methods, such as the "simple" average of all past data.

A manager of a warehouse wants to know how much a typical supplier delivers in 1000 dollar units. He/she takes a sample of 12 suppliers, at random, obtaining the following results:

| Supplier | Amount | Supplier | Amount |
|----------|--------|----------|--------|
| 1        | 9      | 7        | 11     |
| 2        | 8      | 8        | 7      |
| 3        | 9      | 9        | 13     |
| 4        | 12     | 10       | 9      |
| 5        | 9      | 11       | 11     |
| 6        | 12     | 12       | 10     |

<https://www.tablesgenerator.com/markdown_tables>
