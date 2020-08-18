方阵$\Av$的行列式的导数为
\begin{align\*}
    \frac{\diff |\Av|}{\diff \Av} = |\Av| \Av^{-\top}
\end{align\*}

**证明**：记$a_{ij}$有一个微小增量$\epsilon$后的矩阵为$\Av(a_{ij} + \epsilon)$，根据第$i$行或第$j$列Laplace展开易知有
\begin{align\*}
    |\Av(a\_{ij} + \epsilon)| - |\Av| = \epsilon A\_{ij}
\end{align\*}
其中$A_{ij}$是关于$a_{ij}$的代数余子式。于是
\begin{align\*}
    \frac{\diff |\Av|}{\diff a\_{ij}} = \lim\_{\epsilon \rightarrow 0} \frac{|\Av(a\_{ij} + \epsilon)| - |\Av|}{\epsilon} = A\_{ij}
\end{align\*}
写成矩阵的形式为
\begin{align\*}
    \frac{\diff |\Av|}{\diff \Av} = \begin{bmatrix}
        A\_{11} & A\_{21} & \cdots & A\_{n1} \\\\
        A\_{12} & A\_{22} & \cdots & A\_{n2} \\\\
        \vdots & \vdots & \ddots & \vdots \\\\
        A\_{1n} & A\_{2n} & \cdots & A\_{nn}
    \end{bmatrix} = (\Av^\*)^{\top} = |\Av| \Av^{-\top}
\end{align\*}
其中$\Av^*$是$\Av$的伴随矩阵。

对于任意关于$|\Av|$的函数，如$\ln |\Av|$，由链式法则不难求得其导数为$\Av^{-\top}$。

\begin{figure}[htp]
    \centering
    \begin{dot2tex}[mathmode]
        digraph G {
            rankdir=LR;
            graph [nodesep=0.05 ranksep=0.001]
            node [shape="box"];
            edge [fontname="Symbol" fontsize=10];
            r [label="(R,+,\times)"];
            r1 [label="(R,+)"];
            r2 [label="(R,\times)"];
            r1 -> 原群 [label="封闭"];
            原群 -> 半群 [label="结合"];
            半群 -> 幺半群 [label="单位元"];
            幺半群 -> 群 [label="逆元"];
            群 -> 交换群 [label="交换"];
        }
    \end{dot2tex}
    \caption{抽象代数中的环}
\end{figure}


I'm a member of the CGCL/SCTS/BDTS lab at Huazhong University of Science and Technology (HUST). Before joining HUST, I completed my Ph.D. at Nanjing University under the advisement of Prof. Zhi-Hua Zhou.