# Installing packages

## references

<https://stackoverflow.com/questions/64096161/r-package-long-time-to-install-source-or-binary-type>

## Installs

## Binary installs does not work for Linux

<https://services.dartmouth.edu/TDClient/1806/Portal/KB/ArticleDet?ID=141373>

Source installs are the most up-to-date, where binary packages may lag by "some time". This is reflected in your output, where your R-3.6 sees 1.4.6 as the most recent though 1.5.3 source is available.

Some ways around this:

install.packages("stringi", type="binary") should find the closest version and install it without needing to compile it.

Download one of the .zip files (since you're on windows) from the CRAN page for stringi page and then use install.packages("path/to/stringi_1.5.3.zip"). However, they only have binary versions for R-4.0, not for R-3.6 ("r-oldrel"), so ... it may complain, or it may install and fail spectacularly when you most need the package in the future (and are on the plane without an internet connection).

According to a blog post on RStudio, you can use their public CRAN-like mirror to install binary packages for: linux (not available on CRAN) and for older releases of R (also not available on CRAN).
