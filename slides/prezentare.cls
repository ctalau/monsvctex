\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prezentare}
[2010/28/06 v1.0  Model pentru prezentarea de licenta]

% toate optiunile sunt trimise clasei de baza
\def\baseclass{beamer}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

% se verifica optiunea de dimensiune a font-ului
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}

% se incarca clasa si se proceseaza optiunile
\ProcessOptions\relax
\LoadClass{\baseclass}

% formule matematice
\usepackage{amsthm,amsmath}
\newtheorem{thm}{Teorem\u a}[section]

\usepackage{color}
\usepackage{tikz}
\usepackage{pgf}
\usetikzlibrary{arrows,decorations.pathreplacing}

\definecolor{purple}{RGB}{160,32,240}
\definecolor{skyblue}{RGB}{135,206,250}


% Pachete pentru grafice si diagrame
\usepackage{graphicx}

\usepackage{verbatim}
\mode<presentation>
{
    \usetheme{Copenhagen}
    \usecolortheme{whale}
}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{blocks}[rounded][shadow=true]


