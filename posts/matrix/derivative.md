　　标量、向量、矩阵间的求导共有9种可能，其中$\partial \text{scalar} / \partial \text{scalar}$就是我们熟悉的单变量微积分，$\partial \text{vector} / \partial \text{matrix}$、$\partial \text{matrix} / \partial \text{vector}$、$\partial \text{matrix} / \partial \text{matrix}$会涉及高阶张量，处理更为麻烦，因此本文只考虑剩下的5种情形。

　　设$\uv \in \Rbb^l$，$\Uv \in \Rbb^{m \times n}$，则向量、矩阵对标量求导的定义为
\begin{align\*}
    \frac{\partial \uv}{\partial x} \triangleq \begin{bmatrix}
        \frac{\partial u\_1}{\partial x} \\\\ \frac{\partial u\_2}{\partial x} \\\\ \vdots \\\\ \frac{\partial u\_l}{\partial x}
    \end{bmatrix}, \quad
    \frac{\partial \Uv}{\partial x} \triangleq \begin{bmatrix}
        \frac{\partial u\_{11}}{\partial x} & \frac{\partial u\_{12}}{\partial x} & \ldots & \frac{\partial u\_{1n}}{\partial x} \\\\
        \frac{\partial u\_{21}}{\partial x} & \frac{\partial u\_{22}}{\partial x} & \ldots & \frac{\partial u\_{2n}}{\partial x} \\\\
        \vdots                             & \vdots                             & \ddots & \vdots                             \\\\
        \frac{\partial u\_{m1}}{\partial x} & \frac{\partial u\_{m2}}{\partial x} & \ldots & \frac{\partial u\_{mn}}{\partial x}
    \end{bmatrix}
\end{align\*}
设$\xv \in \Rbb^l$，$\Xv \in \Rbb^{m \times n}$，则标量对向量、矩阵求导的定义为
\begin{align\*}
    \frac{\partial u}{\partial \xv} \triangleq \begin{bmatrix} \frac{\partial u}{\partial x\_1} & \frac{\partial u}{\partial x\_2} & \ldots & \frac{\partial u}{\partial x\_l} \end{bmatrix}, \quad \frac{\partial u}{\partial \Xv} \triangleq \begin{bmatrix}
        \frac{\partial u}{\partial x\_{11}} & \frac{\partial u}{\partial x\_{21}} & \ldots & \frac{\partial u}{\partial x\_{m1}} \\\\
        \frac{\partial u}{\partial x\_{12}} & \frac{\partial u}{\partial x\_{22}} & \ldots & \frac{\partial u}{\partial x\_{m2}} \\\\
        \vdots                             & \vdots                             & \ddots & \vdots                             \\\\
        \frac{\partial u}{\partial x\_{1n}} & \frac{\partial u}{\partial x\_{2n}} & \ldots & \frac{\partial u}{\partial x\_{mn}}
    \end{bmatrix}
\end{align\*}
即向量、矩阵对标量求导的结果<span class="blue">与分子尺寸相同</span>，标量对向量、矩阵求导的结果<span class="blue">与分母的转置尺寸相同</span>。向量对向量求导的定义为雅可比矩阵：
\begin{align\*}
    \frac{\partial \uv}{\partial \xv} \triangleq \begin{bmatrix}
        \frac{\partial u\_1}{\partial x\_1} & \frac{\partial u\_1}{\partial x\_2} & \ldots & \frac{\partial u\_1}{\partial x\_l} \\\\
        \frac{\partial u\_2}{\partial x\_1} & \frac{\partial u\_2}{\partial x\_2} & \ldots & \frac{\partial u\_2}{\partial x\_l} \\\\
        \vdots                            & \vdots                            & \ddots & \vdots                            \\\\
        \frac{\partial u\_l}{\partial x\_1} & \frac{\partial u\_l}{\partial x\_2} & \ldots & \frac{\partial u\_l}{\partial x\_l}
    \end{bmatrix}
\end{align\*}
即<span class="blue">行数与分子尺寸相同</span>、<span class="blue">列数与分母尺寸相同</span>。

　　以上即为<span class="blue">分子布局</span>，其好处是<span class="blue">链式法则跟单变量微积分中的顺序一样</span>，坏处是计算标量值函数$f(\xv)$关于向量变量$\xv$的梯度时要<span class="blue">多做一个转置</span>：$\nabla f = (\frac{\partial f}{\partial \xv})^\top$，否则梯度下降优化变量和梯度没法直接相减。分母布局的结果均是分子布局的转置，好处就是算梯度时不用做转置，坏处就是链式法则的顺序要完全反过来。

## 基本结果

　　以下结果根据定义和单变量微积分的求导法则都是显然的。

　　单变量微积分中<span class="blue">常量的导数为零</span>
\begin{align\*}
    \frac{\partial a}{\partial x} = 0
\end{align\*}
类似的这里有
\begin{align\*}
    \frac{\partial \av}{\partial x} = \zerov, \quad \frac{\partial a}{\partial \xv} = \zerov^\top, \quad \frac{\partial \av}{\partial \xv} = \zerov, \quad \frac{\partial \Av}{\partial x} = \zerov, \quad \frac{\partial a}{\partial \Xv} = \zerov^\top
\end{align\*}

　　单变量微积分中<span class="blue">常数标量乘</span>的求导法则为
\begin{align\*}
    \frac{\partial (a u)}{\partial x} = a \frac{\partial u}{\partial x}
\end{align\*}
类似的这里有
\begin{align\*}
    \frac{\partial (a \uv)}{\partial x} = a \frac{\partial \uv}{\partial x}, \quad \frac{\partial (a u)}{\partial \xv} = a \frac{\partial u}{\partial \xv}, \quad \frac{\partial (a \uv)}{\partial \xv} = a \frac{\partial \uv}{\partial \xv}, \quad \frac{\partial (a \Uv)}{\partial x} = a \frac{\partial \Uv}{\partial x}, \quad \frac{\partial (a u)}{\partial \Xv} = a \frac{\partial u}{\partial \Xv}
\end{align\*}

　　单变量微积分中<span class="blue">加法</span>的求导法则为
\begin{align\*}
    \frac{\partial (u+v)}{\partial x} = \frac{\partial u}{\partial x} + \frac{\partial v}{\partial x}
\end{align\*}
类似的这里有
\begin{align\*}
     & \frac{\partial (\uv + \vv)}{\partial x} = \frac{\partial \uv}{\partial x} + \frac{\partial \vv}{\partial x}, \quad \frac{\partial (u+v)}{\partial \xv} = \frac{\partial u}{\partial \xv} + \frac{\partial v}{\partial \xv}, \quad \frac{\partial (\uv + \vv)}{\partial \xv} = \frac{\partial \uv}{\partial \xv} + \frac{\partial \vv}{\partial \xv} \\\\
     & \frac{\partial (\Uv + \Vv)}{\partial x} = \frac{\partial \Uv}{\partial x} + \frac{\partial \Vv}{\partial x}, \quad \frac{\partial (u + v)}{\partial \Xv} = \frac{\partial u}{\partial \Xv} + \frac{\partial v}{\partial \Xv}
\end{align\*}

　　单变量微积分中<span class="blue">乘法</span>的求导法则为
\begin{align\*}
    \frac{\partial (uv)}{\partial x} = \frac{\partial u}{\partial x} v + u \frac{\partial v}{\partial x}
\end{align\*}
类似的这里有
\begin{align\*}
     & \frac{\partial (\uv \vv)}{\partial x} = \frac{\partial \uv}{\partial x} \vv + \uv \frac{\partial \vv}{\partial x}, \quad \frac{\partial (uv)}{\partial \xv} = \frac{\partial u}{\partial \xv} v + u \frac{\partial v}{\partial \xv} \\\\
     & \frac{\partial (\Uv \Vv)}{\partial x} = \frac{\partial \Uv}{\partial x} \Vv + \Uv \frac{\partial \Vv}{\partial x}, \quad \frac{\partial (uv)}{\partial \Xv} = \frac{\partial u}{\partial \Xv} v + u \frac{\partial v}{\partial \Xv}
\end{align\*}
其中第二行是因为
\begin{align\*}
    \left[ \frac{\partial (\Uv \Vv)}{\partial x} \right]\_{ij} & = \frac{\partial (\sum\_k u\_{ik} v\_{kj})}{\partial x} = \sum\_k \frac{\partial u\_{ik}}{\partial x} v\_{kj} + \sum\_k u\_{ik} \frac{\partial v\_{kj}}{\partial x} = \left[ \frac{\partial \Uv}{\partial x} \Vv \right]\_{ij} + \left[ \Uv \frac{\partial \Vv}{\partial x} \right]\_{ij} \\\\
    \left[ \frac{\partial (uv)}{\partial \Xv} \right]\_{ij}    & = \frac{\partial (uv)}{\partial x\_{ji}} = \frac{\partial u}{\partial x\_{ji}} v + u \frac{\partial v}{\partial x\_{ji}} = \left[ \frac{\partial u}{\partial \Xv} \right]\_{ij} v + u \left[ \frac{\partial v}{\partial \Xv} \right]\_{ij}
\end{align\*}
第一行可看作第二行的特例。$\partial (\uv \vv) / \partial \xv$有两种可能，一是$\uv \vv$为标量，即两者的内积，这里暂且不表，后文再讲；二是$\uv \vv$为矩阵，这属于我们不考虑的$\partial \text{matrix} / \partial \text{vector}$情形。

　　单变量微积分中有$\partial x / \partial x = 1$，类似的这里有
\begin{align\*}
    \frac{\partial x\_i}{\partial \xv} = \ev\_i^\top, \quad \frac{\partial \xv}{\partial x\_i} = \ev\_i, \quad \frac{\partial \xv}{\partial \xv} = \Iv, \quad \frac{\partial x\_{ij}}{\partial \Xv} = \Ev\_{ji}, \quad \frac{\partial \Xv}{\partial x\_{ij}} = \Ev\_{ij}
\end{align\*}
其中$\Ev_{ij}$是$(i,j)$处为$1$其余为$0$的矩阵。

　　单变量微积分中的<span class="blue">链式法则</span>为
\begin{align\*}
    \frac{\partial g(u)}{\partial x} = \frac{\partial g(u)}{\partial u} \frac{\partial u}{\partial x}
\end{align\*}
类似的，
- 只涉及向量：设$\xv \in \Rbb^n$，$\uv = \uv(\xv) \in \Rbb^m$，$\gv: \Rbb^m \mapsto \Rbb^l$，则
\begin{align\*}
    \underbrace{\frac{\partial \gv(\uv)}{\partial \xv}}\_{l \times n} = \underbrace{\frac{\partial \gv(\uv)}{\partial \uv}}\_{l \times m} \underbrace{\frac{\partial \uv}{\partial \xv}}\_{m \times n}
\end{align\*}
这是因为
\begin{align\*}
    \left[ \frac{\partial \gv(\uv)}{\partial \xv} \right]\_{ij} & = \frac{\partial [\gv(\uv)]\_i}{\partial x\_j} = \sum\_{k \in [m]} \frac{\partial [\gv(\uv)]\_i}{\partial u\_k} \frac{\partial u\_k}{\partial x\_j} = \frac{\partial [\gv(\uv)]\_i}{\partial \uv} \frac{\partial \uv}{\partial x\_j} \\\\
    & = \left[ \frac{\partial \gv(\uv)}{\partial \uv} \right]\_{i,:} \left[ \frac{\partial \uv}{\partial \xv} \right]\_{:,j} = \left[ \frac{\partial \gv(\uv)}{\partial \uv} \frac{\partial \uv}{\partial \xv} \right]\_{i,j}
\end{align\*}
注意若$n = m = l = 1$，就退化成了单变量的链式法则。
- 自变量是矩阵：设$u = u(\Xv)$，$g: \Rbb \mapsto \Rbb$，则
\begin{align\*}
    \frac{\partial g(u)}{\partial \Xv} = \frac{\partial g(u)}{\partial u} \frac{\partial u}{\partial \Xv}
\end{align\*}
这是因为
\begin{align\*}
    \left[ \frac{\partial g(u)}{\partial \Xv} \right]\_{ij} & = \frac{\partial g(u)}{\partial x\_{ji}} = \frac{\partial g(u)}{\partial u} \frac{\partial u}{\partial x\_{ji}} = \frac{\partial g(u)}{\partial u} \left[ \frac{\partial u}{\partial \Xv} \right]\_{ij}
\end{align\*}
- 中间变量是矩阵：设$\Uv = \Uv(x) \in \Rbb^{m \times n}$，$g: \Rbb^{m \times n} \mapsto \Rbb$，则
\begin{align} \label{eq: chain-matrix}
    \class{blue}{\frac{\partial g(\Uv)}{\partial x}} = \sum\_p \sum\_q \frac{\partial g(\Uv)}{\partial u\_{pq}} \frac{\partial u\_{pq}}{\partial x} = \sum\_q \sum\_p \left[ \frac{\partial g(\Uv)}{\partial \Uv} \right]\_{qp} \left[ \frac{\partial \Uv}{\partial x} \right]\_{pq} = \class{blue}{\tr \left( \frac{\partial g(\Uv)}{\partial \Uv} \frac{\partial \Uv}{\partial x} \right)}
\end{align}


## 向量对标量求导

　　矩阵和向量的乘积是向量，若$\Av$与$\xv$无关，易知有
\begin{align\*}
     & \left[ \frac{\partial (\Av \uv)}{\partial x} \right]\_{i} = \frac{\partial [\Av \uv]\_i}{\partial x} = \frac{\partial (\sum\_k a\_{ik} u\_k)}{\partial x} = \sum\_k a\_{ik} \frac{\partial u\_k}{\partial x} = \left[ \Av \frac{\partial \uv}{\partial x} \right]\_i \Longrightarrow \class{blue}{\frac{\partial (\Av \uv)}{\partial x} = \Av \frac{\partial \uv}{\partial x}} \\\\
     & \class{blue}{\frac{\partial (\uv^\top \Av)}{\partial x}} = \left[ \frac{\partial (\Av^\top \uv)}{\partial x} \right]^\top = \left[ \Av^\top \frac{\partial \uv}{\partial x} \right]^\top = \class{blue}{\frac{\partial \uv^\top}{\partial x} \Av}
\end{align\*}

　　向量的外积也是向量，记$\uv = [u_1(x); u_2(x); u_3(x)]$，$\vv = [v_1(x); v_2(x); v_3(x)]$，则
\begin{align\*}
    \uv \times \vv = \begin{bmatrix}
        u\_2 v\_3 - u\_3 v\_2 \\\\ u\_3 v\_1 - u\_1 v\_3 \\\\ u\_1 v\_2 - u\_2 v\_1
    \end{bmatrix}
\end{align\*}
于是
\begin{align\*}
    \class{blue}{\frac{\partial (\uv \times \vv)}{\partial x}} & = \begin{bmatrix}
        \frac{\partial u\_2}{\partial x} v\_3 - \frac{\partial u\_3}{\partial x} v\_2 + u\_2 \frac{\partial v\_3}{\partial x} - u\_3 \frac{\partial v\_2}{\partial x} \\\\
        \frac{\partial u\_3}{\partial x} v\_1 - \frac{\partial u\_1}{\partial x} v\_3 + u\_3 \frac{\partial v\_1}{\partial x} - u\_1 \frac{\partial v\_3}{\partial x} \\\\
        \frac{\partial u\_1}{\partial x} v\_2 - \frac{\partial u\_2}{\partial x} v\_1 + u\_1 \frac{\partial v\_2}{\partial x} - u\_2 \frac{\partial v\_1}{\partial x} \\\\
    \end{bmatrix} = \class{blue}{\left( \frac{\partial \uv}{\partial x} \right) \times \vv + \uv \times \frac{\partial \vv}{\partial x}}
\end{align\*}


## 标量对向量求导

　　二次型是标量，设$\Av$与$\xv$无关，易知有
\begin{align\*}
    \left[ \frac{\partial (\uv^\top \Av \vv)}{\partial \xv} \right]\_i & = \frac{\partial (\uv^\top \Av \vv)}{\partial x\_i} = \frac{\partial (\sum\_j \sum\_k u\_j a\_{jk} v\_k)}{\partial x\_i} = \sum\_j \sum\_k u\_j a\_{jk} \frac{\partial v\_k}{\partial x\_i} + \sum\_j \sum\_k \frac{\partial u\_j}{\partial x\_i} a\_{jk} v\_k     \\\\
                                                                      & = \uv^\top \Av \frac{\partial \vv}{\partial x\_i} + \vv^\top \Av^\top \frac{\partial \uv}{\partial x\_i} = \left[ \uv^\top \Av \frac{\partial \vv}{\partial \xv} \right]\_i + \left[ \vv^\top \Av^\top \frac{\partial \uv}{\partial \xv} \right]\_i \\\\
                                                                      & \Longrightarrow \class{blue}{\frac{\partial (\uv^\top \Av \vv)}{\partial \xv} = \uv^\top \Av \frac{\partial \vv}{\partial \xv} + \vv^\top \Av^\top \frac{\partial \uv}{\partial \xv}}
\end{align\*}

　　特别的，
- 取$\Av = \Iv$，则
\begin{align\*}
    \frac{\partial (\uv^\top \vv)}{\partial \xv} = \uv^\top \frac{\partial \vv}{\partial \xv} + \vv^\top \frac{\partial \uv}{\partial \xv}
\end{align\*}
进一步若$\uv = \av$与$\xv$无关，则
\begin{align\*}
    \frac{\partial (\av^\top \vv)}{\partial \xv} = \av^\top \frac{\partial \vv}{\partial \xv}, \quad \frac{\partial (\av^\top \xv)}{\partial \xv} = \av^\top \frac{\partial \xv}{\partial \xv} = \av^\top, \quad \frac{\partial (\bv^\top \Av \xv)}{\partial \xv} = \bv^\top \Av
\end{align\*}
- 取$\uv = \vv = \xv$，则
\begin{align\*}
    \frac{\partial (\xv^\top \Av \xv)}{\partial \xv} = \xv^\top \Av \frac{\partial \xv}{\partial \xv} + \xv^\top \Av^\top \frac{\partial \xv}{\partial \xv} = \xv^\top (\Av + \Av^\top)
\end{align\*}
进一步若$\Av = \Iv$，则
\begin{align\*}
    \frac{\partial (\xv^\top \xv)}{\partial \xv} = \frac{\partial \\|\xv\\|^2}{\partial \xv} = 2 \xv^\top
\end{align\*}
- 若$\Av = \bv \av^\top$，则
\begin{align\*}
    \frac{\partial (\xv^\top \bv \av^\top \xv)}{\partial \xv} = \frac{\partial (\av^\top \xv \xv^\top \bv)}{\partial \xv} = \xv^\top (\av \bv^\top + \bv \av^\top)
\end{align\*}
- 更一般的有
\begin{align\*}
    \frac{\partial [(\Av \xv + \bv)^\top \Cv (\Dv \xv + \ev)]}{\partial \xv} & = \frac{\partial (\xv^\top \Av^\top \Cv \Dv \xv + \bv^\top \Cv \Dv \xv + \xv^\top \Av^\top \Cv \ev + \bv^\top \ev)}{\partial \xv} \\\\
    & = \xv^\top (\Av^\top \Cv \Dv + \Dv^\top \Cv^\top \Av) + \bv^\top \Cv \Dv + \ev^\top \Cv^\top \Av                                  \\\\
    & = (\Dv \xv + \ev)^\top \Cv^\top \Av + (\Av \xv + \bv)^\top \Cv \Dv
\end{align\*}

　　范数也是标量，若$\av$与$\xv$无关，则
\begin{align} \label{eq: norm}
    \left[ \frac{\partial \\| \xv - \av \\|}{\partial \xv} \right]\_i & = \frac{\partial \\| \xv - \av \\|}{\partial x\_i} = \frac{\partial \sqrt{\sum\_j (x\_j - a\_j)^2}}{\partial x\_i} = \frac{1}{2} \frac{2 (x\_i - a\_i)}{\sqrt{\sum\_j (x\_j - a\_j)^2}} = \frac{x\_i - a\_i}{\\| \xv - \av \\|} \\\\
    & \Longrightarrow \class{blue}{\frac{\partial \\| \xv - \av \\|}{\partial \xv} = \frac{(\xv - \av)^\top}{\\| \xv - \av \\|}} \nonumber
\end{align}


## 向量对向量求导

　　若$\Av$与$\xv$无关，易知有
\begin{align\*}
     & \left[ \frac{\partial (\Av \uv)}{\partial \xv} \right]\_{ij} = \frac{\partial [\Av \uv]\_i}{\partial x\_j} = \frac{\partial (\sum\_k a\_{ik} u\_k)}{\partial x\_j} = \sum\_k a\_{ik} \frac{\partial u\_k}{\partial x\_j} = \left[ \Av \frac{\partial \uv}{\partial \xv} \right]\_{ij} \Longrightarrow \class{blue}{\frac{\partial (\Av \uv)}{\partial \xv} = \Av \frac{\partial \uv}{\partial \xv}}
\end{align\*}
特别的，若$\uv = \xv$，则
\begin{align\*}
    \frac{\partial (\Av \xv)}{\partial \xv} = \Av \frac{\partial \xv}{\partial \xv} = \Av
\end{align\*}

　　若$v = v(\xv)$，则
\begin{align\*}
    \left[ \frac{\partial (v \uv)}{\partial \xv} \right]\_{ij} = \frac{\partial (v u\_i)}{\partial x\_j} = v \frac{\partial u\_i}{\partial x\_j} + u\_i \frac{\partial v}{\partial x\_j} = v \left[ \frac{\partial \uv}{\partial \xv} \right]\_{ij} + \left[ \uv \frac{\partial v}{\partial \xv} \right]\_{ij} \Longrightarrow \class{blue}{\frac{\partial (v \uv)}{\partial \xv} = v \frac{\partial \uv}{\partial \xv} + \uv \frac{\partial v}{\partial \xv}}
\end{align\*}
注意第一项是标量乘以雅可比矩阵，第二项是列向量乘以行向量。

　　若$\av$与$\xv$无关，结合式(\ref{eq: norm})可得
\begin{align\*}
    \left[ \frac{\partial}{\partial \xv} \frac{\xv - \av}{\\| \xv - \av \\|} \right]\_{ij} & = \frac{\partial}{\partial x\_j} \frac{x\_i - a\_i}{\\| \xv - \av \\|} = \frac{\delta\_{ij} \\|\xv - \av\\|}{\\| \xv - \av \\|^2} - \frac{x\_i - a\_i}{\\| \xv - \av \\|^2} \frac{\partial \\| \xv - \av \\|}{\partial x\_j} \\\\
                                                                                        & = \frac{\delta\_{ij}}{\\| \xv - \av \\|} - \frac{x\_i - a\_i}{\\| \xv - \av \\|^2} \frac{x\_j - a\_j}{\\| \xv - \av \\|}                                                                                               \\\\
                                                                                        & \Longrightarrow \class{blue}{\frac{\partial}{\partial \xv} \frac{\xv - \av}{\\| \xv - \av \\|} = \frac{\Iv}{\\| \xv - \av \\|} - \frac{(\xv - \av)(\xv - \av)^\top}{\\| \xv - \av \\|^3}}
\end{align\*}


## 矩阵对标量求导

　　若$u = u(x)$，$\Vv = \Vv(x)$，则
\begin{align\*}
    \left[ \frac{\partial (u \Vv)}{\partial x} \right]\_{ij} = \frac{\partial (u v\_{ij})}{\partial x} = \frac{\partial u}{\partial x} v\_{ij} + u \frac{\partial v\_{ij}}{\partial x} = \frac{\partial u}{\partial x} \left[ \Vv \right]\_{ij} + u \left[ \frac{\partial \Vv}{\partial x} \right]\_{ij} \Longrightarrow \class{blue}{\frac{\partial (u \Vv)}{\partial x} = \frac{\partial u}{\partial x} \Vv + u \frac{\partial \Vv}{\partial x}}
\end{align\*}

　　若乘积求导法则中的$\Uv$或$\Vv$可继续分解为$x$相关项的乘积，例如$\Vv \leftarrow \Vv \Wv$，则
\begin{align} \label{eq: product}
    \class{blue}{\frac{\partial (\Uv \Vv \Wv)}{\partial x}} = \frac{\partial \Uv}{\partial x} \Vv \Wv + \Uv \frac{\partial (\Vv \Wv)}{\partial x} = \frac{\partial \Uv}{\partial x} \Vv \Wv + \Uv \left( \frac{\partial \Vv}{\partial x} \Wv + \Vv \frac{\partial \Wv}{\partial x} \right) = \class{blue}{\frac{\partial \Uv}{\partial x} \Vv \Wv + \Uv \frac{\partial \Vv}{\partial x} \Wv + \Uv \Vv \frac{\partial \Wv}{\partial x}}
\end{align}
由此可知若$\Av$、$\Bv$与$x$无关，则
\begin{align\*}
    \frac{\partial (\Av \Uv \Bv)}{\partial x} = \Av \frac{\partial \Uv}{\partial x} \Bv
\end{align\*}
当$\Uv$为方阵、$n$为正整数时有
\begin{align} \label{eq: power}
    \class{blue}{\frac{\partial \Uv^n}{\partial x}} = \Uv^{n-1} \frac{\partial \Uv}{\partial x} + \Uv^{n-2} \frac{\partial \Uv}{\partial x} \Uv + \cdots + \Uv \frac{\partial \Uv}{\partial x} \Uv^{n-2} + \frac{\partial \Uv}{\partial x} \Uv^{n-1} = \class{blue}{\sum\_{i \in [n]} \Uv^{i-1} \frac{\partial \Uv}{\partial x} \Uv^{n-i}}
\end{align}

　　令乘积求导法则中的$\Vv = \Uv^{-1}$可得
\begin{align} \label{eq: inverse}
    \zerov = \frac{\partial \Iv}{\partial x} = \frac{\partial (\Uv \Uv^{-1})}{\partial x} = \Uv \frac{\partial \Uv^{-1}}{\partial x} + \frac{\partial \Uv}{\partial x} \Uv^{-1} \Longrightarrow \class{blue}{\frac{\partial \Uv^{-1}}{\partial x} = - \Uv^{-1} \frac{\partial \Uv}{\partial x} \Uv^{-1}}
\end{align}
由此可知
\begin{align\*}
    \class{blue}{\frac{\partial [\Xv^{-1}]\_{kl}}{\partial x\_{ij}}} & = \tr \left( \frac{\partial [\Xv^{-1}]\_{kl}}{\partial \Xv^{-1}} \frac{\partial \Xv^{-1}}{\partial x\_{ij}} \right) = - \tr \left( \Ev\_{lk} \Xv^{-1} \frac{\partial \Xv}{\partial x\_{ij}} \Xv^{-1} \right) = - \tr ( \Xv^{-1} \Ev\_{lk} \Xv^{-1} \Ev\_{ij} ) \\\\
    & = - [\Xv^{-1} \Ev\_{lk} \Xv^{-1}]\_{ji} = - \sum\_p \sum\_q [\Xv^{-1}]\_{jp} [\Ev\_{lk}]\_{pq} [\Xv^{-1}]\_{qi} = \class{blue}{- [\Xv^{-1}]\_{jl} [\Xv^{-1}]\_{ki}}
\end{align\*}
结合式(\ref{eq: product})还可得海森矩阵
\begin{align\*}
    \class{blue}{\frac{\partial^2 \Uv^{-1}}{\partial x \partial y}} & = \frac{\partial}{\partial y} \left( - \Uv^{-1} \frac{\partial \Uv}{\partial x} \Uv^{-1} \right) = - \frac{\partial \Uv^{-1}}{\partial y} \frac{\partial \Uv}{\partial x} \Uv^{-1} - \Uv^{-1} \frac{\partial^2 \Uv}{\partial x \partial y} \Uv^{-1} - \Uv^{-1} \frac{\partial \Uv}{\partial x} \frac{\partial \Uv^{-1}}{\partial y} \\\\
    & = \Uv^{-1} \frac{\partial \Uv}{\partial y} \Uv^{-1} \frac{\partial \Uv}{\partial x} \Uv^{-1} - \Uv^{-1} \frac{\partial^2 \Uv}{\partial x \partial y} \Uv^{-1} + \Uv^{-1} \frac{\partial \Uv}{\partial x} \Uv^{-1} \frac{\partial \Uv}{\partial y} \Uv^{-1}                                                                          \\\\
    & = \class{blue}{\Uv^{-1} \left( \frac{\partial \Uv}{\partial y} \Uv^{-1} \frac{\partial \Uv}{\partial x} - \frac{\partial^2 \Uv}{\partial x \partial y} + \frac{\partial \Uv}{\partial x} \Uv^{-1} \frac{\partial \Uv}{\partial y} \right) \Uv^{-1}}
\end{align\*}

　　矩阵除了常规的乘积外，还有克罗内克积和哈达玛积。设$\Uv \in \Rbb^{m \times n}$，$\Vv \in \Rbb^{p \times q}$，则
\begin{align\*}
    \class{blue}{\frac{\partial (\Uv \otimes \Vv)}{\partial x}} & = \begin{bmatrix}
        \frac{\partial u\_{11} \Vv}{\partial x} & \frac{\partial u\_{12} \Vv}{\partial x} & \cdots & \frac{\partial u\_{1n} \Vv}{\partial x} \\\\
        \frac{\partial u\_{21} \Vv}{\partial x} & \frac{\partial u\_{22} \Vv}{\partial x} & \cdots & \frac{\partial u\_{2n} \Vv}{\partial x} \\\\
        \vdots                                 & \vdots                                 & \ddots & \vdots                                 \\\\
        \frac{\partial u\_{m1} \Vv}{\partial x} & \frac{\partial u\_{m2} \Vv}{\partial x} & \cdots & \frac{\partial u\_{mn} \Vv}{\partial x} \\\\
    \end{bmatrix}                                                                       \\\\
                                                         & = \begin{bmatrix}
        \frac{\partial u\_{11}}{\partial x} \Vv + u\_{11} \frac{\partial \Vv}{\partial x} & \frac{\partial u\_{12}}{\partial x} \Vv + u\_{12} \frac{\partial \Vv}{\partial x} & \cdots & \frac{\partial u\_{1n}}{\partial x} \Vv + u\_{1n} \frac{\partial \Vv}{\partial x} \\\\
        \frac{\partial u\_{21}}{\partial x} \Vv + u\_{21} \frac{\partial \Vv}{\partial x} & \frac{\partial u\_{22}}{\partial x} \Vv + u\_{22} \frac{\partial \Vv}{\partial x} & \cdots & \frac{\partial u\_{2n}}{\partial x} \Vv + u\_{2n} \frac{\partial \Vv}{\partial x} \\\\
        \vdots                                                                          & \vdots                                                                          & \ddots & \vdots                                                                          \\\\
        \frac{\partial u\_{m1}}{\partial x} \Vv + u\_{m1} \frac{\partial \Vv}{\partial x} & \frac{\partial u\_{m2}}{\partial x} \Vv + u\_{m2} \frac{\partial \Vv}{\partial x} & \cdots & \frac{\partial u\_{mn}}{\partial x} \Vv + u\_{mn} \frac{\partial \Vv}{\partial x} \\\\
    \end{bmatrix}                                                                       \\\\
                                                         & = \begin{bmatrix}
        \frac{\partial u\_{11}}{\partial x} \Vv & \frac{\partial u\_{12}}{\partial x} \Vv & \cdots & \frac{\partial u\_{1n}}{\partial x} \Vv \\\\
        \frac{\partial u\_{21}}{\partial x} \Vv & \frac{\partial u\_{22}}{\partial x} \Vv & \cdots & \frac{\partial u\_{2n}}{\partial x} \Vv \\\\
        \vdots                                 & \vdots                                 & \ddots & \vdots                                 \\\\
        \frac{\partial u\_{m1}}{\partial x} \Vv & \frac{\partial u\_{m2}}{\partial x} \Vv & \cdots & \frac{\partial u\_{mn}}{\partial x} \Vv \\\\
    \end{bmatrix} + \begin{bmatrix}
        u\_{11} \frac{\partial \Vv}{\partial x} & u\_{12} \frac{\partial \Vv}{\partial x} & \cdots & u\_{1n} \frac{\partial \Vv}{\partial x} \\\\
        u\_{21} \frac{\partial \Vv}{\partial x} & u\_{22} \frac{\partial \Vv}{\partial x} & \cdots & u\_{2n} \frac{\partial \Vv}{\partial x} \\\\
        \vdots                                 & \vdots                                 & \ddots & \vdots                                 \\\\
        u\_{m1} \frac{\partial \Vv}{\partial x} & u\_{m2} \frac{\partial \Vv}{\partial x} & \cdots & u\_{mn} \frac{\partial \Vv}{\partial x} \\\\
    \end{bmatrix}                                          \\\\
                                                         & = \class{blue}{\frac{\partial \Uv}{\partial x} \otimes \Vv + \Uv \otimes \frac{\partial \Vv}{\partial x}}
\end{align\*}
设$\Uv, \Vv \in \Rbb^{m \times n}$，则
\begin{align\*}
    \class{blue}{\frac{\partial (\Uv \odot \Vv)}{\partial x}} & = \begin{bmatrix}
        \frac{\partial u\_{11} v\_{11}}{\partial x} & \frac{\partial u\_{12} v\_{12}}{\partial x} & \cdots & \frac{\partial u\_{1n} v\_{1n}}{\partial x} \\\\
        \frac{\partial u\_{21} v\_{21}}{\partial x} & \frac{\partial u\_{22} v\_{22}}{\partial x} & \cdots & \frac{\partial u\_{2n} v\_{2n}}{\partial x} \\\\
        \vdots                                    & \vdots                                    & \ddots & \vdots                                    \\\\
        \frac{\partial u\_{m1} v\_{m1}}{\partial x} & \frac{\partial u\_{m2} v\_{m2}}{\partial x} & \cdots & \frac{\partial u\_{mn} v\_{mn}}{\partial x} \\\\
    \end{bmatrix}                                                                   \\\\
                                                       & = \begin{bmatrix}
        \frac{\partial u\_{11}}{\partial x} v\_{11} & \frac{\partial u\_{12}}{\partial x} v\_{12} & \cdots & \frac{\partial u\_{1n}}{\partial x} v\_{1n} \\\\
        \frac{\partial u\_{21}}{\partial x} v\_{21} & \frac{\partial u\_{22}}{\partial x} v\_{22} & \cdots & \frac{\partial u\_{2n}}{\partial x} v\_{2n} \\\\
        \vdots                                    & \vdots                                    & \ddots & \vdots                                    \\\\
        \frac{\partial u\_{m1}}{\partial x} v\_{m1} & \frac{\partial u\_{m2}}{\partial x} v\_{m2} & \cdots & \frac{\partial u\_{mn}}{\partial x} v\_{mn} \\\\
    \end{bmatrix} + \begin{bmatrix}
        u\_{11} \frac{\partial v\_{11}}{\partial x} & u\_{12} \frac{\partial v\_{12}}{\partial x} & \cdots & u\_{1n} \frac{\partial v\_{1n}}{\partial x} \\\\
        u\_{21} \frac{\partial v\_{21}}{\partial x} & u\_{22} \frac{\partial v\_{22}}{\partial x} & \cdots & u\_{2n} \frac{\partial v\_{2n}}{\partial x} \\\\
        \vdots                                    & \vdots                                    & \ddots & \vdots                                    \\\\
        u\_{m1} \frac{\partial v\_{m1}}{\partial x} & u\_{m2} \frac{\partial v\_{m2}}{\partial x} & \cdots & u\_{mn} \frac{\partial v\_{mn}}{\partial x} \\\\
    \end{bmatrix}                                      \\\\
                                                       & = \class{blue}{\frac{\partial \Uv}{\partial x} \odot \Vv + \Uv \odot \frac{\partial \Vv}{\partial x}}
\end{align\*}

　　设多项式函数$g(x) = a_0 + a_1 x + a_2 x^2 + a_3 x^3 + \cdots$，则$g'(x) = a_1 + 2 a_2 x + 3 a_3 x^2 + \cdots$，若$\Av$为与$x$无关的方阵，记
\begin{align\*}
    g (x \Av)  & = a\_0 \Iv + a\_1 x \Av + a\_2 x^2 \Av^2 + a\_3 x^3 \Av^3 + \cdots \\\\
    g' (x \Av) & = a\_1 \Iv + 2 a\_2 x \Av + 3 a\_3 x^2 \Av^2 + \cdots
\end{align\*}
易知有
\begin{align\*}
    \class{blue}{\frac{\partial g(x \Av)}{\partial x}} & = a\_1 \Av + 2 a\_2 x \Av^2 + 3 a\_3 x^2 \Av^3 + \cdots                             \\\\
    & = \Av (a\_1 \Iv + 2 a\_2 x \Av + 3 a\_3 x^2 \Av^2 + \cdots) = \class{blue}{\Av g' (x \Av)} \\\\
    & = (a\_1 \Iv + 2 a\_2 x \Av + 3 a\_3 x^2 \Av^2 + \cdots) \Av = \class{blue}{g' (x \Av) \Av}
\end{align\*}
对于$e^x$、$\ln x$、$\sin x$、$\cos x$，上式依然适用，例如
\begin{align\*}
    \frac{\partial e^{x \Av}}{\partial x} = \Av e^{x \Av} = e^{x \Av} \Av
\end{align\*}

## 标量对矩阵求导

　　矩阵常见的标量函数有<span class="blue">迹</span>和<span class="blue">行列式</span>，二次型可以归为迹来处理。

#### 迹对矩阵求导

　　若$a$与$\Xv$无关，$\Uv = \Uv(\Xv)$，$\Vv = \Vv(\Xv)$，则以下结论是显然的：
\begin{align\*}
    \frac{\partial \tr(\Xv)}{\partial \Xv} = \Iv, \quad \frac{\partial \tr(\Uv+\Vv)}{\partial \Xv} = \frac{\partial \tr(\Uv)}{\partial \Xv} + \frac{\partial \tr(\Vv)}{\partial \Xv}, \quad \frac{\partial \tr(a \Uv)}{\partial \Xv} = a \frac{\partial \tr(\Uv)}{\partial \Xv}
\end{align\*}
对于乘积有
\begin{align\*}
    \left[ \frac{\partial \tr(\Uv \Vv)}{\partial \Xv} \right]\_{ij} & = \class{blue}{\frac{\partial \tr(\Uv \Vv)}{\partial x\_{ji}}} = \frac{\partial (\sum\_p \sum\_q u\_{pq} v\_{qp})}{\partial x\_{ji}} = \sum\_p \sum\_q \left( \frac{\partial u\_{pq}}{\partial x\_{ji}} v\_{qp} + u\_{pq} \frac{\partial v\_{qp}}{\partial x\_{ji}} \right) \\\\
    & = \class{blue}{\tr \left( \frac{\partial \Uv}{\partial x\_{ji}} \Vv \right) + \tr \left( \Uv \frac{\partial \Vv}{\partial x\_{ji}} \right)} = \tr \left( \frac{\partial (\Uv \Vv)}{\partial x\_{ji}} \right)
\end{align\*}
由此可知<span class="blue">迹和求导的顺序可以交换</span>。特别的，
- 取$\Uv = \Bv \Av$与$\Xv$无关，$\Vv = \Xv$，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Bv \Av \Xv)}{\partial \Xv} \right]\_{ij} = \tr \left( \Bv \Av \frac{\partial \Xv}{\partial x\_{ji}} \right) = \tr ( \Bv \Av \Ev\_{ji} ) = [\Bv \Av]\_{ij} \Longrightarrow \frac{\partial \tr(\Bv \Av \Xv)}{\partial \Xv} = \frac{\partial \tr(\Av \Xv \Bv)}{\partial \Xv} = \Bv \Av
\end{align\*}
- 取$\Uv = \Bv \Av$与$\Xv$无关，$\Vv = \Xv^\top$，则
\begin{align\*}
    \frac{\partial \tr(\Bv \Av \Xv^\top)}{\partial \Xv} = \frac{\partial \tr(\Xv \Av^\top \Bv^\top)}{\partial \Xv} = \frac{\partial \tr(\Av^\top \Bv^\top \Xv)}{\partial \Xv} = \Av^\top \Bv^\top
\end{align\*}
- 取$\Uv = \Av$与$\Xv$无关，$\Vv = \Xv \Xv^\top$，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Av \Xv \Xv^\top)}{\partial \Xv} \right]\_{ij} & = \tr \left( \Av \frac{\partial \Xv \Xv^\top}{\partial x\_{ji}} \right) = \tr \left( \Av \frac{\partial \Xv}{\partial x\_{ji}} \Xv^\top \right) + \tr \left( \Av \Xv \frac{\partial \Xv^\top}{\partial x\_{ji}} \right) \\\\
    & = \tr(\Av \Ev\_{ji} \Xv^\top) + \tr(\Av \Xv \Ev\_{ij})                                                                                                                                                                 \\\\
    & = [\Xv^\top \Av]\_{ij} + [\Av \Xv]\_{ji}
\end{align\*}
从而
\begin{align\*}
    \frac{\partial \tr(\Av \Xv \Xv^\top)}{\partial \Xv} = \frac{\partial \tr(\Xv^\top \Av \Xv)}{\partial \Xv} = \frac{\partial \tr(\Xv \Xv^\top \Av)}{\partial \Xv} = \Xv^\top \Av + \Xv^\top \Av^\top = \Xv^\top (\Av + \Av^\top)
\end{align\*}
- 取$\Uv = \Av$与$\Xv$无关，$\Vv = \Xv^\top \Xv$，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Av \Xv^\top \Xv)}{\partial \Xv} \right]\_{ij} & = \tr \left( \Av \frac{\partial \Xv^\top \Xv}{\partial x\_{ji}} \right) = \tr \left( \Av \frac{\partial \Xv^\top}{\partial x\_{ji}} \Xv \right) + \tr \left( \Av \Xv^\top \frac{\partial \Xv}{\partial x\_{ji}} \right) \\\\
    & = \tr(\Av \Ev\_{ij} \Xv) + \tr(\Av \Xv^\top \Ev\_{ji})                                                                                                                                                                 \\\\
    & = [\Xv \Av]\_{ji} + [\Av \Xv^\top]\_{ij}
\end{align\*}
从而
\begin{align\*}
    \frac{\partial \tr(\Av \Xv^\top \Xv)}{\partial \Xv} = \frac{\partial \tr(\Xv \Av \Xv^\top)}{\partial \Xv} = \frac{\partial \tr(\Xv^\top \Xv \Av)}{\partial \Xv} = (\Av + \Av^\top) \Xv^\top
\end{align\*}
- 取$\Uv = \Bv \Av$与$\Xv$无关，$\Vv = \Xv^{-1}$，结合式(\ref{eq: inverse})可得
\begin{align\*}
    \left[ \frac{\partial \tr(\Bv \Av \Xv^{-1})}{\partial \Xv} \right]\_{ij} & = \tr \left( \Bv \Av \frac{\partial \Xv^{-1}}{\partial x\_{ji}} \right) = \tr \left( - \Bv \Av \Xv^{-1} \frac{\partial \Xv}{\partial x\_{ji}} \Xv^{-1} \right) \\\\
    & = - \tr \left( \Xv^{-1} \Bv \Av \Xv^{-1} \Ev\_{ji} \right) = - [\Xv^{-1} \Bv \Av \Xv^{-1}]\_{ij}                                                               \\\\
    & \Longrightarrow \frac{\partial \tr(\Bv \Av \Xv^{-1})}{\partial \Xv} = \frac{\partial \tr(\Av \Xv^{-1} \Bv)}{\partial \Xv} = - \Xv^{-1} \Bv \Av \Xv^{-1}
\end{align\*}
- 取$\Uv = \Iv$，$\Vv = (\Xv + \Av)^{-1}$，结合式(\ref{eq: inverse})可得
\begin{align\*}
    \left[ \frac{\partial \tr(\Xv + \Av)^{-1}}{\partial \Xv} \right]\_{ij} & = \tr \left( \frac{\partial (\Xv + \Av)^{-1}}{\partial x\_{ji}} \right) = - \tr \left( (\Xv + \Av)^{-1} \frac{\partial (\Xv + \Av)}{\partial x\_{ji}} (\Xv + \Av)^{-1} \right) \\\\
    & = - \tr \left( (\Xv + \Av)^{-1} (\Xv + \Av)^{-1} \Ev\_{ji}  \right) = - [(\Xv + \Av)^{-1} (\Xv + \Av)^{-1}]\_{ij}                                                              \\\\
    & \Longrightarrow \frac{\partial \tr(\Xv + \Av)^{-1}}{\partial \Xv} = - (\Xv + \Av)^{-1} (\Xv + \Av)^{-1}
\end{align\*}
- 取$\Uv = \Av \Xv \Bv$，$\Vv = \Xv^\top \Cv$，其中$\Av$、$\Bv$、$\Cv$与$\Xv$无关，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Av \Xv \Bv \Xv^\top \Cv)}{\partial \Xv} \right]\_{ij} & = \tr \left( \frac{\partial (\Av \Xv \Bv)}{\partial x\_{ji}} \Xv^\top \Cv \right) + \tr \left( \Av \Xv \Bv \frac{\partial (\Xv^\top \Cv)}{\partial x\_{ji}} \right) \\\\
    & = \tr \left( \Av \Ev\_{ji} \Bv \Xv^\top \Cv \right) + \tr \left( \Av \Xv \Bv \Ev\_{ij} \Cv \right)                                                                  \\\\
    & = [\Bv \Xv^\top \Cv \Av]\_{ij} + [\Cv \Av \Xv \Bv]\_{ji}                                                                                                            \\\\
    & \Longrightarrow \frac{\partial \tr(\Av \Xv \Bv \Xv^\top \Cv)}{\partial \Xv} = \Bv \Xv^\top \Cv \Av + \Bv^\top \Xv^\top \Av^\top \Cv^\top
\end{align\*}
- 取$\Uv = \Av \Xv^\top \Bv$，$\Vv = \Xv \Cv$，其中$\Av$、$\Bv$、$\Cv$与$\Xv$无关，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Av \Xv^\top \Bv \Xv \Cv)}{\partial \Xv} \right]\_{ij} & = \tr \left( \frac{\partial (\Av \Xv^\top \Bv)}{\partial x\_{ji}} \Xv \Cv \right) + \tr \left( \Av \Xv^\top \Bv \frac{\partial (\Xv \Cv)}{\partial x\_{ji}} \right) \\\\
    & = \tr \left( \Av \Ev\_{ij} \Bv \Xv \Cv \right) + \tr \left( \Av \Xv^\top \Bv \Ev\_{ji} \Cv \right)                                                                  \\\\
    & = [\Bv \Xv \Cv \Av]\_{ji} + [\Cv \Av \Xv^\top \Bv]\_{ij}                                                                                                            \\\\
    & \Longrightarrow \frac{\partial \tr(\Av \Xv^\top \Bv \Xv \Cv)}{\partial \Xv} = \Cv \Av \Xv^\top \Bv + \Av^\top \Cv^\top \Xv^\top \Bv^\top
\end{align\*}
- 取$\Uv = \Bv \Av$与$\Xv$无关，$\Vv = \Xv^n$，其中$n$是正整数，结合式(\ref{eq: power})可得
\begin{align\*}
    \left[ \frac{\partial \tr(\Bv \Av \Xv^n)}{\partial \Xv} \right]\_{ij} & = \tr \left( \Bv \Av \frac{\partial \Xv^n}{\partial x\_{ji}} \right) = \tr \left( \Bv \Av \sum\_{k \in [n]} \Xv^{k-1} \frac{\partial \Xv}{\partial x\_{ji}} \Xv^{n-k} \right) = \sum\_{k \in [n]} \tr \left( \Bv \Av \Xv^{k-1} \frac{\partial \Xv}{\partial x\_{ji}} \Xv^{n-k} \right) \\\\
    & = \sum\_{k \in [n]} \tr ( \Xv^{n-k} \Bv \Av \Xv^{k-1} \Ev\_{ji} ) = \sum\_{k \in [n]} [\Xv^{n-k} \Bv \Av \Xv^{k-1}]\_{ij}                                                                                                                                                             \\\\
    & \Longrightarrow \frac{\partial \tr(\Bv \Av \Xv^n)}{\partial \Xv} = \frac{\partial \tr(\Av \Xv^n \Bv)}{\partial \Xv} = \sum\_{k \in [n]} \Xv^{n-k} \Bv \Av \Xv^{k-1}
\end{align\*}
进一步若$\Av = \Bv = \Iv$，则
\begin{align\*}
    \frac{\partial \tr(\Xv^n)}{\partial \Xv} = \sum\_{k \in [n]} \Xv^{n-k} \Xv^{k-1} = \sum\_{k \in [n]} \Xv^{n-1} = n \Xv^{n-1}
\end{align\*}
不难发现形式上和单变量的求导公式$\partial x^n / \partial x = n x^{n-1}$是一样的。类似的记
\begin{align\*}
    e^{\Xv}  & = \Iv + \Xv + \frac{\Xv^2}{2!} + \frac{\Xv^3}{3!} + \cdots      \\\\
    \sin \Xv & = \Xv - \frac{\Xv^3}{3!} + \frac{\Xv^5}{5!} - \cdots        \\\\
    \cos \Xv & = \Iv - \frac{\Xv^2}{2!} + \frac{\Xv^4}{4!} - \frac{\Xv^6}{6!} + \cdots
\end{align\*}
结合式(\ref{eq: power})可得
\begin{align\*}
    \frac{\partial \tr(e^{\Xv})}{\partial \Xv} & = \frac{\partial }{\partial \Xv} \tr \left( \Iv + \Xv + \frac{\Xv^2}{2!} + \frac{\Xv^3}{3!} + \cdots \right)                                                                                       \\\\
    & = \frac{\partial \tr (\Iv)}{\partial \Xv} + \frac{\partial \tr (\Xv)}{\partial \Xv} + \frac{1}{2!} \frac{\partial \tr (\Xv^2)}{\partial \Xv} + \frac{1}{3!} \frac{\partial \tr (\Xv^3)}{\partial \Xv} + \cdots \\\\
    & = \Iv + \Xv + \frac{\Xv^2}{2!} + \cdots = e^{\Xv}
\end{align\*}
以及
\begin{align\*}
    \frac{\partial \tr(\sin \Xv)}{\partial \Xv} & = \frac{\partial }{\partial \Xv} \tr \left( \Xv - \frac{\Xv^3}{3!} + \frac{\Xv^5}{5!} - \cdots \right)                                                                                                            \\\\
    & = \frac{1}{1!} \frac{\partial \tr (\Xv)}{\partial \Xv} - \frac{1}{3!} \frac{\partial \tr (\Xv^3)}{\partial \Xv} + \frac{1}{5!} \frac{\partial \tr (\Xv^5)}{\partial \Xv} - \cdots                                             \\\\
    & = \Iv - \frac{\Xv^2}{2!} + \frac{\Xv^4}{4!} - \cdots = \cos \Xv                                                                                                                                                               \\\\
    \frac{\partial \tr(\cos \Xv)}{\partial \Xv} & = \frac{\partial }{\partial \Xv} \tr \left( \Iv - \frac{\Xv^2}{2!} + \frac{\Xv^4}{4!} - \frac{\Xv^6}{6!} + \cdots \right)                                                                                         \\\\
    & = \frac{\partial \tr (\Iv)}{\partial \Xv} - \frac{1}{2!} \frac{\partial \tr (\Xv^2)}{\partial \Xv} + \frac{1}{4!} \frac{\partial \tr (\Xv^4)}{\partial \Xv} - \frac{1}{6!} \frac{\partial \tr (\Xv^6)}{\partial \Xv} + \cdots \\\\
    & = - \Xv + \frac{\Xv^3}{3!} - \frac{\Xv^5}{5!} + \cdots = - \sin \Xv
\end{align\*}
均与单变量的求导公式一样。

- 取$\Uv = \Iv$，$\Vv = \Av \otimes \Xv$，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Av \otimes \Xv)}{\partial \Xv} \right]\_{ij} & = \tr \left( \frac{\partial \Av \otimes \Xv}{\partial x\_{ji}} \right) = \tr \left( \Av \otimes \frac{\partial \Xv}{\partial x\_{ji}} \right) = \tr ( \Av \otimes \Ev\_{ji} ) = \tr(\Av) \delta\_{ij} \\\\
    & \Longrightarrow \frac{\partial \tr(\Av \otimes \Xv)}{\partial \Xv} = \tr(\Av) \Iv
\end{align\*}
- 取$\Uv = \Iv$，$\Vv = \Xv \otimes \Xv$，则
\begin{align\*}
    \left[ \frac{\partial \tr(\Xv \otimes \Xv)}{\partial \Xv} \right]\_{ij} & = \tr \left( \frac{\partial \Xv \otimes \Xv}{\partial x\_{ji}} \right) = \tr \left( \frac{\partial \Xv}{\partial x\_{ji}} \otimes \Xv + \Xv \otimes \frac{\partial \Xv}{\partial x\_{ji}} \right) \\\\
    & = \tr ( \Ev\_{ji} \otimes \Xv ) + \tr ( \Xv \otimes \Ev\_{ji} ) = 2 \tr(\Xv) \delta\_{ij}                                                                                                         \\\\
    & \Longrightarrow \frac{\partial \tr(\Xv \otimes \Xv)}{\partial \Xv} = 2 \tr(\Xv) \Iv
\end{align\*}

#### 行列式对矩阵求导

　　设$\Xv \in \Rbb^{m \times n}$、$\Av \in \Rbb^{l \times m}$、$\Bv \in \Rbb^{n \times l}$、$\Yv = \Av \Xv \Bv \in \Rbb^{l \times l}$，$\Av$、$\Bv$与$\Xv$无关，结合式(\ref{eq: chain-matrix})易知
\begin{align\*}
    \left[ \frac{\partial |\Av \Xv \Bv|}{\partial \Xv} \right]\_{ij} = \frac{\partial |\Yv|}{\partial x\_{ji}} = \sum\_p \sum\_q \frac{\partial |\Yv|}{\partial y\_{pq}}\frac{\partial y\_{pq}}{\partial x\_{ji}} = \tr \left( \frac{\partial |\Yv|}{\partial \Yv} \frac{\partial \Yv}{\partial x\_{ji}} \right)
\end{align\*}
其中第二项
\begin{align\*}
    \frac{\partial \Yv}{\partial x\_{ji}} = \frac{\partial (\Av \Xv \Bv)}{\partial x\_{ji}} = \Av \frac{\partial \Xv}{\partial x\_{ji}} \Bv = \Av \Ev\_{ji} \Bv
\end{align\*}
记$y_{ji}$有一个微小增量$\epsilon$后的矩阵为$\Yv(y_{ji} + \epsilon)$，根据第$j$行Laplace展开易知
\begin{align\*}
    |\Yv(y\_{ji} + \epsilon)| - |\Yv| = \epsilon C\_{ji}
\end{align\*}
其中$C_{ji}$是关于$y_{ji}$的<span class="blue">代数余子式</span>，因此
\begin{align\*}
    \left[ \frac{\partial |\Yv|}{\partial \Yv} \right]\_{ij} = \frac{\partial |\Yv|}{\partial y\_{ji}} = \lim\_{\epsilon \rightarrow 0} \frac{|\Yv(y\_{ji} + \epsilon)| - |\Yv|}{\epsilon} = C\_{ji}
\end{align\*}
故第一项
\begin{align\*}
    \frac{\partial |\Yv|}{\partial \Yv} = \begin{bmatrix}
        C\_{11} & C\_{21} & \cdots & C\_{n1} \\\\
        C\_{12} & C\_{22} & \cdots & C\_{n2} \\\\
        \vdots & \vdots & \ddots & \vdots \\\\
        C\_{1n} & C\_{2n} & \cdots & C\_{nn}
    \end{bmatrix} = \Yv^*
\end{align\*}
代入可得
\begin{align\*}
    \left[ \frac{\partial |\Av \Xv \Bv|}{\partial \Xv} \right]\_{ij} & = \tr \left( \frac{\partial |\Yv|}{\partial \Yv} \frac{\partial \Yv}{\partial x\_{ji}} \right) = \tr (\Yv^* \Av \Ev\_{ji} \Bv) = [\Bv \Yv^* \Av]\_{ij} \\\\
                                                                    & \Longrightarrow \class{blue}{\frac{\partial |\Av \Xv \Bv|}{\partial \Xv} = \Bv (\Av \Xv \Bv)^* \Av}
\end{align\*}
若$\Xv$、$\Av$、$\Bv$均为可逆方阵，则$\Yv = \Av \Xv \Bv$亦为可逆方阵，于是
\begin{align} \label{eq: determinant}
    \frac{\partial |\Av \Xv \Bv|}{\partial \Xv} = \Bv (\Av \Xv \Bv)^* \Av = \Bv |\Av \Xv \Bv| (\Av \Xv \Bv)^{-1} \Av = |\Av \Xv \Bv| \Xv^{-1}
\end{align}
进一步若$\Av = \Bv = \Iv$，则
\begin{align\*}
    \frac{\partial |\Xv|}{\partial \Xv} = \Xv^* = |\Xv| \Xv^{-1}
\end{align\*}
由此可得
\begin{align\*}
    \frac{\partial |\Xv^n|}{\partial \Xv} = \frac{\partial |\Xv|^n}{\partial \Xv} = n |\Xv|^{n-1} \Xv^* = n |\Xv|^n \Xv^{-1} = n |\Xv^n| \Xv^{-1}
\end{align\*}
若$a$与$\Xv$无关，则
\begin{align\*}
    \frac{\partial \ln |a \Xv|}{\partial \Xv} = \frac{\partial \ln a^m |\Xv|}{\partial \Xv} = \frac{\partial \ln a^m}{\partial \Xv} + \frac{\partial \ln |\Xv|}{\partial \Xv} = \frac{1}{|\Xv|} \frac{\partial |\Xv|}{\partial \Xv} = \frac{\Xv^*}{|\Xv|} = \Xv^{-1}
\end{align\*}

　　设$\Xv \in \Rbb^{m \times n}$、$\Av \in \Rbb^{m \times m}$、$\Yv = \Xv^\top \Av \Xv \in \Rbb^{n \times n}$可逆，$\Av$与$\Xv$无关，易知有
\begin{align\*}
    \left[ \frac{\partial |\Xv^\top \Av \Xv|}{\partial \Xv} \right]\_{ij} & = \tr \left( \Yv^* \frac{\partial \Xv^\top \Av \Xv}{\partial x\_{ji}} \right) = \tr \left( \Yv^* \frac{\partial \Xv^\top}{\partial x\_{ji}} \Av \Xv \right) + \tr \left( \Yv^* \Xv^\top \Av \frac{\partial \Xv}{\partial x\_{ji}} \right) \\\\
    & = \tr ( \Yv^* \Ev\_{ij} \Av \Xv ) + \tr ( \Yv^* \Xv^\top \Av \Ev\_{ji} ) = [\Av \Xv \Yv^*]\_{ji} + [\Yv^* \Xv^\top \Av]\_{ij}
\end{align\*}
于是
\begin{align\*}
    \frac{\partial |\Xv^\top \Av \Xv|}{\partial \Xv} & = (\Av \Xv \Yv^*)^\top + \Yv^* \Xv^\top \Av = (\Av \Xv |\Xv^\top \Av \Xv| (\Xv^\top \Av \Xv)^{-1})^\top + |\Xv^\top \Av \Xv| (\Xv^\top \Av \Xv)^{-1} \Xv^\top \Av \\\\
    & = |\Xv^\top \Av \Xv| (\Xv^\top \Av^\top \Xv)^{-1} \Xv^\top \Av^\top + |\Xv^\top \Av \Xv| (\Xv^\top \Av \Xv)^{-1} \Xv^\top \Av                                     \\\\
    & = |\Xv^\top \Av \Xv| ((\Xv^\top \Av^\top \Xv)^{-1} \Xv^\top \Av^\top + (\Xv^\top \Av \Xv)^{-1} \Xv^\top \Av)
\end{align\*}
若$\Av$对称，则
\begin{align\*}
    \frac{\partial |\Xv^\top \Av \Xv|}{\partial \Xv} = 2 |\Xv^\top \Av \Xv| (\Xv^\top \Av \Xv)^{-1} \Xv^\top \Av
\end{align\*}
- 若$\Xv$、$\Av$是方阵，则其均可逆，于是
\begin{align\*}
    \frac{\partial |\Xv^\top \Av \Xv|}{\partial \Xv} = 2 |\Xv^\top| |\Av| |\Xv| \Xv^{-1} \Av^{-1} \Xv^{-\top} \Xv^\top \Av = 2 |\Xv|^2 |\Av| \Xv^{-1}
\end{align\*}
- 若$\Av = \Iv$，则
\begin{align\*}
    \frac{\partial |\Xv^\top \Xv|}{\partial \Xv} = 2 |\Xv^\top \Xv| (\Xv^\top \Xv)^{-1} \Xv^\top = 2 |\Xv^\top \Xv| \Xv^\dagger
\end{align\*}
以及
\begin{align\*}
    \frac{\partial \ln |\Xv^\top \Xv|}{\partial \Xv} = \frac{1}{|\Xv^\top \Xv|} \frac{\partial |\Xv^\top \Xv|}{\partial \Xv} = 2 \Xv^\dagger
\end{align\*}

