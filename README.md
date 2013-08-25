Cliffs.d
========

A reasonably fast implementation of Cliff's delta effect size metric

Calculates the metric using a tight C loop instead of examining the 
input's dominance matrix. The algorithm is still `O(n^2)` but it
is space efficient and executes in C code rather than R. As a result,
it can process input vectors of 50k elements in about 10 seconds.

The equivalent R code is the following (found [here](https://stat.ethz.ch/pipermail/r-help/2007-April/129592.html)):

```R
cliffs.d.1 <- function(x, y) {
  mean(rowMeans(sign(outer(x, y, FUN="-"))))
}
```

#### Benchmarks

```R
> library(rbenchmark)
> library(cliffsd)
> cliffs.d.1 <- function(x, y) {
+   mean(rowMeans(sign(outer(x, y, FUN="-"))))
+ }
> a <- sample(1:10, 1000, replace = T)
> b <- sample(1:10, 1000, replace = T)
> benchmark(cliffs.d(a,b), cliffs.d.1(a,b))
              test replications elapsed relative user.self sys.self user.child
2 cliffs.d.1(a, b)          100   4.646   17.532     4.122    0.526          0
1   cliffs.d(a, b)          100   0.265    1.000     0.264    0.001          0

>  a <- sample(1:10, 10000, replace = T)
>  b <- sample(1:10, 10000, replace = T)
>  benchmark(cliffs.d(a,b), cliffs.d.1(a,b), replications = 10)
              test replications elapsed relative user.self sys.self user.child
2 cliffs.d.1(a, b)           10  42.433   16.667    27.476   12.840          0
1   cliffs.d(a, b)           10   2.546    1.000     2.505    0.016          0

```

#### Correctness test

```R
library(cliffsd)

cliffs.d.1 <- function(x, y) {
  mean(rowMeans(sign(outer(x, y, FUN="-"))))
}
correct = 0
for(i in c(1:100)) {
    a <- sample(1:runif(1, 1, 100), runif(1, 1, 1000), replace = T)
    b <- sample(1:runif(1, 1, 100), runif(1, 1, 1000), replace = T)

    t <- cliffs.d(a,b)
    v <- cliffs.d.1(a,b)

    if (signif(v, digits = 5) != signif(t, digits = 5)) {
      print(a)
      print(b)
      print(sprintf("t: %f, v: %f", t, v))
    } else {
      correct = correct + 1
    }
}
print(sprintf("%d/100 correct tests", correct))
```
