# **[Download the version](https://go.dev/dl/)** you want

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

Did not install apt go at home and only installed 1 version and updated path in exports.sh to /usr/local/go/bin

## Uninstalling Go

You can remove Go from your system using the steps described in this topic.

Linux / macOS / FreeBSD¶
Delete the go directory.
This is usually /usr/local/go.

Remove the Go bin directory from your PATH environment variable.
Under Linux and FreeBSD, edit /etc/profile or $HOME/.profile. If you installed Go with the macOS package, remove the /etc/paths.d/go file.

## Pick golang version to install

All versions are located at **[golang versions](https://go.dev/dl/)**

1. Remove any previous Go installation by deleting the /usr/local/go folder (if it exists), then extract the archive you just downloaded into /usr/local, creating a fresh Go tree in /usr/local/go:

    ```bash
    cd ~/Downloads
    curl -OL https://go.dev/dl/go1.23.4.linux-amd64.tar.gz 
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
    ls /usr/local/go 
    api  bin  codereview.cfg  CONTRIBUTING.md  doc  go.env  lib  LICENSE  misc  PATENTS  pkg  README.md  SECURITY.md  src  test  VERSION
    ```

    (You may need to run the command as root or through sudo).

    Do not untar the archive into an existing /usr/local/go tree. This is known to produce broken Go installations.

2. Add /usr/local/go/bin to the PATH environment variable.
    You can do this by adding the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):

    export PATH=$PATH:/usr/local/go/bin

    Note: Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source $HOME/.profile.

3. Verify that you've installed Go by opening a command prompt and typing the following command:

    `$ go version`
    Confirm that the command prints the installed version of Go.

## **[Managing Go installations](https://go.dev/doc/manage-install)**

You can install multiple Go versions on the same machine. For example, you might want to test your code on multiple Go versions. For a list of versions you can install this way, see the **[download page](https://go.dev/dl/)**.

Note: To install using the method described here, you'll need to have git installed.

To install additional Go versions, run the **[go install](https://pkg.go.dev/cmd/go#hdr-Compile_and_install_packages_and_dependencies)** command, specifying the download location of the version you want to install.

```bash
sudo apt-get install gcc-multilib
# step 1 downloads the go installation program to ~/go/bin
cd ~/go/bin
go install golang.org/dl/go1.22.0@latest
# Add ~/go/bin to path
# step 2 install the go version to the ~/sdk/go1.22.0 directory
go1.22.0 download
Downloaded   0.0% (   16384 / 68988925 bytes) ...
Downloaded  21.6% (14909360 / 68988925 bytes) ...
Downloaded 100.0% (68988925 / 68988925 bytes)
Unpacking /home/brent/sdk/go1.22.0/go1.22.0.linux-amd64.tar.gz ...
Success. You may now run 'go1.22.0'
```

To run go commands with the newly-downloaded version, append the version number to the go command, as follows:

```bash
go1.22.0 version
go version go1.10.7 linux/amd64
```

When you have multiple versions installed, you can discover where each is installed, look at the version's GOROOT value. For example, run a command such as the following:

```bash
go1.22.0 env GOROOT 
/home/brent/sdk/go1.22.0

# <https://github.com/dominikh/go-tools#installation>

## install go linter

go install honnef.co/go/tools/cmd/staticcheck@latest

## install debugger

go install github.com/go-delve/delve/cmd/dlv@latest

## language server (I think vscode handles this install)

go install golang.org/x/tools/gopls@latest
<https://github.com/golang/vscode-go/blob/master/README.md>
Welcome! 👋🏻
Whether you are new to Go or an experienced Go developer, we hope this extension fits your needs and enhances your development experience.
Install Go 1.14 or newer if you haven't already.
Install the VS Code Go extension.
Open any directory or workspace containing Go code to automatically activate the extension. The Go status bar appears in the bottom left corner of the window and displays your Go version.
The extension depends on go, gopls, dlv and other optional tools. If any of the dependencies are missing, the ⚠️ Analysis Tools Missing warning is displayed. Click on the warning to download dependencies.
See the tools documentation for a complete list of tools the extension depends on.
```

## install vscode go extension

<https://marketplace.visualstudio.com/items?itemName=golang.go>
Installation
Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.
ext install golang.Go

~/go
or

## VSCode

The extension depends on go, gopls, dlv and other optional tools. If any of the dependencies are missing, the ⚠️ Analysis Tools Missing warning is displayed. Click on the warning to download dependencies.
