% This class is still individually maintained.
% So no comments will occur.
\ProvidesClass{aklbook}[2022/5/21 v0.0.1 Alkali's personal template for book]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions,xstring}
\SetupKeyvalOptions{
    family=@akl,
    prefix=@akl@
}

\newif\if@akl@Chinese\@akl@Chinesetrue
\newif\if@akl@English
\DeclareOption{cn}{\@akl@Chinesetrue\@akl@Englishfalse\PassOptionToPackage{aklmath}}
\DeclareOption{en}{\@akl@Englishtrue\@akl@Chinesefalse\PassOptionToPackage{aklmath}}

\DeclareStringOption[cm]{enfontset}
\DeclareStringOption[fandol]{cnfontset}
\DeclareStringOption[cm]{mathfontset}
\DeclareBoolOption[false]{print}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass{book}
\RequirePackage{geometry,graphicx,indentfirst,fontspec,aklmath,xeCJK}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage[affil-it]{authblk}

\newcommand{\authoronline}[1]{\def\onlinename{#1}}
\newcommand{\authorprint}[1]{\def\printname{#1}}
\if@akl@print
    \author{\printname}
    \@ifpackageloaded{hyperref}{
        \hypersetup{
            colorlinks=true,
            linkcolor=blue,
            citecolor=green
        }
    }
\else
    \author{\onlinename}
    \@ifpackageloaded{hyperref}{
        \hypersetup{hidelinks}
    }
\fi

\IfStrEq{@akl@enfontset}{cm}{}{}
\IfStrEq{@akl@enfontset}{times}{
    \setmainfont{Times New Roman}
    \setsansfont{Arial}
    \setmonofont{Courier New}
}{}
\IfStrEq{@akl@enfontset}{newtx}{
    \setmainfont{TeX Gyre Termes}
    \setsansfont{TeX Gyre Heros}
    \setmonofont{TeX Gyre Bonum}
}{}
\IfStrEq{@akl@enfontset}{stix2}{
    \setmainfont{STIX Two Text}
    \setsansfont{TeX Gyre Heros}
}{}
\IfStrEq{@akl@enfontset}{xits}{
    \setmainfont{XITS}
    \setsansfont{TeX Gyre Heros}
}{}
\IfStrEq{@akl@enfontset}{gnu}{
    \setmainfont{FreeSerif}
    \setsansfont{FreeSans}
    \setmonofont{FreeMono}
}


% This is not finished.