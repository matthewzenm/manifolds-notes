# 曲面曲线论笔记

## 本书是什么？

本书是一本使用现代微分几何的语言叙述古典曲面曲线论的个人读书笔记，换言之，本书目标为讨论Riemann几何中的一些基本对象（度量, 测地线）与$2$维Riemann流形在$3$维欧氏空间中的等距浸入等话题。
同时，本书也希望严格（但不一定完备）地叙述流形理论与有关张量的代数理论。

由于本书的个人笔记性质，材料的安排会时常偏离主线，而加入大量与古典微分几何无关的内容。
这部分内容也可以供有需要的读者阅读。

## 本书的框架是什么？

到本次commit（2022年6月25日）为止，计划中的框架为：
1. 微分流形的基本内容
2. 多重线性代数, 以及流形上的张量场（包含微分形式与度量）
3. 传统语言描述的$3$维空间中的曲线与曲面
4. 联络与测地线
5. 一般流形上的曲线理论
6. 使用联络叙述的Gauss-Codazzi-Mainardi公式, 与曲面论基本定理
7. 活动标架法
8. Gauss-Bonnet公式

此外，书中也可能加入非欧几何、流形上的积分或de Rham理论初步的内容。

## 本书的前置知识如何？

本书假设的用途是用作北京师范大学励耘理科实验班的微分几何课教材，因此假设读者受到了坚实的三个学期本科数学系训练，即：
1. Zorich数学分析程度的数学分析内容，特别是应当对Zorich使用的拓扑语言有了解；
2. 代数学基础上下册程度的代数学内容，即基本的线性代数与群环域的定义及基本性质。

## 如何编译本书？

本书可以在**完全安装**的$\TeX{}\ {\rm Live}$环境下通过编译。
到本次commit（2022年6月25日）为止，使用的编译命令为
```shell
xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex
biber -l zh__pinyin main.tex
xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex
xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex
```
由于代码中使用了`fixdif`包 ([CTAN](https://ctan.org/pkg/fixdif))，但这个包并没有进入$\TeX{}\ {\rm Live}\ 2022$的安装ISO，所以应当预先使用
```shell
tlmgr install fixdif
```
命令安装`fixdif`包。

仓库中包含了方正书宋、方正楷体、方正黑体、方正仿宋、方正粗宋与方正粗楷$6$种中文字体。
由于后两种作者仅购买了个人非商用授权，如果您想规避可能的法律问题，请在`pagesetting.sty`中修改汉语字体部分。