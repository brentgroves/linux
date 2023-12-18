# R in VSCode

## references

<https://code.visualstudio.com/docs/languages/r>
<https://www.dataquest.io/blog/install-package-r/>
<https://stackoverflow.com/questions/64096161/r-package-long-time-to-install-source-or-binary-type>

## Getting started

Install R (>= 3.4.0) for your platform. For Windows users, it is recommended to check Save version number in registry during installation so that the R extension can find the R executable automatically.

Install languageserver in R.

```bash
R
install.packages("languageserver")
```

Install the **[R extension](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r)** for Visual Studio Code.

Create an R file and start coding.

To enhance the experience of using R in VS Code, the following software and packages are recommended:

**[radian](https://github.com/randy3k/radian)**: A modern R console that corrects many limitations of the official R terminal and supports many features such as syntax highlighting and auto-completion.

**[VSCode-R-Debugger](https://github.com/ManuelHentschel/VSCode-R-Debugger)**: A VS Code extension to support R debugging capabilities.

**[httpgd](https://github.com/nx10/httpgd)**: An R package to provide a graphics device that asynchronously serves SVG graphics via HTTP and WebSockets. This package is required by the interactive plot viewer of the R extension for VS Code.

If you run into any issues installing the R packages or the R extension for VS Code, go to the installation wiki pages (Windows | macOS | Linux) for more details.
