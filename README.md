# CSUThesis 示例模板

[![CSUTeX](https://img.shields.io/badge/CSUTheis-v1.0.0-green.svg)](https://github.com/ChaoYan/CSUThesis)

## 欢迎使用中南大学论文模板

本示例模板是应用中南大学学位论文（非官方）LaTeX 文档类 CSUThesis 的一个完整实现，包括了本科生、硕士生和博士生论文模板，甚至还包括课堂报告模板(beta)。演示了排版中常用的例子，包括公式、表格、算法、参考文献等。
另外，模板中的校徽等图片素材是由作者本人修改的矢量图，边缘更圆润，清晰度更高、字体更标准。
用户可以参考或者直接基于此示例文档撰写论文。

[![eg.md.png](http://s63.555889.xyz/2020/12/10/e1ca9fde6b237623b2116cb7f79f7c17.md.png)](http://img62.com/image/v5dVCr)

请注意 CSUThesis 目前仅支持 XeTeX 引擎，字符编码仅支持 UTF-8。

## 获取模板

### 下载模版

普通用户可以直接 `clone` 或者[直接点此](https://gh.api.99988866.xyz/https://github.com/ChaoYan/CSUThesis/archive/master.zip)下载仓库代码。

```bash
git clone https://github.com/ChaoYan/CSUThesis.git
```

### Overleaf

[Overleaf](https://www.overleaf.com?r=b3b31f49&rm=d&rs=b) 用户可以从下面的模版链接创建自己的项目。

[![Overleaf](https://img.shields.io/badge/overleaf-csuthesis-green.svg)](https://www.overleaf.com/latex/templates/csuthesis/xrjzkvdjmmhy) 

## 使用模板

如果你不熟悉 LaTeX 的编译流程，请**不要**直接使用编译器进行编译。针对不同的平台，模版提供了相应的编译脚本。

### Visual Studio Code 用户

推荐使用LaTex Workshop插件提供的 `latexmk(latexmkrc)` 进行编译。如下图，点击按钮，直接编译生成 main.pdf：

[![60f0133f70a54c83de6b99f1e6d8e9c4.md.jpg](http://s62.555889.xyz/2020/12/10/60f0133f70a54c83de6b99f1e6d8e9c4.md.jpg)](http://img62.com/image/v5d4ZW)


### Linux 与 macOS 用户

推荐使用模版提供的 `Makefile` 进行编译，具体来说我们提供了如下几条可用的命令：

```bash
make all                      # 编译生成 main.pdf
make clean                    # 删除编译所产生的中间文件
make cleanall                 # 删除 main.pdf 和所有中间文件
make wordcount                # 论文字数统计
```

### Windows 用户

对于 Windows 用户，我们也提供了编译脚本 `Compile.bat`。可以双击直接编译，也可以在命令提示符窗口中使用脚本提供的额外功能：

```bash
.\Compile.bat thesis          # 编译生成 main.pdf
.\Compile.bat clean           # 删除编译所产生的中间文件
.\Compile.bat cleanall        # 删除 main.pdf 和所有中间文件
.\Compile.bat wordcount       # 论文字数统计
```

## 反馈与贡献

本模版是由诸多感兴趣的同学一起维护的开源项目，我们非常欢迎问题反馈和新的贡献者！

### 反馈问题

如果在使用上有任何问题，建议先查阅项目的 [Wiki 文档](https://github.com/ChaoYan/CSUThesis/wiki)。
如果这些不能解决你的问题，建议通过以下方式进行反馈（按推荐顺序排序）：

* [在 GitHub 项目主页开 issue](https://github.com/ChaoYan/CSUThesis/issues) (推荐)

### 成为贡献者

这个仓库是面向用户的**示例模版**，如果你有很好的排版示例，可以提交到此仓库与大家分享。在贡献之前，你可以熟悉贡献代码的流程。除了提交 Pull Request 之外，还有以下方式可以进行贡献：

* 帮助我们解答同学们的[问题](https://github.com/ChaoYan/CSUThesis/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3Atype%2Fquestion+)，这些问题你也可能遇到过并且知道如何解决；
* 与我们一起维护项目的 [Wiki 文档](https://github.com/ChaoYan/CSUThesis/wiki)，Wiki 任何人都可以直接编辑；
* 向周围同学安利 CSUThesis，让更多的同学使用我们维护的模板；

## 致谢

* 感谢 [SJTUThesis](https://github.com/sjtug/SJTUThesis) 提供了原始模板；

## 软件许可证

中南大学校徽校名图片（`csu-vi-logo-blue.pdf` 等）的版权归中南大学所有。

`csuthesis.cls` 文档类与相关附属文件，以及 `biblatex-gb7714-2015` 样式文件使用 [LPPL](https://www.latex-project.org/lppl.txt) 授权。

其他部分使用 [Apache License 2.0](LICENSE) 授权。
