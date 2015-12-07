# Master_Degree_courses

**说明：**

本项目是我硕士研究生期间部分课程的作业的合集。

你使用本作品内任何内容均须遵守知识共享 署名-非商业性使用-相同方式共享 4.0 国际 许可协议。
要查看该许可协议，可访问
http://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh
或者写信到
Creative Commons, PO Box 1866, Mountain View, CA 94042, USA。
除非，你是__借鉴__本项目的内容来完成作业。
__请诚信地完成你的学业！无论你喜欢你的课程与否，抄作业都是错误的！__

__再次强调！抄作业是错误的！__

## 内容介绍 ##

文档源码的目录结构如下：

    |-- README.md                      # 本文档
    |-- finite_element_method          # 《地球物理中的有限单元法》的磁场延拓程序
    |-- Fortran                        # 《Fortran语言编程》的作业和考试答案
    |-- inversion                      # 《反演》的结课作业
    |-- Petrophysics                   # 《岩石物理学》的结课作业
    |-- Geoscience_leading_edge.tex    # 《地球科学前沿》的结课作业
    |-- Numerical_simulation.tex       # 《数值模拟》的结课作业

## 如何使用tex文件
tex结尾的文件是文本文件，可以直接用编辑器打开，查看其中内容。
我上交的作业的文档都是用LaTex编译的，如果你想做出PDF，打印出来，你需要编译。
如果不包含参考文献请，请执行__两次__：

        xelatex *.tex

否则，请执行：

        xelatex *.tex
        bibtex *.aux
        xelatex *.tex
        xelatex *.tex
