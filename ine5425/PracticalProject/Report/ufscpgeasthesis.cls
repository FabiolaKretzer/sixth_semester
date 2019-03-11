%%% ufpehesis.cls  %%% UFPE Thesis/Dissertation document class
%%% (C) 2003--2005 Paulo Gustavo Soares Fonseca
%%%    Author              = "Paulo G. S. Fonseca"
%%% Alterações por Rafael Luiz Cancian  
%%% Setembro, 2009
%%% Adaptações para formato DAS - PGEAS - UFSC

\ProvidesClass{ufscpgeasthesis}[2009/01/09]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{pt}{%
  \let\@language=0%
  \PassOptionsToPackage{brazil}{babel}}

\DeclareOption{en}{%
  \let\@language=1%
  \PassOptionsToPackage{brazil,english}{babel}}

\DeclareOption{oneside}{%
  \PassOptionsToClass{oneside}{book}}

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{book}}
 
\DeclareOption{print}{%
  \let\@scr=0}

\DeclareOption{scr}{%
  \let\@scr=1%
  \PassOptionsToClass{dvipdfm}{book}}
  
\DeclareOption{bsc}{%
  \let\@degreetype=0}

\DeclareOption{msc}{%
  \let\@degreetype=1}

\DeclareOption{qual}{%
  \let\@degreetype=2}

\DeclareOption{prop}{%
  \let\@degreetype=3}

\DeclareOption{phd}{%
  \let\@degreetype=4}
  
\DeclareOption{disc}{%
  \let\@degreetype=5

}

% Default options
\ExecuteOptions{pt,msc,pgeas,print}
\ProcessOptions

\LoadClass[11pt,a4paper]{book}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\RequirePackage{babel}
\RequirePackage{calc}
\RequirePackage{ifthen}
% \RequirePackage[latin1]{inputenc}
\RequirePackage{textcase}
\RequirePackage{textcomp}
\RequirePackage{url}
\RequirePackage{xspace}
\RequirePackage{paralist}
%%\RequirePackage{tabela-simbolos}

\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage[scaled=0.92]{helvet}
\RequirePackage{courier}

\if\@scr0
  \RequirePackage{graphicx}
\fi
\if\@scr1
  \RequirePackage[dvips]{graphicx}
  \RequirePackage[dvips,usenames]{color}
  \RequirePackage[dvipdfm,colorlinks,backref]{hyperref}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\origcleardoublepage=\cleardoublepage
\def\cleardoublepage{%
  \newpage{\pagestyle{empty}\origcleardoublepage}
}

%%
% For use with the pseudocode package
\def\@lopcchapterspace{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Language Independent

\gdef\@maleadvisertitle{Orientador}
\gdef\@femaleadvisertitle{Orientadora}
\gdef\@malecoadvisertitle{Co-orientador}
\gdef\@femalecoadvisertitle{Co-orientadora}
\gdef\@bachelordissertation{Trabalho de Graduação}
\gdef\@mastersdissertation{Dissertação de Mestrado}
\gdef\@phdqualifying{Monografia de Qualificação}
\gdef\@phdproposal{Proposta de Tese de Doutorado}
\gdef\@phdthesis{Tese de Doutorado}
\gdef\@trabalhoorientado{Trabalho Orientado}
\gdef\@bachelordegree{Bacharel}
\gdef\@mastersdegree{Mestre}
\gdef\@phddegree{Doutor}
\if\@degreetype5
   \gdef\@presentationtext{Trabalho da disciplina de ``\@discipline''\ apresentado ao \@program\ do \if\@showdepartment1\@department\ \else\@institute\ \fi
da \@university .}
\else
   \gdef\@presentationtext{Trabalho apresentado ao \@program\ do \if\@showdepartment1\@department\ \else\@institute\ \fi da \@university\ como requisito parcial para obtenção do grau de \@degree\ em \@majorfield.}
\fi
\gdef\resumoname{Resumo}
\gdef\abstrname{Abstract}
\gdef\keywordsnamePT{Palavras-chave}
\gdef\keywordsnameEN{Keywords}

%% Language Dependent

% Portuguese
\if\@language0
  \gdef\@notdefined{NÃO DEFINIDO}
  \gdef\acknowledgementsname{Agradecimentos}
  \gdef\@axiomname{Axioma}
  \gdef\@conjecturename{Conjectura}
  \gdef\@defname{Definição}
  \gdef\@lemmaname{Lema}
  \gdef\@theoname{Teorema}
  \gdef\@propname{Proposição}
  \gdef\@corname{Corolário}
  \gdef\@proofname{Prova}
  \gdef\@figurename{Figura}
  \gdef\@tablename{Tabela}
%   \gdef\@equationame{Equação}
  \gdef\@chaptername{Capítulo}
  \gdef\@sectionname{Seção}
  \gdef\@appendixname{Apêndice}
  \gdef\@pagename{página}
%   \gdef\@listofequationsname{Lista de Equações}
  \gdef\@colophontext{%
  \urlstyle{rm}%
  %Este volume foi tipografado em \LaTeX\ na classe \textsf{UFSCThesis}
  %(\url{www.cin.ufpe.br/~paguso/ufpethesis}).
  %\if\@scr1
  %Para detalhes sobre este documento, clique \Acrobatmenu{GeneralInfo}{aqui}.
  %\fi
   }
% English
\else\if\@language1
  \gdef\@notdefined{UNDEFINED}
  \gdef\acknowledgementsname{Acknowledgements}
  \gdef\@axiomname{Axiom}
  \gdef\@conjecturename{Conjecture}
  \gdef\@defname{Definition}
  \gdef\@lemmaname{Lemma}
  \gdef\@theoname{Theorem}
  \gdef\@propname{Proposition}
  \gdef\@corname{Corollary}
  \gdef\@proofname{Proof}
  \gdef\@figurename{Figure}
  \gdef\@tablename{Table}
%   \gdef\@equationame{equation}
  \gdef\@chaptername{Chapter}
  \gdef\@sectionname{Section}
  \gdef\@appendixname{Appendix}
  \gdef\@pagename{page}
%   \gdef\@listofequationsname{Lista de Equações}
  \gdef\@colophontext{%
  \urlstyle{rm}%
  }
\fi\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IDENTIFICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% School identification

\def\university#1{%
  \gdef\@university{#1}}
\def\@university{Universidade Federal de Santa Catarina}

\def\universitylogo {\includegraphics{ufsc.eps}}

\let\@showinstitute=0
\def\institute#1{%
  \let\@showinstitute=1
  \gdef\@institute{#1}}

\let\@showdepartment=0
\def\department#1{%
  \let\@showdepartment=1
  \gdef\@department{#1}}

\let\@showlogo=0
\def\showlogo#1{%
  \let\@showlogo=1}

\def\program#1{%
  \gdef\@program{#1}}
\def\@program{\@notdefined}

\def\discipline#1{%
  \gdef\@discipline{#1}}
\def\@discipline{\@notdefined}

\def\majorfield#1{%
  \gdef\@majorfield{#1}}
\def\@majorfield{\@notdefined}

\def\address#1{%
  \gdef\@address{#1}}
\def\@address{Florianópolis}

\def\year#1{%
  \gdef\@year{#1}}
\def\@year{\@notdefined}

\def\month#1{%
  \gdef\@month{#1}}
\def\@month{\@notdefined}

%% Authors identification

\def\author#1{%
  \gdef\@author{#1}
  \if\@scr1 \hypersetup{pdfauthor={\@author}}\fi}
\def\@author{\@notdefined}

\def\adviser{%
  \@ifnextchar [%
    {\@padviser}%
    {\@padviser[\@empty]}}
\def\@padviser[#1]#2{%
  \ifx#1\@empty
    \gdef\@advisertitle{\@maleadvisertitle}
  \else
    \gdef\@advisertitle{\@femaleadvisertitle}
  \fi
  \gdef\@adviser{#2}}
\def\@adviser{\@notdefined}

\let\@showcoadviser=0
\def\coadviser{%
  \@ifnextchar [%
    {\@pcoadviser}%
    {\@pcoadviser[\@empty]}}
\def\@pcoadviser[#1]#2{%
  \let\@showcoadviser=1
  \ifx#1\@empty
    \gdef\@coadvisertitle{\@malecoadvisertitle}
  \else
    \gdef\@coadvisertitle{\@femalecoadvisertitle}
  \fi
  \gdef\@coadviser{#2}}

%% Work identification

\def\title#1{%
  \gdef\@title{#1}
  \if\@scr1 \hypersetup{pdftitle={\@title}}\fi}
\def\@title{\@notdefined}

\def\@texttype{%
  \if\@degreetype0
    \@bachelordissertation
  \else\if\@degreetype1
    \@mastersdissertation
  \else\if\@degreetype2
    \@phdqualifying
  \else\if\@degreetype3
    \@phdproposal
  \else\if\@degreetype4
    \@phdthesis
  \else\if\@degreetype5
    \@trabalhoorientado
  \fi\fi\fi\fi\fi\fi}

\def\@degree{%
  \if\@degreetype0
    \@bachelordegree
  \else\if\@degreetype1
    \@mastersdegree
  \else\if\@degreetype2
    \@phddegree
  \else\if\@degreetype3
    \@phddegree
  \else\if\@degreetype4
    \@phddegree
  \else\if\@degreetype5
    \@phddegree
  \fi\fi\fi\fi\fi\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\topmargin}{0mm}
\setlength{\textheight}{\paperheight-\headheight-\headsep-\footskip-55mm} %2in
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\marginparsep}{0mm}
\setlength{\textwidth}{\paperwidth-55mm} %2in

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%         PGEAS STYLE           %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\it\normalsize}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Frontpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\frontpage{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \begin{center}
    {\large\bfseries\scshape\@author}
    \vskip80mm
    {\Large\scshape\@title}
    \vskip80mm
    \normalfont
    \@address\\
    \@year
  \end{center}
  %\if@openright\cleardoublepage\else\clearpage\fi
  %\thispagestyle{empty}
  %\begin{center}
  %\large
  %\if\@showlogo1\input\universitylogo\\\@university\else\@university\fi
  %\input\universitylogo
  %\\\@university
  %\if\@showinstitute1\\\@institute\fi
  %\if\@showdepartment1\\\@department\fi
  %%\vskip 25mm
  %\\\@program
  %%\@program
  %\vskip 45mm
  %\begin{minipage}{110mm}
  %  \begin{center}
  %    {\Large\bfseries\@title}
  %    \vskip\baselineskip
  %    \@author
  %    \vskip\baselineskip
  %    \@texttype
  %  \end{center}
  %\end{minipage}\\
  %\vfill
  %\@address\\
  %\@date
  %\end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Presentation page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\presentationpage{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \begin{center}
  {\large\bfseries\scshape
  \@university
  %\if\@showinstitute1\\\scshape\@institute\fi
  %\if\@showdepartment1\\\scshape\@department\fi
  \if\@showdepartment1\\\scshape\@program\fi}
  \vskip\baselineskip
  \vskip 40mm
  {\Large\bfseries\scshape\@title}
  \vskip 40mm
  %\begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti %
    \normalfont
    \@presentationtext
    \vskip2\baselineskip
%    \begin{center}
%    \begin{tabular}{rl}
%    {\quotefont \@advisertitle:}&\@adviser\\
%    \if\@showcoadviser1{\quotefont\@coadvisertitle:}&\@coadviser\\\fi
%    \end{tabular}
%    \end{center}
    \end{minipage}
  %\end{flushright}
  \vskip 30mm
  {\large\bfseries\scshape\@author}
  %\vfill
  \vskip 30mm
  \normalsize\@address,\ \@month\ de\ \@year
  \end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedicatory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\dedicatory{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  ~\\
  \vfill
  \begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti
    \begin{flushright}}
\def\enddedicatory{
		\end{flushright}
    \normalfont
    \end{minipage}
  \end{flushright}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Acknowledgements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\acknowledgements{%
  \chapter*{\acknowledgementsname}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\resumo{%
  %\if@openright\cleardoublepage\else\clearpage\fi
  %\thispagestyle{empty}
  %\begin{center}
  %  \normalfont
  %  Resumo da \@texttype apresentada à \@university como parte dos requisitos necessários para a obtenção do grau de \@degree em \@majorfield \\ \\
  %  {\large\\scshape\@title\\ \\ \@autor}
  %  \@month / \@year \\ \\
  %\end{center}
  % Orientador: \\
  % Área de concentração: \\
  % Palavras-chave: \\
  % Número de páginas: \\
  \gdef\@keywordsname{\keywordsnamePT}
  \chapter*{\resumoname}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\abstract{%
  \gdef\@keywordsname{\keywordsnameEN}
  \chapter*{\abstrname}}

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Keywords
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}
\def\endkeywords{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\epigraph{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  ~\\\vfill
  \begin{quotation}}
\def\endepigraph{\end{quotation}}

\def\quotation{%
  \@ifnextchar [%
    {\begin{pquot@tion}}%
    {\begin{pquot@tion}[\@empty]}}
\def\endquotation{\end{pquot@tion}\@afterindenttrue\@afterheading}

\def\pquot@tion[#1]#2{%
  \def\@qauthor{#2}
  \def\@qnote{#1}
  \begin{flushright}
    \begin{minipage}{0.8\textwidth}
      \begin{flushright}\quotefonti}
\def\endpquot@tion{%
        \vskip.2\baselineskip%
        \quotefont---\MakeTextUppercase{\@qauthor}
        \if\@qnote\@empty
          \relax
        \else
          \space(\@qnote)
        \fi
      \end{flushright}
    \end{minipage}
  \end{flushright}
  \normalfont\vskip2\baselineskip}

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@plaintocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}

 \renewcommand\tableofcontents{%
   \chapter*{\contentsname}
   \@starttoc{toc}}
 

% \def\l@part#1#2{%
%   \ifnum \c@tocdepth >-2\relax
%     \addpenalty{-\@highpenalty}%
%     \addvspace{2.25em \@plus\p@}%
%     \setlength\@tempdima{3em}%
%     \begingroup
%       \parindent \z@ \rightskip \@pnumwidth
%       \parfillskip -\@pnumwidth
%       {\leavevmode
%        \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
%        \nobreak
%          \global\@nobreaktrue
%          \everypar{\global\@nobreakfalse\everypar{}}%
%     \endgroup
%   \fi}

\def\l@chapter#1#2{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip .75em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
    %\vskip .75em \@plus\p@
  \fi}

%\def\l@section{\@plaintocline{1}{1.5em}{2.3em}}
%\def\l@subsection{\@plaintocline{2}{3.8em}{3.2em}}
%\def\l@subsubsection{\@plaintocline{3}{7.0em}{4.1em}}
%\def\l@paragraph{\@plaintocline{4}{10em}{5em}}
%\def\l@subparagraph{\@plaintocline{5}{12em}{6em}}
%
%\def\l@figure{\@plaintocline{1}{1.5em}{2.3em}}
%\def\l@table{\@plaintocline{1}{1.5em}{2.3em}}
\let\@dottedtocline\@plaintocline

\setcounter{tocdepth}{3}


\renewcommand\listoffigures{%
   \chapter*{\listfigurename}
   \@starttoc{lof}}

\renewcommand\listoftables{%
   \chapter*{\listtablename}
   \@starttoc{lot}}


%
% \listofequations is defined analogously to \listoffigures,
% \listoftables. It produces a section heading for the list of
% equations opens a *.loe file to receive items in that list.
%
% \def\listofequations{\chapter*{\@listofequationsname}
%   \@starttoc{loe}}
% 
% \renewcommand\listofequations{%
%    \chapter*{\listofequationsname}
%    \@starttoc{loe}}

%
% The aequation environment provides a numbered displayed formula,
% where the absolute equation number is given as argument to the
% environment.
%
% \newenvironment{aequation}[1]{
%   $$ % $$ BRACE MATCHING HACK COPIED FROM latex.tex VERSION 2.09
%   \newcommand{\@equationnumber}{#1} }{
%   % $$ BRACE MATCHING HACK COPIED FROM latex.tex VERSION 2.09
%   \eqno\mbox{(\@equationnumber)} \addcontentsline{loe}{table}{Equation
%     \@equationnumber.  (Sec~\thecjsection)} $$
% }

%
% The \aequationnumber command, used at the beginning of a line in the
% LaTeX source for an eqnarray* environment, provides an absolute
% equation number at the end of the printed line.
%
% \newcommand{\aequationnumber}[1]{%
%   \noalign{\vbox to 0ex{\hfill\mbox{(#1)}}\nointerlineskip}%
%   \addcontentsline{loe}{table}{Equation #1. (Sec~\thecjsection)}%
% }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sectioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{4}

\def\part{%
	\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}%
  \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     \ifnum \c@secnumdepth >-2\relax
       {\sc\Large\partname\nobreakspace\thepart}
       \par
       \vskip 20\p@
     \fi
     {\huge\bfseries #2\par}}
     \vfil}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \null\vfil
     {\huge\bfseries #1\par}}
     \vfil}

\def\chapter{\if@openright\cleardoublepage\else\clearpage\fi
             \thispagestyle{plain}%
             \global\@topnum\z@
             \@afterindenttrue
             \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{
   \refstepcounter{chapter}%
   \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
   \chaptermark{#1}%
   \addtocontents{lof}{\protect\addvspace{10\p@}}%
   \addtocontents{lot}{\protect\addvspace{10\p@}}%
   \@lopcchapterspace%
   \@makechapterhead{#2}%
   \@afterheading}

\def\@makechapterhead#1{\global\topskip 1.5pc
  \relax
  \begingroup
  \LARGE\bfseries\centering
    \ifnum\c@secnumdepth>\m@ne
      \leavevmode \hskip-\leftskip
      \rlap{\vbox to\z@{\vss
          \centerline{\large\sc{\chaptername}\enspace\thechapter}
          \vskip2.5pc}}\hskip\leftskip\fi
     #1\par \endgroup
  \skip@10pc \advance\skip@-\normalbaselineskip
  \vskip\skip@ }  
  
\def\@schapter#1{%
  \schaptermark{#1}%
  \@makeschapterhead{#1}%
  \@afterheading}

\def\@makeschapterhead#1{\global\topskip 1.5pc\relax
  \begingroup
  \LARGE\bfseries\centering
  #1\par \endgroup
  \skip@10pc \advance\skip@-\normalbaselineskip
  \vskip\skip@ }

\def\appendix{%
   \setcounter{chapter}{0}%
   \renewcommand{\thechapter}{\Alph{chapter}}%
   \renewcommand{\chaptername}{\appendixname}}

\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindenttrue\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}

\def\section{%
  \@startsection{section}{1}{0mm}{1.5\baselineskip}
    {\baselineskip}{\centering\large\bfseries}}

\def\subsection{%
  \@startsection{subsection}{2}{0mm}{1.2\baselineskip}
    {.6\baselineskip}{\centering\bfseries}}

\def\subsubsection{%
  \@startsection{subsubsection}{3}{0mm}{\baselineskip}
   {.6\baselineskip}{\centering\normalfont}}

\def\paragraph{%
  \@startsection{paragraph}{4}{0mm}{\baselineskip}
   {-1em}{\itshape}}

\def\colophon{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \null\vfill
  \small\noindent
  \@colophontext	
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers & footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@evenhead{\rlap{\thepage}\hfill{\leftmark}\hfill}%
\def\@oddhead{\hfill{\rightmark}\hfill\llap{\thepage}}%

\def\chaptermark#1%
{\markboth{\normalfont\footnotesize\MakeTextUppercase{\chaptername~\thechapter\enspace#1}}%
{\normalfont\footnotesize\MakeTextUppercase{\chaptername~\thechapter\enspace#1}}}

\def\schaptermark#1%
{\markboth{\normalfont\footnotesize\MakeTextUppercase{#1}}%
{\normalfont\footnotesize\MakeTextUppercase{#1}}}

\def\sectionmark#1%
{\markright{\normalfont\footnotesize\MakeTextUppercase{\thesection\enspace #1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\global\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
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
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables and figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \long\def\@makecaption#1#2{%
%   \vskip\abovecaptionskip
%   \sbox\@tempboxa{\small\bf #1\rm\enskip #2}%
%   \ifdim \wd\@tempboxa >\hsize
%     {\small\bf#1\rm\enskip #2\par}
%   \else
%     \global \@minipagefalse
%     \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%   \fi
%   \vskip\belowcaptionskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mathematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Equation numbering
\renewcommand{\theequation}{\rm\thechapter.\arabic{equation}}

% Theorem-like environments
\newtheoremstyle{theo}%
	{\topsep}{\topsep}% Space above and below
	{\slshape}% Body style
	{0pt}% Heading indent amount
	{\bfseries}{.}% Heading font and punctuation after it
	{1ex plus 0pt minus .2ex}% Space after heading 
	{}% Head spec (empty = same as ‘plain’ style
\theoremstyle{definition}
\newtheorem{Def}{\@defname}[chapter]
\theoremstyle{theo}
\newtheorem{Axi}{\@axiomname}[chapter]
\newtheorem{Conj}{\@conjecturename}[chapter]
\newtheorem{Lem}{\@lemmaname}[chapter]
\newtheorem{Theo}{\@theoname}[chapter]
\newtheorem{Prop}{\@propname}[chapter]
\newtheorem{Cor}{\@corname}[chapter]
%\renewcommand{\qedsymbol}{\rule{3pt}{8pt}}
%\renrewcommand{\proofname}{\@proofname}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\figref}[2][]{\@figurename~\ref{#2}#1\xspace}
\newcommand{\tabref}[1]{\@tablename~\ref{#1}\xspace}
\newcommand{\eqnref}[1]{\@equationame~\eqref{#1}\xspace}
\newcommand{\chapref}[1]{\@chaptername~\ref{#1}\xspace}
\newcommand{\secref}[1]{\@sectionname~\ref{#1}\xspace}
\newcommand{\appref}[1]{\@appendixname~\ref{#1}\xspace}
\newcommand{\axiref}[1]{\@axiomname~\ref{#1}\xspace}
\newcommand{\conjref}[1]{\@conjname~\ref{#1}\xspace}
\newcommand{\defref}[1]{\@defname~\ref{#1}\xspace}
\newcommand{\lemref}[1]{\@lemmaname~\ref{#1}\xspace}
\newcommand{\theoref}[1]{\@theoname~\ref{#1}\xspace}
\newcommand{\corref}[1]{\@corname~\ref{#1}\xspace}
\newcommand{\propref}[1]{\@propname~\ref{#1}\xspace}
\newcommand{\pgref}[1]{\@pagename~\pageref{#1}\xspace}
