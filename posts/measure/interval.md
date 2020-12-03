　　Lebesgue积分的核心问题是给$\Rbb$的子集赋予“长度”，而$\Rbb$上最简单的子集就是<span class="violet">区间</span>，故从区间入手不失为一种途径。

　　区间是拥有<span class="violet">凸性</span>的一类子集，共有10种：
\begin{align\*}
    (a,b), \quad [a,b), \quad (a,b], \quad [a,b], \quad (a,\infty), \quad [a,\infty), \quad (-\infty,a), \quad (-\infty,a], \quad (-\infty, \infty), \quad \emptyset
\end{align\*}
其中$\Rbb = (-\infty, \infty)$就是全集，$\emptyset$是其补集，此外$[a,a] = \{ a \}$，因此单点集也属于区间。

　　对任意两个区间$I_1$、$I_2$，其交集是一个区间($\emptyset$也是区间)；其并集要么是一个区间，要么存在$t$满足如下两种情况之一：(1).对$\forall x_1 \in I_1$、$\forall x_2 \in I_2$有$x_1 < t < x_2$；(2).对$\forall x_1 \in I_1$、$\forall x_2 \in I_2$有$x_2 < t < x_1$；其补集要么是一个区间，要么是两个区间的并集。

　　下面考虑所有由<span class="violet">区间的有限并</span>(finite union)构成的集合$\Ical$，不难验证$\Ical$是一个<span class="violet">代数</span>。首先全集$\Rbb = (-\infty, \infty) \in \Ical$；设$E_1 = \cup_{j \in [n]} I_j \in \Ical$，$E_2 = \cup_{k \in [n']} I'_k \in \Ical$，那么$E_1 \cup E_2$显然还是区间的有限并；又
\begin{align\*}
    E\_1 \cap E\_2 = (\cup\_{j \in [n]} I\_j) \cap (\cup\_{k \in [n']} I'\_k) = \cup\_{j \in [n]} \cup\_{k \in [n']} (I\_j \cap I'\_k)
\end{align\*}
由于$I_j \cap I'_k$是一个区间，因此$E_1 \cap E_2$也是区间的有限并，从而属于$\Ical$，最后由De Morgan律知$\complement E_1 = \cap_{j \in [n]} \complement I_j$，而每个$\complement I_j$均是区间的有限并，因此其交集也属于$\Ical$，故$\Ical$是一个代数。

　　对于$\Ical$中任一元素$E$，将能合并成一个区间的都合并掉，则可得到标准形式
\begin{align\*}
    E = I\_1 \cup \cdots \cup I\_n
\end{align\*}
其中$I_1, \ldots, I_n$两两交集为空，且存在$t_1, \ldots, t_{n-1}$满足
\begin{align\*}
    x\_1 < t\_1 < x\_2 < t\_2 < \cdots < t\_{n-1} < x\_n, \quad \forall x\_j \in I\_j, ~ j \in [n]
\end{align\*}
后文如无特殊说明，$\Ical$中的任一写成该形式的元素默认为其标准形式。

　　下面考虑给区间赋予长度，直觉上来说<span class="violet">区间长度就是其端点的差值，无界区间长度为$\infty$，不相交区间的并的长度是它们的长度之和</span>，故引入长度函数$m: \Ical \mapsto [0, \infty]$：
\begin{align\*}
     & m((a,b)) = m([a,b)) = m((a,b]) = m([a,b]) = b - a, \quad m(\emptyset) = 0                       \\\\
     & m((a,\infty)) = m([a,\infty)) = m((-\infty,a)) = m((-\infty,a]) = m((-\infty, \infty)) = \infty
\end{align\*}
对任意$E = I_1 \cup \cdots \cup I_n \in \Ical$，<span class="red">定义</span>$m(E) = \sum_{j \in [n]} m(I_j)$。

　　上述定义的长度函数$m: \Ical \mapsto [0, \infty]$满足
1. <span class="violet">有限可加性</span>：设$E_1, E_2, \ldots, E_n \in \Ical$且两两不相交，则$m(\cup_{j \in [n]} E_j) = \sum_{j \in [n]} m(E_j)$；
2. <span class="violet">单调性</span>：设$E_1, E_2 \in \Ical$且$E_1 \subseteq E_2$，则$m(E_1) \leq m(E_2)$；
3. <span class="violet">有限次可加性</span>：设$E_1, E_2, \ldots \in \Ical$，则$m(\cup_{j \in [n]} E_j) \leq \sum_{j \in [n]} m(E_j)$；
4. <span class="violet">可数可加性</span>：设$E_1, E_2, \ldots \in \Ical$且两两不相交，若$\cup_{j=1}^\infty E_j \in \Ical$，则$m(\cup_{j=1}^\infty E_j) = \sum_{j=1}^\infty m(E_j)$；
5. <span class="violet">可数次可加性</span>：设$E_1, E_2, \ldots \in \Ical$，若$\cup_{j=1}^\infty E_j \in \Ical$，则$m(\cup_{j=1}^\infty E_j) \leq \sum_{j=1}^\infty m(E_j)$；
6. <span class="violet">平移不变性</span>：对$\forall E \in \Ical$和$x_0 \in \Rbb$，$E + x_0 \triangleq \{ x + x_0 \mid x \in E \} \in \Ical$且$m(E + x_0) = m(E)$。

　　可数可加性、可数次可加性分别是有限可加性、有限次可加性的推广，令$E_{n+1} = E_{n+2} = \cdots = \emptyset$即可由前者导出后者。此外可数(次)可加性的前提是$\cup_{j=1}^\infty E_j \in \Ical$，否则$m(\cup_{j=1}^\infty E_j)$没有定义，但这并不要求$\Ical$是一个$\sigma$-代数。

**证明**：
1. 只需证明两个集合的情况即可由数学归纳法知结论对任意自然数$n$都成立。设$E_1 \cup E_2 = \cup_{j \in [n']} I_j$，则$m(E_1 \cup E_2) = \sum_{j \in [n']} m(I_j)$。注意构成$E_1$的每个区间必然都属于某个$I_j$，故其标准形式为$E_1 = \cup_{j \in [n']} (E_1 \cap I_j)$，即$m(E_1) = \sum_{j \in [n']} m(E_1 \cap I_j)$，同理$m(E_2) = \sum_{j \in [n']} m(E_2 \cap I_j)$，于是待证结论变成
\begin{align\*}
    \sum\_{j \in [n']} m(I\_j) = \sum\_{j \in [n']} m(E\_1 \cap I\_j) + \sum\_{j \in [n']} m(E\_2 \cap I\_j)
\end{align\*}
即只需证$m(I_j) = m(E_1 \cap I_j) + m(E_2 \cap I_j)$。注意$E_1 \cap I_j$、$E_2 \cap I_j$不相交，因此其标准形式中的所有区间均两两不相交，又这些区间的并集是区间$I_j$，因此这些区间写成标准形式是首尾相连的(前一个区间的右端点等于后一个区间的左端点)，从而$m(I_j) = m(E_1 \cap I_j) + m(E_2 \cap I_j)$。

2. 若$E_1 \subseteq E_2$，则$E_2 = E_1 \cup (E_2 \setminus E_1)$且$E_1 \cap (E_2 \setminus E_1) = \emptyset$，由有限可加性和长度函数的非负性知
\begin{align\*}
    m(E\_2) = m(E\_1) + m(E\_2 \setminus E\_1) \geq m(E\_1)
\end{align\*}

3. 只需证明两个集合的情况即可由数学归纳法知结论对任意自然数$n$都成立。由于$E_1 \cup E_2 = E_1 \cup (E_2 \setminus E_1)$且$E_1 \cap (E_2 \setminus E_1) = \emptyset$，又$(E_2 \setminus E_1) \subseteq E_2$，由有限可加性和单调性知
\begin{align\*}
    m(E\_1 \cup E\_2) = m(E\_1) + m(E\_2 \setminus E\_1) \leq m(E\_1) + m(E\_2)
\end{align\*}
4. 由有限可加性的证明知只需考虑$\cup_{j=1}^\infty E_j$等于一个区间$I$的情况，设$E_j = \cup_{k \in [n_j]} I_{j,k}$，于是
\begin{align\*}
    I = E\_1 \cup E\_2 \cup \cdots = I\_{1,1} \cup I\_{1,2} \cup \cdots \cup I\_{1,n\_1} \cup I\_{2,1} \cup I\_{2,2} \cup \cdots \cup I\_{2,n\_2} \cup I\_{3,1} \cup \cdots
\end{align\*}
由于$E_1, E_2, \ldots$两两不相交，因此上式中的可数无穷项$I_{j,k}$均两两不相交，将其写成标准形式：
\begin{align\*}
    I = I\_1 \cup I\_2 \cup \cdots = \cup\_{k=1}^\infty I\_k
\end{align\*}
注意$m(E_j) = \sum_{k \in [n_j]} m(I_{j,k})$，于是待证结论变成
\begin{align\*}
    m(I) = m(\cup\_{k=1}^\infty I\_k) = \sum\_{k=1}^\infty m(I\_k)
\end{align\*}
对任意自然数$n$，由有限可加性和单调性知
\begin{align\*}
    \sum\_{k \in [n]} m(I\_k) = m(\cup\_{k \in [n]} I\_k) \leq m(\cup\_{k=1}^\infty I\_k) = m(I)
\end{align\*}
令$n \rightarrow \infty$可得$\sum_{k=1}^\infty m(I_k) \leq m(I)$。

    下面证明另一个方向，不妨设所有的$I_k$都是有界区间(否则若某个$I_k$无界，则$I$也无界，上式两边都是$\infty$)，则对$\forall \epsilon > 0$，存在开区间$J_k$从外部充分逼近$I_k$，即$I_k \subseteq J_k$且$m(J_k) < m(I_k) + \epsilon / 2^k$。引入有界闭区间$[a_0, b_0] \subseteq I$，于是
    \begin{align\*} [a\_0, b\_0] \subseteq I = \cup\_{k=1}^\infty I\_k \subseteq \cup\_{k=1}^\infty J\_k
    \end{align\*}
    即$J_1, J_2, \ldots$是有界闭区间$[a_0, b_0]$的一个<span class="violet">开覆盖</span>(open cover)，由Heine-Borel定理知其<span class="violet">存在有限子覆盖</span>，不妨设子覆盖的下标集合是$\Ical'$，于是由有限可加性和单调性知
    \begin{align\*} a\_0 - b\_0 = m([a\_0, b\_0]) \leq \sum\_{k \in \Ical'} m(J\_k) < \sum\_{k \in \Ical'} \left( m(I\_k) + \frac{\epsilon}{2^k} \right) \leq \sum\_{k=1}^\infty \left( m(I\_k) + \frac{\epsilon}{2^k} \right) = \epsilon + \sum\_{k=1}^\infty m(I\_k)
    \end{align\*}
    若$I$无界，可以选取$[a_0, b_0]$使得$b_0 - a_0$任意的大，而$\epsilon$又可以任意的小，于是有$\sum_{k=1}^\infty m(I_k) = \infty = m(I)$；若$I$有界，选取$[a_0, b_0]$从内部充分逼近$I$，即使得$b_0 - a_0 > m(I) - \epsilon$，于是有
    \begin{align\*} m(I) - \epsilon < \epsilon + \sum\_{k=1}^\infty m(I\_k)
    \end{align\*}
    由于$\epsilon$可以任意的小，故$m(I) \leq \sum_{k=1}^\infty m(I_k)$。

    综上有$m(\cup_{k=1}^\infty I_k) = m(I) = \sum_{k=1}^\infty m(I_k)$。

5. 令$F_j = E_j \setminus (\cup_{k \in [j-1]} E_k) \subseteq E_j$，易知$F_1, F_2, \ldots$两两不相交且对任意自然数$n$有$\cup_{j \in [n]} F_j = \cup_{j \in [n]} E_j$，于是
\begin{align\*}
    m(\cup\_{j \in [n]} E\_j) = m(\cup\_{j \in [n]} F\_j) = \sum\_{j \in [n]} m(F\_j) \leq \sum\_{j \in [n]} m(E\_j)
\end{align\*}
令$n \rightarrow \infty$可知$m(\cup_{j=1}^\infty E_j) \leq \sum_{j=1}^\infty m(E_j)$。
  
6. 设$E = \cup_{j \in [n]} I_j$，则$E + x_0 = \cup_{j \in [n]} (I_j + x_0)$。若$I_j$有界，设其端点分别为$a$、$b$，则$I_j + x_0$依然有界且端点分别为$a + x_0$、$b + x_0$，于是$m(I_j + x_0) = (b + x_0) - (a + x_0) = b - a = m(I_j)$；若$I_j$无界，则$I_j + x_0$也无界($\pm \infty + x_0 = \pm \infty$)，且$m(I_j + x_0) = \infty = m(I_j)$，综上有$m(E + x_0) = m(E)$。


