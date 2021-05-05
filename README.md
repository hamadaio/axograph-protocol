# Curreent noise injection protocol


## Overview

Injection of in vivo-like sinewave noisy currents.

Sinusoidal noisy current injections to probe response dynamics of pyramidal cells under in vivo-like conditions.
 
Final waveform I-noise is generated as a realization of [Ornstein-Uhlenbeck Stochastic Process](https://www.sciencedirect.com/topics/mathematics/ornstein-uhlenbeck-process) with `zero-mean variance s^2` ([Rauch et al. J Neurophysiol (2003) 90: 1598–1612](https://journals.physiology.org/doi/abs/10.1152/jn.00293.2003))
waveform is based on [Kondgen et al. Cerebral Cortex (2008) 18(9): 2086-2097](https://academic.oup.com/cercor/article/18/9/2086/354095?login=true)

---

### AxoGraph Protcol

High-frequency tracking current-injection waveform written for [AxoGraph Data Acquisition software](https://axograph.com).


[high-frequency-tracking-protocol_v1.axtx](https://github.com/hamadaio/axograph-protocol/blob/main/high-frequency-tracking-protocol_v1.axtx)

[high-frequency-tracking-protocol_v2.axtx](https://github.com/hamadaio/axograph-protocol/blob/main/high-frequency-tracking-protocol_v2.axtx)

---

### MatLab

[HFT-i-noise-process-OU.m](https://github.com/hamadaio/axograph-protocol/blob/main/HFT-i-noise-process-OU.m)

---

### Igor Pro

[Igor Pro](https://www.wavemetrics.com) from Wavemetrics - Technical graphing and data analysis software for scientists and engineers

[OU-HTF-i-noise-script.pxp](https://github.com/hamadaio/neuroscience-ephys-scripts/blob/main/OU-HTF-i-noise-script.pxp)

