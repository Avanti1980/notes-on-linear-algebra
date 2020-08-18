若方阵$\Av$可逆，则
\begin{align\*}
    \frac{\diff (\tr (\Bv \Av^{-1} \Cv))}{\diff \Av} = - \Av^{-\top} \Bv^\top \Cv^\top \Av^{-\top}
\end{align\*}

**证明**：由矩阵乘法的线性性，易知有
\begin{align\*}
    \frac{\diff (\Av \Bv)}{\diff x} = \frac{\diff \Av}{\diff x} \Bv + \Av \frac{\diff \Bv}{\diff x}
\end{align\*}
特别地，取$\Bv = \Av^{-1}$且$x = a_{ij}$可知有
\begin{align\*}
    \boldsymbol{0} = \frac{\diff \Iv}{\diff a\_{ij}} = \frac{\diff (\Av \Av^{-1})}{\diff a\_{ij}} = \frac{\diff \Av}{\diff a\_{ij}} \Av^{-1} + \Av \frac{\diff \Av^{-1}}{\diff a\_{ij}}
\end{align\*}
即
\begin{align\*}
    \frac{\diff \Av^{-1}}{\diff a\_{ij}} = - \Av^{-1} \frac{\diff \Av}{\diff a\_{ij}} \Av^{-1}
\end{align\*}
注意$\tr (\Bv \Av^{-1} \Cv) = \tr (\Av^{-1} \Cv \Bv)$，于是
\begin{align\*}
    \frac{\diff (\tr (\Bv \Av^{-1} \Cv))}{\diff a\_{ij}} & = \frac{\diff (\tr(\Av^{-1} \Cv \Bv))}{\diff a\_{ij}} = \tr \left( \frac{\diff (\Av^{-1} \Cv \Bv)}{\diff a\_{ij}} \right)                                         \\\\
                                                        & = \tr \left( - \Av^{-1} \frac{\diff \Av}{\diff a\_{ij}} \Av^{-1} \Cv \Bv \right) = - \tr \left( \frac{\diff \Av}{\diff a\_{ij}} \Av^{-1} \Cv \Bv \Av^{-1} \right)
\end{align\*}
注意$\diff \Av / \diff a_{ij}$是一个$(i,j)$处为$1$其余均为$0$的矩阵，于是
\begin{align\*}
    \frac{\diff (\tr (\Bv \Av^{-1} \Cv))}{\diff a\_{ij}} = - [\Av^{-1} \Cv \Bv \Av^{-1}]\_{ji}
\end{align\*}
写成矩阵的形式为
\begin{align\*}
    \frac{\diff (\tr (\Bv \Av^{-1} \Cv))}{\diff \Av} = - \Av^{-\top} \Bv^\top \Cv^\top \Av^{-\top}
\end{align\*}
