# Install Redis Insight

## reference

<https://docs.redis.com/latest/ri/installing/install-redis-desktop/#install-redisinsight-on-ubuntu>

## Remove RedisInsight

```bash
sudo apt list --installed | grep redis
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
redis-stack-server/jammy,now 7.2.0-v5 amd64 [installed]
redisinsight/now 2.38.0-99051 amd64 [installed,local]
# To remove a package with Apt, use the command:
sudo apt remove redisinsight
```

## Install RedisInsight on Ubuntu

Download **[RedisInsight](https://redis.com/redis-enterprise/redis-insight/)**.

Open a terminal and navigate to the folder containing the downloaded file.
Make your downloaded file into an executable.

```bash
pushd .
cd ~/Downloads
chmod +x redisinsight-linux64-<version>
sudo apt install ./RedisInsight-linux-amd64.deb
# start
redisinsight
```

To access your RedisInsight UI, open a web browser and navigate to <http://127.0.0.1:8001>.
