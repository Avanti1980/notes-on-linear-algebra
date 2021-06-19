　　Bayes公式描述了后验与先验和似然的关系：
\begin{align\*}
    \pr(y|x) = \frac{\pr(x|y) \pr(y)}{\pr(x)} \varpropto \pr(x|y) \pr(y)
\end{align\*}
通常后验与先验不属于同一个分布族，但也存在一些特例，当它们同属一个分布族时，此先验称为似然的共轭先验，常见的有Gamma-Poisson共轭、Beta-Binomial共轭、Multinomial-Dirichlet共轭。

## Gamma-Poisson共轭

　　对$\Gamma$函数的积分变量做线性变换$z = \alpha y$，于是有
\begin{align\*}
    \Gamma(n) = \int\_0^\infty e^{-z} z^{n-1} \diff z = \int\_0^\infty e^{-\alpha y} \alpha^n y^{n-1} \diff y \Longrightarrow 1 = \int\_0^\infty \frac{\alpha^n y^{n-1} e^{- \alpha y}}{\Gamma(n)} \diff y
\end{align\*}
设$y$服从参数为$n$、$\alpha$的Gamma分布：
\begin{align\*}
    \pr(y) = \frac{\alpha^n y^{n-1} e^{- \alpha y}}{\Gamma(n)}
\end{align\*}
在给定$y$的条件下，设$x$服从参数为$y$的Poisson分布：
\begin{align\*}
    \pr(x = k|y) = \frac{y^k e^{-y}}{k!}
\end{align\*}
由全概率公式有
\begin{align\*}
    \pr(x=k) & = \int\_0^\infty \pr(y) \pr(x=k|y) \diff y = \int\_0^\infty \frac{\alpha^n y^{n-1} e^{- \alpha y}}{\Gamma(n)} \frac{y^k e^{-y}}{k!} \diff y                       \\\\
             & = \frac{\alpha^n}{\Gamma(n) k!} \frac{\Gamma(n+k)}{(\alpha+1)^{n+k}} \int\_0^\infty \frac{(\alpha+1)^{n+k} y^{n + k -1} e^{- (\alpha+1) y}}{\Gamma(n+k)} \diff y \\\\
             & = \frac{\alpha^n}{\Gamma(n) k!} \frac{\Gamma(n+k)}{(\alpha+1)^{n+k}}
\end{align\*}
于是
\begin{align\*}
    \pr(y|x = k) & = \frac{\pr(y) \pr(x = k|y)}{\pr(x = k)} = \frac{\alpha^n}{\Gamma(n) k!} y^{n + k -1} e^{- (\alpha+1) y} / \frac{\alpha^n}{\Gamma(n) k!} \frac{\Gamma(n+k)}{(\alpha+1)^{n+k}} \\\\
                 & = \frac{(\alpha+1)^{n+k} y^{n + k -1} e^{- (\alpha+1) y}}{\Gamma(n+k)}
\end{align\*}
即后验服从参数为$n + k$、$\alpha + 1$的Gamma分布。

## Beta-Binomial共轭

　　设$y$服从参数为$\alpha$、$\beta$的Beta分布：
\begin{align\*}
    \pr(y) = \frac{y^{\alpha - 1} (1 - y)^{\beta - 1}}{B(\alpha, \beta)} = \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} y^{\alpha - 1} (1 - y)^{\beta - 1}
\end{align\*}
在给定$y$的条件下，设$x$服从参数为$y$的Binomial分布：
\begin{align\*}
    \pr(x=k|y) = \binom{n}{k} y^k (1-y)^{n-k}
\end{align\*}
由全概率公式有
\begin{align\*}
    \pr(x=k) & = \int\_0^1 \pr(y) \pr(x=k|y) \diff y = \int\_0^1 \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} \binom{n}{k} y^{\alpha+k-1} (1-y)^{\beta+n-k-1} \diff y                                                                                                \\\\
             & = \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} \binom{n}{k} \frac{\Gamma(\alpha+k) \Gamma(\beta+n-k)}{\Gamma(\alpha+\beta+n)} \int\_0^1 \frac{\Gamma(\alpha+\beta+n)}{\Gamma(\alpha+k) \Gamma(\beta+n-k)} y^{\alpha+k-1} (1-y)^{\beta+n-k-1} \diff y \\\\
             & = \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} \binom{n}{k} \frac{\Gamma(\alpha+k) \Gamma(\beta+n-k)}{\Gamma(\alpha+\beta+n)}
\end{align\*}
于是
\begin{align\*}
    \pr(y|x = k) & = \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} \binom{n}{k} y^{\alpha+k-1} (1-y)^{\beta+n-k-1} / \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} \binom{n}{k} \frac{\Gamma(\alpha+k) \Gamma(\beta+n-k)}{\Gamma(\alpha+\beta+n)} \\\\
                 & = \frac{\Gamma(\alpha+\beta+n)}{\Gamma(\alpha+k) \Gamma(\beta+n-k)} y^{\alpha+k-1} (1-y)^{\beta+n-k-1}
\end{align\*}
即后验服从参数为$\alpha + k$、$\beta + n - k$的Beta分布。

## Multinomial-Dirichlet共轭

　　Dirichlet分布是Beta分布的多元扩展，Multinomial分布是Binomial分布的多元扩展，不难猜测Dirichlet分布是Multinomial分布的共轭先验。设$\yv = [y_1; \ldots; y_{k+1}]$服从参数为$\alphav = [\alpha_1; \ldots; \alpha_{k+1}]$的Dirichlet分布，即
\begin{align\*}
    \pr(\yv) = \frac{\Gamma(\alpha\_{k+1} + \cdots + \alpha\_1)}{\Gamma(\alpha\_{k+1}) \cdots \Gamma(\alpha\_1)} \prod\_{i=1}^{k+1} y\_i^{\alpha\_i - 1}
\end{align\*}
在给定$\yv$的条件下，设$\xv$服从参数为$\yv$的Multinomial分布：
\begin{align\*}
    \pr(\xv=\nv | \yv) = \frac{\Gamma(n\_{k+1} + \cdots + n\_1)}{\Gamma(n\_{k+1}) \cdots \Gamma(n\_1)} \prod\_{i=1}^{k+1} y\_i^{n\_i}
\end{align\*}
由全概率公式有
\begin{align\*}
    \pr(\xv = \nv) & = \int \cdots \int \pr(\yv) \pr(\xv = \nv|\yv) \diff \yv                                                                                                                                                                                                                                        \\\\
                   & = \frac{\Gamma(\alpha\_{k+1} + \cdots + \alpha\_1)}{\Gamma(\alpha\_{k+1}) \cdots \Gamma(\alpha\_1)} \frac{\Gamma(n\_{k+1} + \cdots + n\_1)}{\Gamma(n\_{k+1}) \cdots \Gamma(n\_1)} \int \cdots \int \prod\_{i=1}^{k+1} y\_i^{\alpha\_i + n\_i - 1} \diff y\_1 \cdots \diff y\_k                                \\\\
                   & = \frac{\Gamma(\alpha\_{k+1} + \cdots + \alpha\_1)}{\Gamma(\alpha\_{k+1}) \cdots \Gamma(\alpha\_1)} \frac{\Gamma(n\_{k+1} + \cdots + n\_1)}{\Gamma(n\_{k+1}) \cdots \Gamma(n\_1)} \frac{\Gamma(\alpha\_{k+1}+n\_{k+1}) \cdots \Gamma(\alpha\_1+n\_1)}{\Gamma(\alpha\_{k+1}+n\_{k+1} + \cdots + \alpha\_1+n\_1)}
\end{align\*}
于是
\begin{align\*}
    \pr(\yv|\xv = \nv) & = \prod\_{i=1}^{k+1} y\_i^{\alpha\_i + n\_i - 1} / \frac{\Gamma(\alpha\_{k+1}+n\_{k+1}) \cdots \Gamma(\alpha\_1+n\_1)}{\Gamma(\alpha\_{k+1}+n\_{k+1} + \cdots + \alpha\_1+n\_1)}       \\\\
                       & = \frac{\Gamma(\alpha\_{k+1} + n\_{k+1} + \cdots + \alpha\_1 + n\_1)}{\Gamma(\alpha\_{k+1} + n\_{k+1}) \cdots \Gamma(\alpha\_1 + n\_1)} \prod\_{i=1}^{k+1} y\_i^{\alpha\_i + n\_i - 1}
\end{align\*}
即后验服从参数为$\alphav + \nv$的Dirichlet分布。

