# **[https://github.com/pyenv/pyenv](linux/k_p/python/python-virtual_environment.md)**

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

Simple Python Version Management: pyenv
Join the chat at <https://gitter.im/yyuu/pyenv>

pyenv lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.

This project was forked from rbenv and ruby-build, and modified for Python.

What pyenv does...
Lets you change the global Python version on a per-user basis.
Provides support for per-project Python versions.
Allows you to override the Python version with an environment variable.
Searches for commands from multiple versions of Python at a time. This may be helpful to test across Python versions with tox.
In contrast with pythonbrew and pythonz, pyenv does not...
Depend on Python itself. pyenv was made from pure shell scripts. There is no bootstrap problem of Python.
Need to be loaded into your shell. Instead, pyenv's shim approach works by adding a directory to your PATH.
Manage virtualenv. Of course, you can create virtualenv yourself, or pyenv-virtualenv to automate the process.

## Install

1. Automatic installer (Recommended)

`curl -fsSL https://pyenv.run | bash`
For more details visit our other project: <https://github.com/pyenv/pyenv-installer>

## B. Set up your shell environment for Pyenv

The below setup should work for the vast majority of users for common use cases. See Advanced configuration for details and more configuration options.
