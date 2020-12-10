%%
%% This is file `csuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% csuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2017 by weijianwen <weijianwen@gmail.com>
%%           (C) 2018-2020 by SJTUG
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%     https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This file has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer of this work is Alexara Wu.
%% 
%  changes:
%  - add fancystyle(front)
%  - delete zihao auto
%  - update head log default color
%  - update chapter/section format
%  - update caption format

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}
  [2020/12/01 1.0.0rc7 Central South University Thesis Template]
\hyphenation{CSU-Thesis}
\def\csuthesis{CSU\textsc{Thesis}}
\def\version{1.0.0rc7}
\newcommand\csu@error[1]{%
  \ClassError{csuthesis}{#1}{}%
}
\newcommand\csu@warning[1]{%
  \ClassWarning{csuthesis}{#1}{}%
}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=csu,
  prefix=csu@,
  setkeys=\kvsetkeys}
\newcommand\csusetup[1]{%
  \kvsetkeys{csu}{#1}%
}
\newcommand\csu@define@key[2]{%
  \kvsetkeys{#1@key}{#2}%
}
\newcommand\csu@set@family@handler[1]{%
  \kv@set@family@handler{#1@key}{%
    \def\csu@@initial{}%
    \def\csu@@choices{}%
    \@namedef{#1@##1@@default}{}%
    \@namedef{#1@##1@@check}{}%
    \@namedef{#1@##1@@code}{}%
    \@namedef{#1@##1@@name}{##1}%
    \kv@define@key{#1@value}{name}{%
      \@namedef{#1@##1@@name}{####1}%
    }%
    \kv@define@key{#1@value}{choices}{%
      \def\csu@@choices{####1}%
      \@namedef{#1@##1@@reset}{}%
      \@namedef{#1@##1@@check}{%
        \@ifundefined{%
          if#1@\@nameuse{#1@##1@@name}@\@nameuse{#1@\@nameuse{#1@##1@@name}}%
        }{%
          \csu@error{Invalid value `##1 = \@nameuse{#1@\@nameuse{#1@##1@@name}}'}%
        }%
        \@nameuse{#1@##1@@reset}%
        \@nameuse{#1@\@nameuse{#1@##1@@name}@\@nameuse{#1@\@nameuse{#1@##1@@name}}true}%
      }%
    }%
    \kv@define@key{#1@value}{initial}{%
      \def\csu@@initial{####1}%
      \expandafter\ifx\csname #1@##1@@default\endcsname\@empty
        \@namedef{#1@##1@@default}{####1}%
      \fi
    }%
    \kv@define@key{#1@value}{default}{%
      \@namedef{#1@##1@@default}{####1}%
    }%
    \kvsetkeys{#1@value}{##2}%
    \@namedef{#1@\@nameuse{#1@##1@@name}}{}%
    \kv@set@family@handler{#1@choice}{%
      \ifx\csu@@initial\@empty
        \def\csu@@initial{####1}%
      \fi
      \expandafter\ifx\csname #1@##1@@default\endcsname\@empty
        \@namedef{#1@##1@@default}{####1}%
      \fi
      \expandafter\newif\csname if#1@\@nameuse{#1@##1@@name}@####1\endcsname
      \expandafter\g@addto@macro\csname #1@##1@@reset\endcsname{%
        \@nameuse{#1@\@nameuse{#1@##1@@name}@####1false}%
      }%
    }%
    \kvsetkeys@expandafter{#1@choice}{\csu@@choices}%
    \expandafter\let\csname #1@\@nameuse{#1@##1@@name}\endcsname\csu@@initial
    \expandafter\ifx\csname #1@\@nameuse{#1@##1@@name}\endcsname\@empty\else
      \@nameuse{#1@##1@@check}%
    \fi
    \kv@define@key{#1}{##1}[\@nameuse{#1@##1@@default}]{%
      \@namedef{#1@\@nameuse{#1@##1@@name}}{####1}%
      \@nameuse{#1@##1@@check}%
      \@nameuse{#1@##1@@code}%
    }%
  }
}
\newcommand\csu@option@hook[3]{%
  \expandafter\g@addto@macro\csname #1@#2@@code\endcsname{#3}%
}
\csu@set@family@handler{csu}
\csu@define@key{csu}{
  type = {
    choices = {
      doctor,
      master,
      bachelor,
      course,
    },
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  zihao = {
    choices = {
      -4,
      5,
      false,
    },
    initial = -4,
  },
  latinfontset = {
    choices = {
      xits,
      times,
      stix,
      step,
      termes,
      pagella,
      cambria,
      libertinus,
      lm,
      none,
    },
  },
}
\DeclareBoolOption[false]{review}
\DeclareBoolOption[false]{continuous}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newif\ifcsu@type@graduate
\csu@type@graduatefalse
\ifcsu@type@doctor
  \csu@type@graduatetrue
\fi
\ifcsu@type@master
  \csu@type@graduatetrue
\fi
\PassOptionsToClass{zihao=\csu@zihao}{ctexbook}
\PassOptionsToPackage{no-math,quiet}{fontspec}
\LoadClass[a4paper,UTF8,scheme=plain,linespread=\ifcsu@type@graduate 1.3\else 1.5\fi]{ctexbook}[2018/04/01]
\AtEndOfClass{
  \ifcsu@type@graduate
    \input{csuthesis-graduate.ltx}
  \else
    \input{csuthesis-undergraduate.ltx}
  \fi
}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{filehook}
\RequirePackage{environ}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage{xeCJKfntef}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage{chngcntr}
\RequirePackage[titles]{tocloft}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom, hang]{footmisc}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{url}
\RequirePackage{silence}
\WarningFilter{pageslts}{Package pdfpages detected}
\newcommand\csu@package@conflict[2]{
  \AtBeginOfPackageFile*{#2}{
    \csu@error{The `#2' package is incompatible with required `#1'}
  }
}
\csu@package@conflict{unicode-math}{amscd}
\csu@package@conflict{unicode-math}{amsfonts}
\csu@package@conflict{unicode-math}{amssymb}
\csu@package@conflict{unicode-math}{bbm}
\csu@package@conflict{unicode-math}{bm}
\csu@package@conflict{unicode-math}{eucal}
\csu@package@conflict{unicode-math}{eufrak}
\csu@package@conflict{unicode-math}{mathrsfs}
\newcommand\csu@patchcmd[3]{%
  \patchcmd{#1}{#2}{#3}{}%
    {\csu@warning{Oops! Command `\protect#1' is NOT patchable.}}
}
\kv@define@key{csu}{style}{
  \kvsetkeys{csu@style}{#1}
}
\csu@set@family@handler{csu@style}
\csu@define@key{csu@style}{
  frontmatter-numbering = {
    name = frontmatter@numbering,
    choices = {
      true,
      false,
    },
  },
  indent-headings = {
    name = indent@headings,
    choices = {
      fixed,
      auto,
      false,
    },
    initial = false,
    default = fixed,
  },
  header = {
    choices = {
      single,
      double,
    },
  },
  title-logo-color = {
    name = title@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    initial = blue,
  },
  header-logo-color = {
    name = header@logo@color,
    choices = {
      red,
      blue,
      black,
    },
    initial = blue,
  },
  float-number-separator = {
    name = fl@num@sep,
    initial = {--},
  },
  equation-number-separator = {
    name = eq@num@sep,
    initial = {--},
  },
}
\kv@define@key{csu}{info}{
  \kvsetkeys{csu@info}{#1}
}
\csu@set@family@handler{csu@info}
\csu@define@key{csu@info}{
  title           = { name = title@zh },
  title*          = { name = title@en },
  keywords        = { name = keywords@zh },
  keywords*       = { name = keywords@en },
  author          = { name = author@zh },
  author*         = { name = author@en },
  id,
  supervisor      = { name = supervisor@zh },
  supervisor*     = { name = supervisor@en },
  assisupervisor  = { name = assisupervisor@zh },
  assisupervisor* = { name = assisupervisor@en },
  degree          = { name = degree@zh },
  degree*         = { name = degree@en },
  department      = { name = department@zh },
  department*     = { name = department@en },
  major           = { name = major@zh },
  major*          = { name = major@en },
  course          = { name = course@zh },
  course*         = { name = course@en },
  fund            = { name = fund@zh },
  fund*           = { name = fund@en },
  date            = {%
    initial = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}
\newcommand\csu@nopar[1]{%
  \begingroup\let\\\@empty#1\endgroup%
}
\newcommand\csu@clist@use[2]{%
  \def\csu@@tmp{}%
  \def\csu@clist@processor##1{%
    \ifx\csu@@tmp\@empty
      \def\csu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \expandafter\comma@parse\expandafter{#1}{\csu@clist@processor}%
}
\ifcsu@language@chinese
  \def\csu@info@title{\csu@info@title@zh}
  \def\csu@info@keywords{\csu@info@keywords@zh}
  \def\csu@info@author{\csu@info@author@zh}
\else
  \def\csu@info@title{\csu@info@title@en}
  \def\csu@info@keywords{\csu@info@keywords@en}
  \def\csu@info@author{\csu@info@author@en}
\fi
\newcommand\csu@date[2]{%
  \ifcsu@review\relax\else
    \edef\csu@@date{#2}%
    \def\csu@@process@date##1-##2-##3\@nil{%
      #1{##1}{##2}{##3}%
    }%
    \expandafter\csu@@process@date\csu@@date\@nil
  \fi
}
\newcommand\csu@date@format@zh[3]{#1 年 \number#2 月 \number#3 日}
\newcommand\csu@date@month@en[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\csu@date@format@en[3]{\csu@date@month@en{#2} \number#3, #1}
\kv@define@key{csu}{name}{
  \kvsetkeys{csu@name}{#1}
}
\csu@set@family@handler{csu@name}
\csu@define@key{csu@name}{
  appendix          = { initial = Appendix },
  contents          = { initial = Contents },
  listfigure        = { initial = List of Figures },
  listtable         = { initial = List of Tables },
  listalgorithm     = { initial = List of Algorithms },
  figure            = { initial = Figure },
  figure*           = { name = figure@second, initial = 图 },
  table             = { initial = Table },
  table*            = { name = table@second, initial = 表 },
  algorithm         = { initial = Algorithm },
  nomenclature      = { initial = Nomenclature },
  summary           = { initial = Summary },
  bib               = { initial = Bibliography },
  index             = { initial = Index },
  acknowledgements  = { initial = Acknowledgements },
  publications      = { initial = Publications },
  achievements      = { initial = Research Achievements },
  resume            = { initial = Resume },
}
\newcommand\csu@name@def[2]{%
  \@namedef{csu@name@#1}{#2}
}
\csu@name@def{school@zh}{中南大学}
\csu@name@def{school@en}{Central South University}
\ifcsu@type@graduate
  \ifcsu@type@doctor
    \csu@name@def{degree@type@zh}{博士}
    \csu@name@def{degree@type@en}{Doctor}
  \else
    \csu@name@def{degree@type@zh}{硕士}
    \csu@name@def{degree@type@en}{Master}
  \fi
  \csu@name@def{author@zh}{\csu@name@degree@type@zh 研究生}
  \csu@name@def{author@en}{Candidate}
  \csu@name@def{id@zh}{学号}
  \csu@name@def{id@en}{Student ID}
  \csu@name@def{supervisor@zh}{导师}
  \csu@name@def{supervisor@en}{Supervisor}
  \csu@name@def{assisupervisor@zh}{副导师}
  \csu@name@def{assisupervisor@en}{Assistant Supervisor}
  \csu@name@def{degree@zh}{申请学位}
  \csu@name@def{degree@en}{Academic Degree Applied for}
  \csu@name@def{major@zh}{学科}
  \csu@name@def{major@en}{Speciality}
  \csu@name@def{department@zh}{所在单位}
  \csu@name@def{department@en}{Affiliation}
  \csu@name@def{defenddate@zh}{答辩日期}
  \csu@name@def{defenddate@en}{Date of Defence}
  \csu@name@def{conferring@zh}{授予学位单位}
  \csu@name@def{conferring@en}{Degree-Conferring-Institution}
  \csu@name@def{thesis@type}{学位论文}
  \csu@name@def{thesis@kind}{\csu@name@thesis@type}
  \csu@name@def{subject@zh}{%
    \csu@name@school@zh\csu@name@degree@type@zh\csu@name@thesis@type
  }
  \csu@name@def{subject@en}{%
    Dissertation Submitted to \csu@name@school@en \\
    for the Degree of \csu@name@degree@type@en
  }
\else
  \ifcsu@type@course
    \csu@name@def{degree@type@zh}{}
    \csu@name@def{degree@type@en}{}
    \csu@name@def{thesis@type}{课程报告}
    \csu@name@def{thesis@kind}{\csu@name@thesis@type}
    \csu@name@def{subject@zh}{\csu@name@thesis@type}
    \csu@name@def{subject@en}{Course Report}
  \else
    \csu@name@def{degree@type@zh}{本科}
    \csu@name@def{degree@type@en}{Bachelor}
    \csu@name@def{thesis@type}{学位论文}
    \csu@name@def{thesis@kind}{毕业设计(论文)}
    \csu@name@def{subject@zh}{\csu@name@degree@type@zh\csu@name@thesis@kind}
    \csu@name@def{subject@en}{GRADUATION DESIGN(THESIS)}
  \fi
  \csu@name@def{author@zh}{学生姓名}
  \csu@name@def{id@zh}{学生学号}
  \csu@name@def{supervisor@zh}{指导教师}
  \csu@name@def{course@zh}{课程名称}
  \csu@name@def{major@zh}{专业班级}
  \csu@name@def{department@zh}{学院}
  \csu@name@def{digest}{英文大摘要}
\fi
\csu@name@def{orig@subtitle@zh}{原创性声明}
\csu@name@def{orig@subtitle@en}{Declaration of Originality}
\csu@name@def{copr@subtitle@zh}{版权使用授权书}
\csu@name@def{copr@subtitle@en}{Copyright Authorization}
\csu@name@def{orig@title}{\csu@name@thesis@kind\csu@name@orig@subtitle@zh}
\csu@name@def{copr@title}{\csu@name@thesis@kind\csu@name@copr@subtitle@zh}
\csu@name@def{title@qouted}{《\csu@nopar\csu@info@title@zh》}
\csu@name@def{origbody}{%
  本人郑重声明：所呈交的\csu@name@thesis@kind\csu@name@title@qouted ，
  是本人在导师的指导下，独立进行研究工作所取得的成果。除文中已经注明引用
  的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的作品成果。对
  本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全
  意识到本声明的法律结果由本人承担。}
\csu@name@def{coprbody}{%
  本\csu@name@thesis@kind 作者
  完全了解学校有关保留、使用\csu@name@thesis@kind 的规定，同意学校保留
  并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。
  本人授权\csu@name@school@zh 可以将本\csu@name@thesis@kind 的全部或部
  分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和
  汇编本\csu@name@thesis@kind 。}
\csu@name@def{abstract@zh}{摘\hspace{\ccwd}要}
\csu@name@def{abstract@en}{Abstract}
\csu@name@def{keywords@zh}{关键词：}
\csu@name@def{keywords@en}{Key words:~}
\ifcsu@language@chinese
  \csusetup{
    name = {
      appendix          = {附录},
      contents          = {目\hspace{\ccwd}录},
      listfigure        = {插图索引},
      listtable         = {表格索引},
      listalgorithm     = {算法索引},
      figure            = {图},
      figure*           = {Figure},
      table             = {表},
      table*            = {Table},
      algorithm         = {算法},
      nomenclature      = {主要符号对照表},
      summary           = {全文总结},
      bib               = {参考文献},
      index             = {索\hspace{\ccwd}引},
      acknowledgements  = {致\hspace{\ccwd}谢},
      publications      = {攻读学位期间发表（或录用）的学术论文},
      achievements      = {攻读学位期间获得的科研成果},
      resume            = {个人简历},
    }
  }
  \ctexset{
    chapter/name    = {第,章},
    chapter/number  = \chinese{chapter},
  }
  \csu@name@def{titlepage}{扉页}
  \csu@name@def{subject}{\csu@name@subject@zh}
  \csu@name@def{orig@subtitle}{\csu@name@orig@subtitle@zh}
  \csu@name@def{copr@subtitle}{\csu@name@copr@subtitle@zh}
  \csu@name@def{abstract}{\csu@name@abstract@zh}
\else
  \csu@name@def{titlepage}{Title Page}
  \csu@name@def{subject}{\csu@name@subject@en}
  \csu@name@def{orig@subtitle}{\csu@name@orig@subtitle@en}
  \csu@name@def{copr@subtitle}{\csu@name@copr@subtitle@en}
  \csu@name@def{abstract}{\csu@name@abstract@en}
\fi
\ctexset{%
  appendixname   = \csu@name@appendix,
  contentsname   = \csu@name@contents,
  listfigurename = \csu@name@listfigure,
  listtablename  = \csu@name@listtable,
  figurename     = \csu@name@figure,
  tablename      = \csu@name@table,
  bibname        = \csu@name@bib,
  indexname      = \csu@name@index,
}
\let\csu@font@family@xits\@empty
\newcommand\csu@font@set@xits@names{%
  \ifx\csu@font@family@xits\@empty
    \IfFontExistsTF{XITSMath-Regular.otf}{%
      \gdef\csu@font@family@xits{XITS}%
      \gdef\csu@font@style@xits@rm{Regular}%
      \gdef\csu@font@style@xits@bf{Bold}%
      \gdef\csu@font@style@xits@it{Italic}%
      \gdef\csu@font@style@xits@bfit{BoldItalic}%
      \gdef\csu@font@name@xits@math@rm{XITSMath-Regular}%
      \gdef\csu@font@name@xits@math@bf{XITSMath-Bold}%
    }{%
      \gdef\csu@font@family@xits{xits}%
      \gdef\csu@font@style@xits@rm{regular}%
      \gdef\csu@font@style@xits@bf{bold}%
      \gdef\csu@font@style@xits@it{italic}%
      \gdef\csu@font@style@xits@bfit{bolditalic}%
      \gdef\csu@font@name@xits@math@rm{xits-math}%
      \gdef\csu@font@name@xits@math@bf{xits-mathbold}%
    }%
  \fi
}
\let\csu@font@family@libertinus\@empty
\newcommand\csu@font@set@libertinus@names{%
  \ifx\csu@font@family@libertinus\@empty
    \IfFontExistsTF{LibertinusSerif-Regular.otf}{%
      \gdef\csu@font@family@libertinus@serif{LibertinusSerif}%
      \gdef\csu@font@family@libertinus@sans{LibertinusSans}%
      \gdef\csu@font@name@libertinus@math{LibertinusMath-Regular}%
      \gdef\csu@font@style@libertinus@rm{Regular}%
      \gdef\csu@font@style@libertinus@bf{Bold}%
      \gdef\csu@font@style@libertinus@it{Italic}%
      \gdef\csu@font@style@libertinus@bfit{BoldItalic}%
    }{%
      \gdef\csu@font@family@libertinus@serif{libertinusserif}%
      \gdef\csu@font@family@libertinus@sans{libertinussans}%
      \gdef\csu@font@name@libertinus@math{libertinusmath-regular}%
      \gdef\csu@font@style@libertinus@rm{regular}%
      \gdef\csu@font@style@libertinus@bf{bold}%
      \gdef\csu@font@style@libertinus@it{italic}%
      \gdef\csu@font@style@libertinus@bfit{bolditalic}%
    }%
  \fi
}
\newcommand\csu@set@font@xits{%
  \csu@font@set@xits@names
  \setmainfont{\csu@font@family@xits}[
    Extension      = .otf,
    UprightFont    = *-\csu@font@style@xits@rm,
    BoldFont       = *-\csu@font@style@xits@bf,
    ItalicFont     = *-\csu@font@style@xits@it,
    BoldItalicFont = *-\csu@font@style@xits@bfit,
  ]
}
\newcommand\csu@set@font@times{%
  \setmainfont{Times New Roman}[Ligatures = Rare]
  \setsansfont{Arial}
  \setmonofont{Courier New}[Scale = MatchLowercase]
}
\newcommand\csu@set@font@stix{%
  \setmainfont{STIX2Text}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]
}
\newcommand\csu@set@font@step{%
  \setmainfont{STEP}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]
}
\newcommand\csu@set@font@source@sans@mono{%
  \setsansfont{SourceSansPro}[
    Extension      = .otf,
    UprightFont    = *-Regular ,
    ItalicFont     = *-RegularIt ,
    BoldFont       = *-Bold ,
    BoldItalicFont = *-BoldIt,
  ]
  \setmonofont{SourceCodePro}[
    Extension      = .otf,
    UprightFont    = *-Regular ,
    ItalicFont     = *-RegularIt ,
    BoldFont       = *-Bold ,
    BoldItalicFont = *-BoldIt,
    Scale          = MatchLowercase,
  ]
}
\newcommand\csu@set@font@termes{%
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\csu@set@font@pagella{%
  \setmainfont{texgyrepagella}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\csu@set@font@texgyre@sans@mono{%
  \setsansfont{texgyreheros}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmonofont{texgyrecursor}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
}
\newcommand\csu@set@font@cambria{%
  \setmainfont{Cambria}
  \setsansfont{Calibri}
  \setmonofont{Consolas}[Scale = MatchLowercase]
}
\newcommand\csu@set@font@libertinus{%
  \csu@font@set@libertinus@names
  \setmainfont{\csu@font@family@libertinus@serif}[
    Extension      = .otf,
    UprightFont    = *-\csu@font@style@libertinus@rm,
    BoldFont       = *-\csu@font@style@libertinus@bf,
    ItalicFont     = *-\csu@font@style@libertinus@it,
    BoldItalicFont = *-\csu@font@style@libertinus@bfit,
  ]%
  \setsansfont{\csu@font@family@libertinus@sans}[
    Extension      = .otf,
    UprightFont    = *-\csu@font@style@libertinus@rm,
    BoldFont       = *-\csu@font@style@libertinus@bf,
    ItalicFont     = *-\csu@font@style@libertinus@it,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\csu@set@font@lm{%
  \setmainfont{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setsansfont{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\newcommand\csu@set@math@font@xits{%
  \csu@font@set@xits@names
  \setmathfont{\csu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \csu@font@name@xits@math@bf,
    StylisticSet = 8,
  ]%
  \setmathfont{\csu@font@name@xits@math@rm}[
    Extension    = .otf,
    BoldFont     = \csu@font@name@xits@math@bf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\csu@set@math@font@stix{%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 8,
  ]%
  \setmathfont{STIX2Math}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\csu@set@math@font@step{%
  \setmathfont{STEPMath-Regular}[
    Extension    = .otf,
    BoldFont     = STEPMath-Bold,
    StylisticSet = 8,
  ]%
  \setmathfont{STEPMath-Regular}[
    Extension    = .otf,
    BoldFont     = STEPMath-Bold,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\csu@set@math@font@termes{%
  \setmathfont{texgyretermes-math.otf}
}
\newcommand\csu@set@math@font@pagella{%
  \setmathfont{texgyrepagella-math.otf}
}
\newcommand\csu@set@math@font@cambria{%
  \setmathfont{Cambria Math}
}
\newcommand\csu@set@math@font@libertinus{%
  \csu@font@set@libertinus@names
  \setmathfont{\csu@font@name@libertinus@math .otf}%
}
\newcommand\csu@set@math@font@lm{%
  \setmathfont{latinmodern-math.otf}%
}
\newcommand\csu@load@fontset@xits{%
  \csu@set@font@xits
  \csu@set@font@source@sans@mono
  \csu@set@math@font@xits
}
\newcommand\csu@load@fontset@times{%
  \csu@set@font@times
  \csu@set@math@font@xits
}
\newcommand\csu@load@fontset@stix{%
  \csu@set@font@stix
  \csu@set@font@source@sans@mono
  \csu@set@math@font@stix
}
\newcommand\csu@load@fontset@step{%
  \csu@set@font@step
  \csu@set@font@source@sans@mono
  \csu@set@math@font@step
}
\newcommand\csu@load@fontset@termes{%
  \csu@set@font@termes
  \csu@set@font@texgyre@sans@mono
  \csu@set@math@font@termes
}
\newcommand\csu@load@fontset@pagella{%
  \csu@set@font@pagella
  \csu@set@font@texgyre@sans@mono
  \csu@set@math@font@pagella
}
\newcommand\csu@load@fontset@cambria{%
  \csu@set@font@cambria
  \csu@set@math@font@cambria
}
\newcommand\csu@load@fontset@libertinus{%
  \csu@set@font@libertinus
  \csu@set@math@font@libertinus
}
\newcommand\csu@load@fontset@lm{%
  \csu@set@font@lm
  \csu@set@math@font@lm
}
\newcommand\csu@load@fontset@none{\relax}
\newcommand\csu@load@fontset{%
  \@nameuse{csu@load@fontset@\csu@latinfontset}
}
\csu@load@fontset
\csu@option@hook{csu}{latinfontset}{%
  \csu@load@fontset
}
\def\csu@thepage{}
\def\csu@lastpageref{}
\newif\ifcsu@page@numbering \csu@page@numberingtrue
\AtEndOfClass{%
  \sloppy
  \raggedbottom
}
\csu@patchcmd\cleardoublepage%
  {\newpage}{\thispagestyle{empty}\newpage}
\csu@patchcmd\chapter%
  {\thispagestyle}{\@gobble}
\AtBeginDocument{%
  \pagenumbering{Alph}
  \pagestyle{empty}
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifcsu@style@frontmatter@numbering@false
    \csu@page@numberingfalse
  \fi
  \pagenumbering{Roman}
  \def\csu@thepage{\thepage}
  \def\csu@lastpageref{\lastpageref{pagesLTS.Roman}}
  \pagestyle{front}
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \csu@page@numberingtrue
  \csu@set@float@fontsizetrue
  \pagenumbering{arabic}
  \def\csu@lastpageref{\lastpageref{pagesLTS.arabic}}
  \pagestyle{plain}
}
\renewcommand\backmatter{%
  \cleardoublepage
  \@mainmatterfalse
}
\ctexset{%
  chapter = {%
    format       = \zihao{3}\mdseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {\ifcsu@type@graduate 3ex\else \baselineskip\fi},
    afterskip    = {\ifcsu@type@graduate 3ex\else \baselineskip\fi},
    fixskip      = true,
  },
  section = {%
    format       = \zihao{4}\mdseries\heiti,
    afterindent  = true,
    aftername    = \quad,
    beforeskip   = 0pt,
    afterskip    = 0pt,
  },
  subsection = {%
    format       = \zihao{-4}\mdseries\heiti,
    afterindent  = true,
    aftername    = \quad,
    beforeskip   = 0pt,
    afterskip    = 0pt,
  },
  subsubsection = {%
    format       = \zihao{-4}\normalfont,
    afterindent  = true,
    beforeskip   = 0pt,
    afterskip    = 0pt,
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}
\newlength{\csu@headings@indent@fixed}
\setlength{\csu@headings@indent@fixed}{2\ccwd}
\newcommand\csu@style@set@indent@headings{%
  \ifcsu@style@indent@headings@fixed
    \csu@style@indent@headings@autotrue
    \gdef\csu@headings@indent{\csu@headings@indent@fixed}
  \else
    \gdef\csu@headings@indent{2\ccwd}
  \fi
  \ifcsu@style@indent@headings@auto
    \ifcsu@type@graduate\relax\else
      \ctexset{%
        subsubsection/name   = {(,)},
        subsubsection/number = \arabic{subsubsection},
      }
    \fi
  \else
    \gdef\csu@headings@indent{\z@}
    \ctexset{%
      subsubsection/name   = {},
      subsubsection/number = \thesubsubsection,
    }
  \fi
  \ctexset{%
    section/indent       = \csu@headings@indent,
    subsection/indent    = \csu@headings@indent,
    subsubsection/indent = \csu@headings@indent,
  }
}
\csu@style@set@indent@headings
\csu@option@hook{csu@style}{indent-headings}{%
  \csu@style@set@indent@headings
}
\newcommand\csu@indent@box{%
  \hspace*{\ifcsu@style@indent@headings@auto 2\ccwd\else\z@\fi}%
}
\ctexset{%
  punct          = quanjiao,
  space          = auto,
  autoindent     = true,
}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\def\csu@textcircled#1{%
  \ifnum\value{#1} >10%
    \csu@error{%
      Too many footnotes in this page.
      Keep footnote no more than 10%
    }%
  \fi
  {\CJKfamily+{}\symbol{\the\numexpr\value{#1}+"245F\relax}}%
}
\renewcommand{\thefootnote}{\csu@textcircled{footnote}}
\renewcommand{\thempfootnote}{\csu@textcircled{mpfootnote}}
\footnotemargin1.5em\relax
\let\csu@makefnmark\@makefnmark
\def\csu@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\csu@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\csu@makefnmark}{}{}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M
  \do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m
  \do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
}
\Urlmuskip=0mu plus 0.1mu
\newcommand\csu@pdfbookmark[2]{}
\newcommand\csu@phantomsection{}
\NewDocumentCommand{\csu@chapter}{s O{#3} m O{#2}}{
  \if@openright\cleardoublepage\else\clearpage\fi%
  \IfBooleanTF{#1}{%
    \ifthenelse{\equal{#4}{}}{\relax}{%
      \csu@pdfbookmark{0}{#4}%
    }
  }{%
    \csu@phantomsection
    \addcontentsline{toc}{chapter}{#4}%
  }%%
  \chapter*{#3}%
  \@mkboth{\MakeUppercase{#2}}{\MakeUppercase{#2}}%
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \csu@chapter*{\contentsname}%
  \@starttoc{toc}%
}
\def\csu@listof#1{% #1: float type
  \setcounter{tocdepth}{2} % restore tocdepth in case being modified
  \@ifstar
    {\csu@chapter*{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
    {\csu@chapter{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
}
\renewcommand\listoffigures{\csu@listof{figure}}
\renewcommand\listoftables{\csu@listof{table}}
\ifcsu@language@chinese
  \renewcommand\cftdot{\textperiodcentered}
\fi
\renewcommand\cftdotsep{1}
\renewcommand\cftfigpresnum{\csu@name@figure~}
\renewcommand\cfttabpresnum{\csu@name@table~}
\AtEndPreamble{%
  \newlength{\csu@cftfignumwidth@tmp}
    \settowidth{\csu@cftfignumwidth@tmp}{\cftfigpresnum}
  \addtolength{\cftfignumwidth}{\csu@cftfignumwidth@tmp}
  \newlength{\csu@cfttabnumwidth@tmp}
    \settowidth{\csu@cfttabnumwidth@tmp}{\cfttabpresnum}
  \addtolength{\cfttabnumwidth}{\csu@cfttabnumwidth@tmp}
}
\renewcommand\textfraction{0.15}
\renewcommand\topfraction{0.85}
\renewcommand\bottomfraction{0.65}
\renewcommand\floatpagefraction{0.60}
\newcommand\csu@def@thefloats{
  \def\thefigure{\thechapter\csu@style@fl@num@sep\arabic{figure}}
  \def\p@subfigure{\thefigure}
  \def\thetable{\thechapter\csu@style@fl@num@sep\arabic{table}}
}
\newcommand\csu@counter@without@chapter{
  \counterwithout{figure}{chapter}
  \setcounter{figure}{0}
  \counterwithout{table}{chapter}
  \setcounter{table}{0}
}
\newcommand\csu@counter@within@chapter{
  \counterwithin*{figure}{chapter}
  \counterwithin*{table}{chapter}
  \csu@def@thefloats
}
\ifcsu@continuous
  \apptocmd{\mainmatter}{%
    \csu@counter@without@chapter
  }{}{}
  \apptocmd{\appendix}{%
    \csu@counter@within@chapter
  }{}{}
\else
  \AtBeginDocument{%
    \csu@def@thefloats
  }
\fi
\AtBeginDocument{%
  \def\theequation{\thechapter\csu@style@eq@num@sep\arabic{equation}}
}
\newif\ifcsu@set@float@fontsize \csu@set@float@fontsizefalse
\csu@patchcmd\@floatboxreset%
  {\normalsize}
  {\ifcsu@set@float@fontsize\zihao{5}\else\normalsize\fi}
\NewDocumentCommand{\CSUsetfloatfontsize}{}{\csu@set@float@fontsizetrue}
\NewDocumentCommand{\CSUunsetfloatfontsize}{}{\csu@set@float@fontsizefalse}
\DeclareCaptionFont{csu@caption@font}{\zihao{5}\kaishu}
\DeclareCaptionFont{csu@subcaption@font}{\zihao{5}\normalfont}
\DeclareCaptionLabelSeparator{enskip}{\enskip}
\captionsetup{%
  format        = plain,
  labelformat   = simple,
  labelsep      = enskip,
  justification = centering,
  font          = csu@caption@font
}
\captionsetup[sub]{%
  format        = hang,
  labelformat   = brace,
  justification = justified,
  font          = csu@subcaption@font
}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{\csu@name@table@second}
  \def\figurename{\csu@name@figure@second}
}
\captionsetup[bi-second]{bi-second}
\let\mathellipsis\cdots
\AtBeginDocument{%
  \renewcommand\Re{\operatorname{Re}}%
  \renewcommand\Im{\operatorname{Im}}%
}
\newcommand\upe{\mathrm{e}}
\newcommand\upi{\mathrm{i}}
\newcommand\upj{\mathrm{j}}
\newcommand\dif{\mathop{}\!\mathrm{d}}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\newcommand\csu@square{{\CJKfamily+{}\symbol{"25A1}}}
\newcommand\csu@copr@addon{%
  \vskip 2ex
  \begingroup
    \linespread{1}\selectfont
    本\csu@name@thesis@type 属于\parbox[c]{20\ccwd}{%
      {\heiti 保\hspace{1\ccwd}密}~\csu@square ，
      在\uline{\hspace{2\ccwd}}年解密后适用本授权书。\bigbreak
      {\heiti 不保密}~\csu@square 。
    }\par
  \endgroup
  \vskip 2ex
  （请在以上方框内打“$\checkmark$”）
}
\newcommand\csu@signbox[1]{%
  \parbox{.45\textwidth}{%
    #1 签名：\vskip 4em
    日期：\hspace{\stretch{3}}年\hspace{\stretch{2}}月\hspace{\stretch{2}}日
  }
}
\NewDocumentCommand{\originalitypage}{s O{}}{%
  \ifcsu@review\relax\else
    \cleardoublepage
    \ifblank{#2}{%
      \thispagestyle{empty}
      \csu@chapter*[\csu@name@orig@subtitle]{%
        \zihao{-2}\csu@name@school@zh\\\csu@name@orig@title
      }
      \IfBooleanT{#1}{%
        \let\csu@name@title@qouted\@empty
      }
      \begingroup
        \zihao{4}
        \begingroup
          \linespread{1.5}\selectfont
          \csu@name@origbody\par
        \endgroup
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \csu@signbox{\csu@name@thesis@type 作者}
        \end{minipage}
        \par
      \endgroup
    }{%
      \includepdf[pagecommand={%
        \csu@pdfbookmark{0}{\csu@name@orig@subtitle}%
      }]{#2}
    }
  \fi
}
\NewDocumentCommand{\copyrightpage}{O{}}{%
  \ifcsu@review\relax\else
    \cleardoublepage
    \ifblank{#1}{%
      \thispagestyle{empty}
      \csu@chapter*[\csu@name@copr@subtitle]{%
        \zihao{-2}\csu@name@school@zh\\\csu@name@copr@title
      }
      \begingroup
        \zihao{4}
        \begingroup
          \linespread{1.5}\selectfont
          \csu@name@coprbody\par
          \csu@copr@addon\par
        \endgroup
        \vskip 16ex
        \noindent
        \begin{minipage}{\textwidth}
          \csu@signbox{\csu@name@thesis@type 作者}
          \hfill
          \csu@signbox{指导教师}
        \end{minipage}
        \par
      \endgroup
    }{%
      \includepdf[pagecommand={%
        \csu@pdfbookmark{0}{\csu@name@copr@subtitle}%
      }]{#1}
    }
  \fi
}
\newcommand\csu@save@env@body[1]{\long\gdef\csu@saved@env@body{#1}}
\NewDocumentEnvironment{nomenclature}{}{%
  \csu@chapter{\csu@name@nomenclature}
}{}
\NewDocumentEnvironment{nomenclature*}{}{%
  \csu@chapter*{\csu@name@nomenclature}
}{}
\NewDocumentEnvironment{summary}{}{%
  \csu@chapter{\csu@name@summary}
}{}
\NewDocumentEnvironment{acknowledgements}{}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@review\relax\else
    \csu@chapter{\csu@name@acknowledgements}
    \csu@saved@env@body
  \fi
}
\newenvironment{csu@bibliolist}[2]{%
  \csu@chapter{#2}
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
}{%
  \def\@noitemerr
    {\@latex@warning{Empty `bibliolist' environment}}%
  \endlist
}
\NewDocumentEnvironment{publications}{O{99}}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@review\relax\else
    \begin{csu@bibliolist}{#1}{\csu@name@publications}
      \csu@saved@env@body
    \end{csu@bibliolist}
  \fi
}
\NewDocumentEnvironment{publications*}{O{99}}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@review
    \begin{csu@bibliolist}{#1}{\csu@name@publications}
      \csu@saved@env@body
    \end{csu@bibliolist}
  \fi
}
\NewDocumentEnvironment{achievements}{O{99}}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@review\relax\else
    \begin{csu@bibliolist}{#1}{\csu@name@achievements}
      \csu@saved@env@body
    \end{csu@bibliolist}
  \fi
}
\NewDocumentEnvironment{achievements*}{O{99}}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@review
    \begin{csu@bibliolist}{#1}{\csu@name@achievements}
      \csu@saved@env@body
    \end{csu@bibliolist}
  \fi
}
\NewDocumentEnvironment{resume}{}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@review\relax\else
    \csu@chapter{\csu@name@resume}
    \csu@saved@env@body
  \fi
}
\NewDocumentEnvironment{digest}{}{%
  \Collect@Body\csu@save@env@body
}{%
  \ifcsu@type@bachelor
    \ifcsu@language@chinese
      \AtEndDocument{%
        \cleardoublepage
        \pagenumbering{roman}
        \def\csu@thepage{\theCurrentPageLocal}
        \def\csu@lastpageref{\lastpageref{pagesLTS.roman.local}}
        \csu@chapter*[\csu@name@digest]{\MakeUppercase\csu@info@title@en}
        \counterwithout{section}{chapter}
        \csu@counter@without@chapter
        \let\addcontentsline\@gobblethree
        \csu@saved@env@body
      }
    \fi
  \fi
}
\AtEndPreamble{
  \ifcsu@review%
    \csusetup{%
      info = {
        author          = {},
        author*         = {},
        id              = {},
        supervisor      = {},
        supervisor*     = {},
        assisupervisor  = {},
        assisupervisor* = {},
      }
    }
  \fi
}
\NewDocumentCommand{\encrypt}{m O{***}}{%
  \ifcsu@review
    {#2}
  \else
    {#1}
  \fi
}
\newcommand\csu@uline[1]{%
  \begingroup
    \setbox0=\vbox{\strut #1\strut}%
    \dimen0=0pt
    \loop\ifdim\ht0>0pt
      \dimen1=\dimexpr\ht0 - \baselineskip\relax
      \setbox1=\vsplit0 to \ht\strutbox
      \advance\dimen1 by -\ht0
      \noindent\raisebox{-\dimen0}[\ht\strutbox][\dp\strutbox]{\box1}%
      \advance\dimen0 by \dimen1
      \vspace{-0.2ex}\hrule\vskip 0.2ex
    \repeat
  \endgroup
}
\AtEndOfPackageFile*{hyperref}{
  \hypersetup{
    linktoc            = all,
    bookmarksdepth     = 2,
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    unicode            = true,
    psdextra           = true,
    breaklinks         = true,
    plainpages         = false,
    pdfdisplaydoctitle = true,
    hidelinks,
  }
  \newcounter{csu@bookmark}
  \renewcommand\csu@pdfbookmark[2]{%
    \phantomsection
    \stepcounter{csu@bookmark}%
    \pdfbookmark[#1]{#2}{csuchapter.\thecsu@bookmark}%
  }
  \renewcommand\csu@phantomsection{%
    \phantomsection
  }
  \pdfstringdefDisableCommands{%
    \let\\\@empty
    \let\quad\@empty
    \let\hspace\@gobble
  }
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \AtBeginDocument{%
    \hypersetup{
      pdftitle    = \csu@info@title,
      pdfsubject  = \csu@name@subject,
      pdfkeywords = \csu@info@keywords,
      pdfauthor   = \csu@info@author,
      pdfcreator  = {LaTeX with CSUThesis \version}
    }
  }%
}
\AtEndOfPackageFile*{threeparttable}{
  \appto\TPTnoteSettings{\footnotesize}
}
\AtEndOfPackageFile*{longtable}{
  \BeforeBeginEnvironment{longtable}
    {\begingroup\ifcsu@set@float@fontsize\zihao{5}\fi}
  \AfterEndEnvironment{longtable}
    {\endgroup}
}
\AtEndOfPackageFile*{siunitx}{
  \sisetup{
    group-minimum-digits = 4,
    separate-uncertainty = true,
    inter-unit-product   = \ensuremath{{}\cdot{}},
  }
  \ifcsu@language@chinese
    \sisetup{
      list-final-separator = { 和 },
      list-pair-separator  = { 和 },
      range-phrase         = {～},
    }
  \fi
}
\newcommand\csu@def@theorem@name{%
  \ifcsu@language@chinese
    \csu@name@def{assumption}{假设}
    \csu@name@def{axiom}{公理}
    \csu@name@def{conjecture}{猜想}
    \csu@name@def{corollary}{推论}
    \csu@name@def{definition}{定义}
    \csu@name@def{example}{例}
    \csu@name@def{exercise}{练习}
    \csu@name@def{lemma}{引理}
    \csu@name@def{problem}{问题}
    \csu@name@def{proof}{证明}
    \csu@name@def{proposition}{命题}
    \csu@name@def{remark}{注}
    \csu@name@def{solution}{解}
    \csu@name@def{theorem}{定理}
  \else
    \csu@name@def{assumption}{Assumption}
    \csu@name@def{axiom}{Axiom}
    \csu@name@def{conjecture}{Conjecture}
    \csu@name@def{corollary}{Corollary}
    \csu@name@def{definition}{Definition}
    \csu@name@def{example}{Example}
    \csu@name@def{exercise}{Exercise}
    \csu@name@def{lemma}{Lemma}
    \csu@name@def{problem}{Problem}
    \csu@name@def{proof}{Proof}
    \csu@name@def{proposition}{Proposition}
    \csu@name@def{remark}{Remark}
    \csu@name@def{solution}{Solution}
    \csu@name@def{theorem}{Theorem}
  \fi
}
\newcommand\csu@def@theorem{%
  \newtheorem{assumption} {\csu@name@assumption} [chapter]
  \newtheorem{axiom}      {\csu@name@axiom}      [chapter]
  \newtheorem{conjecture} {\csu@name@conjecture} [chapter]
  \newtheorem{corollary}  {\csu@name@corollary}  [chapter]
  \newtheorem{definition} {\csu@name@definition} [chapter]
  \newtheorem{example}    {\csu@name@example}    [chapter]
  \newtheorem{exercise}   {\csu@name@exercise}   [chapter]
  \newtheorem{lemma}      {\csu@name@lemma}      [chapter]
  \newtheorem{problem}    {\csu@name@problem}    [chapter]
  \newtheorem{proposition}{\csu@name@proposition}[chapter]
  \newtheorem{theorem}    {\csu@name@theorem}    [chapter]
  \newtheorem*{remark}    {\csu@name@remark}
  \newtheorem*{solution}  {\csu@name@solution}
}
\PassOptionsToPackage{amsmath,thmmarks,hyperref}{ntheorem}
\AtEndOfPackageFile*{ntheorem}{
  \csu@def@theorem@name
  \theoremheaderfont{\csu@indent@box\bfseries\heiti}
  \theorembodyfont{\normalfont}
  \theoremseparator{\enskip}
  \theoremsymbol{\ensuremath{\square}}
  \newtheorem*{proof}{\csu@name@proof}
  \theoremstyle{plain}
  \theoremsymbol{}
  \csu@def@theorem
}
\AtEndOfPackageFile*{amsthm}{
  \csu@def@theorem@name
  \let\csu@thmhead\thmhead@plain
  \def\thmhead@plain{\csu@indent@box\csu@thmhead}
  \newtheoremstyle{csuplain}
    {}{}
    {\normalfont}{}
    {\bfseries\heiti}{}
    {\ccwd}{}
  \theoremstyle{csuplain}
  \csu@def@theorem
  \renewcommand\proofname\csu@name@proof
  \renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item\relax
      {\csu@indent@box\bfseries\heiti #1~}
      \hspace\labelsep\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\AtEndOfPackageFile*{algorithm2e}{
  \SetAlgorithmName{\csu@name@algorithm}%
                   {\csu@name@algorithm}%
                   {\csu@name@listalgorithm}
  \SetAlgoCaptionSeparator{~}
  \def\listalgocfname{\listalgorithmcfname}
  \newlistof{alg}{loa}{\listalgocfname}
  \let\l@algocf\l@alg
  \setlength{\cftalgindent}{1.5em}
  \setlength{\cftalgnumwidth}{2.3em}
  \renewcommand\cftalgpresnum{\csu@name@algorithm~}
  \apptocmd{\csu@counter@without@chapter}{%
    \counterwithout{algocf}{chapter}
    \setcounter{algocf}{0}
  }{}{}
  \pretocmd{\csu@counter@within@chapter}{%
    \counterwithin*{algocf}{chapter}
  }{}{}
  \apptocmd{\csu@def@thefloats}{%
    \def\thealgocf{\thechapter\csu@style@fl@num@sep\arabic{algocf}}
  }{}{}
  \csu@patchcmd\algocf@latexcaption%
    {\addcontentsline}
    {\caption@iflist{\addcontentsline}{\@gobblethree}}
  \AtEndPreamble{%
    \newlength{\csu@cftalgnumwidth@tmp}
      \settowidth{\csu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\csu@cftalgnumwidth@tmp}
  }
  \renewcommand\listofalgorithms{\csu@listof{algocf}}
}
\AtEndOfPackageFile*{algorithm}{
  \RequirePackage{algorithmicx, algpseudocode}
  \floatname{algorithm}{\csu@name@algorithm}
  \@addtoreset{algorithm}{chapter}
  \csu@patchcmd\@chapter%
    {\if@twocolumn}
    {\addtocontents{loa}{\protect\addvspace{10\p@}}%
     \if@twocolumn}
  \def\listalgorithmname{\csu@name@listalgorithm}
  \newlistof{alg}{loa}{\listalgorithmname}
  \let\l@algorithm\l@alg
  \setlength{\cftalgindent}{1.5em}
  \setlength{\cftalgnumwidth}{2.3em}
  \renewcommand\cftalgpresnum{\csu@name@algorithm~}
  \apptocmd{\csu@counter@without@chapter}{%
    \counterwithout{algorithm}{chapter}
    \setcounter{algorithm}{0}
  }{}{}
  \pretocmd{\csu@counter@within@chapter}{%
    \counterwithin*{algorithm}{chapter}
  }{}{}
  \apptocmd{\csu@def@thefloats}{%
    \def\thealgorithm{\thechapter\csu@style@fl@num@sep\arabic{algorithm}}
  }{}{}
  \AtEndPreamble{%
    \newlength{\csu@cftalgnumwidth@tmp}
      \settowidth{\csu@cftalgnumwidth@tmp}{\cftalgpresnum}
    \addtolength{\cftalgnumwidth}{\csu@cftalgnumwidth@tmp}
  }
  \renewcommand\listofalgorithms{\csu@listof{algorithm}}
}
\AtEndOfPackageFile*{listings}{
  \lstdefinestyle{lstStyleCode}{
    aboveskip=\medskipamount,
    belowskip=\medskipamount,
    basicstyle=\footnotesize\ttfamily,
    commentstyle=\slshape\color{black!60},
    stringstyle=\color{green!40!black!100},
    keywordstyle=\bfseries\color{blue!50!black},
    extendedchars=false,
    upquote=true,
    tabsize=2,
    showstringspaces=false,
    xleftmargin=1em,
    xrightmargin=1em,
    breaklines=true,
    breakindent=2em,
    framexleftmargin=1em,
    framexrightmargin=1em,
    backgroundcolor=\color{gray!10},
    columns=flexible,
    keepspaces=true,
    texcl=true,
    mathescape=true
  }
}
\AtEndOfPackageFile*{tikz}{
  \usetikzlibrary{shapes.geometric, arrows}
  \tikzstyle{startstop} = [
    rectangle,
    rounded corners,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{io} = [
    trapezium,
    trapezium left angle=75,
    trapezium right angle=105,
    minimum width=1cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{process} = [
    rectangle,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black
  ]
  \tikzstyle{decision} = [
    diamond,
    minimum width=2cm,
    minimum height=1cm,
    text centered,
    draw=black]
  \tikzstyle{arrow} = [thick, ->, >=stealth]
}
\endinput
%%
%% End of file `csuthesis.cls'.
