{smcl}
{* *! version 0.1 2022-06-20}{...}
{vieweralsosee "[R] help" "mansection R help"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "help" "help help"}{...}
{vieweralsosee "SSC" "--"}{...}
{vieweralsosee "ihelp" "help ihelp"}{...}
{viewerjumpto "Syntax"      "xhelp##syntax"}{...}
{viewerjumpto "Description" "xhelp##description"}{...}
{viewerjumpto "Options"     "xhelp##options"}{...}
{viewerjumpto "Remarks"     "xhelp##remarks"}{...}
{viewerjumpto "Examples"    "xhelp##examples"}{...}
{viewerjumpto "Stored results" "xhelp##results"}{...}
{viewerjumpto "Author"      "xhelp##author"}{...}
{help xhelp_zh:中文版本}
{hline}
{p2colset 1 10 12 2}{...}
{p2col:{bf:xhelp} {hline 2}}
Tools to create and display translated help files
{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 4 37 2}
{cmd:xhelp} [{it:command-or-topic-name}] [{cmd:,}
  {opt non:ew} {opt name(viewername)} 
  {opt mark:er(markername)} {opt l:ang(version)} 
  {opt edit} {opt noihlp} {opt p:ersonal}]
{p_end}


{marker description}{...}
{title:Description}

{pstd}
The {cmd:xhelp} command provides some tools to {bf:create} and {bf:display} 
translated help files with two main modes:

{pstd}
In {it:edit mode}, {cmd:xhelp} finds, copies and renames the specified 
original (official) {it:command-or-topic-name} help file(s) into the current 
working directory or the PERSONAL adopath and then opens it/them with Do-file 
editor for your editing. You can translate the file(s) into target language 
(such as Chinese) while conveniently retaining the original formatting 
{help smcl:SMCL} directives.

{pstd}
In {it:view mode}, {cmd:xhelp} depends on the official command {bf:{help help}} 
to display help for the specified {it:command-or-topic-name}. {cmd:xhelp} 
just adds one extra option {opt l:ang(version)} to official {cmd:help}, 
allowing you to specify which version help file to display. When the specified 
{it:version} being unvailable, the fallback original version will be shown.


{marker options}{...}
{title:Options}

{dlgtab:View Mode}

{p 4 8 2}{opt non:ew} specifies that a new Viewer window not be opened for 
the help topic if a Viewer window is already open. The default is for a new 
Viewer window to be opened each time {cmd:help} is typed so that multiple 
help files may be viewed at once. {opt non:ew} causes the help file to be 
displayed in the topmost open Viewer.

{p 4 8 2}{opt name(viewername)} specifies that help be displayed in a 
Viewer window named {it:viewername}. If the named window already exists, 
its contents will be replaced. If the named window does not exist, it will 
be created.

{p 4 8 2}{opt mark:er(markername)} specifies that the help file be opened 
to the position of {it:markername} within the help file.

{p 4 8 2}{opt l:ang(version)} specifies which version help file to display. 
When not set, it is "{it:zh}" by default (for Chinese). {cmd:xhelp} 
calls the command {cmd:findfile} to find {it:command-or-topic-name_version.sthlp} 
along the {bf:{stata adopath:ADOPATH}} - when unvailable, the fallback 
original version will be shown instead.

{dlgtab:Edit Mode}

{p 4 8 2}{opt edit} switches on the {it:edit mode}. {cmd:xhelp} will find 
(via {cmd:findfile}) and copy the specified original (official) 
{it:command-or-topic-name} help file into the current working directory or 
the PERSONAL adopath as {it:command-or-topic-name_version.sthlp}, add some 
lines and then open it with Do-file editor for your further editing.

{p 4 8 2}{opt l:ang(version)} sets the version of help file you want to 
create and appends the specified "{it:_version}" to the new help file's 
name directly (i.e., {it:original-help-name_version.sthlp}). 
When not specified, it is "{it:zh}" by default.

{p 4 8 2}{opt noihlp} specifies that the {it:.ihlp} files INCLUDEd in the 
original {it:command-or-topic-name.sthlp} will not be found, copied and 
renamed into the current working directory or the PERSONAL adopath.

{p 4 8 2}{opt p:ersonal} specifies that the newly-created help files shall
be in the PERSONAL adopath. By default, it's in the current working directory.


{marker remarks}{...}
{title:Remarks}

{p 4 7 2}{ul:1. {it:View Mode}}:{p_end}

{p 8 10 2}
- You can use {cmd:xhelp} just like the official {cmd:help} in most 
cases. Options {opt non:ew}, {opt name(viewername)} and 
{opt mark:er(markername)} are supported and just passed through to 
{bf:{help help##options:help}}.
{p_end}

{p 8 10 2}
- When you type {cmd:xhelp {it:command-or-topic-name}}, Stata will search 
for {it:command-or-topic-name_zh.sthlp} (or some reasonable variations) along
the ADOPATH and display the found one. When not found, Stata will invoke 
{cmd:help {it:command-or-topic-name}} instead.
{p_end}

{p 8 10 2}
- You can type {cmd:xhelp {it:command-or-topic-name}, {opt l:ang(fr)}} to 
display the {it:fr} version help file of {it:command-or-topic-name}. When 
not found, Stata will invoke {cmd:help {it:command-or-topic-name}} instead.
{p_end}

{p 4 7 2}{ul:2. {it:Edit Mode}}:{p_end}

{p 8 10 2}
- You shall set option {opt edit} explicitly to switch on the {it:edit mode}. 
The {it:edit mode} is from which {cmd:xhelp} gets its {cmd:x} upon {cmd:help}.
{p_end}

{p 8 10 2}
- When you type {cmd:xhelp {it:command-or-topic-name}, edit}, Stata will search 
for {it:command-or-topic-name.sthlp} (or some reasonable variations) along
the ADOPATH. If found, copy it into the current working directory, rename it  
to {it:command-or-topic-name_zh.sthlp}, add some lines and open it in the 
Do-file editor for your further manual editing (and translating, of course).
{p_end}

{p 8 10 2}
- You can add adequate option(s) {opt l:ang(version)}, {opt noihlp} or 
{opt p:ersonal} to the bare {cmd:xhelp {it:command-or-topic-name}, edit}, 
so as to modify its default behavior.
{p_end}


{marker examples}{...}
{title:Examples}

{phang}{cmd:. }{bf:{stata xhelp}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp help}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp import excel}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp help, l(CN)}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp importing}}{p_end}
{phang}{cmd:. xhelp su, edit}{space 9} // edit mode, don't run {p_end}
{phang}{cmd:. xhelp import excel, edit}{space 2} // edit mode, don't run {p_end}
{phang}{cmd:. xhelp sum(), edit l(zh_CN)}{space 2} // edit mode, don't run {p_end}
{phang}{cmd:. xhelp f_strpos, edit noihlp p}{space 2} // edit mode, don't run {p_end}


{marker results}{...}
{title:Stored results}

{p 4 8 2}{cmd:xhelp} stores nothing.


{marker author}{...}
{title:Author}

{pstd}Yongyi Zeng{p_end}
{pstd}zzyy@xmu.edu.cn{p_end}

{pstd}School of Management{p_end}
{pstd}Xiamen University{p_end}
{pstd}China, PR.{p_end}

{.-}
{pstd}version 0.1 @ 2022-06-20{p_end}
{center:{c 169} 2022 YongyiZeng}
