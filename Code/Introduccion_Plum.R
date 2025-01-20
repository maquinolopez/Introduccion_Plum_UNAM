######################################
# Author: Marco A. Aquino-López
# Script: Introduction to Plum
# Purpose: Demonstrate how to use the rPlum package to date sediments using 210Pb
######################################

# Introduction to rPlum
# ----------------------
# This script provides an introduction to the `rPlum` package for sediment dating.
# It includes examples of running models with default and custom datasets, 
# as well as calculating and visualizing accumulation rates.

# Clearing the R environment
rm(list = ls())

# Install the `rplum` package (if not already installed)
if (!requireNamespace("rplum", quietly = TRUE)) {
  install.packages("rplum")
}

# Load the `rplum` library
library(rplum)

# Run the default Plum core (provided by Dr. Nicole Sanderson)
# ------------------------------------------------------------
# This uses a built-in example dataset. 
# Plum will prompt for the number of sections to model.
Plum(BCAD = TRUE)  # Use BC/AD for calendar years instead of BP.

# Running Custom Cores
# ---------------------
# 1. Core with supported 210Pb proxy data
Plum("Sim01")

# 2. Core with 210Pb measurements only
Plum("Sim02")

# 3. Core with 210Pb and other dating measurements
# Specify section thickness and additional dating information.
Plum("HP1C", thick = 1, otherdates = "HP1C_C")

# Accumulation Rates
# -------------------
# To simulate a clean start, clear the environment again.
rm(list = ls())

# Run the core without running the full Plum model immediately (`run = FALSE`)
Plum("HP1C", otherdates = "HP1C_C", run = FALSE)

# Visualize the age-depth model
agedepth()
dev.off()  # Close the graphical device (if open)

# Plotting Accumulation Rates at Specific Depths
# -----------------------------------------------
# Example: Accumulation rate at 10 cm depth
accrate_d10 <- accrate.depth(d = 10)
head(accrate_d10)
mean(accrate_d10); var(accrate_d10)
plot(density(accrate_d10), main = "Accumulation Rate at Depth 10 cm", 
     xlab = "yr/cm", ylab = "")

# Example: Accumulation rate at 25 cm depth (converted to cm/yr)
accrate_d25 <- accrate.depth(d = 25, cmyr = TRUE)
head(accrate_d25)
mean(accrate_d25); var(accrate_d25)
summary(accrate_d25)
plot(density(accrate_d25), main = "Accumulation Rate at Depth 25 cm", 
     xlab = "cm/yr", ylab = "")

# Plotting Accumulation Rates at Specific Ages
# --------------------------------------------
# Example: Accumulation rate at 300 years BP
accrate_a300 <- accrate.age(age = 300)
head(accrate_a300)
mean(accrate_a300); var(accrate_a300)
summary(accrate_a300)
plot(density(accrate_a300), main = "Accumulation Rate at Age 300 BP", 
     xlab = "yr/cm", ylab = "")
hist(accrate_a300, breaks = 100)

# Example: Accumulation rate at -10 years BP (converted to cm/yr)
acc_rate_10 <- accrate.age(age = -10, cmyr = TRUE)
head(acc_rate_10)
mean(acc_rate_10); var(acc_rate_10)
plot(density(acc_rate_10), main = "Accumulation Rate at Age -10 BP", 
     xlab = "cm/yr", ylab = "")

# Plotting Accumulation Rates for the Whole Model
# ------------------------------------------------
# By Depth
accrate.depth.ghost(cmyr = TRUE, acc.lim = c(0, 1.5))
accrate.depth.ghost(acc.lim = c(0, 5), d.lim = c(0, 10))

# By Age
accrate.age.ghost(acc.lim = c(0, 40))
accrate.age.ghost(cmyr = TRUE, age.lim = c(-20, 50), acc.lim = c(0, 0.28))

# Additional Notes:
# -----------------
# - The `Plum` function automatically asks for confirmation on the number of sections
#   unless the input is explicitly provided in the dataset.
# - Users can explore other parameters in the `Plum` and `agedepth` functions to 
#   customize analyses further.
# - Always ensure the dataset is correctly formatted for use with `rplum`. Refer to 
#   the package documentation for data requirements and examples.

# End of Script