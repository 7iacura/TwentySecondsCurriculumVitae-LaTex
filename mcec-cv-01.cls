\ProvidesClass{mcec-cv}[2016/08/01]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

% ------------------------------
% -- Packages --
% ------------------------------

\RequirePackage[default]{lato}
\usepackage[T1]{fontenc}

\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{parskip}
\RequirePackage{fontawesome}

% ------------------------------
% -- Colors --
% ------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{maincolor}{HTML}{245FA6}
\definecolor{grey}{HTML}{333333}
\definecolor{lightgrey}{HTML}{8F8F8F}
\definecolor{maingrey}{HTML}{8A8A8A}
\colorlet{asidecolor}{sidecolor}

% ------------------------------
% -- Page Setting --
% ------------------------------

\RequirePackage[left=7.2cm, top=1cm, right=0.8cm, bottom=1.3cm, nohead, nofoot]{geometry}
\RequirePackage{hyperref}

% -- settings: section --
\renewcommand{\section}[1]{
	\par\noindent\colorbox{maincolor}
	{\parbox[t][0.6cm][c]
		{\dimexpr\textwidth-0\fboxsep\relax}
		{\par\noindent \centering \color{white} \large #1 } 
	} \par\noindent
}

\newcommand*\round[3]{%
  \tikz[baseline=(char.base)]\node[anchor=north west, draw, rectangle, rounded corners, inner sep=3pt, minimum size=6mm,
    text height=3mm, fill=#2, #2, text=#3](char){#1} ;}
    
\newcommand*\littleround[3]{%
  \tikz[baseline=(char.base)]\node[rounded corners, minimum width=6mm, fill=#2, #2, text=#3](char){#1} ;}

% -- mcec flags: --
\newcommand{\flag}[1]{\round{#1}{maingrey}{white}}
\newcommand{\largeflag}[1]{\round{\large #1}{maingrey}{white}}
\newcommand{\wbflag}[1]{\littleround{#1}{white}{black}}

% ------------------------------
% -- Profile left SideBar --
% ------------------------------

\setlength{\TPHorizModule}{1cm} % left border
\setlength{\TPVertModule}{2cm} % top border

% -- settings: profile pic --
\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5.5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}
\newcommand{\givenprofilepic}{}
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}
% -- settings: name --
\newcommand{\givenname}{REQUIRED!}
\newcommand{\name}[1]{\renewcommand{\givenname}{#1}}
% -- settings: job --
\newcommand{\givenjob}{}
\newcommand{\job}[1]{\renewcommand{\givenjob}{#1}}
% -- settings: birth date  --
\newcommand{\givendate}{}
\renewcommand{\date}[1]{\renewcommand{\givendate}{\textsc{\wbflag{\faCalendar}} #1 \\}}
% -- settings: address --
\newcommand{\givenaddress}{}
\newcommand{\address}[1]{\renewcommand{\givenaddress}{\textsc{\wbflag{\faMapMarker}} #1 \\}}
% -- settings: phones --
\newcommand{\givenphones}{}
\newcommand{\phones}[1]{
	\renewcommand{\givenphones}{
		\foreach [count=\i] \x in {#1} {\textsc{\wbflag{\faPhone}} \x \\}	
}}
% -- settings: emails --
\newcommand{\givenemails}{}
\newcommand{\emails}[1]{
	\renewcommand{\givenemails}{
		\foreach [count=\i] \x in {#1} {\textsc{\wbflag{@}} \href{mailto:\x}{\x}  \\}	
}}
% -- settings: site address --
\newcommand{\givensite}{}
\newcommand{\site}[2]{
	\renewcommand{\givensite}{\textsc{\wbflag{\faGlobe}} \href{#2}{#1}  \\}	
}
% -- settings: github address
\newcommand{\givengithub}{}
\newcommand{\github}[1]{
	\renewcommand{\givengithub}{\textsc{\wbflag{\faGithub}} \href{#1}{https://github.com} \\}
}
% -- settings: linkedin address
\newcommand{\givenlinkedin}{}
\newcommand{\linkedin}[1]{
	\renewcommand{\givenlinkedin}{\textsc{\wbflag{\faLinkedin}} \href{#1}{https://linkedin.com} \\}
}
% -- settings: twitter address
\newcommand{\giventwitter}{}
\newcommand{\twitter}[1]{
	\renewcommand{\giventwitter}{\textsc{\wbflag{\faTwitter}} \href{#1}{https://twitter.com} \\}
}

% -- settings: about me -- (old in side bar)
%\newcommand{\about}[1]{\renewcommand{\givenabout}{
%	\vspace{0.5cm} 
%	\section{About me}\justifying #1}}
%\newcommand{\givenabout}{}

\newcommand{\about}[1]{ 
	\section{About me}
	\vspace{5mm} \hspace{3mm} \parbox{12.8cm}{
	\noindent \color{grey} \justifying #1}
}

	
% -- settings: languages --
\newcommand{\languages}[1]{
	\renewcommand{\givenlanguages}{
		\vspace{0.5cm} 
		\section{Languages}
		\begin{flushleft}
		\foreach [count=\i] \x/\y in {#1} {
			\begin{table}[]
			\begin{tabular}{lr}
				\hspace{-0.25 cm} \flag{\x} & {\small \y}
			\end{tabular}
			\end{table}		
		}
		\end{flushleft}
}}
\newcommand{\givenlanguages}{}

% -- settings: mcec skills --
\newcommand{\mcecskills}[1]{ 
	\renewcommand{\givenmcecskills}{
		\vspace{0.5cm} 
		\section{Skills}
		\begin{flushleft}
		\foreach [count=\i] \x in {#1} {\flag{\x} } 
		\end{flushleft}
}}
\newcommand{\givenmcecskills}{}


% -- settings: skills --
\newcommand\skills[1]{ 
\renewcommand{\givenskill}{
\noindent
\begin{tikzpicture}
\foreach [count=\i] \x/\y in {#1}
{

\draw[fill=maingrey,maingrey] (0,\i) rectangle (6,\i+0.4);
\draw[fill=white,maincolor](0,\i) rectangle (\y,\i+0.4);
\node [above right ] at (0,\i+0.4) {\x};
}
\end{tikzpicture}
}
}
\newcommand{\givenskill}{}

\newcommand\skillstext[1]{ 

\renewcommand{\giventextskill}{
\begin{flushleft}
\noindent
\foreach [count=\i] \x/\y in {#1}
{ 
\x$ \star $\y
}
\end{flushleft}
}
}

\newcommand{\giventextskill}{}


% ------------------------------
% -- settings: lists mcec --
% ------------------------------

% mcecllist (long list): [5]
% 	(1) job position / title school
%	(2) company name / school course
% 	(3) date (4) location (5) description
\newenvironment{mcecllist}{
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll} }
	{ \end{tabular*} }
\newcommand{\litem}[5]{
\hspace{1mm} \parbox[t]{11.5cm}{
	\textbf{\color{black} \large #1} \\
	\textbf{\color{black} \normalsize #2} \\
	\textbf{\color{grey} {\small #3} | {\footnotesize #4}}	
} \\
\vspace{5mm} \hspace{1mm} \parbox[t]{13.4cm}{ {\color{grey} \small #5} }
\\ }

% mcecslist (normal list): [4]
% 	(1) title certificate (2) link (3) code (4) date 
\newenvironment{mcecnlist}{
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll} }
	{ \end{tabular*} }
\newcommand{\nitem}[4]{
\vspace{5mm} \hspace{1mm} \parbox[t]{11.5cm}{
	\textbf{\color{black} \href{#2}{#1}} \\
	\textbf{\color{black} \normalsize #3} | \textbf{\color{grey} {\small #4}}		
} \\ }

% mcecslist (short list): [2]
% 	(1) date (2) title
\newenvironment{mcecslist}{
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll} }
	{ \end{tabular*} }
\newcommand{\sitem}[2]{
\vspace{0.1cm} \hspace{4pt} \color{grey} {\small #1}&\parbox[t]{12cm}{
	\textnormal{\color{black} \normalsize #2}
}\\}




% ------------------------------
% -- makeprofile --
% ------------------------------
\newcommand{\makeprofile}
{
% -- grey background --
\begin{tikzpicture}[remember picture, overlay]
   	 \node [rectangle, fill=asidecolor, anchor=north, minimum width=7cm, minimum height=8cm] (box) at (-3.8cm,1.6cm){};
\end{tikzpicture}

% -- left sidebar content --
\begin{textblock}{6}(0.5, 0.2)
\begin{flushleft}

	% -- print profile pic --
	\begin{tikzpicture}[x=\imagescale, y=-\imagescale]
    	    \node[anchor=north west, inner sep=5pt, outer sep=0pt] at (0,0) 
        	{\includegraphics[width=\imagewidth]{\givenprofilepic}};
	\end{tikzpicture}

	% -- print profile name --
	\begin{center}
		{\LARGE\givenname}
	\end{center}

	% -- print personal info --
	\vspace{0.5cm}	
	\givendate	
	\givenaddress
	\givenphones	
	\givenemails
	\givensite
	\givenlinkedin
	\givengithub
	\giventwitter

%	\givenabout
	
	\givenlanguages
	
	\givenmcecskills
	
%	\section{Skill}
%	\givenskill
%	\giventextskill
%	\noindent
%	\scriptsize
%	\noindent
	
\end{flushleft}
\end{textblock}
\vspace{-10pt}
}

% ------------------------------
% -- maketitlename --
% ------------------------------
\newcommand{\maketitlename}
{
% -- print profile name --
\begin{center}
	{\color{maincolor} \Huge\givenname}
\end{center}

% -- print job position --
\begin{center}
	{\color{grey} \Large\givenjob}
\end{center}
\vspace{5pt}
}




