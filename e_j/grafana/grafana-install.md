# Grafana

## references

<https://grafana.com/docs/grafana/latest/setup-grafana/installation/debian/>

## uninstall

```bash
# If you configured Grafana to run with systemd, stop the systemd servivce for Grafana server: I did this one!
sudo systemctl stop grafana-server
# If you configured Grafana to run with init.d, stop the init.d service for Grafana server:
sudo service grafana-server stop
# To uninstall Grafana OSS:
sudo apt-get remove grafana
# To uninstall Grafana Enterprise:
sudo apt-get remove grafana-enterprise
# Optional: To remove the Grafana repository:
sudo rm -i /etc/apt/sources.list.d/grafana.list
```

## Install from APT repository

If you install from the APT repository, Grafana automatically updates when you run apt-get update.

| Grafana Version           | Package            | Repository                          |
|---------------------------|--------------------|-------------------------------------|
| Grafana Enterprise        | grafana-enterprise | <https://apt.grafana.com> stable main |
| Grafana Enterprise (Beta) | grafana-enterprise | <https://apt.grafana.com> beta main   |
| Grafana OSS               | grafana            | <https://apt.grafana.com> stable main |
| Grafana OSS (Beta)        | grafana            | <https://apt.grafana.com> beta main   |

Note: Grafana Enterprise is the recommended and default edition. It is available for free and includes all the features of the OSS edition. You can also upgrade to the full Enterprise feature set, which has support for Enterprise plugins.

Complete the following steps to install Grafana from the APT repository:

```bash
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# sudo apt-get update
# Installs the latest OSS release:
sudo apt-get install grafana
# Installs the latest Enterprise release:
sudo apt-get install grafana-enterprise
# Optional https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/ configure grafana
```

## Start the Grafana server

This topic includes instructions for starting the Grafana server. For certain configuration changes, you might have to restart the Grafana server for them to take effect.

The following instructions start the grafana-server process as the grafana user, which was created during the package installation.

If you installed with the APT repository or .deb package, then you can start the server using systemd or init.d. If you installed a binary .tar.gz file, then you execute the binary.

## Start the Grafana server with systemd (I did this)

Complete the following steps to start the Grafana server using systemd and verify that it is running.

To start the service, run the following commands:

```bash
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

## Configure the Grafana server to start at boot using systemd (I didn't do this)

To configure the Grafana server to start at boot, run the following command:

```bash
sudo systemctl enable grafana-server.service
```

## Stop grafana

```bash
sudo systemctl stop grafana-server
```

## restart grafana

```bash
# Restart the Grafana server using systemd
# To restart the Grafana server, run the following commands:

sudo systemctl restart grafana-server
```

## Start server on port <= 1024

<https://grafana.com/docs/grafana/latest/setup-grafana/start-restart-grafana/#serve-grafana-on-a-port--1024>

## test it

<http://localhost:3000/>

admin/admin
admin/prom-operator
