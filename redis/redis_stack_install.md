## Install Redis Stack

## references

<https://redis.io/docs/install/install-stack/linux/>
<https://www.dragonflydb.io/faq/how-to-start-redis-server>
<https://www.hostinger.com/tutorials/how-to-install-and-setup-redis-on-ubuntu/>

## Install Redis Stack on Linux

How to install Redis Stack on Linux

Learn how to install Redis Stack on Linux from the official repository, RPM feed, with snap, or AppImage.

### From the official Debian/Ubuntu APT Repository

You can install recent stable versions of Redis Stack from the official packages.redis.io APT repository. The repository currently supports Debian Bullseye (11), Ubuntu Bionic (18.04), Ubuntu Focal (20.04), and Ubuntu Jammy (22.04) on x86 and arm64 processors. Add the repository to the apt index, update it, and install it:

```bash
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install redis-stack-server
```

## connect with CLI

Redis CLI
Overview of redis-cli, the Redis command line interface

In interactive mode, redis-cli has basic line editing capabilities to provide a familiar typing experience.

To launch the program in special modes, you can use several options, including:

Simulate a replica and print the replication stream it receives from the primary.
Check the latency of a Redis server and display statistics.
Request ASCII-art spectrogram of latency samples and frequencies.
This topic covers the different aspects of redis-cli, starting from the simplest and ending with the more advanced features.

## start redis

<https://www.dragonflydb.io/faq/how-to-start-redis-server>

Once Redis is installed, you can start the Redis server by running the following command in the terminal:

```bash
redis-server
```

This will start the Redis server in the default configuration at port 6379.

You can also specify a configuration file while starting the Redis server. For example, to start Redis with a custom configuration file located at /etc/redis/myconfig.conf, you can run the following command:

```bash
redis-server /etc/redis/myconfig.conf
```

In addition, you can run Redis in the background by adding the --daemonize yes option to the command:

```bash
redis-server --daemonize yes
```

This will start the Redis server in the background and return control to the terminal.

Finally, you can check if the Redis server is running properly by using the Redis command-line interface (CLI) tool redis-cli. Open a new terminal window and run the following command:

```bash
redis-cli ping
```

If the Redis server is running, it will return PONG.
