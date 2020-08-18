　　对于定积分
\begin{align\*}
    \int\_a^b f(x) \diff x
\end{align\*}
Riemann积分对定义域区间$[a,b]$进行切分$a = a_0 < a_1 < \cdots < a_{n-1} < a_n = b$，然后用上和
\begin{align\*}
    US = \sum\_{i \in [n]} \sup \\{ f(x): x \in [a\_{i-1, a\_i}] \\} (a\_i - a\_{i-1})
\end{align\*}
与下和
\begin{align\*}
    LS = \sum\_{i \in [n]} \inf \\{ f(x): x \in [a\_{i-1, a\_i}] \\} (a\_i - a\_{i-1})
\end{align\*}
对积分值进行夹逼
\begin{align\*}
    LS \leq \int\_a^b f(x) \diff x \leq US
\end{align\*}

　　随着切分越来越细，上和单调减，下和单调增，当积分函数$f$连续时，<span class="violet">两者极限相等且等于积分值</span>，但是当$f$(非常)不连续时，Riemann积分就会出问题了，比如对Dirichlet函数
\begin{align\*}
    f(x) = \begin{cases}
        1 & x \in \Qbb \\\\ 0 & \ow
    \end{cases}
\end{align\*}
无论怎么对定义域切分，下和总是$0$，上和总是$1$，极限不相等。为了解决此类问题，Lebesgue积分采用对值域进行切分的方式，对于某个值域区间$[a, b]$，易知也有上和、下和夹逼：
\begin{align\*}
    \int\_{x\in\\{ a \leq f(x) \leq b \\}} a \diff x \leq \int\_{x\in\\{ a \leq f(x) \leq b \\}} f(x) \diff x \leq \int\_{x\in\\{ a \leq f(x) \leq b \\}} b \diff x
\end{align\*}
于是问题就转化为求集合$\{x : a \leq f(x) \leq b \}$的“长度”。

　　给集合赋予“长度”是Lebesgue测度论的核心问题，这个问题看似简单，其实很复杂，因为集合可能是无穷点集(上面Dirichlet函数的例子)，也可能是无穷个不相交小区间的并集(在$(0,1]$上对$\sin (1/x)$积分)。事实上，不存在一个普适的长度函数能够对$\Rbb$的任意子集都赋予长度，总有些稀奇古怪的异类需要剔除，因此我们引入<span class="violet">集合代数</span>的概念，通过定义一些规则，导出一类性质良好可以赋予长度的集合。

　　设$\Omega$为非空集合，$\Acal \subseteq \Pcal(\Omega)$为其子集构成的集合，对前面的一维积分问题，$\Omega$就是$\Rbb$，但测度论并不局限于一维积分。例如对$n$维积分，$\Omega$是$\Rbb^n$；对概率论，$\Omega$是基础事件集合。因此为了保持结论的一般性，我们不将全集写为$\Rbb$。

　　集合代数中最简单的结构是<span class="violet">环</span>(ring)，其满足三个条件：(1).$\emptyset \subseteq \Acal$；(2).$\Acal$关于$\setminus$封闭；(3).$\Acal$关于$\cup$封闭。这个名字不是随便乱起的，因为定义加法为对称差$\Delta$、乘法为交$\cap$，$(\Acal, \Delta, \cap)$就构成了抽象代数里的<span class="violet">(交换)环</span>，具体可参见[此文](https://avanti1980.github.io/notes-on-math/posts/measure/set-ring-algebra-ring.html)。

　　若将环的后两个条件弱化可得到<span class="violet">半环</span>(semiring)，其满足：(1).$\emptyset \subseteq \Acal$；(2).对于$\forall A, B \in \Acal$，$A \setminus B$是$\Acal$中有限个不相交集合的并；(3).$\Acal$关于$\cap$封闭。

　　由于$\cup$封闭可保证半环的第二个条件始终满足，而$\setminus$封闭可导出$\cap$封闭：
\begin{align\*}
    X \setminus (X \setminus Y) = X \setminus (X \cap \complement Y) = X \cap \complement (X \cap \complement Y) = X \cap (\complement X \cup Y) = X \cap Y
\end{align\*}
因此环肯定是半环。但反过来不成立，例如$\Rbb$上的全部左开右闭区间构成的集合
\begin{align\*}
    \Acal = \\{ (a,b] \mid a,b \in \Rbb, a \leq b \\}
\end{align\*}
就是一个半环，但不是环(关于$\cup$不封闭)。事实上，如果半环关于$\cup$封闭，则结合第二个条件“$A \setminus B$是$\Acal$中有限个不相交集合的并”可导出“$A \setminus B$是$\Acal$中元素”，即关于$\setminus$封闭，半环升级成环。

　　若将环的第一个条件改成全集$\Omega \in \Acal$，则得到<span class="violet">代数</span>(algebra)，其满足：(1).$\Omega \subseteq \Acal$；(2).$\Acal$关于$\setminus$封闭；(3).$\Acal$关于$\cup$封闭。

　　由于$\emptyset = (\Omega \setminus \Omega) \in \Acal$，因此代数肯定是环，但反过来不成立，例如$\Rbb$上的全部有界区间的有限并(finite unions)构成的集合就是一个环，但不是代数(全集$\Omega = \Rbb$不属于该集合，因为它无法写成有界区间的有限并)。更一般的，<span class="violet">设全集为不可数集合，则其所有可数子集构成的集合就只是环而不是代数</span>。环升级成代数的方法也很简单：先加入全集，然后加入必要的保证$\setminus$、$\cup$封闭的新元素即可。

　　由于全集的存在，$\setminus$封闭可导出$\complement$封闭，而由De Morgan律：
\begin{align\*}
    X \cap Y & = \complement \complement (X \cap Y) = \complement (\complement X \cup \complement Y) \\\\
    X \cup Y & = \complement \complement (X \cup Y) = \complement (\complement X \cap \complement Y)
\end{align\*}
即在$\complement$封闭的前提下，$\cap$封闭、$\cup$封闭可以互推。又$A \setminus B = A \cap \complement B$，因此$\cap$、$\complement$封闭可以导出$\setminus$封闭，于是若全集存在，则有
\begin{align\*}
    \setminus, \cup \text{封闭} \Longleftrightarrow \complement, \cap \text{封闭} \Longleftrightarrow \complement, \cup \text{封闭}
\end{align\*}
故代数也可等价定义为：(1).$\Omega \subseteq \Acal$；(2).$\Acal$关于$\complement$封闭；(3).$\Acal$关于$\cap$或$\cup$封闭。

　　虽然环以$\Delta$为加法、$\cap$为乘法可构成抽象代数里的交换环(该方式也是唯一的)，但是代数以$\Delta$为加法、$\cap$为乘法却没有对应的抽象代数结构，易知
\begin{align\*}
    A \cap \Omega = A, \quad A \cap \emptyset = \emptyset
\end{align\*}
即全集$\Omega$是乘法运算的单位元，空集$\emptyset$是乘法运算的零元(这是环就有的)，但其它非零元素没有乘法逆元，设$A \in \Acal$为非空集，显然不存在其它集合与$A$的交集等于全集(单位元)，因此代数无法构成抽象代数里的域。

　　前面提到在$(0,1]$上对$\sin (1/x)$积分时，集合$\{x : a \leq f(x) \leq b \}$是无穷个不相交小区间的并集，因此我们也要允许<span class="violet">可数次并</span>这样的操作，这样就导出了$\sigma$-环，其满足：(1).$\emptyset \subseteq \Acal$；(2).$\Acal$关于$\setminus$封闭；(3).$\Acal$关于可数次$\cup$封闭；以及$\sigma$-代数，其满足：(1).$\Omega \subseteq \Acal$；(2).$\Acal$关于$\setminus$封闭；(3).$\Acal$关于可数次$\cup$封闭。$\sigma$-代数也被称为$\sigma$-域，但前文表明代数并不对应抽象代数里的域，因此我不喜欢这样的叫法，容易产生误解。$\sigma$-环、$\sigma$-代数的关系与环、代数的关系一样，前者加入全集，然后再加入必要的保证$\setminus$、$\cup$封闭的新元素即可得到后者。

　　综上，半环、环、代数、$\sigma$-环、$\sigma$-代数之间的关系如下：
<div style="text-align: center">
    <img alt="集合代数" src="https://raw.githubusercontent.com/Avanti1980/notes-on-math/master/img/set-algebra.svg" style="margin: 10px auto;width:30%"/>
</div>

　　测度论一般采用$\sigma$-代数作为考虑对象，即对$\sigma$-代数中的任一集合赋予长度。具体到一维积分，这意味着全集$\Rbb$是有长度的，若$A \subseteq \Rbb$是$\sigma$-代数中的集合，即可以赋予长度，那么$\Rbb \setminus A$也是可以赋予长度的，若$A_1, A_2, \ldots$可以赋予长度，那么其并集也可以赋予长度。

　　采用别的结构作为基础建立测度论也不是不可以，只是没有$\sigma$-代数那么好用。比如函数$f$可测的定义是<span class="violet">对任意Borel集$B \subseteq \Rbb$，逆象$f^{-1</span>(B) \in \Sigma$，其中$\Sigma$是一个$\sigma$-代数}。若在$\sigma$-环$\Sigma_r$上沿用此定义，即<span class="violet">对任意Borel集$B \subseteq \Rbb$有$f^{-1</span>(B) \in \Sigma_r$}。由于全集$\Omega = f^{-1} (\Rbb)$，因此要么$\Sigma_r$包含全集从而是一个$\sigma$-代数，要么任何函数都不可测。若修正定义为<span class="violet">对任意Borel集$B \subseteq \Rbb$有$\{ x: f(x) \neq 0 \</span> \cap f^{-1}(B) \in \Sigma_r$}，此时可避免所有函数不可测的情况，因为即便$B = \Rbb$，即$f^{-1}(B) = \Omega$，第一项可能会小于全集。但是注意到对任意非零常数函数$f$，均有$\{ x: f(x) \neq 0 \} = \Omega$，因此所有的非零常数函数都是不可测的，进一步这会导出<span class="violet">即便$f$可测，$f+1$也还是不可测</span>这样反直觉的结果。
