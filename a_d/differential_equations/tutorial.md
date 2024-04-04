# Differential Equations

Use R to work on ODEs

## references

https://cran.r-project.org/web/packages/phaseR/readme/README.html

https://www.cfm.brown.edu/people/dobrush/am33/R/ch1/dirfield.html

https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Soetaert~et~al.pdf

## launch R Studio using compose

```bash
pushd .
cd ~/src/repsys/docker/r
docker compose up

```

## Example

As a basic example, we consider analysing the non-linear two-dimensional system of ODEs provided in phaseR via example12(). By hand, we typically first locate the nullclines and then identify the equilibrium points. Following this, we produce a plot from which trajectories can be sketched. This can all be seamlessly carried out in phaseR with:

install.packages("phaseR")
library(phaseR)

example12_flowField   <- flowField(example12,
                                   xlim = c(-4, 4),
                                   ylim = c(-4, 4),
                                   add  = FALSE)