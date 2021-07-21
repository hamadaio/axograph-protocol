# Current noise injection protocol


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

```
Izero = 100;	// DC step to generate 10Hz baseline AP
dt = 0.02;
sineAmp = 50;	// sinewave amplitude
f = FREQ*0.001;
tau = 3;
s = 50;
taufix = 3;
sfix = 10;
```
![Screenshot 2021-05-05 at 15 38 12](https://user-images.githubusercontent.com/42112716/117150087-1f8f3a00-adb8-11eb-9811-9db5bf4c47c1.png)


![Screenshot 2021-05-05 at 15 38 39](https://user-images.githubusercontent.com/42112716/117150262-451c4380-adb8-11eb-82c9-03e647971056.png)

---

### MatLab

[HFT-i-noise-process-OU.m](https://github.com/hamadaio/axograph-protocol/blob/main/HFT-i-noise-process-OU.m)

---

### Igor Pro

[Igor Pro](https://www.wavemetrics.com) from Wavemetrics - Technical graphing and data analysis software for scientists and engineers

[OU-HTF-i-noise-script.pxp](https://github.com/hamadaio/neuroscience-ephys-scripts/blob/main/OU-HTF-i-noise-script.pxp)

