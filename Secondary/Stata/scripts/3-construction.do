global data "/Users/bbdaniels/Library/CloudStorage/Dropbox/Career/DIME/DIME Analytics/Trainings/RRF Course/2023/Materials/Hands-On Sessions/Data for Hands-On Exercises"

// Load cleaned connectivity dataset
import delimited using ///
  "${data}/data-construction/secondary-data/colombia_connectivity_cleaned.csv" ///
  , clear varnames(1)

  // Check for outliers and winsorize
  tw (kdensity avg_d_kbps)(kdensity avg_u_kbps)

    ssc install winsor
    winsor avg_d_kbps , gen(avg_d_kbps_w) p(0.01)
    winsor avg_u_kbps , gen(avg_u_kbps_w) p(0.01)

  // Convert to Mbps
  gen avg_d_mbps = avg_d_kbps_w/1000
  gen avg_u_mbps = avg_u_kbps_w/1000

  tw (kdensity avg_d_mbps)(kdensity avg_u_mbps)

  // Create average indicators by municipality
  collapse ///
  (mean) ... ///
  , by(...)

  gen mbps_mean = ...
    lab var mbps_mean ...

  // Create difference indicators by municipality
  egen adm2_pc_code = group(adm2_pc)
    lab var adm2_pc_code ...
  tsset adm2_pc_code trimester
    gen difference = D.mbps_mean

  // Save this data
  save ...

// Load cleaned infrastructure dataset
import delimited using ///
  "${data}/data-construction/secondary-data/colombia_infrastructure_cleaned.csv" ///
  , clear varnames(1)

  // Create indicators
  gen ...
  egen ...

  // Save this data
  save ...

// Merge datasets
use ... , clear

  merge 1:1 ... ///
    using ... ///
  , ...

  save ...

// End
