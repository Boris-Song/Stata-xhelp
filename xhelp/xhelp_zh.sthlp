{smcl}
{* *! version 0.1 2022-06-20}{...}
{vieweralsosee "[R] help" "mansection R help"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "help" "help help_zh"}{...}
{vieweralsosee "SSC" "--"}{...}
{vieweralsosee "ihelp" "help ihelp_cn"}{...}
{viewerjumpto "语法" "xhelp_zh##syntax"}{...}
{viewerjumpto "描述" "xhelp_zh##description"}{...}
{viewerjumpto "选项" "xhelp_zh##options"}{...}
{viewerjumpto "说明" "xhelp_zh##remarks"}{...}
{viewerjumpto "示例" "xhelp_zh##examples"}{...}
{viewerjumpto "保存结果" "xhelp_zh##results"}{...}
{viewerjumpto "作者" "xhelp_zh##author"}{...}
{help xhelp:English Version}
{hline}
{p2colset 1 10 12 2}{...}
{p2col:{bf:xhelp} {hline 2}}
创建与展示翻译版帮助文档的工具
{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:语法}

{p 4 28 2}
{cmd:xhelp} [{it:命令或主题名}] [{cmd:,}
  {opt non:ew} {opt name(浏览窗名)} 
  {opt mark:er(书签名)} {opt l:ang(语言版本)} 
  {opt edit} {opt noihlp} {opt p:ersonal}]
{p_end}


{marker description}{...}
{title:描述}

{pstd}
{cmd:xhelp}命令提供{bf:创建}和{bf:展示} Stata 翻译版帮助文档的工具，主要有两种
工作模式：

{pstd}
在 {it:编辑模式} 中，{cmd:xhelp} 搜索指定的原始（官方）帮助文档，将其复制到
当前工作目录或命名为PERSONAL的ADO文档路径中，重命名并在do文件编辑器中打开供编辑，
方便你在将该文档翻译为目标语言（如中文）时保留原始帮助文档的 {help smcl:SMCL} 
的格式化标签。

{pstd}
在 {it:展示模式} 中，{cmd:xhelp} 依赖官方命令 {bf:{help help}} 来展示相应
命令或主题的帮助文档。{cmd:xhelp} 增加一个额外选项 {opt l:ang(语言版本)}，用来
设定所展示帮助文档的版本。当找不到指定语言版本时就展示后备原始版本的帮助文档。


{marker options}{...}
{title:选项}

{dlgtab:展示模式{space 4}}

{p 4 8 2}{opt non:ew} 设定在浏览窗口已经打开的情况下无需新开一个窗口，
帮助文档将直接展示在最上层的浏览窗口中。{cmd:help} 命令的默认选项为每次键入 
{cmd:help}都会打开一个新的浏览窗口，默认设定允许同时浏览多份帮助文档。

{p 4 8 2}{opt name(浏览窗名)} 设定帮助文档在名为 {it:浏览窗名}
的浏览窗口中展示。如果指定名称的浏览窗口已经存在，其展示内容将被替换；
反之则创建该浏览窗口。

{p 4 8 2}{opt mark:er(书签名)} 设定在打开帮助文档时直接跳转至文档内指定
{it:书签名} 所在的位置。

{p 4 8 2}{opt l:ang(语言版本)} 指定展示帮助文档的语言版本，默认为
“{it:zh}”（即中文版）。{cmd:xhelp} 调用 {cmd:findfile} 命令沿着 
{bf:{stata adopath:ADO文档路径}} 搜索帮助文档 {it:命令或主题名_语言版本.sthlp}。
如果未能找到指定语言版本的帮助文档，就展示原始版本的帮助文档。

{dlgtab:编辑模式{space 4}}

{p 4 8 2}{opt edit} 启动 {it:编辑模式}。{cmd:xhelp}（借助 {cmd:findfile} 
命令）找到指定名为 {it:命令或主题名} 的原始（官方）帮助文档，将其复制到当前工作
目录或命名为PERSONAL的ADO文档路径中，重命名为 {it:命令或主题名_语言版本.sthlp}，
增加若干行内容，并在do文件编辑器中打开供你进一步的编辑修改。

{p 4 8 2}{opt l:ang(语言版本)} 设定想要创建帮助文档的语言版本并将其直接附加在
新帮助文档的文件名中（如 {it:命令或主题名_语言版本.sthlp}）。如果未设定该选项，
其默认取值为“{it:zh}”（即中文版）。

{p 4 8 2}{opt noihlp} 指定无需搜索、复制并重命名包含（{it:INCLUDE}）在原始
帮助文档 {it:命令或主题名.sthlp} 中的 {it:.ihlp} 类型文档到当前工作目录或
命名为PERSONAL的ADO文档路径中。

{p 4 8 2}{opt p:ersonal} 设定新语言版本帮助文档要复制到命名为PERSONAL的
ADO文档路径中。在默认情况下，新语言版本帮助文档复制至当前工作目录。


{marker remarks}{...}
{title:说明}

{p 4 7 2}{ul:1. {it:展示模式}}:{p_end}

{p 8 10 2}
- 在大多数情况下，你可像使用官方命令 {cmd:help} 那样使用 {cmd:xhelp}。
{cmd:xhelp} 也支持选项 {opt non:ew}、{opt name(浏览窗名)} 和
{opt mark:er(书签名)} 并将这些选项直接传递给 {bf:{help help_zh##options:help}}。
{p_end}

{p 8 10 2}
- 当你输入命令 {cmd:xhelp {it:命令或主题名}} 时，Stata将沿着ADO文档路径搜索
帮助文档 {it:命令或主题名_zh.sthlp}（或其它合理变形）并展示找到的帮助文档。
如果未能找到，Stata将转而调用命令 {cmd:help {it:命令或主题名}}。
{p_end}

{p 8 10 2}
- 你可以输入命令 {cmd:xhelp {it:命令或主题名}, {opt l:ang(fr)}} 来展示
{it:命令或主题名} 帮助文档的 {it:fr} 版本。如果未能找到，Stata将转而调用命令 
{cmd:help {it:命令或主题名}}。
{p_end}

{p 4 7 2}{ul:2. {it:编辑模式}}:{p_end}

{p 8 10 2}
- 你需要通过明确设定选项 {opt edit} 来进入 {it:编辑模式}。存在 {it:编辑模式}
是 {cmd:xhelp} 命令相比于官方命令 {cmd:help} 多个 {cmd:x} 的关键原因。
{p_end}

{p 8 10 2}
- 当你输入命令 {cmd:xhelp {it:命令或主题名}, edit} 时，Stata将沿着ADO文档路径
搜索帮助文档 {it:命令或主题名.sthlp}（或其它合理变形）。一旦找到就将其复制为
{it:命令或主题名_zh.sthlp} 并在do文件编辑器中打开该文档供你进一步的编辑（翻译）。
{p_end}

{p 8 10 2}
- 你可以通过给上述语句 {cmd:xhelp {it:命令或主题名}, edit} 增加恰当的
选项（如 {opt l:ang(string)}、{opt noihlp} 或者 {opt p:ersonal}）来调整其
默认行为。
{p_end}


{marker examples}{...}
{title:示例}

{phang}{cmd:. }{bf:{stata xhelp}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp help}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp import excel}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp help, l(CN)}}{p_end}
{phang}{cmd:. }{bf:{stata xhelp importing}}{p_end}
{phang}{cmd:. xhelp su, edit}{space 9} // 编辑模式，请勿运行 {p_end}
{phang}{cmd:. xhelp import excel, edit}{space 2} // 编辑模式，请勿运行 {p_end}
{phang}{cmd:. xhelp sum(), edit l(zh_CN)}{space 2} // 编辑模式，请勿运行 {p_end}
{phang}{cmd:. xhelp f_strpos, edit noihlp p}{space 2} // 编辑模式，请勿运行 {p_end}


{marker results}{...}
{title:保存结果}

{p 4 8 2}{cmd:xhelp} 并未返回结果。


{marker author}{...}
{title:作者}

{pstd}Yongyi Zeng{p_end}
{pstd}zzyy@xmu.edu.cn{p_end}

{pstd}School of Management{p_end}
{pstd}Xiamen University{p_end}
{pstd}China, PR.{p_end}

{.-}
{pstd}version 0.1 @ 2022-06-20{p_end}
{center:{c 169} 2022 YongyiZeng}

