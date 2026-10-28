# **[You Can Now Upgrade Ubuntu 24.04 LTS to Ubuntu 26.04 LTS, Here’s How](https://9to5linux.com/you-can-now-upgrade-ubuntu-24-04-lts-to-ubuntu-26-04-lts-heres-how)**

Today, September 29th, 2026, Canonical has (finally) opened the upgrade path for Ubuntu 24.04 LTS (Noble Numbat) users to **[Ubuntu 26.04 LTS (Resolute Raccoon)](https://9to5linux.com/ubuntu-26-04-lts-resolute-raccoon-is-now-available-for-download)**, so here’s how to upgrade your installation.

To ensure a safe upgrade process for existing Ubuntu LTS users, Canonical delayed the upgrade path by about three weeks, but now it’s officially open, allowing Ubuntu 24.04 LTS to upgrade to Ubuntu 26.04 LTS and enjoy its new features and improvements.

## How to upgrade Ubuntu 24.04 LTS to Ubuntu 26.04 LTS via GUI

You should receive a notification that Ubuntu 26.04 LTS is available to upgrade. If you don’t get the notification, open the Software Updater utility, and it will say that “Ubuntu 26.04.1 LTS is now available (you have 24.04). Click on the “Upgrade” button to start the upgrade process.

You will be prompted by a dialog with more information about the Ubuntu 26.04 LTS release if you’re interested in reading the full release notes, but you’re here to upgrade your system, so click on the “Upgrade” button to start the upgrade process.

![source](https://9to5linux.com/wp-content/uploads/2026/09/u24u1.webp)

Now, follow the on-screen instructions for a successful upgrade. However, before the upgrade process starts, you will be informed about what packages will be upgraded, installed, or removed, as well as that you must close all open windows and documents to avoid data loss, and that the lock screen has been disabled and will remain disabled during the upgrade process.

![source](https://9to5linux.com/wp-content/uploads/2026/09/u24u3.webp)
![source](https://9to5linux.com/wp-content/uploads/2026/09/u24u4.webp)

During the upgrade process, which can take up to an hour or more to complete, depending on your Internet bandwidth and computer’s specs, you may see a notification to restart certain daemons running on your Ubuntu installation or replace some configuration files with new ones, so choose whether you want to do so or not.

![source](https://9to5linux.com/wp-content/uploads/2026/09/u24u2.webp)

![source](https://9to5linux.com/wp-content/uploads/2026/09/u24u5.webp)

## How to upgrade Ubuntu 24.04 LTS to Ubuntu 26.04 LTS via CLI

As usual, before attempting to upgrade your Ubuntu installation, ensure you have a recent backup of your most important files (you know, just in case something bad happens during the upgrade process). Also, make sure that your Ubuntu 24.04 LTS system is up to date by running the following commands in the Terminal app or by using the Software Updater utility.

```bash
sudo apt update && sudo apt full-upgrade
```

Reboot your system. Now, if you don’t see a notification that Ubuntu 26.04 LTS is available to upgrade, open the Terminal app and run the command below to start the upgrade process to Ubuntu 26.04 LTS “Resolute Raccoon”.

```bash
do-release-upgrade
```

To continue, press y. Wait for the command to gather all the necessary data, and when it finishes, you will be asked, “Do you want to start the upgrade?” so press y again to continue. Press Enter when you see the lock screen disabled notification.

Wait for all the packages needed for the upgrade to be fetched. The upgrade will start automatically, and it can take up to an hour or more to complete, depending on your Internet bandwidth and computer’s specs.

When the upgrade process is complete, you will be notified about the obsolete packages that will be automatically removed. After that, you will be prompted to restart your computer to complete the upgrade process, but don’t forget to save your work before doing so.

That’s it! You successfully upgraded your Ubuntu 24.04 LTS (Noble Numbat), so it’s time to enjoy the plethora of new features and enhancements included in the Ubuntu 26.04 LTS (Resolute Raccoon) release.
