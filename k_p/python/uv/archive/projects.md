# **[Projects](https://docs.astral.sh/uv/guides/projects/)**

**[Ubuntu 22.04 Desktop](../../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../../README.md)**

## Working on projects

uv supports managing Python projects, which define their dependencies in a pyproject.toml file.

## Creating a new project

You can create a new Python project using the uv init command:

```bash
uv init hello-world
cd hello-world
```

Alternatively, you can initialize a project in the working directory:

```bash
mkdir hello-world
cd hello-world
uv init
```

uv will create the following files:

```bash
.
├── .python-version
├── README.md
├── main.py
└── pyproject.toml
```

The main.py file contains a simple "Hello world" program. Try it out with uv run:

```bash
uv run main.py
Using CPython 3.13.2
Creating virtual environment at: .venv
Hello from hello-world!
```
