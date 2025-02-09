{smcl}
{* *! version 2.2.5  19oct2017}{...}
{findalias asgsmviewer}{...}
{findalias asgsuviewer}{...}
{findalias asgswviewer}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help_zh"}{...}
{vieweralsosee "[R] net" "help net"}{...}
{vieweralsosee "net_mnu" "net_mnu"}{...}
{vieweralsosee "[R] news" "help news"}{...}
{vieweralsosee "[R] search" "help search"}{...}
{vieweralsosee "searchadvice" "searchadvice"}{...}
{vieweralsosee "[R] update" "help update"}{...}
{vieweralsosee "[R] view" "help view"}{...}
{stata help:English Version}
{hline}
{title:关于获取帮助的建议}

{pstd}
Stata 官方提供大约3000份的帮助文档和14000页的PDF手册，不管你想要用 Stata
来做点什么，很有可能这些文档已经提供并解释相关的信息。上述文档包含示例代码，
可在官方数据集上直接运行。

{pstd}
不管你的问题是什么，请先尝试如下步骤：

{p 4 7 2}1. 从Stata菜单中选择 {bf:帮助} 然后点击 {bf:搜索...}。

{p 4 7 2}2. 在搜索框中键入你感兴趣的关键词，如 “logistic regression”。

{p 4 7 2}3. 仔细查看搜索返回的资源列表，其中包括帮助文档、常见问题、
            Stata Journal 的文章以及其它资源。

{p 4 7 2}4. 根据描述选择看起来最有用的资源，通常就是官方的帮助文档，其中
            包含文字 “(help <xyz>)”（在上述例子中为“(help {help logistic})”，
			此时你可点击蓝色链接“logistic”）。

{p 4 7 2}5. 假如你在前一步骤中选择点击链接“(help {help logistic})”，
            你对帮助文档开头部分的命令语法可能并不感兴趣，而想看看相关示例。
            从浏览器右上角菜单栏中选择 {bf:跳转到}（{it:Jump To}） 并点击
            {bf:示例}（{it:Example}），你将看到可直接运行于示例数据集的示例命令。
            将这些命令直接复制-粘贴到 Stata 命令窗口中运行就会看到相应的结果。

{p 4 7 2}6. 如果你并不熟悉 {cmd:logistic} 命令，想要关于logistic回归的概览和对
            示例的讨论，你可选择 {bf:另见} （{it:Also See}）菜单并点击PDF图标
            标识的链接 {mansection R logistic:[R] logistic} （或者点击帮助文档
            标题下的蓝色链接 ({manlink R logistic})，关于 {cmd:logistic} 命令的
            PDF文档会在操作系统默认的PDF浏览器中打开。

{p 4 7 2}7. PDF文档包含许多对Stata专家和新手来说都非常有用的资料。和帮助文档一样，
            你通常想从 {it:Remarks and examples}（{it:说明与示例}） 部分开始（
            此时，你只需点击 {cmd:logistic} 词条开头处给出的链接
			{mansection R logisticRemarksandexamples:Remarks and examples}）。
			在这部分中，你会看到对 {cmd:logistic} 命令的完整讨论和对运行于示例
			数据集相关代码及其结果的详细解释。至此，你已准备好“依样画葫芦”将 
            {cmd:logistic} 命令应用于自身的数据集上。

{pstd}
如果上述步骤无助于解决问题，你还可尝试其它很多 Stata 资源（参见
{help resources_zh:进一步了解Stata的相关资源}）。
{p_end}

{.-}
{center:v1.0 2022-06-24, YongyiZeng (厦门大学管理学院, zzyy@xmu.edu.cn)}
{center:翻译自Stata官方帮助文档<help_advice.sthlp>}
