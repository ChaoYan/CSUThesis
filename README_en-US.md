# Sample Template of CSUThesis

[![Build Status](https://travis-ci.org/csug/CSUThesis.svg?branch=master)](https://travis-ci.org/csug/CSUThesis)
[![CSUTeX](https://img.shields.io/badge/CSUTheis-v1.0.0rc7-green.svg)](https://github.com/csug/CSUTeX) 
[![Join the chat at https://gitter.im/csug/CSUThesis](https://badges.gitter.im/csug/CSUThesis.svg)](https://gitter.im/csug/CSUThesis?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Welcome to LaTeX thesis template for Shanghai Jiao Tong University

This sample template is a full implementation of CSUThesis document class which is an *unofficial* LaTeX class for preparing degree theses or course papers in Shanghai Jiao Tong University.

Please note that `csuthesis` only supports XeTeX engine, `csuthesis` only allows UTF-8 character encoding.

## Obtain Template

### Downloads

You can `clone` this repository directly or download from [Github](https://github.com/csug/CSUThesis).

```bash
git clone https://github.com/csug/CSUThesis.git 
```

### Overleaf

If you are an [Overleaf](https://www.overleaf.com?r=b3b31f49&rm=d&rs=b) user, you can create your own project through the link below.

[![Overleaf](https://img.shields.io/badge/overleaf-csuthesis-green.svg)](https://www.overleaf.com/latex/templates/csuthesis-latex-thesis-template-for-shanghai-jiao-tong-university/mkdwbyjbtfgg?r=b3b31f49&rm=d&rs=b) 

## Usage

### Linux & macOS Users

It is recommended to use GNU make utility with `Makefile` provided in template.

```bash
make all                      # compile and generate main.pdf
make clean                    # remove useless files
make cleanall                 # remove everything produced by make all
make wordcount                # count the words of the thesis
```

### Windows Users

We also provided a batch script `Compile.bat` for Windows users. You can double-click the batch file to complie instantly, or use it in a cmd console to access extra features.

```bash
.\Compile.bat thesis          # compile and generate main.pdf
.\Compile.bat clean           # remove useless files
.\Compile.bat cleanall        # remove everything produced by make all
.\Compile.bat wordcount       # count the words of the thesis
```

## Feedback

We are hearing from:

* [Issues page of Github](https://github.com/csug/CSUThesis/issues)
* [CSU BBS](https://bbs.csu.edu.cn/bbsdoc?board=TeX_LaTeX)

## License

The copyright of image sources including CSU logo (`csu-vi-logo-blue.pdf` etc.)
belongs to Shanghai Jiao Tong University.

`csuthesis.cls` document class with related files, and `biblatex-gb7714-2015` biblatex style files is under [LPPL](https://www.latex-project.org/lppl.txt).

The remain part is under [Apache License 2.0](LICENSE).
