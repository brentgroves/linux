# SQL to Redis

## references

<https://www.mortensi.com/2023/05/convert-sql-queries-to-redis-commands/>

<https://redis.com/blog/get-sql-like-experience-redis/>

## Convert SQL queries to Redis commands

Redis is not a relational database. But if you’re coming from the RDBMS world, in this post you will discover how to resolve query, search, and aggregation problems in Redis, and convert SQL queries to Redis commands.

Redis is a good fit to perform many of the operations you would do on a RDBMS. You can even execute a JOIN-like statement! I hope you will find this cheat sheet useful.

For my usual tests, I used to import the SQL database world into MySQL and make experiments. To keep consistency with the examples and tests I do, I took the time to convert the popular world database into Redis syntax. You can find the database in my repository, so you can import it and execute these examples.

## Install Redis Stack

The first thing to do is to launch a Redis Stack instance. You can use Docker for that or any other installation method. If using Docker, run:

docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest

## Create indexes

Then, connect to the server with redis-cli and create a couple of indexes.

FT.CREATE city_idx ON HASH PREFIX 1 city: SCHEMA Name AS name TAG CountryCode AS countrycode TAG SORTABLE Population AS population NUMERIC SORTABLE District AS district TAG SORTABLE

```redis
FT.CREATE city_idx 
ON HASH 
PREFIX 1 city: 
SCHEMA Name AS name TAG 
CountryCode AS countrycode TAG SORTABLE 
Population AS population NUMERIC SORTABLE 
District AS district TAG SORTABLE

FT.SEARCH city_idx '@name:{newcastle} @countrycode:{AUS}' 

FT.CREATE country_idx 
ON HASH 
PREFIX 1 country: 
SCHEMA Name AS name TAG 
Code AS code TAG
Region AS region TAG
```

## Import the dataset

Finally, import the dataset as mentioned.

```bash
curl https://raw.githubusercontent.com/mortensi/world/main/world.txt | redis-cli

```

## Convert SQL to Redis

We are now ready to start testing the commands. The SQL database is a MySQL with the world dataset loaded, if you’s like to reproduce the SQL queries too.

## SELECT, primary key access

SQL Redis
SELECT Name
FROM city
WHERE ID=3839;

```sql
+------+-------+-------------+----------+------------+
| ID | Name | CountryCode | District | Population |
+------+-------+-------------+----------+------------+
| 3839 | Miami | USA | Florida | 362470 |
+------+-------+-------------+----------+------------+
```

```redis
HGETALL city:3839
1) "Name"
2) "Miami"
3) "CountryCode"
4) "USA"
5) "District"
6) "Florida"
7) "Population"
8) "362470"
```

## SELECT, partial results

```sql
SELECT Name
FROM city
WHERE ID=3839;
```

```redis
HGET city:3839 Name
```

## AND

```sql
SELECT District FROM city WHERE Name = 'Newcastle' AND CountryCode = 'AUS';

```

```redis
FT.SEARCH city_idx '@name:{newcastle} 
```

## or

```sql
SELECT Name FROM city WHERE Name = 'Madrid' OR Name = 'Roma';
```

```redis
FT.SEARCH city_idx '@name:{Madrid|Roma}'
```

<https://www.mortensi.com/2023/05/convert-sql-queries-to-redis-commands/>

<https://redis.com/blog/get-sql-like-experience-redis/>

```redis
MULTI
HMSET product:10200 name ZXYW desc “Description for ZXYW” price 300
ZADD product_list 10200 product:10200
ZADD product_price 300 product:10200
EXEC
```
