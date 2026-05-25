## hashes

## references

<https://redis.io/commands/?group=hash>
<https://redis.io/docs/data-types/hashes/>

Basic commands
HSET sets the value of one or more fields on a hash.
HGET returns the value at a given field.
HMGET returns the values at one or more given fields.
HINCRBY increments the value at a given field by the integer provided.

## Redis hashes

Introduction to Redis hashes

Redis hashes are record types structured as collections of field-value pairs. You can use hashes to represent basic objects and to store groupings of counters, among other things.

```redis
> HSET bike:1 model Deimos brand Ergonom type 'Enduro bikes' price 4972
(integer) 4
> HGET bike:1 model
"Deimos"
> HGET bike:1 price
"4972"
> HGETALL bike:1
1) "model"
2) "Deimos"
3) "brand"
4) "Ergonom"
5) "type"
6) "Enduro bikes"
7) "price"
8) "4972"
```

While hashes are handy to represent objects, actually the number of fields you can put inside a hash has no practical limits (other than available memory), so you can use hashes in many different ways inside your application.

The command HSET sets multiple fields of the hash, while HGET retrieves a single field. HMGET is similar to HGET but returns an array of values:

```redis
> HMGET bike:1 model price no-such-field
1) "Deimos"
2) "4972"
3) (nil)
```
