# R in docker

## references

<https://rocker-project.org/>
<https://github.com/rstudio/r-docker>
<https://rocker-project.org/images/>
<https://solutions.posit.co/envs-pkgs/environments/docker/>

## The Rocker Project

Docker Containers for the R Environment

Ensure you have Docker installed and start R inside a container with:

```bash
docker run --rm -ti r-base
```

## Or get started with an RStudio® instance

```bash
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 rocker/rstudio

```

and point your browser to localhost:8787. Log in with user/password rstudio/yourpassword.

<https://rocker-project.org/images/>
