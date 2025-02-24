% Written by Davide Dardari, Gianni Pasolini - University of Bologna -
% 2015, 2023
%
function [Xi,Xq,Delay] = DeModQAM_2023(s,fc,T,fs,psi)
% Extracts the in-phase and in-quadrature components from a modulated signal
% s: samples of the modulated signal 
% fc: carrier frequency (fc<fs/2) 
% fs: sampling rate
% T: duration (sec)
% It returns the I/Q components and the introduced delay

Nf=160; % number of FIR filter taps
b=fir1(Nf, fc/2/(fs/2)); % design a low-pass filter with ft=fc/2
% freqz(b,1) % for debug purposes

Ts=1/fs;  % Sampling time
t=0:Ts:T; % Sampled time axis

Ri=2*s.*cos(2*pi*fc*t+psi);   % in-phase demodulator
Rq=-2*s.*sin(2*pi*fc*t+psi);  % in-quadrature demodulator

Xi=conv(Ri,b);      % filter the 2*fc component
Xq=conv(Rq,b);

Delay=(Nf-1)/2; % compute the delay introduced by the filter (in samples)
end