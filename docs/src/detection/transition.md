# Transition Detection Probability

TODO: Review Abraham (2019) equations 2.93-5.

The transition detection probability is defined as (Abraham, 2019, Eqn 2.104)

```math
P_d = \rmPr\left\{ T_1 \geq h; \SNR^d = \DT_{50}^d + \SE \right\}
```

where

```math
P_f = 1 - F_0(h)
```

## Gaussian? (Passive)

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
d &= \frac{2\calE}{N_0} \\
&= 2 \left( \frac{\calE / T}{N_0 B} \right) B T \\
&= 2 S^\rma B T \\
&= 2 S^d \\
\Rightarrow \SNR^\rmd &= 10 \log_{10}\left( \frac{d}{2} \right)
\end{align*}
```

```math
\begin{align*}
\sqrt{d} &= Φ^{-1}(1 - P_f) - Φ^{-1}(1 - P_d) \\
\Rightarrow P_d &= 1 - Φ\left[ Φ^{-1}(1 - P_f) - \sqrt{d} \right] \\
&= \Phi\left[ \sqrt{d} - Φ^{-1}(1 - P_f) \right] \\
&= Φ\left[ 10^{-\DT/10} - Φ^{-1}(1 - P_f) \right] \\
&= Φ\left[ 10^{(\SE - \SNR)/10} - Φ^{-1}(1 - P_f) \right] \\
&= Φ\left[ \frac{10^{\SE/10}}{10^{\SNR/10}} - Φ^{-1}(1 - P_f) \right] \\
\end{align*}
```

### Somehow

```math
P_d = \Phi\left[ \Phi^{-1}(1 - P_f) \left( {10}^{\SE/10} - 1 \right) \right]
```

which means

```math
\begin{align*}
\frac{10^{\SE/10}}{10^{\SNR/10}} - Φ^{-1}(1 - P_f) &= \Phi^{-1}(1 - P_f) \left( {10}^{\SE/10} - 1 \right)
\end{align*}
```

## Rayleigh? (Active)

```math
\begin{align*}
\sqrt{d} &= \sqrt{\frac{\pi}{4 - \pi}} \left( \frac{\ln(P_f)}{\ln(P_d)} - 1 \right) \\
\Rightarrow 1 + \sqrt{d} \sqrt{\frac{4 - \pi}{\pi}} &= \frac{\ln(P_f)}{\ln(P_d)} \\
\Rightarrow P_d &= \exp\left[ \frac{\ln(P_f)}{1 + \sqrt{d} \sqrt{\dfrac{4 - \pi}{\pi}}} \right] \\
\Rightarrow P_d &= \exp\left[ \frac{\ln(P_f)}{1 + {10}^{-\DT/10} \sqrt{\dfrac{4 - \pi}{\pi}}} \right] \\
\Rightarrow P_d &= \exp\left[ \frac{\ln(P_f)}{1 + \dfrac{{10}^{-\SE/10}}{{10}^{-\SNR/10}} \sqrt{\dfrac{4 - \pi}{\pi}}} \right]
\end{align*}
```
