# Redis

## references

<https://www.youtube.com/watch?v=WQ61RL1GpEE>

## tutorial

```bash
redis-stack-server
```

```bash
redis-cli ping
redis-cli
127.0.0.1:6379> keys *
(empty array)
127.0.0.1:6379> set powerlevel 9001
OK
127.0.0.1:6379> keys *
1) "powerlevel"
127.0.0.1:6379> get powerlevel
"9001"
127.0.0.1:6379> set "myuid" "brent.groves@gmail.com"
OK
127.0.0.1:6379> get "myuid"
"brent.groves@gmail.com"
127.0.0.1:6379> set "user:myuid" "brent.groves@gmail.com"
OK
127.0.0.1:6379> get "user:myuid"
"brent.groves@gmail.com"
127.0.0.1:6379> keys *:user
(empty array)
127.0.0.1:6379> keys user:*
1) "user:myuid"
```

## redis hashes

## redis persistance

- snapshotting also known as rdb
- Append Only File AOF
writes everything to a log file that can be replayed. Claims that this method makes persistance as reliable as PostGreSQL
