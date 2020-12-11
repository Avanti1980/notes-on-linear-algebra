　　设二部图$\Gcal = (\Vcal, \Ecal)$，其中$\Vcal = \Vcal_1 \uplus \Vcal_2$，$\Ecal \subseteq \Vcal_1 \times \Vcal_2$，$\delta(v)$为与点$v$相连的边的集合。若$\Mcal \subseteq \Ecal$且其中任意两条边没有公共顶点，即不存在长度$\ge 2$的路径，则称$\Mcal$为匹配(matching)，其可表示为向量$\xv \in \Zbb_+^{|\Ecal|}$满足对任意$v \in \Vcal$有$\sum_{e \in \delta(v)} x_e \le 1$。若$\Ccal \subseteq \Vcal$使得$\Gcal$的每条边都至少有一个顶点属于$\Ccal$，则称$\Ccal$为覆盖(cover)，其可表示为向量$\zv \in \Zbb_+^{|\Vcal|}$使得对任意$(u,v) \in \Ecal$有$z_u + z_v \ge 1$。

　　设$\Av \in \{ 0,1 \}^{|\Vcal| \times |\Ecal|}$是二部图$\Gcal$对应的关联矩阵，即$a_{v,e} = 1_{e \in \delta(v)}$，则
\begin{align\*}
    \forall v \in \Vcal, \sum\_{e \in \delta(v)} x\_e \le 1 & \Longleftrightarrow \Av \xv \le \ev      \\\\
    \forall (u,v) \in \Ecal, ~ z\_u + z\_v \ge 1            & \Longleftrightarrow \Av^\top \zv \ge \ev
\end{align\*}

## 最大匹配

　　所有匹配中，势最大的称为<span class="blue">最大匹配</span>，求解最大匹配可形式化成
\begin{align} \label{eq: max-matching}
    \max\_{\xv} \\{ \ev^\top \xv : \xv \in \Zbb\_+^{|\Ecal|}, ~ \Av \xv \le \ev \\}
\end{align}
由于第一个约束的存在，这是一个整数规划，难以直接求解，将可行域放松成连续域可得线性规划
\begin{align} \label{eq: relax-max-matching}
    \max\_{\xv} \\{ \ev^\top \xv : \xv \ge \zerov, ~ \Av \xv \le \ev \\}
\end{align}
注意$\{ \xv \ge \zerov, ~ \Av \xv \le \ev \} \Longleftrightarrow [\Av; -\Iv] \xv \le [\ev; \zerov]$，由于二部图的关联矩阵必然是<u>[全幺模矩阵](https://avanti1980.github.io/notes-on-math/posts/matrix/TU-matrix.html)</u>，故$[\Av; -\Iv]$也是全幺模矩阵，又$[\ev; \zerov]$是整数向量，故凸多面体$\{ \xv \ge \zerov, ~ \Av \xv \le \ev \}$的<u>[极点](https://avanti1980.github.io/notes-on-math/posts/convex-optimization/extreme-point.html)</u>是整数向量。由于线性规划必然在极点处取最优，因此式(\ref{eq: relax-max-matching})的最优解就是式(\ref{eq: max-matching})的最大匹配。

　　上述将离散整数约束替换为连续实数约束的操作，其实是将可行域由匹配集合扩大成其凸包。

**定理1**：记匹配$\Mcal$对应的表示向量为$\xv^{(\Mcal)}$，$\Pcal (\Gcal) \triangleq \conv \{ \xv^{(\Mcal_1)}, \xv^{(\Mcal_2)}, \ldots \}$，$\Qcal (\Gcal)$定义为：
\begin{align\*}
    \Qcal (\Gcal) = \\{ \xv \mid \xv \ge \zerov, ~ \Av \xv \le \ev \\} = \left\\{ \xv \in \Rbb\_+^{|\Vcal|} \mid \forall v \in \Vcal, \sum\_{e \in \delta(v)} x\_e \le 1 \right\\}
\end{align\*}
那么$\Pcal (\Gcal) = \Qcal (\Gcal)$。

**证明**：正向比较简单，对任意$\xv = \sum_{i \in [n]} \alpha^{(\Mcal_i)} \xv^{(\Mcal_i)} \in \Pcal(\Gcal)$，易知
\begin{align\*}
    \sum\_{e \in \delta(v)} x\_e & = \sum\_{e \in \delta(v)} \sum\_{i \in [n]} \alpha^{(\Mcal\_i)} x^{(\Mcal\_i)}\_e = \sum\_{i \in [n]} \alpha^{(\Mcal\_i)} \underbrace{\sum\_{e \in \delta(v)} x^{(\Mcal\_i)}\_e}\_{\le 1} \le \sum\_{i \in [n]} \alpha^{(\Mcal\_i)} = 1
\end{align\*}
其中不等号是因为对任意匹配，点$v$相连的边中最多只有一条属于该匹配。

　　反向较为麻烦，对任意$\xv \in \Qcal (\Gcal)$，设$\supp(\xv) = \{ e \in \Ecal \mid x_e > 0 \}$。下面对$|\supp(\xv)|$进行归纳，若$|\supp(\xv)| = 0$，则$\xv = \zerov$就是零匹配；若$|\supp(\xv)| = 1$，显然$\xv$可以表示成零匹配和单边匹配的凸组合。若$|\supp(\xv)| \ge 2$，分两种情况讨论：
- $\supp(\xv)$不是匹配，则$\supp(\xv)$包含长度$\ge 2$的路径，不妨就设为$v_1 \xrightarrow{e_1} v_2 \xrightarrow{e_2} v_3$，由于$x_{e_1}, x_{e_2} > 0$，故$x_{e_1}, x_{e_2} < 1$，否则$\sum_{e \in \delta(v_2)} x_e = x_{e_1} + x_{e_2} > 1$。引入
\begin{align\*}
    d\_e = \begin{cases} 1 & e = e\_1 \\\\ -1 & e = e\_2 \\\\ 0 & \ow \end{cases}
\end{align\*}
现考虑$\xv + \epsilon \dv$，当$\epsilon$增大时，$x_{e_1} + \epsilon d_{e_1}$增大，$x_{e_2} + \epsilon d_{e_2}$减小，当$x_{e_2} + \epsilon d_{e_2}$变为零时，记此时的$\epsilon$为$\epsilon_1$，定义$\xv_1 \triangleq \xv + \epsilon_1 \dv$；同理对于$\xv - \epsilon \dv$，当$\epsilon$增大时，$x_{e_1} - \epsilon \dv_{e_1}$减小，$x_{e_2} - \epsilon \dv_{e_2}$增大，当$x_{e_1} - \epsilon \dv_{e_1}$变为零时，记此时的$\epsilon$为$\epsilon_2$，定义$\xv_2 \triangleq \xv - \epsilon_2 \dv$，那么
\begin{align\*}
    \epsilon\_2 \epsilon\_1 \dv = \epsilon\_2 \xv\_1 - \epsilon\_2 \xv = \epsilon\_1 \xv - \epsilon\_1 \xv\_2 \Longrightarrow \xv = \frac{\epsilon\_2}{\epsilon\_1 + \epsilon\_2} \xv\_1 + \frac{\epsilon\_1}{\epsilon\_1 + \epsilon\_2} \xv\_2 = \conv\\{ \xv\_1, \xv\_2 \\}
\end{align\*}
注意$|\supp(\xv_1)| = |\supp(\xv_2)| = |\supp(\xv)| - 1$，由归纳假设知$\xv_1,\xv_2 \in \Pcal(\Gcal)$，于是$\xv \in \Pcal(\Gcal)$。

- $\supp(\xv)$是匹配，不妨设$\supp(\xv) = \{ e_1, e_2, e_3, \ldots, e_n \}$且$x_{e_1} \le x_{e_2} \le x_{e_3} \le \cdots \le x_{e_n}$，定义
\begin{align\*}
    \Mcal\_i \triangleq \\{ e\_i, e\_{i+1}, \ldots, e\_n \\}, \quad \xv^{(\Mcal\_i)} = [\underbrace{0, \ldots, 0}\_{1:i-1}, \underbrace{1, 1, \ldots, 1}\_{i:n}, \underbrace{0, \ldots, 0}\_{n+1:|\Ecal|}], \quad i \in [n]
\end{align\*}
则
\begin{align\*}
    \xv & = \begin{bmatrix} x\_{e\_1} \\\\ x\_{e\_2} \\\\ x\_{e\_3} \\\\ \vdots \\\\ x\_{e\_n} \\\\ \zerov \end{bmatrix} = \begin{bmatrix} x\_{e\_1} \\\\ x\_{e\_1} \\\\ x\_{e\_1} \\\\ \vdots \\\\ x\_{e\_1} \\\\ \zerov \end{bmatrix} + \begin{bmatrix} 0 \\\\ x\_{e\_2} - x\_{e\_1} \\\\ x\_{e\_2} - x\_{e\_1} \\\\ \vdots \\\\ x\_{e\_2} - x\_{e\_1} \\\\ \zerov \end{bmatrix} + \begin{bmatrix} 0 \\\\ 0 \\\\ x\_{e\_3} - x\_{e\_2} \\\\ \vdots \\\\ x\_{e\_3} - x\_{e\_2} \\\\ \zerov \end{bmatrix} + \cdots \\\\
    & = x\_{e\_1} \xv^{(\Mcal\_1)} + (x\_{e\_2} - x\_{e\_1}) \xv^{(\Mcal\_2)} + (x\_{e\_3} - x\_{e\_2}) \xv^{(\Mcal\_3)}                       \\\\
    & \qquad + \cdots + (x\_{e\_n} - x\_{e\_{n-1}}) \xv^{(\Mcal\_n)} + (1 - x\_{e\_n}) \zerov \in \Pcal (\Gcal)
\end{align\*}


　　由定义$\Pcal (\Gcal) = \conv \{ \xv^{(\Mcal_1)}, \xv^{(\Mcal_2)}, \ldots \}$知$\Pcal (\Gcal)$的任意极点都是$\Gcal$的匹配，反过来结论也成立。

**定理2**：$\Gcal$的任意匹配都是$\Pcal$的极点。

**证明**：对任意匹配$\Mcal$和非零向量$\dv$，不妨设$d_e \neq 0$，注意$x^{(\Mcal)}_e \in \{0, 1\}$，因此$x^{(\Mcal)}_e \pm \epsilon d_e$总有一个不属于$[0,1]$，即$\xv^{(\Mcal)} \pm \epsilon \dv$总有一个不属于$\Pcal$，故$\xv^{(\Mcal)}$是$\Pcal$的极点。

## 完美匹配

　　若匹配$\Mcal^\star$使得在子图$(\Vcal, \Mcal^\star)$中，所有点都有且仅有一条相连的边，则称为完美匹配(perfect matching)。完美匹配可表示为向量$\xv \in \Zbb_+^{|\Ecal|}$满足对任意$v \in \Vcal$有$\sum_{e \in \delta(v)} x_e = 1$，显然完美匹配是匹配的真子集。

**定理3**：设$\Pcal^\star (\Gcal)$为$\Gcal$的所有完美匹配构成的凸包，$\Qcal^\star (\Gcal)$定义为：
\begin{align\*}
    \Qcal^\star (\Gcal) = \\{ \xv \mid \xv \ge \zerov, ~ \class{blue}{\Av \xv = \ev} \\} = \left\\{ \xv \in \Rbb\_+^{|\Vcal|} \mid \forall v \in \Vcal, \class{blue}{\sum\_{e \in \delta(v)} x\_e = 1} \right\\}
\end{align\*}
则$\Pcal^\star (\Gcal) = \Qcal^\star (\Gcal)$。

**证明**：一方面，对任意$\xv = \sum_{i \in [n]} \alpha^{(\Mcal_i^\star)} \xv^{(\Mcal_i^\star)} \in \Pcal^\star(\Gcal)$，易知
\begin{align\*}
    \sum\_{e \in \delta(v)} x\_e & = \sum\_{e \in \delta(v)} \sum\_{i \in [n]} \alpha^{(\Mcal\_i^\star)} x^{(\Mcal\_i^\star)}\_e = \sum\_{i \in [n]} \alpha^{(\Mcal\_i^\star)} \sum\_{e \in \delta(v)} x\_e^{(\Mcal\_i^\star)} = \sum\_{i \in [n]} \alpha^{(\Mcal\_i^\star)} = 1 \Longrightarrow \xv \in \Qcal^\star (\Gcal)
\end{align\*}

　　另一方面，对任意$\xv \in \Qcal^\star(\Gcal) \subseteq \Qcal(\Gcal) = \Pcal(\Gcal)$，设$\xv = \sum_{i \in [n]} \alpha^{(\Mcal_i)} \xv^{(\Mcal_i)}$。用反证法，若其凸组合表示中存在不完美匹配$\Mcal_j$，设$v$不是$\Mcal_j$中边的顶点，则
\begin{align\*}
    \sum\_{e \in \delta(v)} x\_e = \sum\_{e \in \delta(v)} \sum\_{i \in [n] \setminus \\{j\\}} \alpha^{(\Mcal\_i)} x\_e^{(\Mcal\_i)} = \sum\_{i \in [n] \setminus \\{j\\}} \alpha^{(\Mcal\_i)} \sum\_{e \in \delta(v)} x\_e^{(\Mcal\_i)} \le \sum\_{i \in [n] \setminus \\{j\\}} \alpha^{(\Mcal\_i)} < 1
\end{align\*}
这和$\Qcal^\star (\Gcal)$的定义矛盾，故$\xv$的凸组合表示中不存在不完美匹配，即$\xv \in \Pcal^\star (\Gcal)$。

**定理4**：$\Gcal$的任意完美匹配都是$\Pcal^\star$的极点。

**证明**：完美匹配也是匹配，因此是$\Pcal$的极点，故无法由$\Pcal$中其它点的凸组合表示，又$\Pcal^\star \subseteq \Pcal$，因此也无法由$\Pcal^\star$中其它点的凸组合表示，从而也是$\Pcal^\star$的极点

　　对于完全二部图$\Kcal_{n,n}$有$|\Ecal| = n^2$，对任意$\xv \in \Qcal^\star(\Kcal_{n,n})$有
\begin{align\*}
    \xv \in \Rbb\_+^{n^2}, ~ \forall v \in \Vcal, \sum\_{e \in \delta(v)} x\_e = 1
\end{align\*}
又每个点恰有$n$条相连的边，因此$\xv$也可以写成一个$n \times n$的双随机矩阵(所有行和、列和均为$1$)。另一方面，对于完美匹配$\Mcal$，每个点有且仅有一条相连的边，其对应的$\xv^{(\Mcal)}$可以写成置换矩阵(每行、每列有且仅有一个$1$，其余为零)，由定理4知<span class="blue">双随机矩阵集合的极点是置换矩阵</span>，这就是Birkhoff-von Neumann定理。

## König定理

　　前文已述最大匹配问题可放松成线性规划
\begin{align\*}
    \max\_{\xv} \\{ \ev^\top \xv : \xv \ge \zerov, ~ \Av \xv \le \ev \\}
\end{align\*}
引入Lagrange对偶函数$\Lcal(\xv, \yv, \zv) = \ev^\top \xv + \yv^\top \xv - \zv^\top (\Av \xv - \ev)$，易知
\begin{align\*}
    \frac{\partial \Lcal}{\partial \xv} = \ev + \yv - \Av^\top \zv = \zerov \Longrightarrow \Av^\top \zv - \ev = \yv \geq \zerov
\end{align\*}
故对偶问题为
\begin{align} \label{eq: relax-min-vertex-cover}
    \min\_{\zv} \\{ \ev^\top \zv : \zv \ge \zerov, ~ \Av^\top \zv \ge \ev \\}
\end{align}
显然这是将<span class="blue">最小点覆盖</span>问题
\begin{align} \label{eq: min-vertex-cover}
    \min\_{\zv} \\{ \ev^\top \zv : \zv \in \Zbb\_+^{|\Vcal|}, ~ \Av^\top \zv \ge \ev \\}
\end{align}
的离散可行域放松成连续域得到的线性规划。同理由$\{ \zv \ge \zerov, ~ \Av^\top \zv \ge \ev \} \Longleftrightarrow [-\Av^\top; -\Iv] \zv \le [-\ev; \zerov]$以及$\Av$是全幺模矩阵知凸多面体$\{ \zv \mid \zv \ge \zerov, ~ \Av^\top \zv \ge \ev \}$的极点是整数向量。由于线性规划必然在极点处取最优，因此式(\ref{eq: relax-min-vertex-cover})的最优解就是式(\ref{eq: min-vertex-cover})的最小点覆盖。

　　综上，最大匹配、最小点覆盖这两类整数规划问题，其最优解就是将整数约束放松后导出的线性规划的最优解，且这两类相应的线性规划互为对偶问题。

**定理5**：对于二部图$\Gcal = (\Vcal, \Ecal)$，设最大匹配问题的最优值为$\maxm(\Gcal)$，最小点覆盖问题的最优值为$\minvc(\Gcal)$，则有$\maxm(\Gcal) = \minvc(\Gcal)$。

**证明**：$\minvc(\Gcal) \ge \maxm(\Gcal)$是显然的，因为对最大匹配中的任意一条边，至少要覆盖其中一个顶点。

　　下面证明另一个方向，若$\Ecal = \emptyset$，则$\maxm(\Gcal) = \minvc(\Gcal) = 0$，故不妨设$\Ecal$非空。对$|\Vcal|$进行归纳，若$|\Vcal| = 2$，易知$\maxm(\Gcal) = \minvc(\Gcal) = 1$。若$|\Vcal| > 2$，设$\zv^\star$是最小点覆盖问题的最优解，由于存在点$v$使得$z_v^\star > 0$，故根据互补松弛条件可得
\begin{align\*}
    z\_v^\star (\Av\_{v,:} \xv^\star - 1) = 0 \Longrightarrow 1 = \Av\_{v,:} \xv^\star = \sum\_{e \in \delta(v)} x\_e^\star
\end{align\*}
又原问题的最优解$\xv^\star$是最大匹配，故$v$出现在所有的最大匹配中，记$\Gcal'$为$\Gcal$删除点$v$及其相连边后得到的图，于是
\begin{align\*}
    \maxm(\Gcal') = \maxm(\Gcal) - 1
\end{align\*}
由归纳假设知$\maxm(\Gcal') = \minvc(\Gcal')$，于是
\begin{align\*}
    \minvc(\Gcal) & \le \minvc(\Gcal') + 1 \\\\
                  & = \maxm(\Gcal') + 1    \\\\
                  & = \maxm(\Gcal)
\end{align\*}

　　König定理还可进一步推广，设$b$-匹配对应的表示向量满足对任意$v \in \Vcal$有$\sum_{e \in \delta(v)} x_e \le b_v$；$c$-点覆盖对应的表示向量满足对任意$e = (u,v) \in \Ecal$有$z_u + z_v \ge c_e$，易知有
\begin{align\*}
    \max\_{\xv} \\{ \cv^\top \xv : \xv \ge \zerov, ~ \Av \xv \le \bv \\} = \min\_{\zv} \\{ \bv^\top \zv : \zv \ge \zerov, ~ \Av^\top \zv \ge \cv \\}
\end{align\*}
即最大$c$-加权$b$-匹配等于最小$b$-加权$c$-点覆盖。

## 最大流与最小割

　　类似于最大匹配和最小点覆盖，最大流和最小割也是一组对偶问题。给定有向流网络$\Gcal = (\Vcal, \Ecal)$、源点$s$、汇点$t$，设$\delta_{\text{in}}(v)$是以点$v$为终点的入边集合、$\delta_{\text{out}}(v)$是以点$v$为起点的出边集合，$\Av \in \{ 0, \pm 1 \}^{|\Vcal| \times |\Ecal|}$是$\Gcal$对应的关联矩阵，即
\begin{align\*}
    a\_{v,e} = \begin{cases}
        1  & e \in \delta\_{\text{in}} (v)  \\\\
        -1 & e \in \delta\_{\text{out}} (v) \\\\
        0  & \ow
    \end{cases}
\end{align\*}
$\Av'$为$\Av$去掉$s$、$t$对应行的子矩阵，注意有向流网络中源点$s$只有出边、汇点$t$只有入边，因此$\Av'$其实也是$\Gcal$删除$s$、$t$及其所有相连边后的有向图的关联矩阵，故$\Av'$是全幺模矩阵。

　　最大流问题可形式化为线性规划：
\begin{align\*}
    \max\_{\xv} \\{ \av^\top \xv : \zerov \le \xv \le \cv, ~ \Av' \xv = \zerov \\}
\end{align\*}
其中$\av^\top$是$\Av$中汇点$t$对应的行，$\zerov \le \xv \le \cv$约束流的上下界，$\Av' \xv = \zerov$约束非源点、汇点的流量要守恒。注意
\begin{align\*}
    \\{ \xv \mid \zerov \le \xv \le \cv, ~ \Av' \xv = \zerov \\} \Longleftrightarrow [\Av'; -\Av'; \Iv; -\Iv] \xv \leq [\zerov; \zerov; \cv; \zerov]
\end{align\*}
由$\Av'$是全幺模矩阵知$[\Av'; -\Av'; \Iv; -\Iv]$也是全幺模矩阵，若流量上限$\cv$是整数向量，则可行域$\{ \zv \mid \zerov \le \xv \le \cv, ~ \Av' \xv = \zerov \}$的极点也是整数向量，即最大流是整数流。

　　引入Lagrange对偶函数$\Lcal(\xv, \yv, \zv, \wv) = \av^\top \xv + \yv^\top \xv - \zv^\top (\xv - \cv) - \wv'^\top \Av' \xv$，易知
\begin{align\*}
    \frac{\partial \Lcal}{\partial \xv} = \av + \yv - \zv - \Av'^\top \wv' = \zerov \Longrightarrow \Av'^\top \wv' + \zv \ge \av
\end{align\*}
故对偶问题为
\begin{align\*}
    \min\_{\wv', \zv} \\{ \cv^\top \zv : \zv \ge \zerov, ~ \Av'^\top \wv' + \zv \ge \av \\}
\end{align\*}
注意
\begin{align\*}
    \\{ \zv \mid \zv \ge \zerov, ~ \Av'^\top \wv' + \zv \ge \av \\} \Longleftrightarrow [-\Av'^\top, -\Iv; \zerov, -\Iv] [\wv'; \zv] \leq [-\av; \zerov]
\end{align\*}
由$\Av'$是全幺模矩阵知$[-\Av'^\top, -\Iv; \zerov, -\Iv]$也是全幺模矩阵，故对偶问题的最优解$\wv'^\star$、$\zv^\star$也是整数向量。

　　$\wv'^\star$的维度为$|\Vcal| - 2$，与$\Av'$的行对应，现添加$w_s^\star = 0$、$w_t^\star = -1$将其扩充为$\wv^\star$，与$\Av$的行对应，于是$\Av^\top \wv^\star + \zv^\star = \Av'^\top \wv'^\star - \av + \zv^\star \ge \zerov$。由于$\cv$非负，故$\zv^\star$应尽量的小，从而$\zv^\star = \max \{ \zerov, - \Av^\top \wv^\star \}$，即对$e = (u,v) \in \Ecal$有$z^\star_e = \max \{ 0, w_u^\star - w_v^\star \}$。

　　定义$\Scal = \{ v \in \Vcal \mid w_v^\star \ge 0 \}$，$\overline{\Scal} = \Vcal \setminus \Scal$，显然$s \in \Scal$、$t \in \overline{\Scal}$，将边分为四类：
- $\delta(\Scal) \triangleq \{ (u,v) \in \Ecal \mid u \in \Scal, ~ v \in \Scal \}$为所有起点、终点均属于$\Scal$的边的集合；
- $\delta(\overline{\Scal}) \triangleq \{ (u,v) \in \Ecal \mid u \in \overline{\Scal}, ~ v \in \overline{\Scal} \}$为所有起点、终点均属于$\overline{\Scal}$的边的集合；
- $\delta_{\text{out}}(\Scal) \triangleq \{ (u,v) \in \Ecal \mid u \in \Scal, ~ v \in \overline{\Scal} \}$为所有起点属于$\Scal$、终点属于$\overline{\Scal}$的边的集合；
- $\delta_{\text{in}}(\Scal) \triangleq \{ (u,v) \in \Ecal \mid u \in \overline{\Scal}, ~ v \in \Scal \}$为所有起点属于$\overline{\Scal}$、终点属于$\Scal$的边的集合；

注意在将所有$\delta_{\text{out}}(\Scal)$中的边删除后，$s$、$t$不再连通，因此$\delta_{\text{out}}(\Scal)$称为割(cut)。

　　由于$w_v^\star$都是整数，因此对任意$e = (u,v) \in \delta_{\text{out}}(\Scal)$有$z_e^\star \ge w_u^\star - w_v^\star \ge 1$，因此
\begin{align\*}
    \cv^\top \zv^\star \ge \sum\_{e \in \delta\_{\text{out}}(\Scal)} c\_e z\_e^\star \ge \sum\_{e \in \delta\_{\text{out}}(\Scal)} c\_e \ge \sum\_{e \in \delta\_{\text{out}}(\Scal)} x\_e^\star \ge \sum\_{e \in \delta\_{\text{in}}(t)} x\_e^\star = \av^\top \xv^\star \ge \cv^\top \zv^\star
\end{align\*}
其中第一个不等号是因为$z_e^\star \ge 0$；第二个不等号是因为对任意$e \in \delta_{\text{out}}(\Scal)$有$z_e^\star \ge 1$；第三个不等号是因为$c_e$是边$e$的流量上限；第四个不等号是因为$\delta_{\text{out}}(\Scal)$上的流量未必会全部进入汇点，可能会有一部分通过$\delta_{\text{in}}(\Scal)$再折回$\Scal$；第五个不等号是因为弱对偶性。

　　综上所有的不等号都取等号，由此可以得到一些有趣的结论：
- 根据第一个不等号取等号，对任意$e \not \in \delta_{\text{out}}(\Scal)$有$z_e^\star = 0$，即对任意$\delta(\Scal)$、$\delta(\overline{\Scal})$、$\delta_{\text{in}}(\Scal)$中的边$e$，都有$z_e^\star = 0$；
- 根据第二个不等号取等号，对任意$e = (u,v) \in \delta_{\text{out}}(\Scal)$有$z_e^\star = 1$，故只可能是$w_u^\star = 0$、$w_v^\star = -1$，于是对任意$e = (p, u) \in \delta(\Scal)$，必然有$w_p^\star = 0$，否则$z_e^\star \ge w_p^\star - w_u^\star > 0$，与前一个结论矛盾，依此类推，对所有$\Scal$中的点$u$都有$w_u^\star = 0$。同理，对所有$\overline{\Scal}$中的点$v$都有$w_v^\star = -1$；
- 根据第三个不等号取等号，当流量达到最大时，$\delta_{\text{out}}(\Scal)$中每条边的流量都达到上限，这个也可由互补松弛条件$z_e (x_e - c_e) = 0$得到：$z_e^\star = 1 > 0 \Longrightarrow x_e^\star = c_e$；
- 根据第四个不等号取等号，$\delta_{\text{out}}(\Scal)$上的流量全部进入$t$，不存在折回$\Scal$的情况，即$\delta_{\text{in}}(\Scal)$上的流量为零，这个也可由互补松弛条件$y_e x_e = 0$得到：$z_e^\star = 0 > -1 = w_u^\star - w_v^\star$，故$y_e^\star = z_e^\star - (w_u^\star - w_v^\star) > 0$，从而$x_e^\star = 0$。



