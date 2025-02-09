{smcl}
{* *! version 1.2.3  19oct2017}{...}
{viewerdialog help "help_d"}{...}
{vieweralsosee "[R] help" "mansection R help"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "help advice" "help help_advice_zh"}{...}
{vieweralsosee "[R] net search" "help net_search"}{...}
{vieweralsosee "[R] search" "help search"}{...}
{viewerjumpto "语法" "help_zh##syntax"}{...}
{viewerjumpto "菜单" "help_zh##menu"}{...}
{viewerjumpto "描述" "help_zh##description"}{...}
{viewerjumpto "PDF文档链接" "help_zh##linkspdf"}{...}
{viewerjumpto "选项" "help_zh##options"}{...}
{viewerjumpto "说明" "help_zh##remarks"}{...}
{viewerjumpto "视频示例" "help_zh##video"}{...}
{help help:English Version}
{hline}
{p2colset 1 13 15 2}{...}
{p2col:{bf:[R] help} {hline 2}}在 Stata 中展示帮助信息
{p_end}
{p2col:}({mansection R help:参见PDF手册词条的完整信息}){p_end}
{p2colreset}{...}


{hline}

{title:Stata的帮助系统}

{pstd}
Stata用户可通过几种方式获得帮助，进一步信息请参见 
{help help_advice_zh:关于获取帮助的建议}。

{pstd}
以下是关于Stata命令 {cmd:help} 的技术细节。

{hline}

{marker syntax}{...}
{title:语法}

{p 8 14 2}
{cmdab:h:elp} [{it:命令或主题名}] [{cmd:,}
{opt non:ew}
{opt name(浏览窗名)}
{opt mark:er(书签名)}]


{marker menu}{...}
{title:菜单}

{phang}
{bf:帮助 > Stata命令...}


{marker description}{...}
{title:描述}

{pstd}
{cmd:help} 命令展示指定命令或主题的帮助信息。{cmd:help} 开启一个新的浏览窗口
来展示指定命令或主题的帮助文档（Unix系统在控制台中展示帮助信息）。如果直接调用 
{cmd:help} 而未指定命令或主题名，Stata将展示使用帮助系统和帮助文档的建议。


{marker linkspdf}{...}
{title:PDF文档链接}

        {mansection R helpRemarksandexamples:说明与示例}

{pstd}
上述部分的内容并未包含在此帮助文档中。


{marker options}{...}
{title:选项}

{phang}
{opt nonew}：设定在浏览窗口已经打开的情况下无需新开一个窗口，帮助文档
将直接展示在最上层的浏览窗口中。{cmd:help} 命令的默认选项为每次键入
{cmd:help}都打开一个新的浏览窗口，默认设定允许同时浏览多份帮助文档。

{phang}
{opt name(浏览窗名)}：设定帮助文档在名为 {it:浏览窗名} 的浏览窗口中展示。
如果指定名称的浏览窗口已经存在，其展示内容将被替换；反之则创建该浏览窗口。

{phang}
{opt marker(书签名)}：设定在打开帮助文档时直接跳转至文档内指定 {it:书签名}
所在的位置。


{marker remarks}{...}
{title:说明}

{pstd}
为了获取关于Stata命令的帮助，可在命令窗口中键入运行 {cmd:help} {it:命令名} 
或者依次点击Stata菜单 {bf:帮助 > Stata命令...} 然后指定 {it:命令名}。

{pstd}
示例是讲解 {cmd:help} 命令的最佳方式：

{p2colset 11 47 49 2}{...}
{p2col 9 45 49 2:获取关于 ... 的帮助信息}键入并运行{p_end}
{p2col:{cmd:regress}}{cmd:help regress}{p_end}
{p2col:{cmd:regress}估计后工具命令}{cmd:help regress postestimation}{p_end}
{p2col:}或者 {cmd:help regress post}{p_end}
{p2col:作图命令选项 {cmd:xlabel()}}{cmd:help graph xlabel()}{p_end}
{p2col:Stata函数 {cmd:strpos()}}{cmd:help strpos()}{p_end}
{p2col:Mata函数 {cmd:optimize()}}{cmd:help mata optimize()}{p_end}
{p2colreset}{...}

{pstd}
小贴士

{phang2}
o {cmd:help} 展示使用帮助系统和帮助文档的建议。

{phang2}
o {cmd:help guide} 展示 Stata 基本概念的目录及其链接。

{phang2}
o {cmd:help estimation commands} 展示全部 Stata 估计命令的字母序列表及其链接。

{phang2}
o {cmd:help functions} 展示 Stata 函数的分类目录及其链接。

{phang2}
o {cmd:help mata functions} 展示 Mata 函数的分类目录及其链接。

{phang2}
o {cmd:help ts glossary} 展示时间序列手册的词汇表（其它专门手册可依此类推）。

{pstd}
如果你键入 {cmd:help} {it:主题} ，但 Stata 却未能找到 {it:主题} 的帮助文档，
此时，Stata 将自动搜索 {it:主题}。

{pstd}
例如，你在命令窗口中试着键入 {cmd:help forecasting} ，由于未能找到关于
forecasting 的帮助文档，Stata 将执行命令 {cmd:search forecasting} 
并在浏览器窗口中展示搜索结果。

{pstd}
关于如何使用 {cmd:help} 命令的完整说明请参见用户指南手册之 {findalias frhelp}
（{it:[U] 4 Stata的帮助和搜索功能}）。
{p_end}


{marker video}{...}
{title:视频示例}

{phang}
{browse "http://www.youtube.com/watch?v=UpXNMeTzmuI":Stata帮助快速入门}
{p_end}

{.-}
{center:v1.0 2022-06-20, YongyiZeng (厦门大学管理学院, zzyy@xmu.edu.cn)}
{center:翻译自Stata官方帮助文档 <help.sthlp>}
