　　1655年，Wallis在研究单位圆方程$y = (1 - x^2)^{1/2}$下的面积时得到了Wallis公式：
\begin{align\*}
    \frac{\pi}{2} & = \left( \frac{2}{1} \cdot \frac{2}{3} \right) \cdot \left( \frac{4}{3} \cdot \frac{4}{5} \right) \cdot \left( \frac{6}{5} \cdot \frac{6}{7} \right) \cdot \left( \frac{8}{7} \cdot \frac{8}{9} \right) \cdots = \prod\_{n=1}^\infty \left( \frac{2n}{2n-1} \cdot \frac{2n}{2n+1} \right) = \prod\_{n=1}^\infty \frac{4n^2}{4n^2-1}
\end{align\*}
但他的推导并不严格，用到了分数的阶乘，而如何将阶乘从正整数插值到分数当时尚不清楚。进入十八世纪后，Goldbach率先开始考虑阶乘的插值问题，但一直不得要领，便向其他数学家好友求助。1729年，Bernoulli家族的Daniel Bernoulli给出了一个无穷乘积形式的结果：
\begin{align\*}
    n! = \lim\_{m \rightarrow \infty} \left( m + 1 + \frac{n}{2} \right)^{n-1} \prod\_{k=1}^m \frac{k+1}{k+n}
\end{align\*}
将阶乘的定义延拓到了实数集。

## Euler的发现

　　Euler与Daniel的私交甚好，在得知Daniel在研究阶乘的插值问题后，也开始了自己的探索，首先他发现对任意自然数$n$和$m$有：
\begin{align\*}
    \lim\_{m \rightarrow \infty} \frac{(m+1)^n}{(m+n) \cdots (m+1)} = 1 \Longrightarrow \lim\_{m \rightarrow \infty} \frac{(m+1)^n m!}{(m+n)!} = 1
\end{align\*}
于是有
\begin{align\*}
    n! & = n! \lim\_{m \rightarrow \infty} \frac{(m+1)^n m!}{(m+n)!} = \lim\_{m \rightarrow \infty} \frac{\class{green}{(m+1)^n} \class{blue}{m!}}{\class{red}{(n+1)(n+2)\cdots(n+m)}}                                                                                                            \\\\
       & = \left[ \class{green}{\left( \frac{2}{1} \right)^n} \frac{\class{blue}{1}}{\class{red}{n+1}} \right] \cdot \left[ \class{green}{\left( \frac{3}{2} \right)^n} \frac{\class{blue}{2}}{\class{red}{n+2}} \right] \cdot \left[ \class{green}{\left( \frac{4}{3} \right)^n} \frac{\class{blue}{3}}{\class{red}{n+3}} \right] \cdots
\end{align\*}
这样Euler也得到了一个$n!$的无穷乘积式。

　　就收敛到$n!$的速度来说，Daniel的无穷乘积式比Euler的要快得多，但Euler的无穷乘积式更方便进一步挖掘，例如令$n = 1/2$有
\begin{align\*}
    \left(\frac{1}{2}\right)! = \sqrt{ \left[ \frac{\class{green}{2}}{\class{blue}{1}} \cdot \frac{\class{blue}{1^2 \cdot 2} \cdot \class{green}{2}}{3 \cdot 3} \right] \cdot \left[ \frac{\class{green}{3}}{\class{blue}{2}} \cdot \frac{\class{blue}{2^2 \cdot 2} \cdot \class{green}{2}}{5 \cdot 5} \right] \cdot \left[ \frac{\class{green}{4}}{\class{blue}{3}} \cdot \frac{\class{blue}{3^2 \cdot 2} \cdot \class{green}{2}}{7 \cdot 7} \right] \cdots} = \sqrt{\frac{\class{blue}{2} \cdot \class{green}{4}}{3 \cdot 3} \cdot \frac{\class{blue}{4} \cdot \class{green}{6}}{5 \cdot 5} \cdot \frac{\class{blue}{6} \cdot \class{green}{8}}{7 \cdot 7} \cdots}
\end{align\*}
最后一项不正是Wallis公式么？于是立刻得到
\begin{align\*}
    \left(\frac{1}{2}\right)! = \frac{\sqrt{\pi}}{2}
\end{align\*}

　　在Euler这样的大师眼里，一旦扯上$\pi$，自然就和圆相关的积分逃不了干系，那么$n!$应该也可以表示成某种积分的形式，于是Euler开始考虑一般形式的积分
\begin{align} \label{eq: first-integral-raw}
    E(m,n) = \int\_0^1 x^m (1-x)^n \diff x
\end{align}
其中$m$是正实数，$n$是正整数。由分部积分有
\begin{align\*}
    E(m,n) & = \frac{1}{m+1} \int\_0^1 (1-x)^n \diff x^{m+1} = \left. \frac{1}{m+1} x^{m+1} (1-x)^n \right|\_0^1 - \frac{1}{m+1} \int\_0^1 x^{m+1} \diff (1-x)^n \\\\
           & = \frac{n}{m+1} \int\_0^1 x^{m+1}(1-x)^{n-1} \diff x = \frac{n}{m+1} E(m+1,n-1)
\end{align\*}
又
\begin{align\*}
    E(m+n,0) = \int\_0^1 x^{m+n} \diff x = \frac{1}{m+n+1}
\end{align\*}
于是
\begin{align} \label{eq: E}
    E(m,n) = \frac{n}{m+1} \cdot \frac{n-1}{m+2} \cdots \frac{1}{m+n} E(m+n,0) = \frac{n}{m+1} \cdot \frac{n-1}{m+2} \cdots \frac{1}{m+n} \cdot \frac{1}{m+n+1}
\end{align}
整理可得
\begin{align\*}
    \frac{n!}{(m+1)(m+2) \cdots (m+n)} = (m+n+1) \int\_0^1 x^m (1-x)^n \diff x
\end{align\*}
为了将$n!$摘出来，Euler先做变量代换$m = u/v$，于是
\begin{align} \label{eq: Euler trick}
    \frac{n!}{(u+v)(u+2v)\cdots (u+nv)} = \frac{u+(n+1)v}{v^{n+1}} \int\_0^1 x^{u/v} (1-x)^n \diff x
\end{align}
注意当$u \rightarrow 1$且$v \rightarrow 0$时，式(\ref{eq: Euler trick})左端$\rightarrow n!$，对右端继续做变量代换$x = y^{v/(u+v)}$，注意
\begin{align\*}
    x^{u/v} = y^{u/(u+v)}, \quad \diff x = \frac{v}{u+v} y^{-u/(u+v)} \diff y
\end{align\*}
故式(\ref{eq: Euler trick})右端变为
\begin{align\*}
    \frac{u+(n+1)v}{v^{n+1}} \int\_0^1 y^{u/(u+v)} (1-y^{v/(u+v)})^n \frac{v}{u+v} y^{-u/(u+v)} \diff y & = \frac{u+(n+1)v}{v^n (u+v)} \int\_0^1 (1-y^{v/(u+v)})^n \diff y                              \\\\
                                                                                                       & = \frac{u+(n+1)v}{(u+v)^{n+1}} \int\_0^1 \left(\frac{1-y^{v/(u+v)}}{v/(u+v)}\right)^n \diff y
\end{align\*}
综上我们有
\begin{align\*}
    n! = \lim\_{u \rightarrow 1, v \rightarrow 0} \frac{u+(n+1)v}{(u+v)^{n+1}} \int\_0^1 \left(\frac{1-y^{v/(u+v)}}{v/(u+v)}\right)^n \diff y = \int\_0^1 \lim\_{x \rightarrow 0} \left(\frac{1-y^x}{x}\right)^n \diff y = \int\_0^1 \left(\lim\_{x \rightarrow 0} \frac{1-y^x}{x}\right)^n \diff y
\end{align\*}
其中第二个等号交换取极限和求积分不是恒成立的，由L'Hospital法则知
\begin{align\*}
    \lim\_{x \rightarrow 0} \frac{1-y^x}{x} = \lim\_{x \rightarrow 0} -y^x \ln y = - \ln y
\end{align\*}
这样就得到了阶乘的积分表达式
\begin{align\*}
    n! = \int\_0^1 ( - \ln y )^n \diff y
\end{align\*}
做变量代换$x = -\ln y$，即$y = e^{-x}$，可得
\begin{align\*}
    n! = \int\_\infty^0 x^n (- e^{-x}) \diff x = \int\_0^\infty e^{-x} x^n \diff x
\end{align\*}

　　记
\begin{align} \label{eq: second-integral-raw}
    \gamma(n) = \int\_0^\infty e^{-x} x^n \diff x
\end{align}
则对于正整数$n$有$\gamma(n) = n!$，此外有递推关系
\begin{align\*}
    \gamma(n) = - \int\_0^\infty x^n \diff e^{-x} = - x^n e^{-x} |\_0^\infty + \int\_0^\infty e^{-x} n x^{n-1} \diff x = n \cdot \gamma(n-1)
\end{align\*}
于是两个积分之间有如下关系：
\begin{align\*}
    E(m,n) = \frac{n!}{(m+1)(m+2)\cdots(m+n)(m+n+1)} = \frac{\gamma (m) \gamma (n)}{\gamma (m+n+1)}
\end{align\*}
后来可能是出于美观的原因吧，Legendre将式(\ref{eq: first-integral-raw})、式(\ref{eq: second-integral-raw})分别修改为
\begin{align} \label{eq: first-second-integral}
    B(m,n) = \int\_0^1 x^{m-1} (1-x)^{n-1} \diff x, \quad \Gamma(n) = \int\_0^\infty e^{-x} x^{n-1} \diff x
\end{align}
即指数中的$m$和$n$均偏移了1，于是对于正整数$n$有$\Gamma(n) = (n-1)!$且有递推关系
\begin{align\*}
    \Gamma(n) = \gamma(n-1) = (n-1) \gamma (n-2) = (n-1) \Gamma (n-1)
\end{align\*}
此外两个积分之间有如下关系：
\begin{align\*}
    B(m,n) = E(m-1,n-1) = \frac{\gamma (m-1) \gamma (n-1)}{\gamma (m+n-1)} = \frac{\Gamma (m) \Gamma (n)}{\Gamma (m+n)}
\end{align\*}
式(\ref{eq: first-second-integral})中的$B$函数和$\Gamma$函数分别被称为Euler第一型积分和Euler第二型积分。

## $\Gamma$函数的等价形式

　　$\Gamma$函数除了Euler给出的
\begin{align\*}
    \Gamma(n) = \int\_0^\infty e^{-x} x^{n-1} \diff x = \int\_0^1 ( - \ln y )^{n-1} \diff y = \int\_0^\infty e^{-e^z} e^{nz} \diff z
\end{align\*}
这几种形式外(最后一个形式可通过变量代换$x = e^z$得到)，还有许多等价形式。

#### Gauss形式

　　注意
\begin{align\*}
    e = \lim\_{m \rightarrow \infty} \left( 1 + \frac{1}{m} \right)^m = \lim\_{m \rightarrow \infty} \left( 1 + \frac{1}{-m/x} \right)^{-m/x} \Longrightarrow e^{-x} = \lim\_{m \rightarrow \infty} \left( 1 - \frac{x}{m} \right)^m
\end{align\*}
于是
\begin{align\*}
    \Gamma(n) = \int\_0^\infty e^{-x} x^{n-1} \diff x = \lim\_{m \rightarrow \infty} \int\_0^m \left( 1 - \frac{x}{m} \right)^m x^{n-1} \diff x
\end{align\*}
由分部积分有
\begin{align\*}
    S & = \int\_0^m \left( 1 - \frac{x}{m} \right)^m x^{n-1} \diff x = \frac{1}{n} \int\_0^m \left( 1 - \frac{x}{m} \right)^m \diff x^n                                              \\\\
      & = \frac{x^n}{n} \left. \left( 1 - \frac{x}{m} \right)^m \right|\_0^m - \frac{1}{n} \int\_0^m x^n m \left( 1 - \frac{x}{m} \right)^{m-1} \left( - \frac{1}{m} \right) \diff x \\\\
      & = \frac{m}{mn} \int\_0^m \left( 1 - \frac{x}{m} \right)^{m-1} x^n \diff x
\end{align\*}
注意系数分子中的$m$是由对$(1 - \square)^m$求导而来(该项会一直变)，分母中的$m$是由对$1 - x / m$求导而来(该项不会变)，分母中的$n$是对$x^{n-1}$积分而得(该项会一直变)，因此
\begin{align\*}
    S & = \frac{m}{mn} \int\_0^m \left( 1 - \frac{x}{m} \right)^{m-1} x^n \diff x = \frac{m}{mn} \cdot \frac{m-1}{m(n+1)} \int\_0^m \left( 1 - \frac{x}{m} \right)^{m-2} x^{n+1} \diff x \\\\
      & = \frac{m}{mn} \cdot \frac{m-1}{m(n+1)} \cdots \frac{1}{m(n+m-1)} \int\_0^m \left( 1 - \frac{x}{m} \right)^0 x^{n+m-1} \diff x                                                  \\\\
      & = \frac{m}{mn} \cdot \frac{m-1}{m(n+1)} \cdots \frac{1}{m(n+m-1)} \cdot \frac{m^{n+m}}{n+m}                                                                                    \\\\
      & = \frac{m^n m!}{n (n+1) \cdots (n+m)} = \frac{m^n}{n} \prod\_{k=1}^m \frac{k}{n+k}
\end{align\*}
这样就得到了Gauss形式的$\Gamma$函数：
\begin{align} \label{eq: gauss}
    \Gamma(n) = \lim\_{m \rightarrow \infty} \frac{m^n}{n} \prod\_{k=1}^m \frac{k}{n+k} = \lim\_{m \rightarrow \infty} \frac{m^n m!}{n (n+1) \cdots (n+m)}
\end{align}

#### Weierstrass形式

　　引入Euler-Mascheroni常数
\begin{align\*}
    \gamma = \lim\_{m \rightarrow \infty} \left( \sum\_{k=1}^m \frac{1}{k} - \ln m \right) = \int\_1^\infty \left( \frac{1}{\lfloor x \rfloor} - \frac{1}{x} \right) \diff x
\end{align\*}
注意
\begin{align\*}
    m^n = e^{n \log m} = \exp \left( n \sum\_{k=1}^m \frac{1}{k} - n \sum\_{k=1}^m \frac{1}{k} + n \ln m \right) = \exp \left( - n \left( \sum\_{k=1}^m \frac{1}{k} - \ln m \right) \right) \prod\_{k=1}^m e^{n/k}
\end{align\*}
代入式(\ref{eq: gauss})即可得Weierstrass形式的$\Gamma$函数：
\begin{align\*}
    \Gamma(n) = \lim\_{m \rightarrow \infty} \frac{1}{n} \exp \left( - n \left( \sum\_{k=1}^m \frac{1}{k} - \ln m \right) \right) \left( \prod\_{k=1}^m e^{n/k} \right) \left( \prod\_{k=1}^m \frac{k}{n+k} \right) = \frac{e^{-n \gamma}}{n} \prod\_{k=1}^\infty e^{n/k} \left( 1 + \frac{n}{k} \right)^{-1}
\end{align\*}

## $\Gamma$函数的性质

　　本节证明Euler反射公式、Legendre倍元公式、Gauss乘法公式和$\Gamma$函数的唯一性。

#### Euler反射公式

　　根据Gauss形式
\begin{align\*}
    \Gamma(n) = \lim\_{m \rightarrow \infty} \frac{m^n m!}{n (n+1) \cdots (n+m)} = (n-1) \lim\_{m \rightarrow \infty} \frac{m^{n-1} m!}{(n-1) n \cdots (n+m-1)} \frac{m}{n+m} = (n-1) \Gamma(n-1)
\end{align\*}
注意该式不需要$n$为正整数。代入$n = \pm n$有
\begin{align\*}
    \Gamma(n) = \lim\_{m \rightarrow \infty} \frac{m^n}{n} \prod\_{k=1}^m \frac{k}{n+k}, \quad \Gamma(-n) = \lim\_{m \rightarrow \infty} \frac{m^{-n}}{-n} \prod\_{k=1}^m \frac{k}{-n+k}
\end{align\*}
两式相乘可得
\begin{align\*}
    \Gamma(n) \Gamma(-n) = \frac{-1}{n^2} \prod\_{k=1}^\infty \frac{k^2}{k^2 - n^2} = \frac{-1}{n^2} \prod\_{k=1}^\infty \left( 1 - \frac{n^2}{k^2} \right)^{-1} = \frac{-1}{n^2} \frac{\pi n}{\sin \pi n} = \frac{1}{-n} \frac{\pi}{\sin \pi n}
\end{align\*}
其中倒数第二个等号是根据$\sin x$的无穷乘积式
\begin{align\*}
    \frac{\sin x}{x} = \left( 1 - \frac{x^2}{\pi^2} \right) \left( 1 - \frac{x^2}{4 \pi^2} \right) \left( 1 - \frac{x^2}{9 \pi^2} \right) \cdots = \prod\_{k=1}^\infty \left( 1 - \frac{x^2}{k^2 \pi^2} \right) \Longrightarrow \frac{\sin \pi n}{\pi n} = \prod\_{k=1}^\infty \left( 1 - \frac{n^2}{k^2} \right)
\end{align\*}
于是可得Euler反射公式：
\begin{align\*}
    \frac{\pi}{\sin \pi n} = \Gamma(n) (-n \Gamma(-n) ) = \Gamma(n) \Gamma(1-n)
\end{align\*}

#### Legendre倍元公式

　　对$B$函数做变量代换$x = \sin^2 y$，即$\diff x = 2 \sin y \cos y \diff y$，可得
\begin{align\*}
    B(m,n) & = \int\_0^1 x^{m-1} (1-x)^{n-1} \diff x = \int\_0^{\frac{\pi}{2}} \sin^{2m-2} y \cos^{2n-2} y 2 \sin y \cos y \diff y \\\\
           & = 2 \int\_0^{\frac{\pi}{2}} \sin^{2m-1} y \cos^{2n-1} y \diff y
\end{align\*}
于是
\begin{align\*}
    I = \frac{\Gamma (z) \Gamma (z)}{2\Gamma (2z)} = \frac{B(z,z)}{2} = \int\_0^{\frac{\pi}{2}} \sin^{2z-1} y \cos^{2z-1} y \diff y = 2^{1-2z} \int\_0^{\frac{\pi}{2}} \sin^{2z-1} 2y \diff y = 2^{-2z} \int\_0^{\pi} \sin^{2z-1} y \diff y
\end{align\*}
由于$\sin y$关于$y = \pi/2$对称，因此
\begin{align\*}
    \frac{\Gamma (z) \Gamma (z)}{2\Gamma (2z)} = I = 2^{-2z} \int\_0^{\pi} \sin^{2z-1} y \diff y = 2^{1-2z} \int\_0^{\frac{\pi}{2}} \sin^{2z-1} y \diff y = 2^{-2z} B \left( z, \frac{1}{2} \right) = 2^{-2z} \frac{\Gamma(z) \Gamma \left( \frac{1}{2} \right)}{\Gamma \left( z+\frac{1}{2} \right)}
\end{align\*}
注意$\Gamma \left( \frac{1}{2} \right) = 2 \Gamma \left( \frac{3}{2} \right) = 2 \left( \frac{1}{2} \right)! = \sqrt{\pi}$，整理可得Legendre倍元公式：
\begin{align\*}
    \Gamma (z) \Gamma \left( z+\frac{1}{2} \right) = 2^{1-2z} \Gamma (2z) \Gamma \left( \frac{1}{2} \right) = 2^{1-2z} \sqrt{\pi} \Gamma (2z) = (2 \pi)^{\frac{1}{2}} 2^{\frac{1}{2} - 2z} \Gamma (2z)
\end{align\*}

#### Gauss乘法公式

　　事实上，Legendre倍元公式是Gauss乘法公式
\begin{align\*}
    \prod\_{k=0}^{n-1} \Gamma \left( z + \frac{k}{n} \right) = (2 \pi)^{\frac{n-1}{2}} n^{\frac{1}{2} - nz} \Gamma (nz), \quad \forall z \not \in \left\\{ - \frac{l}{n} : l \in \Nbb \right\\}
\end{align\*}
在$n=2$时的特例。根据Gauss形式和Stirling公式
\begin{align\*}
    \Gamma(n) = \lim\_{m \rightarrow \infty} \frac{m^n m!}{n (n+1) (n+2) \cdots (n+m)}, \quad m! = \sqrt{2 \pi m} \left( \frac{m}{e} \right)^m (1 + O (1/m))
\end{align\*}
易知有
\begin{align\*}
    \Gamma \left( z + \frac{k}{n} \right) & = \left( z + \frac{k}{n} - 1 \right) \Gamma \left( z + \frac{k}{n} - 1 \right)                                                                                                                                                                         \\\\
                                          & = \left( z + \frac{k}{n} - 1 \right) \lim\_{m \rightarrow \infty} \frac{m^{z + \frac{k}{n} - 1} m!}{\left( z + \frac{k}{n} - 1 \right) \left( z + \frac{k}{n} \right) \left( z + \frac{k}{n} + 1 \right) \cdots \left( z + \frac{k}{n} - 1 + m \right)} \\\\
                                          & = \lim\_{m \rightarrow \infty} \frac{m^{z + \frac{k}{n} - 1} \sqrt{2 \pi m} \left( \frac{m}{e} \right)^m}{\left( z + \frac{k}{n} \right) \left( z + \frac{k}{n} + 1 \right) \cdots \left( z + \frac{k}{n} - 1 + m \right)}                              \\\\
                                          & = (2 \pi)^\frac{1}{2} \lim\_{m \rightarrow \infty} \frac{m^{z + \frac{k}{n} - \frac{1}{2}} \left( \frac{mn}{e} \right)^m}{(nz+k) (nz+k+n) \cdots (nz+k-n+mn)}
\end{align\*}
于是
\begin{align\*}
    \prod\_{k=0}^{n-1} \Gamma \left( z + \frac{k}{n} \right) & = (2 \pi)^\frac{n}{2} \lim\_{m \rightarrow \infty} \frac{m^{nz-\frac{n}{2}} m^{\sum\_{k=0}^{n-1} \frac{k}{n}} \left( \frac{mn}{e} \right)^{mn}}{(nz) (nz+1) \cdots (nz-1+mn)} \\\\
                                                            & = (2 \pi)^\frac{n}{2} \lim\_{m \rightarrow \infty} \frac{m^{nz-\frac{1}{2}} \left( \frac{mn}{e} \right)^{mn}}{(nz) (nz+1) \cdots (nz-1+mn)}                                  \\\\
                                                            & = (2 \pi)^\frac{n}{2} n^{\frac{1}{2}-nz} \lim\_{m \rightarrow \infty} \frac{m^{nz-\frac{1}{2}} \left( \frac{m}{e} \right)^m}{(nz) (nz+1) \cdots (nz-1+m)}                    \\\\
                                                            & = (2 \pi)^\frac{n-1}{2} n^{\frac{1}{2}-nz} \lim\_{m \rightarrow \infty} \frac{m^{nz-1} m!}{(nz) (nz+1) \cdots (nz-1+m)}                                                      \\\\
                                                            & = (2 \pi)^\frac{n-1}{2} n^{\frac{1}{2}-nz} (nz-1) \lim\_{m \rightarrow \infty} \frac{m^{nz-1} m!}{(nz-1) (nz) (nz+1) \cdots (nz-1+m)}                                        \\\\
                                                            & = (2 \pi)^\frac{n-1}{2} n^{\frac{1}{2}-nz} (nz-1) \Gamma (nz-1)                                                                                                             \\\\
                                                            & = (2 \pi)^\frac{n-1}{2} n^{\frac{1}{2}-nz} \Gamma (nz)
\end{align\*}

#### 唯一性

　　阶乘的插值函数并不唯一，但<span class="blue">同时满足1) $f(1) = 1$；2) $f(n+1) = n f(n)$；3) $\ln f$是凸函数</span>这三个条件的只有$\Gamma$函数，这称之为Bohr-Mollerup定理。

　　设函数$f(n)$满足这三个条件，根据第2个条件可知对任意正整数$m$有
\begin{align\*}
    f(n+m) = (n+m-1) (n+m-2) \cdots (n+1) n f (n)
\end{align\*}
即$f(n+m)$可完全由$f(n)$决定，因此只需考虑$(0,1]$上的$f(n)$。此外令$n=1$，根据第1个条件可知$f(m+1) = m!$。

　　对任意$n_1 < n_2$，设$S(n_1, n_2)$为连接两点$(n_1, \ln f(n_1))$、$(n_2, \ln f(n_2))$的直线斜率，即
\begin{align\*}
    S(n\_1, n\_2) = \frac{\ln f(n\_2) - \ln f(n\_1)}{n\_2 - n\_1}
\end{align\*}
由附录中的定理1知$S(n_1, n_2)$关于$n_1$、$n_2$均是单调增函数，于是对$\forall n \in (0,1]$有
\begin{align\*}
        & \qquad ~ S(m-1, m) \le S(m, m+n) \le S(m, m+1) \\\\
        & \Longleftrightarrow \frac{\ln f(m) - \ln f(m-1)}{1} \le \frac{\ln f(m+n) - \ln f(m)}{n} \le \frac{\ln f(m+1) - \ln f(m)}{1} \\\\
        & \Longleftrightarrow \frac{\ln (m-1)}{1} \le \frac{\ln f(m+n) - \ln f(m)}{n} \le \frac{\ln m}{1}                             \\\\
        & \Longleftrightarrow \ln f(m) + n \ln (m-1) \le \ln f(m+n) \le \ln f(m) + n \ln m                                            \\\\
        & \Longleftrightarrow (m-1)^n (m-1)! \le f(m+n) \le m^n (m-1)!
\end{align\*}
于是代入可得
\begin{align\*}
    \frac{(m-1)^n (m-1)!}{(n+m-1) (n+m-2) \cdots (n+1) n} \le f(n) \le \frac{m^n m!}{(n+m) (n+m-1) (n+m-2) \cdots (n+1) n} \cdot \frac{n+m}{m}
\end{align\*}
注意中间项$f(n)$与$m$无关，因此左半、右半部分中的$m$可以各自取值，现令左半的$m = m+1$、右半的$m = m$可得
\begin{align\*}
    \frac{m^n m!}{(n+m) (n+m-1) \cdots (n+1) n} \le f(n) \le \frac{m^n m!}{(n+m) (n+m-1) (n+m-2) \cdots (n+1) n} \cdot \frac{n+m}{m}
\end{align\*}
由夹逼定理知
\begin{align\*}
    f(n) = \lim\_{m \rightarrow \infty} \frac{m^n m!}{(n+m) (n+m-1) \cdots (n+1) n} = \Gamma(n)
\end{align\*}
即在$(0,1]$上满足三个条件的函数就是$\Gamma$函数。又
\begin{align\*}
    f(n+1) = n f(n) & = n \lim\_{m \rightarrow \infty} \frac{m^n m!}{(n+m) (n+m-1) \cdots (n+1) n}                   \\\\
                    & = \lim\_{m \rightarrow \infty} \frac{m^n m!}{(n+m) (n+m-1) \cdots (n+1)} \cdot \frac{m}{n+m+1} \\\\
                    & = \Gamma(n+1)
\end{align\*}
即在$(1,2]$上满足三个条件的函数依然是$\Gamma$函数，依次类推在$(0, \infty)$上满足三个条件的函数就是$\Gamma$函数。

## 附录

**定理1**：对于凸函数$f: \Rbb \mapsto \Rbb$上的两点$(x_1, f(x_1))$、$(x_2, f(x_2))$，连接其直线的斜率
\begin{align\*}
    S(x\_1, x\_2) = \frac{f(x\_2) - f(x\_1)}{x\_2 - x\_1}
\end{align\*}
关于$x_1$、$x_2$均是单调增函数。

**证明**：不妨设$x_1 < x_2$，对$\forall \alpha \in (0,1)$，记$\xhat = \alpha x_1 + (1 - \alpha) x_2$，即$x_1 < \xhat < x_2$，易知有
\begin{align\*}
    \xhat - x\_1 = (1 - \alpha) (x\_2 - x\_1), \quad x\_2 - \xhat = \alpha (x\_2 - x\_1)
\end{align\*}
根据$f$的凸性知$\alpha f(x_1) + (1 - \alpha) f(x_2) \ge f(\xhat)$，于是
\begin{align\*}
    f(\xhat) - f(x\_1) \le (1 - \alpha) (f(x\_2) - f(x\_1)), \quad f(x\_2) - f(\xhat) \ge \alpha (f(x\_2) - f(x\_1))
\end{align\*}
联立整理可得
\begin{align\*}
    \frac{f(\xhat) - f(x\_1)}{1 - \alpha} \le f(x\_2) - f(x\_1) \le \frac{f(x\_2) - f(\xhat)}{\alpha}
\end{align\*}
同除以$x_2 - x_1$可得
\begin{align\*}
    \frac{f(\xhat) - f(x\_1)}{\xhat - x\_1} = \frac{f(\xhat) - f(x\_1)}{(1 - \alpha)(x\_2 - x\_1)} \le \frac{f(x\_2) - f(x\_1)}{x\_2 - x\_1} \le \frac{f(x\_2) - f(\xhat)}{\alpha(x\_2 - x\_1)} = \frac{f(x\_2) - f(\xhat)}{x\_2 - \xhat}
\end{align\*}
即$S(x_1, \xhat) \le S(x_1, x_2) \le S(\xhat, x_2)$，由$x_1$、$x_2$、$\xhat$的任意性知结论成立。
