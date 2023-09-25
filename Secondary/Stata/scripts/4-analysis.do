global data "/Users/bbdaniels/Library/CloudStorage/Dropbox/Career/DIME/DIME Analytics/Trainings/RRF Course/2023/Materials/Hands-On Sessions/Data for Hands-On Exercises"

// Load wide municipality dataset
import delimited using ///
  "${data}/data-analysis/municipality_database.csv" ///
  , clear varnames(1)

  // Label variables
  lab var ...

// Summarize variables
  ds, not(type string)

  tabstat `r(varlist)', statistics(count mean sd min max) save
    return list

  matrix summ = r(StatTotal)
    matrix summ = summ'

  matlist summ

  // Put summary statistics in Word file
  putdocx begin ...
  putdocx table ...

  putdocx save ...

// Create graphs

  graph hbox ... , over()
    graph save ... , replace
  graph bar ... , over()
    graph save ... , replace

  graph combine ///
    ...

  graph export ... , replace

// Regression models

  regress ...
    est sto ...

  * More regressions....

  estout ...

// Scatter plots

  tw ///
    (scatter ...) ///
    (lpoly ...)

  graph export ...

// Correlations

  ...

// End
