　　1655年，英国数学家Wallis写下一个神奇的等式，将$\pi$用奇偶数比值的无穷乘积表示了出来：
\begin{align\*}
    \frac{\pi}{2} & = \left( \frac{2}{1} \cdot \frac{2}{3} \right) \cdot \left( \frac{4}{3} \cdot \frac{4}{5} \right) \cdot \left( \frac{6}{5} \cdot \frac{6}{7} \right) \cdot \left( \frac{8}{7} \cdot \frac{8}{9} \right) \cdots = \prod\_{n=1}^\infty \left( \frac{2n}{2n-1} \cdot \frac{2n}{2n+1} \right) = \prod\_{n=1}^\infty \frac{4n^2}{4n^2-1}
\end{align\*}
简单整理可得
\begin{align\*}
    \frac{\pi}{2} = \lim\_{n \rightarrow \infty} \prod\_{k=1}^n \left( \frac{2k \cdot 2k}{2k(2k-1)} \cdot \frac{2k \cdot 2k}{(2k+1)2k} \right) = \lim\_{n \rightarrow \infty} \frac{2^{4n} (n!)^4}{(2n+1) [(2n)!]^2}
\end{align\*}
可见$\pi$和阶乘存在着某种联系，这为后来Euler发现$\Gamma$函数埋下了伏笔。

　　Wallis公式的证明方法很多，本文列出其中4个。

#### 用积分证明

　　这是现代数学教材最常用的证明，由分部积分知
\begin{align\*}
    I(n) & = \int\_0^\pi \sin^n x \diff x = - \int\_0^\pi \sin^{n-1} x \diff \cos x = - \sin^{n-1} x \cos x |\_0^\pi + \int\_0^\pi (n-1) \sin^{n-2} x \cos^2 x \diff x               \\\\
         & = (n-1) \int\_0^\pi \sin^{n-2} x (1 - \sin^2 x) \diff x = (n-1) I(n-2) - (n-1) I(n)                                                                                    \\\\
         & \Longrightarrow \frac{I(n)}{I(n-2)} = \frac{n-1}{n} \Longrightarrow \frac{I(2n)}{I(2n-2)} = \frac{2n-1}{2n} \Longrightarrow \frac{I(2n+1)}{I(2n-1)} = \frac{2n}{2n+1}
\end{align\*}
又
\begin{align\*}
    I(0) = \int\_0^\pi \sin^0 x \diff x = \pi, \quad I(1) = \int\_0^\pi \sin^1 x \diff x = - \cos x |\_0^\pi = 2
\end{align\*}
于是
\begin{align}
    \label{eq: i1}
    I(2n)   & = \frac{2n-1}{2n} I(2n-2) = \cdots = \frac{2n-1}{2n} \cdot \frac{2n-3}{2n-2} \cdots \frac{1}{2} I(0) = \pi \prod\_{k=1}^n \frac{2k-1}{2k} \\\\
    \label{eq: i2}
    I(2n+1) & = \frac{2n}{2n+1} I(2n-1) = \cdots = \frac{2n}{2n+1} \cdot \frac{2n-2}{2n-1} \cdots \frac{2}{3} I(1) = 2 \prod\_{k=1}^n \frac{2k}{2k+1}
\end{align}
显然$\sin^{2n+1} x \le \sin^{2n} x \le \sin^{2n-1} x$，因此$I(2n+1) \le I(2n) \le I(2n-1)$，从而
\begin{align\*}
    1 \le \frac{I(2n)}{I(2n+1)} \le \frac{I(2n-1)}{I(2n+1)} = \frac{2n+1}{2n}
\end{align\*}
由夹逼定理和式(\ref{eq: i1}-\ref{eq: i2})知
\begin{align\*}
    1 & = \lim\_{n \rightarrow \infty} \frac{I(2n)}{I(2n+1)} = \frac{\pi}{2} \lim\_{n \rightarrow \infty}  \left( \prod\_{k=1}^n \frac{2k-1}{2k} / \prod\_{k=1}^n \frac{2k}{2k+1} \right) = \frac{\pi}{2} \prod\_{k=1}^\infty \left( \frac{2k-1}{2k} \cdot \frac{2k+1}{2k} \right)
\end{align\*}

#### 用$\sin x$的无穷乘积式证明

　　Wallis公式是$\sin x$的无穷乘积式的直接推论。设多项式$f(x)$的零点为$x_1, \ldots, x_n$，则$f(x)$可因式分解为$f(x) = a_0 (x - x_1) (x - x_2) \cdots (x - x_n)$。同理$\sin x$的零点为$\pi \Nbb$，因此应该有(该式严格证明并不容易)
\begin{align} \label{eq: sin-inf-prod}
    \frac{\sin x}{x} = \left( 1 - \frac{x^2}{\pi^2} \right) \left( 1 - \frac{x^2}{4 \pi^2} \right) \left( 1 - \frac{x^2}{9 \pi^2} \right) \cdots = \prod\_{n=1}^\infty \left( 1 - \frac{x^2}{n^2 \pi^2} \right)
\end{align}
代入$x = \pi / 2$，立刻可得
\begin{align\*}
    \frac{2}{\pi} = \prod\_{n=1}^\infty \left( 1 - \frac{1}{4 n^2} \right) = \prod\_{n=1}^\infty \frac{4n^2-1}{4n^2}
\end{align\*}
顺带一提，式(\ref{eq: sin-inf-prod})右端$x^2$的系数为
\begin{align\*}
    -\frac{1}{\pi^2} - \frac{1}{4 \pi^2} - \frac{1}{9 \pi^2} - \cdots = - \frac{1}{\pi^2} \sum\_{n=1}^\infty \frac{1}{n^2}
\end{align\*}
又$\sin x$的Taylor展式关于$x^3$的项为$-x^3 / 3!$，因此
\begin{align\*}
    -\frac{1}{3!} = - \frac{1}{\pi^2} \sum\_{n=1}^\infty \frac{1}{n^2} \Longrightarrow \frac{\pi^2}{6} = \sum\_{n=1}^\infty \frac{1}{n^2}
\end{align\*}

#### 用Stirling公式证明

　　Stirling公式给出了$n!$的近似计算方法：
\begin{align\*}
    n! = \sqrt{2 \pi n} \left( \frac{n}{e} \right)^n (1 + O (1/n)) \approx \sqrt{2 \pi n} \left( \frac{n}{e} \right)^n
\end{align\*}
于是代入可得
\begin{align\*}
    \lim\_{n \rightarrow \infty} \frac{2^{4n} (n!)^4}{(2n+1) [(2n)!]^2} = \lim\_{n \rightarrow \infty} \frac{2^{4n} (2 \pi n)^2 (\frac{n}{e})^{4n} (1 + O (1/n))^4}{(2n+1) 4 \pi n (\frac{2n}{e})^{4n} (1 + O (1/2n))^2} = \lim\_{n \rightarrow \infty} \frac{\pi n}{2n+1} = \frac{\pi}{2}
\end{align\*}

#### Wallis本人的证明

　　1655年微积分尚处于萌芽阶段，这一年Newton只有13岁，Leibniz只有9岁，Euler和Stirling还没出生，前面证明里用到的那些大杀器还没现世。当时的数学家们只得到了如下结果：将$[0,1]$分割为无穷个小区间$[r,1], [r^2, r], [r^3,r^2], \ldots$，则
\begin{align\*}
    \int\_0^1 x^n \diff x & = \lim\_{r \rightarrow 1-} \sum\_{i=1}^\infty (r^{i-1} - r^i) (r^i)^n = \lim\_{r \rightarrow 1-} \sum\_{i=1}^\infty \frac{1-r}{r} (r^{n+1})^i = \lim\_{r \rightarrow 1-} \frac{1-r}{r} \frac{r^{n+1}}{1 - r^{n+1}} \\\\
                         & = \lim\_{r \rightarrow 1-} \frac{r^n}{1 + r + r^2 + \cdots r^n} = \frac{1}{n+1}, \quad n \in \Nbb
\end{align\*}
即在区间$[0,1]$上，$x$轴与曲线$x^n$围成的面积为$1 / (n+1)$。

　　Wallis对$\pi$感兴趣，于是他把曲线换成了单位圆的方程$y = (1 - x^2)^{1/2}$，显然在区间$[0,1]$上其与$x$轴围成的面积为$\pi / 4$，同样经过无穷分割有
\begin{align\*}
    \frac{\pi}{4} = \lim\_{n \rightarrow \infty} \sum\_{k=1}^n \frac{1}{n} \left( 1 - \frac{k^2}{n^2} \right)^{1/2}
\end{align\*}
右边的无穷乘积式难以进一步处理，于是Wallis转而考虑更一般形式的曲线积分
\begin{align\*}
    A(p,q) = \int\_0^1 \left( 1 - x^{\frac{1}{p}} \right)^q \diff x
\end{align\*}
单位圆方程是该式的一个特例，即$A ( \frac{1}{2}, \frac{1}{2} ) = \pi / 4$。易知
\begin{align\*}
    A(p,q) = \int\_0^1 \left( 1 - x^{\frac{1}{p}} \right)^{q-1} \left( 1 - x^{\frac{1}{p}} \right) \diff x = A(p,q-1) - \int\_0^1 \class{blue}{\left( 1 - x^{\frac{1}{p}} \right)^{q-1} x^{\frac{1}{p}} \diff x}
\end{align\*}
注意
\begin{align\*}
    \diff \left( 1 - x^{\frac{1}{p}} \right)^q = q \left( 1 - x^{\frac{1}{p}} \right)^{q-1} (-1) \frac{1}{p} x^{\frac{1-p}{p}} \diff x = -\frac{q}{px} \class{blue}{\left( 1 - x^{\frac{1}{p}} \right)^{q-1} x^{\frac{1}{p}} \diff x}
\end{align\*}
故
\begin{align\*}
    A(p,q) & = A(p,q-1) + \int\_0^1 \frac{px}{q} \diff \left( 1 - x^{\frac{1}{p}} \right)^q = A(p,q-1) + \left. \frac{px}{q} \left( 1 - x^{\frac{1}{p}} \right)^q \right|\_0^1 - \frac{p}{q} \int\_0^1 \left( 1 - x^{\frac{1}{p}} \right)^q \diff x \\\\
           & = A(p,q-1) - \frac{p}{q} A(p,q)                                                                                                                                                                                        \\\\
           & \Longrightarrow \frac{A(p,q)}{A(p,q-1)} = \frac{q}{q+p}
\end{align\*}
又
\begin{align\*}
    A(p,1) = \int\_0^1 ( 1 - x^{\frac{1}{p}}) \diff x = 1 - \left. \frac{p}{p+1} x^{\frac{p+1}{p}} \right|\_0^1 = \frac{1}{p+1}
\end{align\*}
于是
\begin{align} \label{eq: apq}
    A(p,q) = \frac{q}{q+p} A(p,q-1) = \frac{q}{q+p} \cdot \frac{q-1}{q+p-1} \cdots \frac{2}{p+2} \cdot \frac{1}{p+1} = \class{blue}{\frac{p!q!}{(q+p)!}}
\end{align}
尽管上式是针对正整数$p$、$q$得到的，但Wallis猜测它们对分数$p$、$q$也成立，令$p = 1/2$、$q$为任意正整数可得
\begin{align\*}
    A \left( \frac{1}{2}, q \right)             & = \frac{q}{q+\frac{1}{2}} \cdot \frac{q-1}{q-\frac{1}{2}} \cdots \frac{2}{\frac{1}{2}+2} \cdot \frac{1}{\frac{1}{2}+1} = \frac{2q}{2q+1} \cdot \frac{2q-2}{2q-1} \cdots \frac{4}{5} \cdot \frac{2}{3}                                                                                 \\\\
    A \left( \frac{1}{2}, q+\frac{1}{2} \right) & = \frac{q+\frac{1}{2}}{q+1} \cdot \frac{q-\frac{1}{2}}{q} \cdots \frac{\frac{5}{2}}{3} \cdot \frac{\frac{3}{2}}{2} A \left( \frac{1}{2}, \frac{1}{2} \right) = \frac{2q+1}{2q+2} \cdot \frac{2q-1}{2q} \cdots \frac{5}{6} \cdot \frac{3}{4} A \left( \frac{1}{2}, \frac{1}{2} \right)
\end{align\*}
由于$1 - x^{\frac{1}{p}} \in [0,1]$，因此$A(p,q)$是关于$q$的单调减函数，于是
\begin{align\*}
    A \left( \frac{1}{2}, q-\frac{1}{2} \right) \ge A \left( \frac{1}{2}, q \right) \ge A \left( \frac{1}{2}, q+\frac{1}{2} \right) = \frac{q+\frac{1}{2}}{q+1} A \left( \frac{1}{2}, q-\frac{1}{2} \right)
\end{align\*}
由夹逼定理知$\lim_{q \rightarrow \infty} A ( \frac{1}{2}, q ) = \lim_{q \rightarrow \infty} A ( \frac{1}{2}, q+\frac{1}{2} )$，即
\begin{align\*}
    \lim\_{q \rightarrow \infty} \frac{2q}{2q+1} \cdot \frac{2q-2}{2q-1} \cdots \frac{4}{5} \cdot \frac{2}{3} = \lim\_{q \rightarrow \infty} \frac{2q+1}{2q+2} \cdot \frac{2q-1}{2q} \cdots \frac{5}{6} \cdot \frac{3}{4} A \left( \frac{1}{2}, \frac{1}{2} \right)
\end{align\*}
整理可得
\begin{align\*}
    \frac{\pi}{4} = A \left( \frac{1}{2}, \frac{1}{2} \right) = \frac{2}{3} \cdot \frac{4}{3} \cdot \frac{4}{5} \cdot \frac{6}{5} \cdot \frac{6}{7} \cdot \frac{8}{7} \cdot \frac{8}{9}\cdots
\end{align\*}

　　Wallis对式(\ref{eq: apq})取分数$p$、$q$其实<span class="blue">隐含假设了阶乘对分数也有定义</span>，因此这个证明并不严格，但这为后来Euler研究阶乘的插值提供了线索。此外对式(\ref{eq: apq})令$p = q = 1/2$可得
\begin{align\*}
    \frac{\pi}{4} = A \left( \frac{1}{2}, \frac{1}{2} \right) = \left( \frac{1}{2} \right)! \left( \frac{1}{2} \right)! \Longrightarrow \left( \frac{1}{2} \right)! = \frac{\sqrt{\pi}}{2}
\end{align\*}
