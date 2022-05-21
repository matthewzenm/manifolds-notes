\ProvidesClass{aklbook}[2022/5/21 v0.0.1 Alkali's personal template for book]
\NeedsTeXFormat{LaTeX2e}

\newif\if@Chinese\@Chinesetrue
\newif\if@English

\DeclareOption{cn}{\@Chinesetrue\@Englishfalse\PassOptionToPackage{aklmath}}
\DeclareOption{en}{\@Englishtrue\@Chinesefalse\PassOptionToPackage{aklmath}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\LoadClass{book}
\RequirePackage{geometry,graphicx,indentfirst,fontspec,aklmath}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage[affil-it]{authblk}
% This is not finished.