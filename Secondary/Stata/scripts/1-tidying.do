global data "/Users/bbdaniels/Library/CloudStorage/Dropbox/Career/DIME/DIME Analytics/Trainings/RRF Course/2023/Materials/Hands-On Sessions/Data for Hands-On Exercises"

// Load wide connectivity dataset
import delimited using ///
  "${data}/data-tidying/colombia_connectivity_wide.csv" ///
  , clear varnames(1)

  // Reshape to long format

  reshape long ...

  save ... , replace

// Load long infrastructure dataset
import delimited using ///
  "${data}/data-tidying/colombia_infrastructure_lng.csv" ///
  , clear varnames(1)

  // Reshape to wide format

  reshape wide ...

  save ... , replace

// End of do-file
