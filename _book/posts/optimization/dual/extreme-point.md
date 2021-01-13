　　设凸多面体$\Pcal = \{ \xv \mid \Av \xv \leq \bv \} \subseteq \Rbb^n$，则下面四个条件均可作为极点$\vv$的定义：
1. 存在支撑超平面$\Hcal = \{ \xv \mid \wv^\top \xv = \lambda \}$使得对任意$\xv \in \Pcal$有$\wv^\top \xv \leq \lambda$且$\Pcal \cap \Hcal = \{ \vv \}$；
2. $\vv$无法表示成$\Pcal \setminus \{ \vv \}$中元素的凸组合；
3. 不存在非零向量$\dv$使得$\vv \pm \dv \in \Pcal$；
4. 存在$n$个约束$\av_i^\top \xv \leq b_i$在$\vv$处是紧的，即$\av_i^\top \vv = b_i$，且$\av_1, \ldots, \av_n$线性无关。

　　**证明**：

1 $\Rightarrow$ 2：若$\vv = \sum_i \alpha_i \vv_i$，其中$\sum_i \alpha_i = 1$且$\alpha_i \ge 0$，则
\begin{align\*}
    \lambda = \wv^\top \vv = \sum\_i \alpha\_i \wv^\top \vv\_i \leq \sum\_i \alpha\_i \lambda = \lambda
\end{align\*}
故对所有的$\vv_i$都有$\wv^\top \vv_i = \lambda$，这和$\Pcal$、$\Hcal$有唯一交集$\vv$矛盾。

2 $\Rightarrow$ 3：若$\vv \pm \dv \in \Pcal$，则$\vv = \frac{1}{2} (\vv + \dv) + \frac{1}{2} (\vv - \dv)$是一个凸组合表示，矛盾。

3 $\Rightarrow$ 4：设所有紧约束的法向量集合为$\Tcal = \{ \av_i \mid \av_i^\top \vv = b_i \}$，若$\dim (\spn (\Tcal)) < n$，即$\Tcal$只能张成$\Rbb^n$的真子空间，则存在非零向量$\dv$与$\spn(\Tcal)$正交，于是
\begin{align\*}
     & \av\_i^\top (\vv + \epsilon \dv) = \av\_i^\top \vv = b\_i, ~ \forall \av\_i \in \Tcal \\\\
     & \av\_i^\top \vv < b\_i, ~ \forall \av\_i \not \in \Tcal
\end{align\*}
这意味着存在充分小的$\epsilon > 0$使得对任意$i$有$\av_i^\top (\vv \pm \epsilon \dv) \le b_i$，故$\vv \pm \epsilon \dv \in \Pcal$，矛盾。

4 $\Rightarrow$ 1：构造超平面
\begin{align\*}
    \Hcal = \left\\{ \xv \mid \sum\_{i \in [n]} \av\_i^\top \xv = \sum\_{i \in [n]} b\_i \right\\}
\end{align\*}
显然对任意$\xv \in \Pcal$有$\sum_{i \in [n]} \av_i^\top \xv \leq \sum_{i \in [n]} b_i$。若想取等号，则必须有$[\av_1, \ldots, \av_n]^\top \xv = [b_1; \ldots; b_n]$，由$\av_1, \ldots, \av_n$线性无关知该线性方程组有唯一解，即$\vv$。

　　