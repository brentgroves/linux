# Alert Manager

## references

<https://github.com/prometheus/alertmanager>

## Installing Alert Manager

You can download the latest version of Alert Manager from the official website of Prometheus and install it on Ubuntu 20.04 LTS very easily.

First, navigate to the ~/Downloads directory (or any other temporary directory of your choice) as follows:

```bash
cd ~
wget https://github.com/prometheus/alertmanager/releases/download/v0.26.0/alertmanager-0.26.0.linux-amd64.tar.gz
tar xzf alertmanager-*tar.gz
cd alertmanager-0.26.0.linux-amd64/
./alertmanager --config.file=alertmanager.yml
```
