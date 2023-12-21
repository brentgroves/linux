# Multiline commands

## references

```redis
MULTI
HMSET product:10200 name ZXYW desc “Description for ZXYW” price 300
ZADD product_list 10200 product:10200
ZADD product_price 300 product:10200
EXEC
```

```redis
MULTI
HMSET product:10201 name ZXYW desc “Description for ZXYW” price 301
ZADD product_list 10201 product:10201
ZADD product_price 301 product:10201
EXEC
```
