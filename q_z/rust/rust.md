# Rust **[source](https://itsfoss.com/install-rust-cargo-ubuntu-linux/)**

## How to Install Rust and Cargo on Ubuntu and Other Linux Distributions

Mozilla did not "dump" or abandon the Rust programming language itself, but rather spun it off into an independent organization, the Rust Foundation, in 2021. This decision was primarily driven by massive 2020 layoffs due to financial constraints and a strategic shift to focus on their core product, Firefox, rather than developing a programming language.

Ever since Mozilla dumped **[Rust](https://www.rust-lang.org/?ref=itsfoss.com)**, it has gained even more prominence and popularity. Don’t just take my words for it. **[Rust is going to be included in the Linux kernel](https://www.zdnet.com/article/rust-in-the-linux-kernel-why-it-matters-and-whats-happening-next/?ref=itsfoss.com)**, only the second programming language after C.

Many developers have also started making awesome command line based tools in Rust. These tools are often available through the **[Cargo package manager](https://crates.io/?ref=itsfoss.com)**.

This is why it matters to install Rust support in Linux, both for the programmers and the end users.

Officially, Rust documents suggest installing Rust in Linux by downloading and executing the installer script in this manner:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

That could work. However, your distribution probably already packages Rust. Using your distribution’s package manager is also an option.

## Method 1: Installing Rust on any Linux using the official method

There are a few advantages of this method:

- You get the latest Rust and Cargo version
- Rust is only installed for the current user, not system-wide
- You do not need to be root or have sudo access to install Rust for yourself this way

Next, use this command to download the script and run it:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
info: downloading installer
warn: It looks like you have an existing rustup settings file at:
warn: /home/brent/.rustup/settings.toml
warn: Rustup will install the default toolchain as specified in the settings file,
warn: instead of the one inferred from the default host triple.

Welcome to Rust!

This will download and install the official compiler for the Rust
programming language, and its package manager, Cargo.

Rustup metadata and toolchains will be installed into the Rustup
home directory, located at:

  /home/brent/.rustup

This can be modified with the RUSTUP_HOME environment variable.

The Cargo home directory is located at:

  /home/brent/.cargo

This can be modified with the CARGO_HOME environment variable.

The cargo, rustc, rustup and other commands will be added to
Cargo's bin directory, located at:

  /home/brent/.cargo/bin

This path will then be added to your PATH environment variable by
modifying the profile files located at:

  /home/brent/.profile
  /home/brent/.bashrc
  /home/brent/.zshenv
  /home/brent/.config/powershell/profile.ps1

You can uninstall at any time with rustup self uninstall and
these changes will be reverted.
```

![source](https://itsfoss.com/content/images/2023/03/installing-rust-linux.webp)

## Execute the Install Script

It will ask for your input on the kind of installation you want. Go with option 1:

![source](https://itsfoss.com/content/images/2023/03/installing-rust-linux-2.webp)

Once the script finishes the installation process, you need to source the configuration file to make the changes available for your shell.

![source](https://itsfoss.com/content/images/2023/03/installing-rust-linux-3.webp)

Source the file:

```bash
source $HOME/.cargo/env
# this is added to the ~/.profile file so no need to add to zsh exports
```

Once it is done, verify that rust is available for you by checking the installed version:

```bash
rustc --version
```
