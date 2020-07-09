　　众所周知对于方阵$\Av$、$\Bv$有
\begin{align} \label{eq: det-product}
    \det(\Av \Bv) = \det(\Av) \det(\Bv)
\end{align}
更一般的设$\Av \in \Rbb^{m \times n}$、$\Bv \in \Rbb^{n \times m}$，记$S_{[n],m}$为集合$[n]$的所有$m$元子集构成的集合，则
\begin{align} \label{eq: Cauchy-Binet}
    \det(\Av \Bv) = \sum\_{S \in S\_{[n],m}} \det(\Av\_{[m],S}) \det(\Bv\_{S,[m]})
\end{align}
这就是<span class="orange">Cauchy-Binet公式</span>。

　　考虑三种情况：
1. $m = n$，此时$S_{[n],n}$中只有一个元素，就是$[n]$，式(\ref{eq: Cauchy-Binet})就退化成了式(\ref{eq: det-product})；
2. $m > n$，此时$S_{[n],m}$是个空集，因此式(\ref{eq: Cauchy-Binet})等号右边的求和为零，而左边是个秩为$n$的$m$阶方阵，<span class="orange">非满秩矩阵</span>对应的行列式值为零；
3. $m < n$，举个简单的例子，$n=3$、$m=2$、$S_{[n],m} = \{ \{1,2\}, \{2,3\}, \{1,3\} \}$，此时有

\begin{align\*}
    \left| \begin{bmatrix}
        a\_{11} & a\_{12} & a\_{13} \\\\ a\_{21} & a\_{22} & a\_{23}
    \end{bmatrix} \begin{bmatrix}
        b\_{11} & b\_{12} \\\\ b\_{21} & b\_{22} \\\\ b\_{31} & b\_{32}
    \end{bmatrix} \right| = \underbrace{\left| \begin{matrix}
            a\_{11} & a\_{12} \\\\ a\_{21} & a\_{22}
        \end{matrix} \right| \left| \begin{matrix}
            b\_{11} & b\_{12} \\\\ b\_{21} & b\_{22}
        \end{matrix} \right|}\_{S=\\{1,2\\}} + \underbrace{\left| \begin{matrix}
            a\_{12} & a\_{13} \\\\ a\_{22} & a\_{23}
        \end{matrix} \right| \left| \begin{matrix}
            b\_{21} & b\_{22} \\\\ b\_{31} & b\_{32}
        \end{matrix} \right|}\_{S=\\{2,3\\}} + \underbrace{\left| \begin{matrix}
            a\_{11} & a\_{13} \\\\ a\_{21} & a\_{23}
        \end{matrix} \right| \left| \begin{matrix}
            b\_{11} & b\_{12} \\\\ b\_{31} & b\_{32}
        \end{matrix} \right|}\_{S=\\{1,3\\}}
\end{align\*}

　　下面给出一个简单的证明，记$\Av$的列分别为$\av_1, \ldots, \av_n$，则
\begin{align\*}
    \Av \Bv = \begin{bmatrix}
        \sum\_i b\_{i1} \av\_i & \sum\_i b\_{i2} \av\_i & \ldots & \sum\_i b\_{im} \av\_i
    \end{bmatrix}
\end{align\*}
即$\Av \Bv$的每一列都是$\av_1, \ldots, \av_n$的线性组合。下面依次展开每一列，易知
\begin{align\*}
    \det(\Av \Bv) & = | \begin{matrix}
        \sum\_i b\_{i1} \av\_i & \sum\_i b\_{i2} \av\_i & \ldots & \sum\_i b\_{im} \av\_i
    \end{matrix} |                                                          \\\\
                  & = b\_{11} | \begin{matrix}
        \av\_1 & \sum\_i b\_{i2} \av\_i & \ldots & \sum\_i b\_{im} \av\_i
    \end{matrix} | + \cdots +  b\_{n1} | \begin{matrix}
        \av\_n & \sum\_i b\_{i2} \av\_i & \ldots & \sum\_i b\_{im} \av\_i
    \end{matrix} |
\end{align\*}
接着展开第二列，易知上式右边的每一项又会拆分成$n$项，即
\begin{align\*}
    \forall k \in [n], \quad & b\_{k1} | \begin{matrix}
        \av\_k & \sum\_i b\_{i2} \av\_i & \ldots & \sum\_i b\_{im} \av\_i
    \end{matrix} | = b\_{k1} (b\_{12} | \begin{matrix}
        \av\_k & \av\_1 & \ldots & \sum\_i b\_{im} \av\_i
    \end{matrix} | + \cdots + b\_{n2} | \begin{matrix}
        \av\_k & \av\_n & \ldots & \sum\_i b\_{im} \av\_i
    \end{matrix} |)
\end{align\*}
最终全部$m$列展开完毕，将会得到$n^m$项：
\begin{align\*}
    \det(\Av \Bv) = \sum\_{\phi} b\_{\phi(1),1} b\_{\phi(2),2} \cdots b\_{\phi(m),m} | \begin{matrix}
        \av\_{\phi(1)} & \av\_{\phi(2)} & \ldots & \av\_{\phi(m)}
    \end{matrix} |
\end{align\*}
其中$\phi$是$[m] \mapsto [n]$的映射，求和遍历所有这样的映射。注意若行列式两列相同，行列式值为零，因此实际我们只需考虑<span class="orange">单射</span>，这样上式的求和项中就只剩下$A_n^m$项。

　　对于任一满足$\phi(1) < \phi(2) < \cdots < \phi(m)$的项，显然它的行列式中的部分是$\Av$的某个$m$阶子方阵，故
\begin{align\*}
    | \begin{matrix}
        \av\_{\phi(1)} & \av\_{\phi(2)} & \ldots & \av\_{\phi(m)}
    \end{matrix} | = \det(\Av\_{[m], S})
\end{align\*}
其中$S = \{\phi(1), \phi(2), \ldots, \phi(m)\}$。现考虑其它行列式也由$\av_{\phi(1)}, \ldots, \av_{\phi(m)}$构成的项，这样的项有$m!$个，均呈型
\begin{align\*}
    b\_{\sigma \circ \phi(1),1} b\_{\sigma \circ \phi(2),2} \cdots b\_{\sigma \circ \phi(m),m} | \begin{matrix}
        \av\_{\sigma \circ \phi(1)} & \av\_{\sigma \circ \phi(2)} & \ldots & \av\_{\sigma \circ \phi(m)}
    \end{matrix} |
\end{align\*}
其中$\sigma$是$S \mapsto S$的<span class="orange">置换</span>，由于行列式交换两列，值不变符号取反，因此
\begin{align\*}
    | \begin{matrix}
        \av\_{\sigma \circ \phi(1)} & \av\_{\sigma \circ \phi(2)} & \ldots & \av\_{\sigma \circ \phi(m)}
    \end{matrix} | = (-1)^{\sgn (\sigma)} | \begin{matrix}
        \av\_{\phi(1)} & \av\_{\phi(2)} & \ldots & \av\_{\phi(m)}
    \end{matrix} | = (-1)^{\sgn (\sigma)} \det(\Av\_{[m], S})
\end{align\*}
其中$\sgn (\sigma)$是$\sigma$产生的<span class="orange">逆序对</span>的个数。所有这样的项求和为
\begin{align\*}
    \left( \sum\_{\sigma} (-1)^{\sgn (\sigma)} b\_{\sigma \circ \phi(1),1} b\_{\sigma \circ \phi(2),2} \cdots b\_{\sigma \circ \phi(m),m} \right) \det(\Av\_{[m], S})
\end{align\*}
注意括号中的部分就是$\Bv$的第$\phi(1), \ldots, \phi(m)$行构成的$m$阶子方阵的行列式展开，因此上式等于
\begin{align\*}
    \det(\Av\_{[m], S}) \det(\Bv\_{S,[m]})
\end{align\*}
取遍$C_n^m$个这样<span class="orange">单调递增</span>的$\phi$即可得
\begin{align\*}
    \det(\Av \Bv) = \sum\_{S \in S\_{[n],m}} \det(\Av\_{[m],S}) \det(\Bv\_{S,[m]})
\end{align\*}

