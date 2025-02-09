{smcl}
{* *! version 1.2.5  19oct2017}{...}
{vieweralsosee "[FN] 字符串函数" "mansection FN Stringfunctions"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "help functions" "help functions"}{...}
{vieweralsosee "help string functions" "help string_functions"}{...}
{vieweralsosee "help ustrpos()" "help f_ustrpos"}{...}
{viewerjumpto "函数" "f_strpos_zh##functions"}{...}
{viewerjumpto "说明" "f_strpos_zh##remarks"}{...}
{help f_strpos:English Version}
{hline}
{p2colset 1 26 28 2}{...}
{p2col:{bf:[FN] 字符串函数}}
{p_end}
{p2col:({mansection FN Stringfunctions:参见PDF手册词条的完整信息})}{p_end}
{p2colreset}{...}


{marker functions}{...}
{title:函数}

INCLUDE help f_strpos_zh

INCLUDE help f_strrpos_zh


{marker remarks}{...}
{title:说明}

{pstd}
基于字符而非字节的搜索需使用函数 {helpb ustrpos()} 和 {helpb ustrrpos()}。
{p_end}

{.-}
{center:v1.0 2022-06-29, YongyiZeng (厦门大学管理学院, zzyy@xmu.edu.cn)}
{center:翻译自Stata官方帮助文档 <f_strpos.sthlp>}
