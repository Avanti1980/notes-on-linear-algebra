　　Euler在研究阶乘插值时引入了$B$函数(第一型积分)和$\Gamma$函数(第二型积分)，且它们有关系：
\begin{align\*}
    B(m,n) = \int\_0^1 x^{m-1} (1-x)^{n-1} \diff x = \frac{\Gamma(m) \Gamma(n)}{\Gamma(m+n)}
\end{align\*}
于是定义函数$f_{m,n}: [0,1] \mapsto \Rbb$如下：
\begin{align\*}
    f\_{m,n}(x) = \frac{x^{m-1} (1-x)^{n-1}}{B(m,n)} = \frac{\Gamma(m+n)}{\Gamma(m) \Gamma(n)} x^{m-1} (1-x)^{n-1}
\end{align\*}
易知其积分为$1$，故可以将其看成一个概率密度函数，由于这个函数的分母是$B$函数，我们称其对应的概率分布为<span class="blue">参数为$m$、$n$的Beta分布</span>。

　　下面给出Beta分布的数字特征，易知其$k$阶矩为
\begin{align\*}
    \Ebb[x^k] & = \int\_0^1 x^k f\_{m,n}(x) \diff x = \int\_0^1 x^k \frac{x^{m-1} (1-x)^{n-1}}{B(m,n)} \diff x = \frac{B(m+k,n)}{B(m,n)} \int\_0^1 \frac{x^{m+k-1} (1-x)^{n-1}}{B(m+k, n)} \diff x \\\\
              & = \frac{B(m+k, n)}{B(m,n)} = \frac{\Gamma(m+k) \Gamma(n)}{\Gamma(m+k+n)} / \frac{\Gamma(m) \Gamma(n)}{\Gamma(m+n)} = \frac{\Gamma(m+k) \Gamma(m+n)}{\Gamma(m+k+n) \Gamma(m)}
\end{align\*}
于是
\begin{align\*}
    \Ebb[x] = \frac{\Gamma(m+1) \Gamma(m+n)}{\Gamma(m+1+n) \Gamma(m)} = \frac{m}{m+n}, \quad \Ebb[x^2] = \frac{\Gamma(m+2) \Gamma(m+n)}{\Gamma(m+2+n) \Gamma(m)} = \frac{(m+1)m}{(m+n+1)(m+n)}
\end{align\*}
故其均值和方差分别为
\begin{align\*}
    \Ebb[x] = \frac{m}{m+n}, \quad \Vbb[x] = \frac{(m+1)m}{(m+n+1)(m+n)} - \left(\frac{m}{m+n}\right)^2 = \frac{mn}{(m+n+1)(m+n)^2}
\end{align\*}

　　$B$函数是二元的，可将其推广成到$k+1$元：
\begin{align} \label{eq: multivariate beta function}
    B(m\_1, \ldots, m\_{k+1}) = \int\_0^1 x\_1^{m\_1-1} \int\_0^{1-x\_1} x\_2^{m\_2-1} \cdots  \int\_0^{1-x\_1 - \cdots - x\_{k-1}} x\_k^{m\_k-1} (1 - x\_1 - \cdots - x\_k)^{m\_{k+1}-1} \diff \xv
\end{align}
注意式(\ref{eq: multivariate beta function})是一个$k$重积分，考察最里面关于$x_k$的积分，即
\begin{align\*}
    E\_k(m\_k, m\_{k+1}) = \int\_0^{1-x\_1 - \cdots - x\_{k-1}} x\_k^{m\_k-1} (1 - x\_1 - \cdots - x\_k)^{m\_{k+1}-1} \diff x\_k = \int\_0^t x\_k^{m\_k-1} (t - x\_k)^{m\_{k+1}-1} \diff x\_k
\end{align\*}
其中$t = 1-x_1 - \cdots - x_{k-1}$。由分部积分有
\begin{align\*}
    E\_k(m\_k, m\_{k+1}) & = \frac{1}{m\_k} \int\_0^t (t - x\_k)^{m\_{k+1}-1} \diff x\_k^{m\_k}                                                                                    \\\\
                      & = \left. \frac{1}{m\_k} (t - x\_k)^{m\_{k+1}-1} x\_k^{m\_k} \right|\_0^t + \frac{1}{m\_k} \int\_0^t x\_k^{m\_k} (m\_{k+1}-1) (t - x\_k)^{m\_{k+1}-2} \diff x\_k \\\\
                      & = \frac{m\_{k+1}-1}{m\_k} E\_k(m\_k+1, m\_{k+1}-1)
\end{align\*}
于是递推下去有
\begin{align\*}
    E\_k(m\_k, m\_{k+1}) & = \frac{m\_{k+1}-1}{m\_k} \cdot \frac{m\_{k+1}-2}{m\_k+1} E\_k(m\_k+2, m\_{k+1}-2)          \\\\
                      & = \cdots                                                                             \\\\
                      & = \frac{m\_{k+1}-1}{m\_k} \cdots \frac{1}{m\_k + m\_{k+1} - 2} E\_k(m\_k + m\_{k+1} - 1, 1)
\end{align\*}
又
\begin{align\*}
    E\_k(m\_k + m\_{k+1} - 1, 1) = \int\_0^t x\_k^{m\_k + m\_{k+1} - 2} \diff x\_k = \left. \frac{x\_k^{m\_k + m\_{k+1} - 1}}{m\_k + m\_{k+1} - 1} \right|\_0^t = \frac{t^{m\_k + m\_{k+1} - 1}}{m\_k + m\_{k+1} - 1}
\end{align\*}
于是
\begin{align\*}
    E\_k(m\_k, m\_{k+1}) = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k)}{\Gamma(m\_{k+1} + m\_k)} (1-x\_1 - \cdots - x\_{k-1})^{m\_k + m\_{k+1} - 1}
\end{align\*}
将其回代入式(\ref{eq: multivariate beta function})，接着考察最里面关于$x_{k-1}$的积分
\begin{align\*}
    E\_{k-1}(m\_{k-1}, m\_k + m\_{k+1}) = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k)}{\Gamma(m\_{k+1} + m\_k)} \int\_0^t x\_{k-1}^{m\_{k-1}-1}  (t - x\_{k-1})^{m\_k + m\_{k+1} - 1} \diff x\_{k-1}
\end{align\*}
其中$t = 1-x_1 - \cdots - x_{k-2}$。由分部积分有
\begin{align\*}
    E\_{k-1}(m\_{k-1}, m\_k + m\_{k+1}) & = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k)}{\Gamma(m\_{k+1} + m\_k)} \cdot \frac{\Gamma(m\_{k+1} + m\_k) \Gamma(m\_{k-1})}{\Gamma(m\_{k+1} + m\_k + m\_{k-1})} t^{m\_{k+1} + m\_k + m\_{k-1} - 1} \\\\
                                    & = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \Gamma(m\_{k-1})}{\Gamma(m\_{k+1} + m\_k + m\_{k-1})} (1-x\_1 - \cdots - x\_{k-2})^{m\_{k+1} + m\_k + m\_{k-1} - 1}
\end{align\*}
不断重复这个过程可知
\begin{align} \label{eq: E2}
    E\_2(m\_2, m\_{k+1} + m\_k + \cdots + m\_3) = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_2)}{\Gamma(m\_{k+1} + m\_k + \cdots + m\_2)} (1-x\_1)^{m\_{k+1} + m\_k + \cdots + m\_2 - 1}
\end{align}
于是最终对$x_1$积分可得
\begin{align\*}
    B(m\_1, \cdots, m\_{k+1}) & = \int\_0^1 x\_1^{m\_1-1} \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_2)}{\Gamma(m\_{k+1} + m\_k + \cdots + m\_2)} (1-x\_1)^{m\_{k+1} + m\_k + \cdots + m\_2 - 1} \diff x\_1                                                                \\\\
                            & = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_2)}{\Gamma(m\_{k+1} + m\_k + \cdots + m\_2)} \cdot \frac{\Gamma(m\_{k+1} + m\_k + \cdots + m\_2) \Gamma(m\_1)}{\Gamma(m\_{k+1} + m\_k + \cdots + m\_1)} 1^{m\_{k+1} + m\_k + \cdots + m\_1 - 1} \\\\
                            & = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_1)}{\Gamma(m\_{k+1} + m\_k + \cdots + m\_1)}
\end{align\*}
记$\mv = [m_1; \ldots; m_{k+1}]$，$\xv = [x_1; \ldots; x_{k+1}]$，定义函数$f_{\mv}: \Delta_{k+1} \mapsto \Rbb$如下：
\begin{align\*}
    f\_{\mv} (\xv) = \frac{\Gamma(m\_{k+1} + m\_k + \cdots + m\_1)}{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_1)} \prod\_{i=1}^{k+1} x\_i^{m\_i - 1}
\end{align\*}
由上面的推导可知$f_{\mv} (\xv)$的$k$重积分为$1$，故可以将其看成一个概率密度函数，们称其对应的概率分布为<span class="blue">参数为$\mv$的Dirichlet分布</span>。

　　下面给出Dirichlet分布的数字特征，易知
\begin{align\*}
     & x\_j^n f\_{\mv} (\xv) = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1}) \cdots \Gamma(m\_1)} x\_j^n \prod\_{i=1}^{k+1} x\_i^{m\_i - 1}                                                                                                                                                                 \\\\
     & = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1} + \cdots + m\_j + n + \cdots + m\_1)} \cdot \frac{\Gamma(m\_j + n)}{\Gamma(m\_j)} \cdot \frac{\Gamma(m\_{k+1} + \cdots + m\_j + n + \cdots + m\_1)}{\Gamma(m\_{k+1}) \cdots \Gamma(m\_j + n) \cdots \Gamma(m\_1)}  x\_j^n \prod\_{i=1}^{k+1} x\_i^{m\_i - 1}
\end{align\*}
于是
\begin{align\*}
    \Ebb[x\_j]   & = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1} + \cdots + m\_j + 1 + \cdots + m\_1)} \frac{\Gamma(m\_j + 1)}{\Gamma(m\_j)} = \frac{m\_j}{m\_{k+1} + \cdots + m\_1}                                      \\\\
    \Ebb[x\_j^2] & = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1} + \cdots + m\_j + 2 + \cdots + m\_1)} \frac{\Gamma(m\_j + 2)}{\Gamma(m\_j)} = \frac{(m\_j+1)m\_j}{(m\_{k+1} + \cdots + m\_1 + 1)(m\_{k+1} + \cdots + m\_1)}
\end{align\*}
故其均值和方差分别为
\begin{align\*}
    \Ebb[x\_j] & = \frac{m\_j}{m\_{k+1} + \cdots + m\_1}                                                                                          \\\\
    \Vbb[x\_j] & = \frac{(m\_j+1)m\_j}{(m\_{k+1} + \cdots + m\_1 + 1)(m\_{k+1} + \cdots + m\_1)} - \left(\frac{m\_j}{m\_{k+1} + \cdots + m\_1}\right)^2 \\\\
              & = \frac{m\_j (m\_{k+1} + \cdots + m\_1 - m\_j)}{(m\_{k+1} + \cdots + m\_1+1)(m\_{k+1} + \cdots + m\_1)^2}
\end{align\*}
又
\begin{align\*}
    x\_p x\_q f\_{\mv} (\xv) & = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1}) \cdots \Gamma(m\_1)} x\_p x\_q \prod\_{i=1}^{k+1} x\_i^{m\_i - 1}                                                                                                       \\\\
                          & = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1} + \cdots + m\_p + 1 + \cdots + m\_q + 1 + \cdots + m\_1)} \cdot \frac{\Gamma(m\_p + 1)}{\Gamma(m\_p)} \cdot \frac{\Gamma(m\_q + 1)}{\Gamma(m\_q)}                         \\\\
                          & \qquad \qquad \cdot \frac{\Gamma(m\_{k+1} + \cdots + m\_p + 1 + \cdots + m\_q + 1 + \cdots + m\_1)}{\Gamma(m\_{k+1}) \cdots \Gamma(m\_p + 1) \cdots \Gamma(m\_q + 1) \cdots \Gamma(m\_1)} x\_p x\_q \prod\_{i=1}^{k+1} x\_i^{m\_i - 1}
\end{align\*}
于是
\begin{align\*}
    \Ebb[x\_p x\_q] & = \frac{\Gamma(m\_{k+1} + \cdots + m\_1)}{\Gamma(m\_{k+1} + \cdots + m\_p + 1 + \cdots + m\_q + 1 + \cdots + m\_1)} \cdot \frac{\Gamma(m\_p + 1)}{\Gamma(m\_p)} \cdot \frac{\Gamma(m\_q + 1)}{\Gamma(m\_q)} \\\\
                  & = \frac{m\_p m\_q}{(m\_{k+1} + \cdots + m\_1 + 1)(m\_{k+1} + \cdots + m\_1)}
\end{align\*}
故协方差为
\begin{align\*}
    \cov(x\_p, x\_q) & = \Ebb[x\_p x\_q] - \Ebb[x\_p] \Ebb[x\_q]                                                                                                                \\\\
                   & = \frac{m\_p m\_q}{(m\_{k+1} + \cdots + m\_1 + 1)(m\_{k+1} + \cdots + m\_1)} - \frac{m\_p}{m\_{k+1} + \cdots + m\_1} \cdot \frac{m\_q}{m\_{k+1} + \cdots + m\_1} \\\\
                   & = \frac{-m\_p m\_q}{(m\_{k+1} + \cdots + m\_1+1)(m\_{k+1} + \cdots + m\_1)^2}
\end{align\*}

　　由式(\ref{eq: E2})知
\begin{align\*}
    \pr(x\_1 = t) & = t^{m\_1 - 1} \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_2)}{\Gamma(m\_{k+1} + m\_k + \cdots + m\_2)} (1-t)^{m\_{k+1} + m\_k + \cdots + m\_2 - 1}                         \\\\
                 & = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_1)}{\Gamma(m\_1) \Gamma(m\_{k+1} + m\_k + \cdots + m\_1 - m\_1)} t^{m\_1 - 1} (1-t)^{m\_{k+1} + m\_k + \cdots + m\_1 - m\_1 - 1}
\end{align\*}
由对称性可知
\begin{align\*}
    \pr(x\_i = t) = \frac{\Gamma(m\_{k+1}) \Gamma(m\_k) \cdots \Gamma(m\_1)}{\Gamma(m\_i) \Gamma(m\_{k+1} + m\_k + \cdots + m\_1 - m\_i)} t^{m\_i - 1} (1-t)^{m\_{k+1} + m\_k + \cdots + m\_1 - m\_i - 1}
\end{align\*}
这意味着Dirichlet分布的变量$x_i$的边际分布是参数为$m_i$、$m_{k+1} + m_k + \cdots + m_1 - m_i$的Beta分布。

