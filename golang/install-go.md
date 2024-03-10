# **[Download the version](https://go.dev/dl/)** you want

Did not install apt go at home and only installed 1 version and updated path in exports.sh to /usr/local/go/bin

## Remove previous version and install new version

Remove any previous Go installation by deleting the /usr/local/go folder (if it exists), then extract the archive you just downloaded into /usr/local, creating a fresh Go tree in /usr/local/go:

```bash
cd ~/Downloads
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
```

(You may need to run the command as root or through sudo).

Do not untar the archive into an existing /usr/local/go tree. This is known to produce broken Go installations.

## managing multiple versions

You can install multiple Go versions on the same machine. For example, you might want to test your code on multiple Go versions. For a list of versions you can install this way, see the **[download page](https://go.dev/dl/)**.

Note: To install using the method described here, you'll need to have git installed.

To install additional Go versions, run the **[go install](https://pkg.go.dev/cmd/go#hdr-Compile_and_install_packages_and_dependencies)** command, specifying the download location of the version you want to install.

```bash
# step 1 downloads the go installation program to ~/go/bin
go install golang.org/dl/go1.21.0@latest
# step 2 install the go version to the ~/sdk/go1.21.0 directory
~/go/bin/go1.21.0 download
# go version still says the previous version because the exports.sh path still points to /usr/local/bin which is the old version of go.
# to make the new version the default version you can point path variable in exports.sh to the ~/sdk/go1.21.0 directory or remove the old version from /usr/local/bin and copy the new version there and set the path to /usr/local/bin.
export PATH=$HOME/bin:/usr/local/go/bin:$PATH


# To temporarily run go commands with the newly-downloaded version, append the version number to the go command, as follows:

$ ~/go/go1.21.0 version
go version go1.10.7 linux/amd64
```

<https://github.com/dominikh/go-tools#installation>

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

## install vscode go extension

<https://marketplace.visualstudio.com/items?itemName=golang.go>
Installation
Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.
ext install golang.Go

~/go
or

## VSCode

The extension depends on go, gopls, dlv and other optional tools. If any of the dependencies are missing, the ⚠️ Analysis Tools Missing warning is displayed. Click on the warning to download dependencies.
