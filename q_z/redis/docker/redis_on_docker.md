# Redis on Docker

## references

<https://www.mortensi.com/2023/05/convert-sql-queries-to-redis-commands/>
<https://redis.com/blog/get-sql-like-experience-redis/>

## Install Redis Stack

The first thing to do is to launch a Redis Stack instance. You can use Docker for that or any other installation method. If using Docker, run:

docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
