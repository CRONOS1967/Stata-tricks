// Initialize a local macro to store the list of variables that match the criteria
local empty_vars

// Loop over all variables in the dataset
foreach var of varlist _all {
    // Check if the variable is all missing
    quietly summarize `var', meanonly
    if r(N) == 0 {
        local empty_vars `empty_vars' `var'
    }
    // Check if the variable is all 0
    else if r(min) == 0 & r(max) == 0 {
        local empty_vars `empty_vars' `var'
    }
    // Check if the variable is all 2
    else if r(min) == 2 & r(max) == 2 {
        local empty_vars `empty_vars' `var'
    }
}

// Display the list of variables that are either all missing, all 0, or all 2
display "`empty_vars'"
