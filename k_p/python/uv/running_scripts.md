# **[Install Python](https://docs.astral.sh/uv/guides/scripts/)**

**[Ubuntu 22.04 Desktop](../../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../../README.md)**

Running scripts
A Python script is a file intended for standalone execution, e.g., with python <script>.py. Using uv to execute scripts ensures that script dependencies are managed without manually managing environments.

If you are not familiar with Python environments: every Python installation has an environment that packages can be installed in. Typically, creating virtual environments is recommended to isolate packages required by each script. uv automatically manages virtual environments for you and prefers a declarative approach to dependencies.

Running a script without dependencies
If your script has no dependencies, you can execute it with uv run:

example.py

print("Hello world")

uv run example.py

Similarly, if your script depends on a module in the standard library, there's nothing more to do:

example.py

import os

print(os.path.expanduser("~"))

uv run example.py

Arguments may be provided to the script:

example.py

import sys

print(" ".join(sys.argv[1:]))

uv run example.py test

uv run example.py hello world!

Additionally, your script can be read directly from stdin:

echo 'print("hello world!")' | uv run -
Or, if your shell supports here-documents:

uv run - <<EOF
print("hello world!")
EOF

Note that if you use uv run in a project, i.e., a directory with a pyproject.toml, it will install the current project before running the script. If your script does not depend on the project, use the --no-project flag to skip this:

# Note: the `--no-project` flag must be provided _before_ the script name

uv run --no-project example.py
See the projects guide for more details on working in projects.

Running a script with dependencies
When your script requires other packages, they must be installed into the environment that the script runs in. uv prefers to create these environments on-demand instead of using a long-lived virtual environment with manually managed dependencies. This requires explicit declaration of dependencies that are required for the script. Generally, it's recommended to use a project or inline metadata to declare dependencies, but uv supports requesting dependencies per invocation as well.

For example, the following script requires rich.

example.py

import time
from rich.progress import track

for i in track(range(20), description="For example:"):
    time.sleep(0.05)
If executed without specifying a dependency, this script will fail:

uv run --no-project example.py

Request the dependency using the --with option:

uv run --with rich example.py

Constraints can be added to the requested dependency if specific versions are needed:

uv run --with 'rich>12,<13' example.py
Multiple dependencies can be requested by repeating with --with option.

Note that if uv run is used in a project, these dependencies will be included in addition to the project's dependencies. To opt-out of this behavior, use the --no-project flag.
