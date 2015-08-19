# region5air

R package with data from EPA's Air Quality System database for Region 5 states.

## Install

Install using the `devtools` package:


```r
devtools::install_github("NateByers/region5air")
```

## Example

Obtain Ozone, PM2.5, and temperature data for the Chicago area between January 1, 2013 and December 31, 2014:


```r
data(chicago)
head(chicago)
```


```
##           site data_status action_code           datetime parameter
## 1 840170890005           0          10 20141231T0100-0600     44201
## 2 840170311601           0          10 20141231T0100-0600     44201
## 3 840170314002           0          10 20141231T0100-0600     44201
## 4 840170310001           0          10 20141231T0100-0600     44201
## 5 840171110001           0          10 20141231T0100-0600     44201
## 6 840170971007           0          10 20141231T0100-0600     44201
```

