global data "/Users/bbdaniels/Library/CloudStorage/Dropbox/Career/DIME/DIME Analytics/Trainings/RRF Course/2023/Materials/Hands-On Sessions/Data for Hands-On Exercises"

// Load decleaned connectivity dataset
import delimited using ///
  "${data}/data-cleaning/secondary data/colombia_connectivity_decleaned.csv" ///
  , clear varnames(1)

  // Examine data
  codebook, compact

  // Check for duplicates
  drop id_test_data
  duplicates report
  duplicates tag ...
  duplicates drop

  // Fix issues with leading and trailing spaces
  replace ... = trim(...)

  // Confirm identifying variable
  isid quadkey adm2_pc trimester , sort

// Cleaning

  // Check data types
  describe
  codebook, compact
  codebook

  // Remove NA from variables and replace with .
  destring ... , ... replace

  // Remove accented characters
  local pairs `" "Ó O" "ó o" "' // Extend to other characters

  foreach pair in `pairs' {
    local original : word 1 of `pair'
    local replace  : word 2 of `pair'
    replace adm1_es = subinstr(adm1_es,"`original'","`replace'",.)
    // Extend to other variables
  }

// Labeling and creating codebook with saved data

  compress

  ssc install iefieldkit , replace

  iecodebook template ///
    using "..."

  iecodebook apply ///
    using "..."

  iecodebook export ///
    using "..." ///
  , save

// End
