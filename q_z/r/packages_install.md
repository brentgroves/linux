# **[r2u project website](https://github.com/eddelbuettel/r2u)

This is to have access to all R packages and those not installed by the standard install procedure.

Complete coverage with (using 24.04 for both amd64 and arm64) about 31485 CRAN packages (and 633 from BioConductor) using current versions: We support R 4.6.0, and BioConductor 3.23 (on resolute, noble and jammy; focal is in archived mode and remains at 3.21); for 24.04 (aka 'noble') and 26.04 (aka 'resolute') BioConductor is available for both amd64 and arm64.

## CRAN

CRAN stands for Comprehensive R Archive Network. It is the official, primary repository for the R programming language. Think of it as the ultimate app store and library for R. It functions as a vast, global network of servers storing:

- **R Distributions:** The actual software and installation files for R itself.
- **Packages:** Thousands of user-created add-on tools that extend R’s capabilities (e.g., advanced plotting, machine learning, web scraping).Documentation: Official manuals, FAQs, and software updates.

**How you use it:** In the R console, you typically interact with CRAN using the install.packages() command. For example, typing install.packages("ggplot2") fetches and installs the popular data-visualization package directly from CRAN to your local machine.

To ensure fast downloads and system redundancy, CRAN operates using a network of "mirrors"—cloned servers located all over the world. You can browse packages, view documentation, or select a download mirror directly on the **[Comprehensive R Archive Network](https://cran.r-project.org/)** website.

## What is Selected ?

Everything :)

Initially, we started from cran-logs by picking the N most-downloaded packages, along with their dependencies from BioConductor. (It should be noted that for example the first 100 packages already account for approximately half the total downloads: it is a very skewed distribution.) We iterated, and fairly soon arrived of full coverage of CRAN.

So we now cover

- all CRAN packages (modulo at best a handful of blacklisted ones) including all packages needing compilation
- all BioConductor packages implied by these plus a 'healthy subset' of the highest **[scoring](https://bioconductor.org/packages/stats/bioc/bioc_pkg_scores.tab)** BioConductor packages (also covering e.g. all BioConductor packages in the Debian and Ubuntu distributions)

This currently results in 25706, 28188, 31485, 29106 binary packages from CRAN in "focal", "jammy", "noble", and "resolute", respectively. It also contains 431, 534, 633, and 620 BioConductor packages, respectively, from their 3.23 (resolute, noble, jammy) and 3.21 (focal) releases. (See this FAQ about why this number is higher than CRAN, and variable between releases.)

The sole exception are packages we cannot build (as we do not have the required commercial software it accessess, or do not have the required more recent toolchain component) plus a handful or so of 'odd builds' that fail and are skipped. For rust-based packages we ensure the toolchain is more recent than what the Ubuntu distribution provides so that we can build whatever is at CRAN.

## What is it Based On?

Initially, for the CRAN binaries we repackaged **[P3M/RSPM/PPM](https://packagemanager.rstudio.com/client/#/repos/2/packages/builds)** (where available) or build natively. All selected BioConductor packages are built natively. For all of these, full dependency resolution and integration with the system is a key feature. For arm64 we started to build from source as we did for BioConductor. Initially we build BioConductor packages locally too; this was moved to GitHub Actions in 2025. The experience of building via GitHub Action for both arm64 and BioConductor has been generally positive so now everything is built from source at GitHub Actions in the r2u-builder repository (which used to be the r2u-bioc-builder repository).

Everything is provided as .deb binary files with proper dependency resolution by using a proper apt repo which also has a signed Release file.