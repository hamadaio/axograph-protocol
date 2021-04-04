%% Injection of in vivo-like sinewave noisy currents

% Sinusoidal noisy current injections to probe response dynamics of
% pyramidal cells under in vivo-like conditions.
 
% Final waveform Inoise is generated as a realization of Ornstein-Uhlenbeck
% stochastic process with zero-mean variance s^2 (Raunch et al. 2003)
% waveform is based on:
% H. Kondgen et al. Cerebral Cortex (2008) 18(9) pp.2086-2097

% v.1 written by MH 20140627
% v.2 modified by GE 20141121
% v.3 (final) modified by CK 20141125


%% Waveform constants

T_0 = 500;
T_HYP = 500;
T_0_2 = 500;
T_DEP = 500;
T_0_2B = 500;

T_PULSE = 20000;
T_0_3 = 500;
T_FIX = 1000;

Idep = +100;    % amplitude depolarizing DC injection
Ihyp = -100;    % amplitude hyperpolarizing DC injection  

dt=0.05;    % correlation time


%% Noisy current waveform parameters

FREQ = 10;  % sinewave frequency
A=10;       % sinewave amplitude
f=FREQ*0.001;

tau = 3;    % time constant
s=50;       % noisy current st.dev.

Izero=100;  % amplitude 

taufix=3;   % time constant (initial flat noise without sinewave)
sfix=10;    % noisy current st.dev.



t_start_hyp = T_0;
t_end_hyp = T_0 + T_HYP; %1000


%t_start_stim = T_0+T_HYP+T_0_2;%1500

t_start_dep = t_end_hyp+T_0_2;
t_end_dep = t_end_hyp+T_0_2 + T_DEP; %1000

t_start_stim = t_end_dep + T_0_2B; %1500

t_start_Isin = t_start_stim+T_FIX; %2500
t_end_pulse = t_start_stim+T_PULSE;
T_total = t_end_pulse +T_0_3;
time=0:dt:T_total;


Isignal = zeros(size(time));
Inoise = zeros(size(time));
Isin = zeros(size(time));

 Isignal = Isignal + [time<T_0]*0;      % this adds zero to all values
 Isignal = Isignal + [[time>=T_0].*[time<t_end_hyp]].*Ihyp;     % this adds the hyp
 Isignal = Isignal + [[time>=t_start_dep].*[time<t_end_dep]].*Idep;     % this adds the dep

 Isignal = Isignal + [[time>=t_start_stim].*[time<t_end_pulse]].*Izero;
 
 
 for i=t_start_stim/dt:(t_start_Isin)/dt
     Inoise(i)=Inoise(i-1)*(1-(dt/taufix))+sfix*sqrt(2*dt/taufix)*randn(1);
 end
 
 for i=(t_start_Isin)/dt:t_end_pulse/dt     
     Inoise(i)=Inoise(i-1)*(1-(dt/tau))+s*sqrt(1-exp(-2*dt/tau))*randn(1);
     Isin(i)=A*sin(2*pi*f*time(i));
 end
 I=Isignal+Isin+Inoise;

 figure(1)
clf

subplot(4,1,1)
plot(time/1000, Isignal)
subplot(4,1,2)
plot(time/1000, Isin, 'r')
subplot(4,1,3)
plot(time/1000, Inoise, 'b')
subplot(4,1,4)
plot(time/1000, I)

Time = time/1000; 
Current = I;

save -v6 synaptic_noise.mat Time Current    % saves file as .mat for Axograph import

%% Save data as .txt (no longer applicable!)


% fileID = fopen('./hejsansvejsan', 'w');
% for i=1:numberOfElements
%     fprintf(fileID, '%10.3f %10.3f\n', time(i), I(i));
% end
% 
% fclose(fileID);