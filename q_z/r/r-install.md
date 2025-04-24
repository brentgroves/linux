# Install R

## references

<https://phoenixnap.com/kb/install-r-ubuntu>
<https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-22-04>
<https://medium.com/@jamie84mclaughlin/installing-r-and-the-tidyverse-on-ubuntu-20-04-60170020649b>

## Important install dependancies

<https://medium.com/@jamie84mclaughlin/installing-r-and-the-tidyverse-on-ubuntu-20-04-60170020649b>

<!-- There are installation dependencies on some fairly major packages. Both tidyverse, httr and odbc require installations at the command line before they can be installed in R. These should help install the required elements: -->

sudo apt install libssl-dev libcurl4-openssl-dev unixodbc-dev libxml2-dev libmariadb-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype-dev libpng-dev libtiff5-dev libjpeg-dev

<!-- Note, selecting 'libfreetype-dev' instead of 'libfreetype6-dev' -->

## Install R on Ubuntu from CRAN Repository

To install R from the CRAN repository:

```bash
sudo apt install software-properties-common dirmngr -y
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# The CRAN repository key fingerprint is E298A3A825C0D65DFD57CBB651716619E084DAB9. Verify the downloaded key using the following command:

gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install r-base r-base-dev -y




# Enter the R command to access the R console:

R
```

Note: Using the R command without sudo creates a personal library for your user. To install packages that are available to every user on the system, run the R command as a root user by typing sudo -i R.

## Installing R Packages

The R community actively develops and maintains thousands of packages for specific tasks like data visualization, machine learning, statistical modeling, text mining, etc. Some of the most popular R packages include:

dplyr. This package provides practical and intuitive functions for summarizing, filtering, and transforming data.
tidyr. The tidyr package enables users to reshape and organize messy data into a tidy format.
purrr. Statisticians use the purrr functional programming package to improve flexibility and maintain consistency when working with functions and vectors.
ggplot2. ggplot2 is a versatile R package for creating and customizing visually appealing plots.
data.table. The high-performance data.table package is primarily used for data manipulation in large datasets.
stringr. The stringr package provides functions for streamlining string and text manipulation tasks.
Users can install R packages from within the R console by utilizing the install.packages("package_name") function.

For example, to install the ggplot2 package from the CRAN repository, access the R console and enter the following command:

install.packages("ggplot2")
