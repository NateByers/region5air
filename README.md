# region5air

R package with data from EPA's Air Quality System database for Region 5 states.

## Install

Install using the `devtools` package:


```r
devtools::install_github("NateByers/region5air")
```

## Example

Obtain Ozone, temperature, and solar radiation for the Chicago area between January 1 December 31, 2013:


```r
data(chicago_air)
head(chicago_air)
```


```
##         date ozone temp solar month weekday
## 1 2013-01-01 0.032   17  0.65     1       3
## 2 2013-01-02 0.020   15  0.61     1       4
## 3 2013-01-03 0.021   28  0.17     1       5
## 4 2013-01-04 0.028   18  0.62     1       6
## 5 2013-01-05 0.025   26  0.48     1       7
## 6 2013-01-06 0.026   36  0.47     1       1
```

