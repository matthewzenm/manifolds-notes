% This class is still individually maintained.
% So no comments will occur.
\ProvidesClass{aklbook}[2022/5/21 v0.0.1 Alkali's personal template for book]
\NeedsTeXFormat{LaTeX2e}

\newcommand{\aklclsset}[1]{\PassOptionsToClass{aklbook}{#1}}

\RequirePackage{kvoptions,xstring}
\SetupKeyvalOptions{
    family=@akl,
    prefix=@akl@
}

\DeclareStringOption[cn]{lang}
\DeclareStringOption[cm]{enfontset}
\DeclareStringOption[fandol]{cnfontset}
\DeclareStringOption[cm]{mathfontset}
\DeclareBoolOption[false]{print}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions*
\ProcessKeyvalOptions{akl}{\PassOptionsToPackage{aklmath}{\@akl@lang}}
\ProcessKeyvalOptions*
\relax


\LoadClass{book}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{aklmath}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage[affil-it]{authblk}

\def\onlinename{}
\def\printname{}
\def\lastcompile{}
\def\publishday{}
\newcommand{\authoronline}[1]{\renewcommand\onlinename{#1}}
\newcommand{\authorprint}[1]{\renewcommand\printname{#1}}
\newcommand{\datecompile}[1]{\renewcommand\lastcompile{#1}}
\newcommand{\datepublish}[1]{\renewcommand\publishday{#1}}
\if@akl@print
    \author{\printname}
    \date{\publishday}
    \@ifpackageloaded{hyperref}{
        \hypersetup{hidelinks}
    }{}
\else
    \author{\onlinename}
    \date{\lastcompile}
    \@ifpackageloaded{hyperref}{
        \hypersetup{
            colorlinks=true,
            linkcolor=blue,
            citecolor=green
        }
    }{}
\fi

\IfStrEq{\@akl@enfontset}{cm}{
    \setmainfont{CMU Serif}
    \setsansfont{CMU Sans Serif}
    \setmonofont{CMU Typewriter Text}
}{}
\IfStrEq{\@akl@enfontset}{times}{
    \setmainfont{Times New Roman}
    \setsansfont{Arial}
    \setmonofont{Courier New}
}{}
\IfStrEq{\@akl@enfontset}{newtx}{
    \setmainfont{TeX Gyre Termes}
    \setsansfont{TeX Gyre Heros}
    \setmonofont{TeX Gyre Cursor}
}{}
\IfStrEq{\@akl@enfontset}{stix2}{
    \setmainfont{STIX Two Text}
    \setsansfont{TeX Gyre Heros}
    \setmonofont{TeX Gyre Cursor}
}{}
\IfStrEq{\@akl@enfontset}{xits}{
    \setmainfont{XITS}
    \setsansfont{TeX Gyre Heros}
}{}
\IfStrEq{\@akl@enfontset}{gnu}{
    \setmainfont{FreeSerif}
    \setsansfont{FreeSans}
    \setmonofont{FreeMono}
}{}

\IfStrEq{\@akl@lang}{cn}{
    \RequirePackage[heading,fontset=none]{ctex}
    \IfStrEq{\@akl@cnfontset}{fandol}{\ctexset{fontset=fandol}}{}
    \IfStrEq{\@akl@cnfontset}{windows}{\ctexset{fontset=windows}}{}
    \IfStrEq{\@akl@cnfontset}{founder}{
        \newif\if@fileexists\@fileexiststrue
        \IfFileExists{FZSSJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZKTJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZCSJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZHTJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZFSJ.otf}{}{\@fileexistsfalse}
        \if@fileexists
            \setCJKmainfont{FZSSJ.otf}[BoldFont={FZCSJ.otf},ItalicFont={FZKTJ.otf}]
            \setCJKsansfont{FZHTJ.otf}
            \setCJKmonofont{FZFSJ.otf}
        \else
            \ClassError{aklbook}{Founder fonts do not exist in current directory.}
        \fi
    }{}
}{
    \RequirePackage[CheckSingle]{xeCJK}
    \IfStrEq{\@akl@cnfontset}{fandol}{
        \setCJKmainfont[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]{FandolSong-Regular.otf}
        \setCJKsansfont[BoldFont=FandolHei-Bold.otf]{FandolHei-Regular.otf}
        \setCJKmonofont{FandolFang-Regular.otf}
    }{}
    \IfStrEq{\@akl@cnfontset}{windows}{
        \setCJKmainfont[BoldFont=simhei.ttf,ItalicFont=simkai.ttf]{simsun.ttc}
        \setCJKsansfont[BoldFont=msyhbd.ttc]{msyh.ttc}
        \setCJKmonofont{simfang.ttf}
    }{}
    \IfStrEq{\@akl@cnfontset}{founder}{
        \new\if@fileexists\@fileexiststrue
        \IfFileExists{FZSSJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZKTJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZCSJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZHTJ.otf}{}{\@fileexistsfalse}
        \IfFileExists{FZFSJ.otf}{}{\@fileexistsfalse}
        \if@fileexists
            \setCJKmainfont{FZSSJ.otf}[BoldFont={FZCSJ.otf},ItalicFont={FZKTJ.otf}]
            \setCJKsansfont{FZHTJ.otf}
            \setCJKmonofont{FZFSJ.otf}
        \else
            \ClassError{aklbook}{Founder fonts do not exist in current directory.}
        \fi
    }{}
}
% This is not finished.