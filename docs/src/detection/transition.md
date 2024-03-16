# Transition Detection Probability

The transition detection probability is defined as (Abraham, 2019, Eqn 2.104)

```math
P_d = \rmPr\left\{ T_1 \geq h; \SNR^d = \DT_{50}^d + \SE \right\}
```

where

```math
P_f = 1 - F_0(h)
```

## Gaussian?

```math
\begin{align*}
P_f &= 1 - Φ\left( \frac{h - μ_0}{σ_0} \right) \\
\Rightarrow h &= μ_0 + σ_0 Φ^{-1}(1 - P_f)
\end{align*}
```

```math
\begin{align*}
\sqrt{d} &= Φ^{-1}(1 - P_f) - Φ^{-1}(1 - P_d)
\end{align*}
```

```math
\begin{align*}
P_d &= 1 - F_1(h) \\
&= 1 - Φ\left( \frac{h - μ_1}{σ_1} \right) \\
&= 1 - Φ\left( \frac{μ_0 - μ_1 + σ_0 Φ^{-1}(1 - P_f)}{σ_1} \right)
\end{align*}
```

```math
\begin{align*}
\sqrt{d} &= Φ^{-1}(1 - P_f) - Φ^{-1}(1 - P_d) \\
\Rightarrow P_d &= 1 - Φ\left[ Φ^{-1}(1 - P_f) - \sqrt{d} \right] \\
&= 1 - Φ\left[ Φ^{-1}(1 - P_f) - 10^{-\DT/10} \right] \\
&= 1 - Φ\left[ Φ^{-1}(1 - P_f) - 10^{(\SE - \SNR)/10} \right] \\
&= 1 - Φ\left[ Φ^{-1}(1 - P_f) - \frac{10^{\SE/10}}{10^{\SNR/10}} \right]
\end{align*}
```
