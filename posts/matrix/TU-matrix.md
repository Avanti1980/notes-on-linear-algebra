　　若矩阵$\Av$的任意子方阵的行列式$\in \{ 0, \pm 1 \}$，则称$\Av$为全幺模矩阵(totally unimodular matrix)。

　　全幺模对于取负、转置、交换行列、拼接自身、拼接单位向量等操作是封闭的：若$\Av$是全幺模矩阵，则
- $\Av$的任意子矩阵$\Bv$也是全幺模矩阵，因为$\Bv$的任意子方阵也是$\Av$的子方阵，特别的$\Av$的任意元素都$\in \{ 0, \pm 1 \}$。
- $-\Av$是全幺模矩阵，设$\Av'$是$-\Av$的任意子方阵，则$-\Av'$是$\Av$的子方阵，于是$\det(-\Av') \in \{ 0, \pm 1 \}$，从而$\det(\Av') \in \{ 0, \pm 1 \}$。
- $\Av^\top$是全幺模矩阵，设$\Av'$是$\Av^\top$的任意子方阵，则$\Av'^\top$是$\Av$的子方阵，于是$\det(\Av'^\top) \in \{ 0, \pm 1 \}$，从而$\det(\Av') \in \{ 0, \pm 1 \}$。
- 把$\Av$的两行/两列互换得到的矩阵$\Bv$是全幺模矩阵，因为$\Bv$的任意子方阵都可以通过$\Av$的某个子方阵交换行/列得到，而交换行/列只改变行列式的符号。
- $[\Av, \pm \Av]$是全幺模矩阵，设$\Bv$是$[\Av, \pm \Av]$的任意子方阵，则$\Bv$的每一列要么来自于$\Av$的某一列，要么来自于$\pm \Av$的某一列。若有两列相同或仅差一个符号，则$\Bv$是奇异矩阵，从而$\det(\Bv) = 0$；否则$\Bv$可直接由$\Av$的某个子方阵得到(最多对部分列再取负)，这只会影响行列式的符号，此时有$\det(\Bv) \in \{ 0, \pm 1 \}$。
- $[\Av, \pm \Iv]$是全幺模矩阵，设$\Bv$是$[\Av, \pm \Iv]$的任意非奇异子方阵，若$\Bv$是$\Av$或$\pm \Iv$其中之一的子方阵，易知有$|\det(\Bv)| = 1$，否则设$\Bv = [\overline{\Av}, \pm \overline{\Iv}]$，其中$\overline{\Av}$、$\overline{\Iv}$分别是$\Av$和$\Iv$的子矩阵且都是列满秩的(否则$\Bv$奇异)，交换$\Bv$的某些行可得
\begin{align\*}
    \overline{\Bv} = \begin{bmatrix} \overline{\Av}\_1 & \zerov \\\\ \overline{\Av}\_2 & \pm \hat{\Iv} \end{bmatrix}
\end{align\*}
于是$|\det(\overline{\Bv})| = |\det(\overline{\Av}_1)| \cdot |\det(\pm \hat{\Iv})| = |\det(\overline{\Av}_1)|$，而$\overline{\Av}_1$是$\Av$的某个非奇异子方阵交换行得到的，故$|\det(\Bv)| = |\det(\overline{\Bv})| = |\det(\overline{\Av}_1)| = 1$。
- $[\Av; \pm \Iv]$是全幺模矩阵，因为$[\Av; \pm \Iv] = [\Av^\top, \pm \Iv]^\top$，其中$\Av^\top$是全幺模矩阵，故$[\Av^\top, \pm \Iv]$是全幺模矩阵，取转置后依然是全幺模矩阵。

　　全幺模矩阵导出的凸多面体的<u>[极点](https://avanti1980.github.io/notes-on-math/posts/convex-optimization/extreme-point.html)</u>是整数向量，若这样的凸多面体是某个线性规划的可行域，那么该线性规划的最优解是整数解，换言之相应的整数线性规划可以通过放松成一般的线性规划来做。

**定理1**. 设$\Av \in \{ 0, \pm 1 \}^{m \times n}$是全幺模矩阵，$\bv \in \Zbb^m$是整数向量，则凸多面体$\Pcal = \{ \xv \in \Rbb^n \mid \Av \xv \leq \bv \}$的极点都是整数向量。

**证明**：设$\vv$是$\Pcal$的极点，则存在$n$元下标集合$\Ical \subseteq [m]$使得$\Av_{\Ical,:} \vv = \bv_{\Ical}$，由Cramer法则知
\begin{align\*}
    v\_i = \frac{\det(\Av\_{\Ical,:}^{(i)}|\bv\_{\Ical})}{\det(\Av\_{\Ical,:})}
\end{align\*}
其中$\Av_{\Ical,:}^{(i)}|\bv_{\Ical}$是将$\Av_{\Ical,:}$的第$i$列替换成$\bv_{\Ical}$得到的矩阵。注意$\Av_{\Ical,:}$是$\Av$的$n$阶非奇异子方阵，因此$\det(\Av_{\Ical,:}) = \pm 1$。将$\Av_{\Ical,:}^{(i)}|\bv_{\Ical}$按第$i$列展开，由于$\bv_{\Ical}$是整数向量，而展开中涉及的代数余子式又都$\in \{ 0, \pm 1 \}$，因此$\det(\Av_{\Ical,:}^{(i)}|\bv_{\Ical})$也是整数，故$v_i$是整数。

　　全幺模矩阵跟图也有联系。

**定理2**. 对于二部图$\Gcal = (\Vcal = \Vcal_1 \uplus \Vcal_2, \Ecal)$，其关联矩阵$\Av \in \{ 0,1 \}^{|\Vcal| \times |\Ecal|}$是全幺模矩阵。

**证明**：对子矩阵的阶数$k$做归纳，$k=1$的情形是显然的，因为$\Av$的每个元素都$\in \{ 0,1 \} \subseteq \{ 0, \pm 1 \}$。设$\Av'$是$\Av$的$k$阶子矩阵，注意$\Av'$的每列最多有两个$1$，其余均为零。
- 若有一列全零，则$\Av'$为奇异矩阵，从而$\det(\Av') = 0 \in \{ 0, \pm 1 \}$。
- 若有一列恰有一个$1$，按该列展开，设$\Av''$是将$1$所在行、列删除后得到的矩阵，则$\det(\Av') = \pm \det (\Av'')$，由归纳假设知$\det (\Av'') \in \{ 0, \pm 1 \}$，故$\det(\Av') \in \{ 0, \pm 1 \}$。
- 若每列都有两个$1$，由于$\Gcal$是二部图，可将$\Av'$按行分成两部分，分别对应$\Vcal_1$中的点和$\Vcal_2$中的点，显然第一部分的行和减去第二部分行和为$\zerov$，故$\Av'$是奇异矩阵，从而$\det(\Av') = 0 \in \{ 0, \pm 1 \}$。

**定理3**. 有向图$\Gcal = (\Vcal, \Ecal)$的关联矩阵$\Av \in \{ 0, \pm 1 \}^{|\Vcal| \times |\Ecal|}$是全幺模矩阵。

**证明**：对子矩阵的阶数$k$做归纳，$k=1$的情形是显然的，注意$\Av'$的每列最多有两个非零元素，其余均为零。
- 若有一列全零，则$\Av'$为奇异矩阵，从而$\det(\Av') = 0 \in \{ 0, \pm 1 \}$。
- 若有一列恰有一个$1$或$-1$，按该列展开，设$\Av''$是将非零元素所在行、列删除后得到的矩阵，则$\det(\Av') = \pm \det (\Av'')$，由归纳假设知$\det (\Av'') \in \{ 0, \pm 1 \}$，故$\det(\Av') \in \{ 0, \pm 1 \}$。
- 若每列都有一个$1$、一个$-1$，则$\Av'$的所有行相加为$\zerov$，故$\Av'$是奇异矩阵，从而$\det(\Av') = 0 \in \{ 0, \pm 1 \}$。

## 附录

　　考虑线性方程组$x_1 \av_1 + x_2 \av_2 + \cdots + x_n \av_n = \bv$，易知
\begin{align\*}
    \det (\cdots, \av\_{i-1}, \bv, \av\_{i+1}, \cdots) & = \det (\cdots, \av\_{i-1}, \sum\_{j \in [n]} x\_j \av\_j, \av\_{i+1}, \cdots) \\\\
                                                     & = \sum\_{j \in [n]} x\_j \det (\cdots, \av\_{i-1}, \av\_j, \av\_{i+1}, \cdots) \\\\
                                                     & = x\_i \det (\cdots, \av\_{i-1}, \av\_i, \av\_{i+1}, \cdots)
\end{align\*}
故
\begin{align\*}
    x\_i = \frac{\det (\cdots, \av\_{i-1}, \bv, \av\_{i+1}, \cdots)}{\det (\cdots, \av\_{i-1}, \av\_i, \av\_{i+1}, \cdots)}
\end{align\*}
该求解公式称为Cramer法则。

　　

