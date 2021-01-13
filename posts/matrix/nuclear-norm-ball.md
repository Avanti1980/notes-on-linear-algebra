　　向量的$\ell_p$范数球都很容易可视化，但是矩阵的就没那么容易了，不过$\Sbb_2$的核范数球是可以的。设
\begin{align\*}
    \Mv = \begin{bmatrix}
        x & y \\\\ y & z
    \end{bmatrix}, \quad \Mv^\top \Mv = \begin{bmatrix}
        x & y \\\\ y & z
    \end{bmatrix} \begin{bmatrix}
        x & y \\\\ y & z
    \end{bmatrix} = \begin{bmatrix}
        x^2 + y^2 & y (x + z) \\\\ y (x + z) & y^2 + z^2
    \end{bmatrix}
\end{align\*}
于是$\Mv^\top \Mv$的特征方程为
\begin{align\*}
    0 & = t^2 - (x^2 + 2 y^2 + z^2) t + (x^2 + y^2) (y^2 + z^2) - y^2 (x + z)^2         \\\\
      & = t^2 - (x^2 + 2 y^2 + z^2) t + x^2 z^2 + y^4 + y^2 (x^2 + z^2) - y^2 (x + z)^2 \\\\
      & = t^2 - (x^2 + 2 y^2 + z^2) t + x^2 z^2 + y^4 - y^2 \cdot 2 x z                 \\\\
      & = t^2 - (x^2 + 2 y^2 + z^2) t + (y^2 - xz)^2
\end{align\*}
易知两个特征根分别为
\begin{align\*}
    t\_{1,2} = \frac{x^2 + 2 y^2 + z^2 \pm \sqrt{(x^2 + 2 y^2 + z^2)^2 - 4 (y^2 - xz)^2}}{2}
\end{align\*}
故$\Mv$的两个奇异值分别为
\begin{align\*}
    \sigma\_{1,2} = \frac{1}{\sqrt{2}} \sqrt{x^2 + 2 y^2 + z^2 \pm \sqrt{(x^2 + 2 y^2 + z^2)^2 - 4 (y^2 - xz)^2}}
\end{align\*}

　　显然$\|\Mv\|_* \le 1$的边界为$\|\Mv\|_* = 1$，即$\sigma_1 + \sigma_2 = 1$，两边平方可得
\begin{align\*}
    1 & = \sigma\_1^2 + \sigma\_2^2 + 2 \sigma\_1 \sigma\_2                                               \\\\
      & = x^2 + 2 y^2 + z^2 + \sqrt{(x^2 + 2 y^2 + z^2)^2 - ((x^2 + 2 y^2 + z^2)^2 - 4 (y^2 - xz)^2)} \\\\
      & = x^2 + 2 y^2 + z^2 + \sqrt{4 (y^2 - xz)^2}                                                   \\\\
      & = x^2 + 2 y^2 + z^2 + 2 |y^2 - xz|                                                            \\\\
      & = \begin{cases}
        (x + z)^2         & xz \ge y^2 \\\\
        (x - z)^2 + 4 y^2 & xz < y^2
    \end{cases}
\end{align\*}
这就是核范数球边界的方程。

　　现将$xoz$平面顺时针旋转45度，于是新的坐标满足
\begin{align\*}
    \begin{bmatrix}
        x' \\\\ z'
    \end{bmatrix} = \begin{bmatrix}
        \cos 45^\circ & - \sin 45^\circ \\\\ \sin 45^\circ & \cos 45^\circ
    \end{bmatrix} \begin{bmatrix}
        x \\\\ z
    \end{bmatrix} = \frac{\sqrt{2}}{2} \begin{bmatrix}
        x - z \\\\ x + z
    \end{bmatrix}, \quad \begin{bmatrix}
        x \\\\ z
    \end{bmatrix} = \begin{bmatrix}
        \cos 45^\circ & \sin 45^\circ \\\\ - \sin 45^\circ & \cos 45^\circ
    \end{bmatrix} \begin{bmatrix}
        x' \\\\ z'
    \end{bmatrix} = \frac{\sqrt{2}}{2} \begin{bmatrix}
        z' + x' \\\\ z' - x'
    \end{bmatrix}
\end{align\*}
注意$xz = (z'^2 - x'^2) / 2$，故核范数球边界在$x'yz'$坐标系下的方程为
\begin{align\*}
    1 = \begin{cases}
        2 z'^2         & z'^2 - x'^2 \ge 2 y^2 \\\\
        2 x'^2 + 4 y^2 & z'^2 - x'^2 < 2 y^2
    \end{cases}
\end{align\*}
先看第一行，显然$1 = 2 z'^2$对应两个平行的平面$z' = \pm 1 / \sqrt{2}$，核范数球边界在这两个平面上的边界为
\begin{align\*}
    z'^2 - x'^2 = 2 y^2 \Longrightarrow 2 x'^2 + 4 y^2 = 1
\end{align\*}
是一个长轴为$1 / \sqrt{2}$、短轴为$1/2$的椭圆。再看第二行，注意
\begin{align\*}
    z'^2 < x'^2 + 2 y^2 = \frac{1}{2} \Longrightarrow - \frac{1}{\sqrt{2}} < z < \frac{1}{\sqrt{2}}
\end{align\*}
即为两个平行的平面$z' = \pm 1 / \sqrt{2}$之间的一系列椭圆$2 x'^2 + 4 y^2 = 1$。

　　综上，$\Sbb_2$的核范数球在$x'yz'$坐标系下为一个以$z$轴为中心的椭圆柱
\begin{align\*}
    2 x'^2 + 4 y^2 \le 1, \quad - \frac{1}{\sqrt{2}} \le z \le \frac{1}{\sqrt{2}}
\end{align\*}
将其沿$xoz$平面顺时针旋转45度，即为其在原$xyz$坐标系下的样子。

