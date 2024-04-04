# r and databases

## references

<https://datacarpentry.org/R-ecology-lesson/05-r-and-databases.html>
<https://solutions.posit.co/connections/db/tooling/connections/>

## Introduction

So far, we have dealt with small datasets that easily fit into your computer’s memory. But what about datasets that are too large for your computer to handle as a whole? In this case, storing the data outside of R and organizing it in a database is helpful. Connecting to the database allows you to retrieve only the chunks needed for the current analysis.

Even better, many large datasets are already available in public or private databases. You can query them without having to download the data first.

R can connect to almost any existing database type. Most common database types have R packages that allow you to connect to them (e.g., RSQLite, RMySQL, etc). Furthermore, the dplyr package you used in the previous chapter, in conjunction with dbplyr supports connecting to the widely-used open source databases sqlite, mysql and postgresql, as well as Google’s bigquery, and it can also be extended to other database types (a vignette in the dplyr package explains how to do it). RStudio has created a website that provides documentation and best practices to work on database interfaces.

Interfacing with databases using dplyr focuses on retrieving and analyzing datasets by generating SELECT SQL statements, but it doesn’t modify the database itself. dplyr does not offer functions to UPDATE or DELETE entries. If you need these functionalities, you will need to use additional R packages (e.g., RSQLite). Here we will demonstrate how to interact with a database using dplyr, using both the dplyr’s verb syntax and the SQL syntax.
