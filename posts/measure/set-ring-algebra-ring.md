　　学测度论时会碰到某个非空集合$\Omega$的子集构成的集合$\Acal \subseteq \Pcal(\Omega)$，当其满足(1). $\emptyset \subseteq \Acal$；(2). $\Acal$关于$\setminus$封闭；(3). $\Acal$关于$\cup$封闭，称为\violet{环}(ring)。众所周知抽象代数里有个数学结构也叫\violet{环}，其上定义了加法、乘法两个二元运算，并且关于加法构成\violet{交换群}(commutative group)，关于乘法构成\violet{半群}(semigroup)，乘法对加法满足\violet{分配律}。
\begin{align\*}
    \xymatrix{
    (R, +) \ar[r]^{\text{封闭性}}      & \text{原群} \ar[r]^{\text{结合律}} & \text{半群} \ar[r]^(.45){\text{单位元}}                                                                    & \text{幺半群} \ar[r]^(.58){\text{逆元}}                          & \text{群} \ar[r]^(.4){\text{交换律}} & \text{交换群} \ar@/\_0.6pc/[dll] \ar[d]                 \\\\
                                       &                                    & \text{交换环}                                                                                              & (R, +, \times) \ar[r]^(.6){\text{分配律}} \ar[l]\_{\text{分配律}} & \text{环}                            & (R, +, \times) \ar[r]^(.62){\text{分配律}} & \text{域} \\\\
    (R, \times) \ar[r]^{\text{封闭性}} & \text{原群} \ar[r]^{\text{结合律}} & \text{半群} \ar[r]^(.45){\text{单位元}} \ar@/^0.6pc/@<2pt>[ur]^(.3){\text{交换律}} \ar@/^0.6pc/@<-2pt>[ur] & \text{幺半群} \ar[r]^(.58){\text{逆元}}                          & \text{群} \ar[r]^(.4){\text{交换律}} & \text{交换群} \ar[u]                                   \\\\
    }
\end{align\*}

　　为了区别，下面我们称前者为集合环，后者为代数环。本文说明两者的关系是\violet{$\Acal$能通过赋予合适的集合上的加法、乘法构成代数(交换)环当且仅当$\Acal$是集合环}。

　　$\Leftarrow$较为简单，给出具体的加法、乘法定义再验证满足代数环公理即可。定义集合环$\Acal$中的加法为\violet{对称差}：
\begin{align\*}
    X \Delta Y = (X \setminus Y) \cup (Y \setminus X), \quad \forall X, Y \in \Acal
\end{align\*}
不难验证$(\Acal, \Delta)$构成\violet{交换群}，其中\violet{交换律}是显然的，\violet{封闭性}由集合环关于$\setminus$、$\cup$封闭保证，又
\begin{align\*}
    X \Delta \emptyset & = (X \setminus \emptyset) \cup (\emptyset \setminus X) = X \\\\
    X \Delta X         & = (X \setminus X) \cup (X \setminus X) = \emptyset
\end{align\*}
因此$\emptyset$是\violet{单位元}，\violet{逆元}就是自身，\violet{结合律}$(X \Delta Y) \Delta Z = X \Delta (Y \Delta Z)$通过集合运算进行验证较为繁琐，根据下面的Venn图易知其成立。
\begin{figure}[htp]
    \centering
    \subfigure[$X \Delta Y$]
    {
        \centering
        \begin{tikzpicture}[fill=Solarized-cyan, text=Solarized-base01, scale=0.8]
            \begin{scope}[even odd rule]
                \clip \firstcircle
                \secondcircle;
                \fill \firstcircle;
            \end{scope}
            \begin{scope}[even odd rule]
                \clip \secondcircle
                \firstcircle;
                \fill \secondcircle;
            \end{scope}
            \draw \firstcircle node[above] {$X$};
            \draw \secondcircle node [below left] {$Y$};
            \draw \thirdcircle node [below right] {$Z$};
        \end{tikzpicture}
    }
    \hspace{1cm}
    \subfigure[$(X \Delta Y) \Delta Z$]
    {
        \begin{tikzpicture}[fill=Solarized-cyan, text=Solarized-base01, scale=0.8]
            \begin{scope}[even odd rule]
                \clip \firstcircle
                \secondcircle
                \thirdcircle;
                \fill \firstcircle;
            \end{scope}
            \begin{scope}[even odd rule]
                \clip \secondcircle
                \thirdcircle
                \firstcircle;
                \fill \secondcircle;
            \end{scope}
            \begin{scope}[even odd rule]
                \clip \thirdcircle
                \firstcircle
                \secondcircle;
                \fill \thirdcircle;
            \end{scope}
            \draw \firstcircle node[above] {$X$};
            \draw \secondcircle node [below left] {$Y$};
            \draw \thirdcircle node [below right] {$Z$};
        \end{tikzpicture}
    }
    %\caption{Xn example of the procedure}
\end{figure}

　　定义乘法为$\cap$，于是\violet{交换律}、\violet{结合律}都是显然的，由于$X \setminus Y = X \cap \complement Y$，因此
\begin{align\*}
    X \setminus (X \setminus Y) = X \setminus (X \cap \complement Y) = X \cap \complement (X \cap \complement Y) = X \cap (\complement X \cup Y) = X \cap Y
\end{align\*}
即\violet{封闭性}也是满足的(这也说明集合环关于$\cup$、$\cap$、$\setminus$都是封闭的)。

　　最后验证$\Delta$对于$\cap$满足\violet{分配律}，由于
\begin{align\*}
    X \Delta Y = (X \setminus Y) \cup (Y \setminus X) = (X \cap \complement Y) \cup (Y \cap \complement X) = (X \cup Y) \cap (\complement X \cup \complement Y)
\end{align\*}
于是
\begin{align\*}
    (X \Delta Y) \cap Z & = (X \cup Y) \cap (\complement X \cup \complement Y) \cap Z                             \\\\
                        & = (X \cup Y) \cap (\complement X \cup \complement Y \cup \complement Z) \cap Z          \\\\
                        & = [(X \cup Y) \cap Z] \cap [\complement X \cup \complement Y \cup \complement Z]        \\\\
                        & = [(X \cap Z) \cup (Y \cap Z)] \cap [\complement (X \cap Z) \cup \complement(Y \cap Z)] \\\\
                        & = (X \cap Z) \Delta (Y \cap Z)
\end{align\*}
同理易知有
\begin{align\*}
    Z \cap (X \Delta Y) = Z \cap (X \cup Y) \cap (\complement X \cup \complement Y) = (X \cap Z) \Delta (Y \cap Z) = (Z \cap X) \Delta (Z \cap Y)
\end{align\*}
综上，若$\Acal \subseteq \Pcal(\Omega)$是集合环，则$(\Acal, \Delta, \cap)$构成代数(交换)环。

　　$\Rightarrow$较为复杂，因为我们不知道一个有望构成交换环的集合，它对应的加法、乘法分别是啥，所以我们得先把加法、乘法构造出来。

　　先考虑二元集合$R = \{0, 1\}$构成的交换环$(R, +, \times)$，不妨设加法单位元是$0$，由交换律可知
\begin{align\*}
    0 + 0 = 0, \quad 0 + 1 = 1 + 0 = 1
\end{align\*}
若$1 + 1 = 1$，则$1$没有逆元，故$1 + 1 = 0$，不难验证这样定义的$(R, +)$构成交换群。由于$\times$对$+$满足分配律，因此
\begin{align\*}
    0 \times 0 = (0 + 0) \times 0 = 0 \times 0 + 0 \times 0 & \Longrightarrow 0 \times 0 = 0 \\\\
    0 \times 1 = (0 + 0) \times 1 = 0 \times 1 + 0 \times 1 & \Longrightarrow 0 \times 1 = 0 \\\\
    1 \times 0 = 1 \times (0 + 0) = 1 \times 0 + 1 \times 0 & \Longrightarrow 1 \times 0 = 0
\end{align\*}
最后$1 \times 1$无论等于$0$还是$1$，$(R, \times)$均可构成半群。因此二元集合可构成两种环，加法均为
\begin{align\*}
    0 + 0 = 0, \quad 0 + 1 = 1 + 0 = 1, \quad 1 + 1 = 0 \\\\
\end{align\*}
乘法分别为
\begin{align\*}
    0 \times 0 = 0, \quad 0 \times 1 = 1 \times 0 = 0, \quad 1 \times 1 = 0 \\\\
    0 \times 0 = 0, \quad 0 \times 1 = 1 \times 0 = 0, \quad 1 \times 1 = 1
\end{align\*}
即只在$1 \times 1$的结果上有区别。若加法单位元是$1$，上述所有运算结果的$0$和$1$互换位置，整体结构不变。

　　设$R^\Omega = \{ f: \Omega \mapsto R \}$，由$R$的特性知每个$f$都是将$\Omega$中的一部分元素映射为$0$，剩下映射为$1$，因此$R^\Omega$中共有$|\Pcal(\Omega)|$个元素，每个元素均是$\Omega$某个子集的特征函数：
\begin{align\*}
    R^\Omega = \\{ 1\_X \mid X \in \Pcal(\Omega) \\}
\end{align\*}
这样就在$R^\Omega$和$\Pcal(\Omega)$间建立了一一对应，即$g: 1_X \mapsto X$是一个双射。若$R^\Omega$想构成环，其上的加法、乘法只能由$R$上的加法、乘法导出：
\begin{align\*}
    \oplus: ~  & (1\_X,1\_Y) \mapsto (1\_X \oplus 1\_Y) (a) \triangleq 1\_X(a) + 1\_Y(a)       \\\\
    \otimes: ~ & (1\_X,1\_Y) \mapsto (1\_X \otimes 1\_Y) (a) \triangleq 1\_X(a) \times 1\_Y(a)
\end{align\*}

　　根据$R$上的加法规则有
\begin{align\*}
    \oplus: ~ & (1\_X,1\_Y) \mapsto (1\_X \oplus 1\_Y) (a) = \begin{cases}
        0 + 0 = 0 & \forall a \in \Omega \setminus (X \cup Y) \\\\
        1 + 0 = 1 & \forall a \in X \setminus Y               \\\\
        0 + 1 = 1 & \forall a \in Y \setminus X               \\\\
        1 + 1 = 0 & \forall a \in X \cap Y
    \end{cases}
\end{align\*}
即$R^\Omega$上的加法规则为
\begin{align\*}
    (1\_X,1\_Y) \mapsto 1\_X \oplus 1\_Y = 1\_{X \Delta Y}
\end{align\*}
\violet{两个集合的特征函数的加和等于其对称差的特征函数}。$R$上的乘法规则不唯一
\begin{align\*}
    \otimes: ~ & (1\_X,1\_Y) \mapsto (1\_X \otimes 1\_Y) (a) = \begin{cases}
        0 \times 0 = 0             & \forall a \in \Omega \setminus (X \cup Y) \\\\
        1 \times 0 = 0             & \forall a \in X \setminus Y               \\\\
        0 \times 1 = 0             & \forall a \in Y \setminus X               \\\\
        1 \times 1 = 0~\text{或}~1 & \forall a \in X \cap Y
    \end{cases}
\end{align\*}
前者对应任何两个集合的特征函数的乘积都是空集的特征函数，后者对应乘积是交集的特征函数：
\begin{align\*}
    (1\_X,1\_Y) \mapsto 1\_X \otimes 1\_Y = 1\_\emptyset ~\text{或}~ 1\_{X \cap Y}
\end{align\*}

　　若$R$上的加法单位元是$1$，运算规则中的$0$和$1$互换位置，因此导出的$R^\Omega$上的加法规则为
\begin{align\*}
    (1\_X,1\_Y) \mapsto 1\_X \oplus 1\_Y = 1\_{\complement (X \Delta Y)}
\end{align\*}
同样乘法规则不唯一，其中一个对应任何两个集合的乘积都是全集的特征函数，另一个对应乘积是交集的补集的特征函数，即
\begin{align\*}
    (1\_X,1\_Y) \mapsto 1\_X \otimes 1\_Y = 1\_\Omega ~\text{或}~ 1\_{\complement (X \cap Y)}
\end{align\*}
即在前者的基础上多个取补集的操作(空集的补集是全集)。

　　至此给出了$R^\Omega$可能构成的四种交换环
\begin{align\*}
     & (R^\Omega, 1\_X \oplus 1\_Y = 1\_{X \Delta Y}, 1\_X \otimes 1\_Y = 1\_\emptyset)                              \\\\
     & (R^\Omega, 1\_X \oplus 1\_Y = 1\_{X \Delta Y}, 1\_X \otimes 1\_Y = 1\_{X \cap Y})                             \\\\
     & (R^\Omega, 1\_X \oplus 1\_Y = 1\_{\complement (X \Delta Y)}, 1\_X \otimes 1\_Y = 1\_\Omega)                   \\\\
     & (R^\Omega, 1\_X \oplus 1\_Y = 1\_{\complement (X \Delta Y)}, 1\_X \otimes 1\_Y = 1\_{\complement (X \cap Y)})
\end{align\*}
注意对于第二种交换环有
\begin{align\*}
    g(1\_X \oplus 1\_Y)  & = g(1\_{X \Delta Y}) = X \Delta Y = g(1\_X) \Delta g(1\_Y) \\\\
    g(1\_X \otimes 1\_Y) & = g(1\_{X \cap Y}) = X \cap Y = g(1\_X) \cap g(1\_Y)
\end{align\*}
即$(\Pcal(\Omega), \Delta, \cap)$同构于$(R^\Omega, \oplus, \otimes)$，也构成交换环，其他情形没有如此简洁的对应(常用的二元集合运算没有结果恒为空集、全集或两者对称差、交集的补集，除非重新定义)。

　　对$\forall \Acal \subseteq \Pcal(\Omega)$，若其能够构成代数环，则$(\Acal, \Delta, \cap)$应为$(\Pcal(\Omega), \Delta, \cap)$的子环，即$\Acal$对$\Delta$、$\cap$保持封闭，于是对$\forall X, Y \in \Acal$有
\begin{align\*}
    \emptyset     & = X \Delta X \in \Acal                     \\\\
    X \setminus Y & = (X \Delta Y) \cap X \in \Acal            \\\\
    X \cup Y      & = (X \Delta Y) \Delta (X \cap Y) \in \Acal
\end{align\*}
因此$\Acal$是集合环。

