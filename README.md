# Master_Degree_courses

**说明**

本项目是我硕士研究生期间部分课程的作业的合集。其中肯定有不完善之处，甚至错误，欢迎指出。

__QQ：100727461__

__MAIL：wangliang0222@foxmail.com__

我之所以把这个项目放到github上来主要有两个原因：

1. 中科大的LUG推荐大家把课程实验、作业等用gitlab保管，而我更喜欢github。
2. 让更多人感受一下开源社区文化的感召力，毕竟git已经很流行了。

要使用本项目，请遵守：

  * 不可用QQ、MAIL、各种云盘保存和传播本项目中的文件，只能传播本项目的链接[Master_Degree_courses](https://github.com/PeterPanwl/Master_Degree_courses)。
  * 须遵守知识共享 署名-非商业性使用-相同方式共享 4.0 国际 许可协议。要查看该许可协议，可访问 http://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh 。除非，你是__借鉴__本项目的内容来完成作业。
  * __不可用于作业抄袭！请诚信地完成你的学业！无论你喜欢你的课程与否，抄作业都是错误的！__
  * __再次强调！抄作业是错误的！禁止用于抄作业！__

__我无力约束你遵守以上条款，亦无力对你使用本项目的内容所造成的不良后果负责。__

## 目录

* [README.md](README.md)
* [《地球物理中的有限单元法》的磁场延拓程序](finite_element_method)
* 《Fortran语言编程》
    * [作业](/Fortran/homework/doc/Fortran_homework.tex)
    * [考试答案](/Fortran/exam/Fortran_exam.tex)
* [《反演》的结课作业](inversion/inversion.tex)
* [《岩石物理学》的结课作业](Petrophysics/Petrophysics.tex)
* [《地球科学前沿》的结课作业](Geoscience_leading_edge.tex)
* [《数值分析》的课堂试验和作业](/Numerical_analysis)
* [《数值模拟》的结课作业](Numerical_simulation.tex)

## 如何下载

__再次强调：不可用QQ、MAIL、各种云盘保存和传播本项目中的文件！__

### 方法 1

点击网页上的 "Download ZIP" 键，即可下载。

### 方法 2

直接使用下载链接
https://codeload.github.com/PeterPanwl/Master_Degree_courses/zip/master

### 方法 3

用 git:

~~~bash
$ git clone https://github.com/PeterPanwl/Master_Degree_courses.git
~~~

## 如何使用tex文件

tex结尾的文件是文本文件，可以直接用编辑器打开，查看其中内容。
没错！我用的是[LaTex](https://www.latex-project.org/)！如果你想做出PDF，你需要编译。
如果不包含参考文献，请执行__两次__：

~~~bash
$ xelatex *.tex
~~~

如果包含参考文献，请执行：

~~~bash
$ xelatex *.tex
$ bibtex *.aux
$ xelatex *.tex
$ xelatex *.tex
~~~
