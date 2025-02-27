%
%   This is file `shnuthesis.cls',
%	@author andy123t
% 	@date 2021/03/12
%	@version v1.6.0
%	@address https://github.com/andy123t/shnuthesis
%   This template is based on HUSTPaperTemp
%

% ---------- 定义的新的Class ----------
\ProvidesClass{shnuthesis}[2021/03/12 v1.6.0]
\NeedsTeXFormat{LaTeX2e}


% ---------- 载入学校logo ----------
\def\logopic{shnu.eps}   %logo
\DeclareOption{SHNULogo} {
	\def\logopic{shnu.eps}
}
\ProcessOptions\relax


% ---------- 载入Class ----------
\LoadClass[a4paper,openany,twoside]{book}


% ---------- 中文字体宏包 ----------
\RequirePackage[cs4size,UTF8]{ctex}


% --------- 定义不同编译方式 ----------
\RequirePackage{ifpdf,ifxetex}
\ifxetex
  \RequirePackage{fontspec}
  \RequirePackage{graphicx}
\else
  \ifpdf
  	\usepackage[utf8]{inputenc}
  	\RequirePackage[T1]{fontenc}
    \RequirePackage{graphicx}
    \RequirePackage{epstopdf}
  \else
    \RequirePackage[dvipdfmx]{graphicx}
    \RequirePackage{bmpsize}
  \fi
\fi


% ---------- 定义页边距 ----------
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2.5cm,top=1.7cm,bottom=1.8cm,includehead,includefoot}
\setlength{\headheight}{15pt}
%\addtolength{\headsep}{-0.1cm}     % 页眉位置
%\addtolength{\footskip}{-0.1cm}    % 页脚位置

% ---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}  % AMS公式
\RequirePackage{bm}         % 数学公式黑斜体
\RequirePackage{mathrsfs}   % 数学英文花体
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{cite}
\RequirePackage{longtable}  % 长表格
\RequirePackage{multirow}   % 表格多行合并
\RequirePackage{enumerate}  % 改变列表标号样式
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{tikz}       % 绘制图形
\RequirePackage{titlesec}   % 设置标题样式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{xstring}    % 使用条件语句


% --------设置图片的路径 ---------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}


% ---------- 定义章节的编号格式 ----------
\renewcommand{\chaptername}{第\arabic{chapter}章}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}.}


\newcommand{\chpzihao}{\fontsize{20pt}{20pt}\selectfont}

%---------- 定义章节标题格式 ------------
\titleformat{\chapter}[hang]{\normalfont \chpzihao \filcenter \heiti}
    {\chpzihao \chaptertitlename}{20pt}{\chpzihao}
\titlespacing{\chapter}{0pt}{-1.5ex  plus .1ex minus .2ex}{3ex plus .1ex minus .2ex}

\titleformat{\section}[hang]{\heiti \large}
    {\zihao{-3} \thesection}{1em}{\zihao{-3}}
\titlespacing{\section}{0pt}{1.5ex plus .1ex minus .2ex}{1.5ex plus .1ex minus .2ex}

\titleformat{\subsection}[hang]{\heiti \normalsize}
    {\zihao{4} \thesubsection}{1em}{\zihao{4}}
\titlespacing{\subsection}%
    {0pt}{1.5ex plus .1ex minus .2ex}{\wordsep}

\titleformat{\subsubsection}[hang]{\heiti}
    {\thesubsubsection }{1em}{}{}
\titlespacing{\subsubsection}%
    {0pt}{1.2ex plus .1ex minus .2ex}{\wordsep}


%---------- 设置章节目录的深度 -------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2} 


% ------------- 设置附录 -----------
\RequirePackage{titletoc}
\RequirePackage[title,titletoc]{appendix}
%\renewcommand{\appendixname}{附录}

%-------------- 定义页眉页脚 -------------------

% 定义页眉和页脚 使用fancyhdr 宏包
\newcommand{\makeheadrule}{%
%    \makebox[-3pt][l]{\rule[.7\baselineskip]{\headwidth}{0.4pt}}
%   \rule[0.85\baselineskip]{\headwidth}{1.5pt}\vskip-.8\baselineskip}		%注释内容为页眉双线代码
	\rule[0.7\baselineskip]{\headwidth}{0.4pt}}		%页眉单线代码
	

\makeatletter
\renewcommand{\headrule}{%
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
     \makeheadrule}}

% ------------ 画单隔线 ------------
%\renewcommand{\headrulewidth}{0.5pt}    % 在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。


% ------------ 设置页眉样式 -----------
\newcommand{\headstyle}{
	% \fancyhead[R]{\color{black}\fangsong \leftmark}
	% \fancyhead[L]{\color{black} 上海师范大学硕士学位论文}
	\fancyhead[RO,LE]{\color{black}\zihao{5} \leftmark}
	\fancyhead[LO,RE]{\color{black} \zihao{5} 上海师范大学硕士学位论文}
	% \fancyhead[L]{\fangsong \zihao{5} 上海师范大学硕士论文}
}


% ------- 设置页脚样式 ----------
\newcommand{\footstyle}{\fancyfoot[C]{\fangsong \thepage}}
\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle


% ------ 定义一种新的格式叫做main ------------
\fancypagestyle{main}{%
    \pagestyle{fancyplain} 
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}


\renewcommand\chaptermark[1]{%
  \markboth{%
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \@chapapp\ \ %
      \fi
    \fi
    #1}{}%
}


% ----------- 中文段落缩进和行距 ------------
\setlength{\parindent}{2em}                 % 首行两个汉字的缩进量
%\setlength{\parskip}{3pt}  % 段落之间的竖直距离
\renewcommand{\baselinestretch}{1.35}        % 定义行距
\headsep=6pt
%\topskip=5pt   % 书写区域顶部空白
%\parskip=5pt
%\parindent=0pt
%\baselineskip=5pt
%\setlength{\baselineskip}{24pt}


% ------------------- 浮动对象设置 ---------------------
% 浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面
% 也可以防止在很大空白的浮动页上放置很小的图形
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% ---------------- 设置图表格式 ---------------

\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}



% --------- 定制图形和表格标题的样式 --------------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{0pt}
\setlength{\floatsep}{10pt plus 3pt minus 2pt}
\setlength{\intextsep}{10pt}
\setlength{\abovecaptionskip}{2pt plus1pt minus1pt}
\setlength{\belowcaptionskip}{3pt plus1pt minus2pt}
%\setlength{\itemsep}{3pt plus1pt minus2pt}


% ----- 重新设置图表autoref -------
\newcommand{\figureautorefname}{图}
\newcommand{\tableautorefname}{表}


% --- 使用tabularx库并定义新的左右中格式 ----
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

% ------------ 设置三线表格式 ------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}


% -------- 重新定义图和表的浮动环境 ---------
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}


%------------- 数学定理设置 ---------------
\theoremstyle{plain} 
\newtheorem{definition}{\heiti 定义}[chapter]
\newtheorem{proposition}{\heiti 命题}[chapter]
\newtheorem{lemma}{\heiti 引理}[chapter]
\newtheorem{theorem}{\heiti 定理}[chapter]
\newtheorem{example}{\heiti 例子}[chapter]
\newtheorem{corollary}{\heiti 推论}[chapter]
\newtheorem{remark}{\heiti 注}[chapter]
\renewcommand{\proofname}{\heiti 证明}
%\renewcommand{\qedsymbol}{$\blacksquare$}
%\newtheorem{algorithm}{算法}
%\newtheorem{axiom}{公理}
%\newtheorem{property}{性质}
%\newtheorem{assumption}{假设}


% -------------- 数学公式设置 ---------------
\allowdisplaybreaks[4]   % \eqnarray 如果很长，影响分栏、换行和分页

% ----- 设置公式间距为零 ------
\AtBeginDocument{
	\setlength{\abovedisplayskip}{4pt}
	\setlength{\belowdisplayskip}{4pt}
	\setlength{\abovedisplayshortskip}{2pt}
	\setlength{\belowdisplayshortskip}{2pt}
	\setlength{\arraycolsep}{2pt}   % array中列之间空白长度
}

% ------- 公式编号带章节 ----------
%\numberwithin{equation}{chapter}

% 重新设置公式autoref
\newcommand{\equationautorefname}{等式}


% ---- 定义列表项的样式 -----

\RequirePackage{enumitem}
%\setlist{noitemsep}
\setitemize{itemsep=3pt}


%------------- 定义新的标题页面 -------------------

% ------ 添加几个新的文档属性 ------
\def \defschool {}
\def \defcollege {}
\def \defmajor {}
\def \defstudy {}
\def \defstunum {}
\def \definstructor {}
\def \defclassifnum {}
\newcommand{\school}[1]{\def \defschool {#1}}
\newcommand{\college}[1]{\def \defcollege {#1}}
\newcommand{\major}[1]{\def \defmajor {#1}}
\newcommand{\study}[1]{\def \defstudy {#1}}
\newcommand{\stunum}[1]{\def \defstunum {#1}}
\newcommand{\instructor}[1]{\def \definstructor {#1}}
\newcommand{\classifnum}[1]{\def \defclassifnum {#1}}

% ------- 重置命令 maketitle -------
\renewcommand{\maketitle}[1][15em]{
	\begin{titlepage}
		\begin{center}
			{\zihao{5} 学校代码：10270  \hspace{2cm} 分类号：\defclassifnum \hspace{2cm} 学号：\defstunum} \\
			\vspace{2.4cm}
			\includegraphics[width=10cm]{\logopic}\\
			\vspace{1cm}
			{\fontsize{40}{40}\selectfont 硕~士~学~位~论~文}\\ %\bfseries
			\vspace{1.8cm}
			\begin{center}
			\parbox[t]{15cm}{\centering \zihao{1} \heiti \@title}
			\end{center}
			\vspace{1.2cm}
			{\zihao{3} \heiti
				\renewcommand\arraystretch{1.6}
				\begin{tabular}{lc}
					\makebox[7em][s]{学 \hfill 院~：} & 
					\underline{\makebox[#1]{\defcollege}} \\
					\makebox[7em][s]{专 \hfill 业~：} & 
					\underline{\makebox[#1]{\defmajor}} \\
					\makebox[7em][s]{研 \hfill 究 \hfill 方 \hfill 向~：} & 
					\underline{\makebox[#1]{\defstudy}} \\
					\makebox[7em][s]{研 \hfill 究 \hfill 生 \hfill 姓 \hfill 名~：} & 
					\underline{\makebox[#1]{\@author}} \\
					\makebox[7em][s]{指 \hfill 导 \hfill 教 \hfill 师~：} &
					\underline{\makebox[#1]{\definstructor}} \\
					\makebox[7em][s]{完 \hfill 成 \hfill 日 \hfill 期~：} &
					\underline{\makebox[#1]{\@date}} \\
				\end{tabular}}\\
		\end{center}
	\end{titlepage}
}



% ------------ 定义新的声明页面 --------------

% 定义三个条件语句
% \newcommand{\encryption}[1]{
% 	\IfStrEqCase{#1}{{empty}{$\square$}
% 		{true}{$\text{\rlap{\checkmark}}\square$ }
% 		{false}{$\square$}}
% 	[$\square$]
% }
% \newcommand{\nonencryption}[1]{
% 	\IfStrEqCase{#1}{{empty}{$\square$}
% 		{true}{$\square$}
% 		{false}{$\text{\rlap{\checkmark}}\square$}}
% 	[$\square$]
% }
% \newcommand{\encryptionyear}[2]{
% 	\IfStrEqCase{#1}{{empty}{}
% 		{true}{#2}
% 		{false}{}}
% }


% ----------- 设置命令 ------------
\newcommand{\makestatement}{
	\clearpage
	\thispagestyle{empty}
	\vspace*{-4ex}

	\begin{center}
	{\heiti \zihao{4} 论文独创性声明}
	\end{center}
	\vspace{6ex}

	\begin{spacing}{1.5}
	本论文是我个人在导师指导下进行的研究工作及取得的研究成果。论文中除了特别加以标注和致谢的地方外，不包含其他人或机构已经发表或撰写过的研究成果。其他同志对本研究的启发和所做的贡献均己在论文中做了明确的声明并表示了谢意。
	\end{spacing}
	\vspace{12ex}

	\rightline{作者签名：\hspace{10em} 日\hspace{1em}期：\hspace{8em}}
	\vspace{25ex}
	
	\begin{center}
	{\heiti \zihao{4} 论文使用授权声明}
	\end{center}
	\vspace{6ex}

	\begin{spacing}{1.5}
	本人完全了解上海师范大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被査阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其它手段保存论文。保密的论文在解密后遵守此规定。
	\end{spacing}
	\vspace{12ex}
	
	\rightline{作者签名：\hspace{9em} 导师签名：\hspace{8em}}
	\vspace{1ex}

	\rightline{日\hspace{2em}期：\hspace{9em} 日\hspace{2em}期：\hspace{8em}}
	
	\clearpage
}



% ------------------ 中文摘要环境 -------------
\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1}
%	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{摘~要}
	\chaptermark{摘~~要}
	%\vspace*{-2ex}
	\begin{center} \heiti \chpzihao 摘~~~要 \end{center}
	\vspace{3ex}
}{
	\vspace{2ex}
	{\noindent \heiti 关键词：} \cnkeyword
	\clearpage
}


% ----------------- 英文摘要环境 ----------------
\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
%	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\chaptermark{Abstract}
	%\vspace*{-3ex}
	\begin{center} \chpzihao \bfseries Abstract \end{center} 
	\vspace{3ex}
}{
	\vspace{2ex}
	{\noindent \bfseries Key Words: } \enkeyword
	\clearpage
}



% ------------- 定义新的目录页面 ----------------
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor  = black,
	citecolor = black
} % 去掉目录红框
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{1.5ex}
\setlength{\cftaftertoctitleskip}{5ex}
\renewcommand{\cftchapfont}{\songti}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftsecfont}{\songti}   % 设置Section字体
\renewcommand{\cftsecdotsep}{\cftdotsep}  % 设置Section引导点
% \renewcommand\cftbeforechapskip{2ex}
\renewcommand{\cftbeforesecskip}{0.5ex} % 设置Part字体
\renewcommand*\ttl@chapterout{\typeout{\CTEXthechapter}}

% 使用条件语句
\RequirePackage{xstring}

% 定义两个新语句
% 第一个语句更改fancyhdr样式
\newcommand{\plainfooterstyle}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{\footstyle}
		{pagenumtoc}{\footstyle}}
}
% 第二个语句在目录中添加目录标签
\newcommand{\addtoctotoc}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{}
		{pagenumtoc}{\phantomsection
			\addcontentsline{toc}{chapter}{目~录}}}
}


% ----------- 设置新的生成目录命令 -------------
\let \oldtableofcontens \tableofcontents
\newcommand{\maketoc}[1][nopagenum]{
	% 修改hdr原plain格式
	\fancypagestyle{plain}{%
		\fancyhf{} %清空原有样式
		\headstyle
		\plainfooterstyle{#1}
	}
	% 设置目录hdr和页码选项
	\clearpage
	\pagestyle{plain}
	\addtoctotoc{#1}
	\tableofcontents
	\clearpage
	\pagestyle{main}
}



% ---------- 定义新的致谢环境 -----------
\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{致谢}
	\chapter*{致谢}
	%\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
	\chaptermark{致谢}
}{
	\clearpage
}



% ----------- 重新定义参考文献页 -----------
%\bibliographystyle{plain}
\ctexset{bibname={参考文献}}

% 设置新的附录命令
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	% 添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{参考文献}
	\oldbibliography{#1}
}



% ---------- 定义新的环境研究成果页 -----------
\newenvironment{researchpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{攻读硕士学位期间的研究成果}
	\chapter*{攻读硕士学位期间的研究成果}
	\chaptermark{攻读硕士学位期间的研究成果}
}{
	\clearpage
}


% End of file `shnuthesis.cls'.

