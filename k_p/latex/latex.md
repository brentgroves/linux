# **[Latex](https://vincent.codes.finance/posts/vscode-latex/)**

## Standard Install

```bash
# This could take along time since there is over 7 GB of data to install
sudo apt update
sudo apt install texlive-full
```

## LaTek manual install

Some older systems yoay may need to instal texlive manually following the instructions in the link <https://www.tug.org/texlive/quickinstall.html>

```bash
cd /tmp wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

zcat < install-tl-unx.tar.gz | tar xf -

cd install-tl-*

perl ./install-tl --no-interaction # as root

set my path as PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH; export PATH MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH; export MANPATH INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH; export INFOPATH
```

## Learn LaTeX in 30 minutes

NEW: Visit the new **[Overleaf Learning Center](https://learn.overleaf.com/)** to explore free online courses and live webinars — everything you need to master LaTeX and get the most out of Overleaf.

This introductory tutorial does not assume any prior experience of LaTeX but, hopefully, by the time you are finished, you will not only have written your first LaTeX document but also acquired sufficient knowledge and confidence to take the next steps toward LaTeX proficiency.

- **[Top](#table-of-contents)**

## What is LaTeX?

LaTeX (pronounced “LAY-tek” or “LAH-tek”) is a tool for typesetting professional-looking documents. However, LaTeX’s mode of operation is quite different to many other document-production applications you may have used, such as Microsoft Word or LibreOffice Writer: those “WYSIWYG” tools provide users with an interactive page into which they type and edit their text and apply various forms of styling. LaTeX works very differently: instead, your document is a plain text file interspersed with LaTeX commands used to express the desired (typeset) results. To produce a visible, typeset document, your LaTeX file is processed by a piece of software called a TeX engine which uses the commands embedded in your text file to guide and control the typesetting process, converting the LaTeX commands and document text into a professionally typeset PDF file. This means you only need to focus on the content of your document and the computer, via LaTeX commands and the TeX engine, will take care of the visual appearance (formatting).

- **[Top](#table-of-contents)**

## Why learn LaTeX?

Various arguments can be proposed for, or against, learning to use LaTeX instead of other document-authoring applications; but, ultimately, it is a personal choice based on preferences, affinities, and documentation requirements.

Arguments in favour of LaTeX include:

- support for typesetting extremely complex mathematics, tables and technical content for the physical sciences;
- facilities for footnotes, cross-referencing and management of bibliographies;
ease of producing complicated, or tedious, document elements such as indexes, glossaries, table of contents, lists of figures;
- being highly customizable for bespoke document production due to its intrinsic programmability and extensibility through thousands of free add-on packages.

Overall, LaTeX provides users with a great deal of control over the production of documents which are typeset to extremely high standards. Of course, there are types of documents or publications where LaTeX doesn’t shine, including many “free form” page designs typically found in magazine-type publications.

One important benefit of LaTeX is the separation of document content from document style: once you have written the content of your document, its appearance can be changed with ease. Similarly, you can create a LaTeX file which defines the layout/style of a particular document type and that file can be used as a template to standardise authorship/production of additional documents of that type; for example, this allows scientific publishers to create article templates, in LaTeX, which authors use to write papers for submission to journals. Overleaf has a gallery containing thousands of templates, covering an enormous range of document types—everything from scientific articles, reports and books to CVs and presentations. Because these templates define the layout and style of the document, authors need only to open them in Overleaf—creating a new project—and commence writing to add their content.

- **[Top](#table-of-contents)**

## Writing your first piece of LaTeX

The first step is to create a new LaTeX project. You can do this on your own computer by creating a new .tex file; alternatively, you can start a new project in Overleaf.

Let’s start with the simplest working example, which can be opened directly in Overleaf:

```latex
\documentclass{article}
\begin{document}
First document. This is a simple example, with no
extra parameters or packages included.
\end{document}
```

- **[Top](#table-of-contents)**
