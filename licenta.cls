\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{licenta}
[2010/28/06 v1.0  Model pentru lucrarea de licenta]

% toate optiunile sunt trimise clasei de baza
\def\baseclass{book}
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
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}

% Macrouri pentru logging
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}

% Luna in limba romana
%\def\today{\ifcase\month\or
%  Ianuarie\or Februarie\or Martie\or Aprilie\or Mai\or Iunie\or
%  Iulie\or August\or Septembrie\or Octombrie\or Noiembrie\or Decembrie\fi
%  \space \number\year}

\usepackage{setspace}
\singlespacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}

\usepackage{vmargin}
\setmarginsrb           { 1.5in}  % marginea stange (mai mare pentru legat)
                        { 0.6in}  % marginea de sus
                        { 1.0in}  % marginea din dreapta
                        { 0.8in}  % marginea dejos
                        {  20pt}  % inaltimea headerului
                        {0.25in}  % inaltimea separatorului de header
                        {   9pt}  % inaltimea footer-ului
                        { 0.3in}  % inaltimea separatorului de footer
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % Fara cuvinte despartite in silbe pe linii consecutive
\brokenpenalty=10000              % Fara cuvinte despartite intre pagini
\widowpenalty=9999                % Fara "ferestre" in josul paginii
\clubpenalty=9999                 % Fara orfani la inceput de pagina
\interfootnotelinepenalty=9999    % Nu desparte notele de subsol

\usepackage{fancyhdr}
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1} \markboth{\emph{\chaptername\ \thechapter.}\ #1}{\emph{\chaptername\ \thechapter.}\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}


% Denumiri in romana pentru keyworduri matematice
\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}

% Parametri pentru figuri
\usepackage[centerlast,small,sc]{caption}
\setlength{\captionmargin}{20pt}
%\newcommand{\fref}[1]{Figura~\ref{#1}}
%\newcommand{\sref}[1]{sect.~\ref{#1}}

%\renewcommand{\chaptername}{Capitolul}
%\renewcommand{\contentsname}{Cuprins}
%\renewcommand{\bibname}{Bibliografie}
%\renewcommand{\figurename}{Figura}

\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}

\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}

% Pachete pentru grafice si diagrame
\usepackage{tikz}
\usetikzlibrary{arrows,shapes,fit}
\usepackage{pgf}
% Font Times New Roman
\usepackage{times}
% Liste cu spatii mai mici
\usepackage{mdwlist}
% Self-explanatory
\usepackage{todo}
\usepackage{multicol}
% Arbori de deductie
\usepackage{bussproofs}
\def\proofSkipAmount{\vskip -10pt}
\usepackage{verbatim}
\usepackage{graphicx}
\usepackage{courier}
% Listinguri de cod
\usepackage{listings}
% definitia sintaxei si stilului pentru TBT
\lstdefinelanguage{TBT} {
    morekeywords={let, fn, letrec, case, of, Inductive},
    sensitive=true,
    morecomment=[l]{--},
    morecomment=[n]{(*}{*)},
    moredelim=[is][commentstyle]{|}{|},
    numbers=left,
    numberstyle=\scriptsize,%\small,
    numberblanklines=true,
}
\lstdefinestyle{tbt}{
    keywordstyle=\color[rgb]{0.41,0.20,0.04}\bfseries,
    commentstyle=\color[gray]{0.55},
    basicstyle=\scriptsize, %\small,
    keepspaces=true,
}
\lstset { %
    language=C++,
    basicstyle=\footnotesize,% basic font setting
}
\renewcommand{\lstlistingname}{Program}

% Pachet pentru referinte in PDF
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks=false,linkcolor={black},citecolor={black},urlcolor={black},
   pdfstartview={FitH},unicode,breaklinks=true]{hyperref}

\pdfstringdefDisableCommands{
   \let\\\space
}

% Pentru pagina de titlu
\newcommand*{\fstsupervisor}[1]{\def\fstsupname{#1}}
\newcommand*{\sndsupervisor}[1]{\def\sndsupname{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\UNIVERSITY}[1]{\def\UNIVNAME{#1}}
\newcommand*{\faculty}[1]{\def\facname{#1}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}
\newcommand*{\degree}[1]{\def\degreename{#1}}
\degree      {}
\authors     {}
\subject     {}
\keywords    {}

\renewcommand\maketitle{
  \btypeout{Title page}
  \hypersetup{pdftitle={\@title}}
  \hypersetup{pdfsubject=\subjectname}
  \hypersetup{pdfauthor=\authornames}
  \hypersetup{pdfkeywords=\keywordnames}
  \thispagestyle{empty}
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \setcounter{footnote}{0}
    \null\vfil
    \vskip 60\p@
    \begin{center}
      \setlength{\parskip}{0pt}
      {\large \textbf{\UNIVNAME}\par}
      \vfill
      {\huge \bf \@title \par}
      \vfill
      \begin{table*}[h]
        \begin{center}
		  \begin{tabular}{lcccccl}
		      \Large \textbf{\Large Supervisors:}
			  \vspace*{1mm} &&&&&& \Large \textbf{\Large Author:}\vspace*{1mm} \\
			  \large \fstsupname &&&&&& \large \authornames \\
        \large \sndsupname &&&&&& \\
		  \end{tabular}
		\end{center}
	  \end{table*}
      \vfill
      {\large \degreename \par}
      \bigskip
      \bigskip
      {\large \facname \par}
      \bigskip
      \bigskip
      \bigskip
      {\Large \@date \par}
      \bigskip
    \end{center}
    \par
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \clearpage
}

% Modul de afisare al cuprinsul
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
    \refstepcounter{dummy}
    \addcontentsline{toc}{chapter}{#1}
}

\renewcommand\tableofcontents{
\btypeout{Table of Contents}
    \begin{spacing}{1}{
        \setlength{\parskip}{1pt}
        \chapter*{\contentsname
            \@mkboth{
               \contentsname}{\contentsname}}
        \@starttoc{toc}
       \clearpage
    }\end{spacing}
}

% Modul de afisare al bibliografiei
\renewcommand\backmatter{
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse}
\endinput
